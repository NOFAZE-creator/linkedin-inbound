# Trouver sa cible sur LinkedIn (recherche, mots-clés, gisements)

Phase 2 du skill. Objectif : passer de "je ne sais pas qui contacter" à une liste de 100 personnes
précises, qualifiées, avec une raison légitime de leur parler.

---

## 1. La recherche booléenne

LinkedIn accepte les opérateurs booléens dans la barre de recherche. C'est gratuit, ça marche sur
un compte de base, et 95 % des gens ne s'en servent pas.

### Les 5 opérateurs

| Opérateur | Ce qu'il fait | Exemple |
|---|---|---|
| `"guillemets"` | Expression exacte | `"directeur des achats"` |
| `AND` | Les deux termes | `logistique AND transport` |
| `OR` | L'un ou l'autre | `DRH OR "directeur des ressources humaines"` |
| `NOT` | Exclut un terme | `courtier NOT assurance` |
| `(parenthèses)` | Groupe les conditions | `(DAF OR "directeur financier") AND industrie` |

**Règles de syntaxe :**
- `AND`, `OR`, `NOT` s'écrivent en MAJUSCULES, sinon ils sont lus comme des mots normaux.
- Pas de guillemets courbes, seulement des guillemets droits. Un copier-coller depuis Word casse la requête.
- Les parenthèses s'imbriquent : `(A OR B) AND (C OR D) NOT E`.
- Ne pas dépasser 3 niveaux, LinkedIn tronque les requêtes trop longues.

**Attention, point souvent faux ailleurs :** les opérateurs de champ (`title:`, `company:`, `school:`)
ne fonctionnent plus dans la recherche standard, LinkedIn les a réservés à Recruiter et Sales
Navigator. Les booléens de base (`AND` `OR` `NOT` guillemets parenthèses) fonctionnent toujours.
LinkedIn change ces règles régulièrement : tester une requête simple avant d'en construire une complexe.

**Limite d'usage commercial :** sur un compte gratuit, LinkedIn plafonne le nombre de recherches de
profils par mois (le compteur se réinitialise le 1er). En cas de blocage, le message "vous avez
atteint la limite d'utilisation commerciale" s'affiche. Solution gratuite : passer par les gisements
de la section 4, qui ne consomment pas ce quota.

### Le générateur de requêtes : fonction x secteur x signal

Toute bonne requête croise trois dimensions.

```
(FONCTION en toutes les variantes) AND (SECTEUR ou CONTEXTE) AND/NOT (SIGNAL)
```

**Dimension 1, la FONCTION.** Il faut lister TOUTES les façons dont la cible s'appelle elle-même,
y compris l'anglais, l'abréviation et le titre pompeux. C'est là que 80 % des recherches échouent :
on cherche "directeur financier" alors que la personne a écrit "CFO" sur son profil.

**Dimension 2, le SECTEUR ou le CONTEXTE.** Le mot que la cible utilise pour décrire son métier,
pas celui du vendeur.

