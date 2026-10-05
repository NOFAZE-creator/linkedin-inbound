# LinkedIn Inbound

Un skill Claude Code qui transforme un compte LinkedIn en canal d'acquisition. Il couvre les quatre
rouages d'une machine LinkedIn : le profil, le contenu, la recherche de cibles et les conversations.
Il fonctionne pour n'importe quel métier et n'importe quel secteur.

Tout est en fichiers texte plus deux pages HTML autonomes. Aucune installation, aucune dépendance,
aucun compte à créer.

---

## Installation

**1. Récupérer le dossier**

```bash
git clone https://github.com/NOFAZE-creator/linkedin-inbound.git
```

**2. Le placer au bon endroit**

Pour l'avoir dans tous vos projets :

```bash
cp -r linkedin-inbound ~/.claude/skills/
```

Ou seulement dans un projet précis, depuis la racine de ce projet :

```bash
cp -r linkedin-inbound .claude/skills/
```

**3. Vérifier**

Ouvrir Claude Code et taper `/linkedin-inbound`. Si le skill apparaît, c'est prêt.
Sinon, vérifier que le chemin se termine bien par `skills/linkedin-inbound/SKILL.md`.

---

## Utilisation

**Le plus simple :** ouvrir `assets/intake.html` dans un navigateur (double-clic sur le fichier).
Treize questions, une par écran, environ huit minutes. À la fin, un bouton copie un brief complet.
Coller ce brief dans Claude Code, et le travail démarre.

**Sinon :** demander directement, par exemple "audite mon profil LinkedIn", "écris-moi un post sur
X", "trouve-moi des prospects dans le secteur Y", ou "lance un sprint LinkedIn de 7 jours".

**Pour piloter dans la durée :** ouvrir `assets/console-linkedin.html`. Rituel quotidien, pipeline,
signaux d'achat et mesures. Multi-client. Les données restent dans le navigateur, sur la machine.

---

## Ce que contient le skill

| Fichier | Contenu |
|---|---|
| `SKILL.md` | Le chef d'orchestre : les 4 rouages, les phases, le plan 30 jours |
| `references/sprint-7-jours.md` | Le plan intensif jour par jour, et le calcul honnête des résultats |
| `references/profil.md` | Réécriture complète du profil, section par section, et SEO de profil |
| `references/trouver-sa-cible.md` | Recherche booléenne, banque de mots-clés, 8 gisements de cibles |
| `references/signaux-declencheurs.md` | 12 signaux d'achat, avec la fenêtre d'action et le message pour chacun |
| `references/connexions-et-dm.md` | Invitations, limites réelles de LinkedIn, séquences de messages |
| `references/contenu.md` | Algorithme, 10 formats de post, 30 hooks, carrousels, recyclage |
| `references/pilier-saas.md` | Pour qui vend ce service : offres, livraison, ligne rouge, reporting |
| `references/api-linkedin.md` | Ce que les API LinkedIn permettent vraiment, et ce qui est impossible |
| `assets/intake.html` | La page de questions, à ouvrir dans un navigateur |
| `assets/console-linkedin.html` | La console de pilotage quotidien |
| `assets/schema.sql` | Le schéma de base, si vous activez les comptes utilisateurs |

---

## Deux modes : fichier local, ou comptes utilisateurs

La console fonctionne des deux façons, c'est le même fichier.

**Mode local (par défaut).** Rien à configurer. Les données restent dans le navigateur qui ouvre le
fichier. C'est le mode à utiliser pour tester, et pour donner le fichier à quelqu'un.

**Mode comptes.** Chaque utilisateur crée son compte, ses données le suivent d'un appareil à
l'autre, et chacun ne voit que les siennes. Trois étapes :

1. Créer un projet sur [supabase.com](https://supabase.com) (l'offre gratuite suffit largement).
2. Ouvrir le SQL Editor, coller le contenu de `assets/schema.sql`, cliquer sur Run. Ça crée les
   quatre tables et active l'isolation par utilisateur (RLS) au niveau de la base.
3. Dans `assets/console-linkedin.html`, remplir le bloc `CLOUD` en haut du script :

```js
var CLOUD = {
  url: "https://xxxxxxxx.supabase.co",
  cle: "sb_publishable_..."
};
```

Puis héberger le fichier où vous voulez (Vercel, Netlify, un simple hébergement statique).

**La clé à mettre est la clé publiable (anon), jamais la clé `service_role`.** La clé publiable est
faite pour être dans la page : c'est RLS, côté base, qui garantit que personne ne voit les données
d'un autre. La clé `service_role` contourne RLS et donnerait accès à tout, à n'importe qui ouvrant
la page.

Après avoir exécuté le schéma, vérifier que l'isolation est bien active :

```sql
select tablename, rowsecurity from pg_tables
  where schemaname = 'public' and tablename like 'li_%';
```

Les quatre tables doivent afficher `rowsecurity = true`.

---

## Personnaliser la marque

Les deux pages HTML sont en marque blanche. Par défaut elles n'affichent aucune marque.

Pour y mettre la vôtre, ouvrir le fichier dans un éditeur de texte et modifier le bloc en haut du
script. Il est le seul endroit à toucher, il est signalé par un commentaire :

```js
var BRAND = {
  nom:      "",                  // Votre nom ou celui de votre boîte. Vide = neutre.
  sous:     "LinkedIn Inbound",  // La ligne sous le nom.
  primaire: "#EC0E8F"            // Votre couleur principale.
};
```

La couleur se propage automatiquement à toute la page : boutons, progression, sélections, teintes et
fond. Elle s'adapte seule au thème clair et au thème sombre. Il n'y a rien d'autre à modifier.

---

## Ce que ce skill ne fait pas, volontairement

**Aucune automatisation d'envoi.** Pas d'invitations automatiques, pas de messages programmés, pas
d'outil branché sur un compte LinkedIn. C'est contraire aux conditions d'utilisation de LinkedIn et
ça expose à une restriction ou à une suppression du compte.

**Aucun scraping, aucun export de base.** Les listes se construisent à la main, contact par contact,
et servent à un contact individuel.

**Aucune connexion à quoi que ce soit.** Les deux pages HTML fonctionnent hors ligne et ne stockent
rien ailleurs que dans le navigateur qui les ouvre. Aucune donnée ne part sur un serveur.

**Aucun chiffre inventé.** Le skill refuse d'écrire un résultat qui n'a pas été fourni. Sans preuve,
il vend par l'honnêteté, ce qui marche mieux et ne se retourne jamais contre son auteur.

La contrepartie est assumée : c'est plus lent qu'un robot, et ça marche nettement mieux.

---

## Une attente à cadrer avant de commencer

L'inbound met **60 à 90 jours** à produire un flux de messages entrants. C'est mécanique : il faut
que l'algorithme apprenne à qui montrer les publications, et que l'audience voie passer le nom assez
souvent pour lui faire confiance.

Ce qui arrive plus vite, ce sont les **conversations**, et elles viennent du réseau qui existe déjà,
pas des nouvelles publications. Un sprint de sept jours produit typiquement une à trois prises de
rendez-vous, pas un flux entrant. Le détail du calcul est dans `references/sprint-7-jours.md`.

Quiconque promet de l'inbound en une semaine ne dit pas la vérité.

---

## Licence

À définir par le propriétaire du dépôt. Sans fichier `LICENSE`, le code reste par défaut sous droit
d'auteur, et personne n'a le droit de le réutiliser. Pour un partage libre, ajouter un fichier
`LICENSE` (MIT est le choix habituel pour ce type d'outil).
