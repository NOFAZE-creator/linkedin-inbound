# Les API LinkedIn : ce qui existe vraiment

État des lieux au 24 juillet 2026, vérifié sur la documentation officielle LinkedIn et Microsoft
Learn. À relire avant toute décision technique : ce document décide de ce qu'un produit peut faire
ou ne pas faire.

**Le résumé en trois lignes.** LinkedIn n'a pas une API, il en a une dizaine, presque toutes fermées.
Deux seulement sont ouvertes à n'importe quel développeur : se connecter, et publier. Tout le reste
demande une approbation, sauf une porte ouverte par le droit européen que presque personne n'utilise.

---

## 1. Les permissions ouvertes à tous (aucune approbation)

Ce sont les seules qu'un développeur seul obtient en quelques minutes, depuis le portail développeur,
onglet Products.

| Produit | Permission | Ce que ça permet |
|---|---|---|
| Sign in with LinkedIn using OpenID Connect | `profile` | Nom, titre et photo du membre authentifié |
| Sign in with LinkedIn using OpenID Connect | `email` | Adresse email principale |
| Share on LinkedIn | `w_member_social` | **Publier, commenter et aimer au nom du membre authentifié** |

**C'est tout.** Trois permissions. Elles suffisent pour un produit qui fait de la connexion et de la
publication programmée, et pour rien d'autre.

`w_member_social` s'utilise en OAuth 3-legged, en POST sur l'API de contenu (UGC). Réponse 201, et
l'identifiant du post revient dans l'en-tête `X-RestLi-Id`.

---

## 2. Ce qui demande une approbation LinkedIn

| Programme | Pour quoi | Réalité de l'accès |
|---|---|---|
| **Advertising API** (Marketing) | Créer et piloter des campagnes publicitaires | Approbation requise, dossier entreprise |
| **Community Management API** | Publier et modérer au nom d'une **page entreprise** (`w_organization_social`) | Société enregistrée, page LinkedIn vérifiée, revue en deux paliers (Development puis Standard). Quelques semaines à plusieurs mois |
| **Sales Navigator (SNAP)** | Données et intégration Sales Navigator | Partenaire uniquement, et **fermé aux nouvelles candidatures en 2026** |
| **Talent Solutions** (RSC, Apply Connect, Premium Job Posting) | Recrutement, ATS | Partenariat, dossier entreprise |
| **Learning API** | LinkedIn Learning | Demande séparée |
| **Compliance** (`r_compliance`, `w_compliance`) | Archivage réglementaire | **Fermé. Ne peut plus être demandé du tout** |

**À retenir :** il n'existe aucune API officielle, à aucun niveau d'accès, pour rechercher des
personnes, lire ses relations en temps réel, envoyer des invitations, ou envoyer des messages privés
en dehors des programmes partenaires fermés. Ce n'est pas une question de prix ou de patience, ces
produits n'existent pas en libre-service.

---

## 3. La porte ouverte par le droit européen (la vraie découverte)

Le **Digital Markets Act** oblige LinkedIn à donner aux membres européens l'accès à leurs propres
données, et à pouvoir les transmettre à une application tierce de leur choix. LinkedIn a donc publié
la **Member Data Portability API**, et elle est nettement plus riche que tout le reste.

### Les deux variantes

| Produit | Permission | Pour qui |
|---|---|---|
| Member Data Portability (Member) | `r_dma_portability_member` | Un membre récupère ses propres données |
| **Member Data Portability (3rd Party)** | `r_dma_portability_3rd_party` | **Une application tierce récupère les données d'un membre, avec son consentement** |

### Ce qu'elle donne réellement

Deux API. La **Snapshot API** rend un instantané de l'historique du membre, la **Changelog API**
rend ses interactions (posts, commentaires, réactions) sur les **28 derniers jours**.

La liste des domaines de la Snapshot API compte plus de 60 entrées. Les plus utiles pour un outil
d'acquisition :