**Dimension 3, le SIGNAL.** Ce qui indique qu'elle est au bon moment (recrute, lève des fonds,
vient d'arriver en poste, a un problème visible) ou ce qu'il faut exclure (concurrents, salariés
d'un grand groupe, autres vendeurs de la même chose).

### 12 requêtes types, à adapter

```
1.  ("directeur général" OR "dirigeant" OR CEO OR "co-fondateur") AND PME AND industrie
2.  (DAF OR "directeur financier" OR CFO) NOT (stagiaire OR alternant OR étudiant)
3.  ("responsable marketing" OR "head of marketing" OR CMO) AND SaaS
4.  (fondateur OR fondatrice OR "founder") AND (agence OR cabinet OR studio)
5.  ("directeur des opérations" OR COO OR "responsable production") AND logistique
6.  (DRH OR "directeur des ressources humaines" OR "responsable RH") AND recrutement
7.  (gérant OR "chef d'entreprise") AND artisan NOT (auto-entrepreneur OR freelance)
8.  ("responsable achats" OR "acheteur") AND (industrie OR bâtiment)
9.  (courtier OR "intermédiaire") AND (assurance OR crédit) NOT (CAFPI OR Empruntis)
10. (expert-comptable OR "cabinet comptable") AND (associé OR gérant)
11. (avocat OR notaire) AND (associé OR "managing partner") NOT collaborateur
12. ("directeur commercial" OR "head of sales" OR VP Sales) AND B2B
```

**Ce que tu dois produire pour la personne :** 10 à 20 requêtes de ce type, avec SA fonction, SON
secteur, SES exclusions. Jamais des requêtes génériques recopiées.

### La requête d'exclusion à toujours ajouter

Systématiquement retirer le bruit :
```
NOT (stagiaire OR alternant OR étudiant OR "en recherche" OR "open to work" OR consultant OR coach)
```
À adapter : si la cible EST consultante, on ne l'exclut évidemment pas. Toujours exclure les
concurrents directs par leur nom.

---

## 2. Les filtres, et dans quel ordre les appliquer

Après avoir lancé la recherche, cliquer sur **Personnes**, puis empiler les filtres dans cet ordre.
L'ordre compte : on réduit d'abord le volume, on affine ensuite.

1. **Relations** : commencer par les **2e**. C'est le meilleur segment (une relation commune,
   donc une raison d'entrer en contact et un taux d'acceptation supérieur). Les 3e+ seulement quand
   les 2e sont épuisés. Les 1er servent aux conversations, pas aux invitations.
2. **Lieux** : la ville, le département ou la région. En local, tout est plus facile.
3. **Entreprise actuelle** : utile pour cibler les clients d'un concurrent ou un compte précis.
4. **Secteur d'activité** : filtre large, à manier avec précaution (beaucoup de profils sont
   mal catégorisés, ce filtre fait perdre des cibles valides).
5. **École** : sous-utilisé et très puissant. Un ancien de la même école accepte presque toujours.
6. **Langue du profil** : évite de tomber sur des profils étrangers non pertinents.
7. **Services proposés** : filtre les indépendants et prestataires, très efficace en B2B local.

**Astuce compte gratuit :** enregistrer les bonnes requêtes en favori du navigateur. L'URL de
recherche LinkedIn contient tous les filtres, donc un simple marque-page rejoue la recherche complète.

---

## 3. Construire la banque de mots-clés

C'est le livrable le plus utile, et le plus vite bâclé. Méthode en 4 étapes, dans cet ordre.

**Étape 1, aller lire 10 profils de la cible.** Pas imaginer, lire. Relever mot pour mot :
- Leur intitulé de poste exact (colonne "titre").
- Les mots de leur section À propos.
- Le vocabulaire de leur secteur qui revient.

**Étape 2, lister toutes les variantes d'un même rôle.** Exemple pour un dirigeant de PME :
`dirigeant`, `gérant`, `président`, `PDG`, `CEO`, `chef d'entreprise`, `directeur général`, `DG`,
`fondateur`, `co-fondateur`, `founder`, `associé`, `patron`, `repreneur`.

**Étape 3, séparer 3 catégories de mots-clés.**

| Catégorie | À quoi ça sert | Exemple |
|---|---|---|
| **Mots de fonction** | Trouver la personne | `DAF`, `directeur financier`, `CFO` |
| **Mots de douleur** | Écrire les posts et les messages | `trésorerie`, `impayés`, `clôture`, `reporting` |
| **Mots de signal** | Repérer le bon moment | `recrute`, `levée`, `nouveau poste`, `ouverture` |

