-- ============================================================================
-- Console LinkedIn, schéma Supabase
-- ----------------------------------------------------------------------------
-- À exécuter une fois dans l'éditeur SQL de Supabase (SQL Editor, Run).
-- Chaque utilisateur a son compte et ne voit QUE ses propres données.
-- L'isolation est garantie par RLS au niveau de la base, pas par le code client.
--
-- Rappel de sécurité : ne jamais utiliser la clé service_role côté navigateur.
-- La console n'utilise que la clé publiable (anon), et c'est RLS qui protège.
-- ============================================================================

-- ─────────────────────────────────────────────────────────────
-- 1. Les clients suivis par un utilisateur
-- ─────────────────────────────────────────────────────────────
create table if not exists public.li_clients (
  id          uuid primary key default gen_random_uuid(),
  proprio     uuid not null references auth.users(id) on delete cascade,
  nom         text not null check (length(trim(nom)) > 0),
  icp         text,
  objectif    text,
  cree_le     timestamptz not null default now()
);

create index if not exists li_clients_proprio_idx on public.li_clients(proprio);

-- ─────────────────────────────────────────────────────────────
-- 2. Le rituel quotidien (une ligne par client)
-- ─────────────────────────────────────────────────────────────
create table if not exists public.li_rituel (
  client_id     uuid primary key references public.li_clients(id) on delete cascade,
  jour          date,
  blocs         jsonb not null default '[false,false,false,false]'::jsonb,
  serie         integer not null default 0 check (serie >= 0),
  dernier_jour  date
);

-- ─────────────────────────────────────────────────────────────
-- 3. Le pipeline de contacts
-- ─────────────────────────────────────────────────────────────
create table if not exists public.li_pipeline (
  id         uuid primary key default gen_random_uuid(),
  client_id  uuid not null references public.li_clients(id) on delete cascade,
  nom        text not null check (length(trim(nom)) > 0),
  poste      text,
  source     text,
  etape      text not null default 'repere'
             check (etape in ('repere','rechauffe','contacte','conversation','rdv')),
  cree_le    timestamptz not null default now()
);

create index if not exists li_pipeline_client_idx on public.li_pipeline(client_id);

-- ─────────────────────────────────────────────────────────────
-- 4. Les mesures hebdomadaires
-- ─────────────────────────────────────────────────────────────
create table if not exists public.li_semaines (
  id            uuid primary key default gen_random_uuid(),
  client_id     uuid not null references public.li_clients(id) on delete cascade,
  label         text not null,
  rang          integer not null default 0,
  entrees       integer not null default 0 check (entrees      >= 0),
  messages      integer not null default 0 check (messages     >= 0),
  reponses      integer not null default 0 check (reponses     >= 0),
  invitations   integer not null default 0 check (invitations  >= 0),
  acceptees     integer not null default 0 check (acceptees    >= 0),
  posts         integer not null default 0 check (posts        >= 0),
  commentaires  integer not null default 0 check (commentaires >= 0),
  appels        integer not null default 0 check (appels       >= 0),
  cree_le       timestamptz not null default now()
);

create index if not exists li_semaines_client_idx on public.li_semaines(client_id);

-- Migration pour une base créée avant l'ajout de la colonne « entrees ».
-- Sans danger à rejouer : ne fait rien si la colonne existe déjà.
alter table public.li_semaines
  add column if not exists entrees integer not null default 0;

-- ============================================================================
-- RLS : activée sur TOUTES les tables, sans exception.
-- Sans ces politiques, n'importe qui muni de la clé publiable lirait tout.
-- ============================================================================

alter table public.li_clients  enable row level security;
alter table public.li_rituel   enable row level security;
alter table public.li_pipeline enable row level security;
alter table public.li_semaines enable row level security;

-- Un utilisateur ne voit et ne modifie que SES clients.
drop policy if exists "li_clients proprio" on public.li_clients;
create policy "li_clients proprio" on public.li_clients
  for all
  to authenticated
  using      (proprio = (select auth.uid()))
  with check (proprio = (select auth.uid()));

-- Les tables filles héritent : on remonte au client, puis au propriétaire.
drop policy if exists "li_rituel proprio" on public.li_rituel;
create policy "li_rituel proprio" on public.li_rituel
  for all
  to authenticated
  using      (exists (select 1 from public.li_clients c
                      where c.id = li_rituel.client_id and c.proprio = (select auth.uid())))
  with check (exists (select 1 from public.li_clients c
                      where c.id = li_rituel.client_id and c.proprio = (select auth.uid())));

drop policy if exists "li_pipeline proprio" on public.li_pipeline;
create policy "li_pipeline proprio" on public.li_pipeline
  for all
  to authenticated
  using      (exists (select 1 from public.li_clients c
                      where c.id = li_pipeline.client_id and c.proprio = (select auth.uid())))
  with check (exists (select 1 from public.li_clients c
                      where c.id = li_pipeline.client_id and c.proprio = (select auth.uid())));

drop policy if exists "li_semaines proprio" on public.li_semaines;
create policy "li_semaines proprio" on public.li_semaines
  for all
  to authenticated
  using      (exists (select 1 from public.li_clients c
                      where c.id = li_semaines.client_id and c.proprio = (select auth.uid())))
  with check (exists (select 1 from public.li_clients c
                      where c.id = li_semaines.client_id and c.proprio = (select auth.uid())));

-- ============================================================================
-- Vérification, à lancer après coup.
-- Les 4 tables doivent afficher rowsecurity = true et au moins 1 politique.
-- ============================================================================
-- select tablename, rowsecurity from pg_tables
--   where schemaname = 'public' and tablename like 'li_%';
-- select tablename, policyname from pg_policies
--   where schemaname = 'public' and tablename like 'li_%';