| Domaine | Contenu |
|---|---|
| **CONNECTIONS** | **Nom, poste, entreprise et date de connexion des relations de 1er degré** |
| **INVITATIONS** | Invitations envoyées et reçues |
| **INBOX** | Messages envoyés et reçus |
| **ALL_COMMENTS** | Commentaires du membre, hors groupes |
| **ALL_LIKES** | Réactions du membre |
| **MEMBER_SHARE_INFO** | Publications et republications, avec date, URL et visibilité |
| **SEARCHES** | Recherches récentes du membre |
| **MEMBER_FOLLOWING**, **COMPANY_FOLLOWS**, **GROUPS**, **EVENTS** | Suivis, groupes, événements |
| **PROFILE**, **POSITIONS**, **SKILLS**, **RECOMMENDATIONS** | Le profil complet |
| **CONTACTS**, **PHONE_NUMBERS**, **EMAIL_ADDRESSES** | Contacts importés et coordonnées |

Autrement dit, le pipeline et une partie des signaux peuvent se remplir automatiquement, légalement,
avec le consentement explicite du client.

### Les quatre conditions, et elles sont sérieuses

1. **Zone EEE uniquement.** Seuls les membres de l'Espace économique européen et de la Suisse
   peuvent consentir. Pour un marché français, c'est parfait. Pour un client américain, c'est mort.
2. **Une page entreprise LinkedIn vérifiée** est obligatoire pour créer l'application, et
   l'association doit être validée par le super-administrateur de cette page.
3. **Une vérification d'entreprise** : nom légal de la société, adresse enregistrée, site web,
   politique de confidentialité, et une **adresse email professionnelle** (les adresses personnelles
   sont refusées).
4. **Une revue par LinkedIn**, avec formulaire de demande d'accès. L'accord n'est pas automatique.

### Deux pièges techniques

- La Snapshot API est **figée sur la version `202312`**. Envoyer un autre numéro dans l'en-tête
  `Linkedin-Version` renvoie une erreur `426 NONEXISTENT_VERSION`.
- Le champ `total` de la pagination n'est pas fiable. Il faut boucler sur les pages jusqu'à recevoir
  l'erreur "No data found for this memberId".

### Le point juridique, à lire attentivement

Les conditions de la Portability API **écartent explicitement** les restrictions d'usage commercial
qui s'appliquent aux autres API : les clauses limitant les types de cas d'usage métier ne
s'appliquent pas aux données de portabilité. L'usage commercial est donc permis, avec l'obligation
de **supprimer immédiatement les données d'un membre à sa demande ou à la fermeture de son compte**,
et l'interdiction de revendre ou d'ouvrir un accès tiers à ces données.

**Mais le RGPD s'applique par-dessus, et c'est là que ça se complique.** Le domaine `CONNECTIONS`
contient les données personnelles de **tiers qui n'ont rien consenti**. Le consentement du client ne
vaut pas consentement de ses 500 relations. Un produit qui stocke ces données doit traiter la base
légale, la minimisation, la durée de conservation et le droit d'opposition de ces tiers.

Ce n'est pas un détail administratif : c'est le point qui fait la différence entre un produit
défendable et une amende. Avant tout stockage de `CONNECTIONS` ou `INBOX` en base, faire valider le
montage par quelqu'un dont c'est le métier.

**Le contournement prudent, qui évite tout le problème :** ne rien stocker côté serveur. L'API rend
les données, l'application les affiche au client dans son navigateur, et n'en garde que ce que le
client saisit lui-même. Moins élégant, infiniment plus sûr.

---

## 4. Les API non officielles, et pourquoi il faut s'en tenir loin

Il existe un marché entier d'API "LinkedIn" non officielles : elles fonctionnent par
rétro-ingénierie, par cookie de session emprunté au compte de l'utilisateur, ou par scraping.
Elles offrent exactement ce que l'API officielle refuse : recherche de profils, envoi
d'invitations, messagerie, données d'entreprise.

**Ce qui est arrivé au plus gros d'entre eux.** LinkedIn a poursuivi **Proxycurl** en justice en
janvier 2025, l'accusant d'avoir exploité des centaines de milliers de faux comptes pour aspirer des
millions de profils. Six chefs d'accusation, dont rupture de contrat, fraude et violation du
Computer Fraud and Abuse Act. **Proxycurl a fermé définitivement le 4 juillet 2025**, sous injonction
permanente de supprimer toutes les données obtenues et de prévenir ses propres clients. L'entreprise
faisait 10 millions de dollars de revenu annuel récurrent. Ça n'a pas suffi.

**Les trois risques, dans l'ordre où ils tombent :**
1. **Le compte du client saute.** L'authentification par cookie déclenche les protections de
   LinkedIn (connexion depuis une autre IP, un autre appareil). Le client perd son réseau, et c'est
   le prestataire qui l'a branché.