**Étape 4, les réutiliser partout.** Les mots de fonction vont dans les requêtes. Les mots de
douleur vont dans les hooks de posts et dans le titre du profil (c'est le SEO de profil). Les mots
de signal servent à prioriser la liste.

**Le test qui valide la banque :** montrer la liste à quelqu'un de la cible. S'il dit "oui c'est
exactement comme ça qu'on dit", c'est bon. S'il dit "on ne dit jamais ça", tout est à refaire.

---

## 4. Les 8 gisements hors recherche (les plus rentables)

La barre de recherche est le gisement le plus évident, donc le plus concurrentiel, et celui qui
consomme le quota gratuit. Les vrais bons contacts sont ailleurs.

**1. Les commentateurs des posts des concurrents.** Le meilleur gisement, de loin. Quelqu'un qui
commente le post d'un concurrent est : dans la cible, actif sur LinkedIn, et déjà conscient du
problème. Ouvrir les posts d'un concurrent, cliquer sur la liste des commentateurs, tout est là.

**2. Les commentateurs des influenceurs du secteur.** Même logique, en plus large. Les gros comptes
du secteur agrègent gratuitement la cible.

**3. Les participants d'événements LinkedIn.** Chercher un événement LinkedIn du secteur, la liste
des participants est souvent publique. Ils ont déjà levé la main sur le sujet, et l'événement donne
une raison naturelle d'entrer en contact.

**4. Les membres de groupes.** Les groupes LinkedIn sont peu actifs, mais leurs listes de membres
restent une base qualifiée. Un membre du même groupe peut être contacté avec une raison légitime.

**5. Les abonnés d'une page entreprise.** Ceux qui suivent la page d'un concurrent ou d'un
fournisseur du secteur.

**6. Les offres d'emploi.** Une entreprise qui recrute un poste révèle une douleur. Recruter un
assistant administratif, c'est un aveu de surcharge admin. Recruter un commercial, c'est un besoin
de croissance. L'annonce donne le contexte, et souvent le nom du responsable.

**7. Ceux qui ont vu ton profil.** Section "Qui a consulté votre profil". Ils ont fait le premier
pas. Le contact le plus chaud du réseau, et presque personne ne l'exploite.

**8. Ceux qui interagissent avec tes propres posts.** Chaque like et chaque commentaire sur un post
est une main levée. Les inviter dans les 48 h, quand le post est encore frais dans leur tête.

**Priorité absolue :** les gisements 7 et 8 d'abord (déjà chauds), puis 1 et 2 (actifs et
conscients), puis 3 à 6, et la recherche booléenne en dernier. La plupart des gens font l'inverse.

---

## 5. Organiser la liste

Un simple tableur, 8 colonnes, rempli à la main :

| Nom | Poste | Entreprise | Ville | Source | Signal | Statut | Date |
|---|---|---|---|---|---|---|---|

- **Source** : d'où vient le contact (commentaire concurrent, événement, recherche...). C'est ce qui
  donne l'accroche personnalisée plus tard.
- **Signal** : ce qui rend le moment pertinent (recrute, a commenté un post sur X, nouveau poste).
- **Statut** : à réchauffer, invité, accepté, en conversation, RDV, non.

Trier par signal, pas par ordre alphabétique. On appelle les gens chauds d'abord.

**Interdit :** exporter, scraper ou constituer un fichier automatiquement depuis LinkedIn. C'est
contraire aux conditions d'utilisation, et en France, la constitution d'un fichier de prospection
engage sur le RGPD. La liste se remplit à la main, contact par contact, et elle sert à un contact
individuel, jamais à un envoi groupé.

---

## 6. La check-list de la phase 2

- [ ] 10 profils de la cible lus, verbatim relevés
- [ ] Banque de mots-clés en 3 catégories (fonction, douleur, signal)
- [ ] 10 à 20 requêtes booléennes écrites et testées
- [ ] Requête d'exclusion adaptée au secteur
- [ ] Filtres empilés dans le bon ordre, recherches mises en favori
- [ ] Les 8 gisements passés en revue, les 2 plus riches identifiés
- [ ] Tableur de 100 cibles, trié par signal