2. **Le fournisseur disparaît du jour au lendemain.** Un produit construit sur une de ces API meurt
   avec elle, comme tous les clients de Proxycurl l'ont appris en 2025.
3. **Le risque juridique remonte la chaîne.** LinkedIn appartient à Microsoft, et a démontré qu'il
   poursuit jusqu'à la fermeture.

**Verdict : aucune de ces API dans un produit vendu à un client.** Le gain de fonctionnalité ne
compense jamais le risque de faire perdre son compte LinkedIn à quelqu'un qui a payé pour être aidé.

---

## 5. Ce qu'un produit peut réellement faire, par palier

| Palier | Ce qu'il faut | Ce que le produit peut faire |
|---|---|---|
| **0. Aucune API** | Rien | Tout le pilotage manuel : rituel, pipeline saisi à la main, table des signaux, mesures. C'est la console actuelle, et elle fonctionne déjà |
| **1. Self-serve** | 15 minutes sur le portail développeur | Connexion du client par LinkedIn, **publication et programmation de posts**, commentaires et réactions au nom du membre |
| **2. Portabilité DMA** | Société, page entreprise vérifiée, revue LinkedIn, cadrage RGPD | **Import automatique des relations, des invitations, de la messagerie et de l'activité**. Le pipeline et une partie des signaux se remplissent seuls. Clients européens uniquement |
| **3. Community Management** | Société, page vérifiée, revue en deux paliers, plusieurs semaines à plusieurs mois | Publier et modérer au nom des **pages entreprise** des clients |
| **Jamais** | Rien n'y donne accès en libre-service | Rechercher des profils, envoyer des invitations, lire qui a consulté le profil |

**Le palier 1 est atteignable aujourd'hui, seul, gratuitement.** C'est lui qui transforme l'outil de
pilotage en vrai produit : le client connecte son compte une fois, et publie depuis l'application.

**Le palier 2 est le vrai fossé concurrentiel**, précisément parce qu'il demande une société, une
page vérifiée et un cadrage RGPD, et que la plupart des concurrents préfèrent le raccourci illégal
qui finit comme Proxycurl.

---

## 6. Ce qui reste impossible, et qu'il faut assumer en vente

Aucune API, à aucun palier, ne permet :
- de **rechercher des personnes** (la recherche booléenne reste manuelle, dans LinkedIn) ;
- d'**envoyer des invitations** automatiquement ;
- de savoir **qui a consulté le profil** (aucun domaine de portabilité ne le couvre) ;
- de lire le fil d'actualité ou les publications d'autres membres.

C'est structurel, et c'est une bonne nouvelle commerciale : personne ne peut le faire légalement,
donc l'avantage ne se prend pas sur l'automatisation, il se prend sur la méthode et la régularité.

---

## Sources

- [Getting Access to LinkedIn APIs, Microsoft Learn](https://learn.microsoft.com/en-us/linkedin/shared/authentication/getting-access)
- [Share on LinkedIn, Microsoft Learn](https://learn.microsoft.com/en-us/linkedin/consumer/integrations/self-serve/share-on-linkedin)
- [Member Data Portability 3rd Party, Microsoft Learn](https://learn.microsoft.com/en-us/linkedin/dma/member-data-portability/member-data-portability-3rd-party/)
- [Member Snapshot API, Microsoft Learn](https://learn.microsoft.com/en-us/linkedin/dma/member-data-portability/shared/member-snapshot-api)
- [Member Snapshot Domains, Microsoft Learn](https://learn.microsoft.com/en-us/linkedin/dma/member-data-portability/shared/snapshot-domain)
- [LinkedIn DMA Portability API Terms](https://www.linkedin.com/legal/l/portability-api-terms)
- [Community Management App Review, Microsoft Learn](https://learn.microsoft.com/en-us/linkedin/marketing/community-management-app-review)
- [Restricted Uses of LinkedIn Marketing APIs and Data, Microsoft Learn](https://learn.microsoft.com/en-us/linkedin/marketing/restricted-use-cases)
- [Proxycurl Shuts Down, annonce du fondateur](https://nubela.co/blog/goodbye-proxycurl/)
- [LinkedIn Wins Legal Case Against Data Scrapers, Yahoo Finance](https://finance.yahoo.com/news/linkedin-wins-legal-case-against-162510557.html)
