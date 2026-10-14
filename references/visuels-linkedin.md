# Les visuels LinkedIn : le cahier des charges

Recherche du 14 octobre 2026. Tout ce qui est dans ce fichier est soit **officiel** (LinkedIn), soit
**mesuré** (avec la source et la taille d'échantillon), soit **calculé** (géométrie). Les opinions de
praticiens sont signalées comme telles.

---

## 0. Avant tout : d'où viennent les chiffres

**LinkedIn ne publie aucune donnée de performance par format.** Seules les spécifications techniques
sont officielles. Tout le reste vient de cinq éditeurs d'outils qui analysent leurs propres
utilisateurs, et chacun vend un produit lié au format qu'il mesure. Aucune réplication indépendante.

| Source | Échantillon | Population | Ce qu'elle divise |
|---|---|---|---|
| **MagicPost** | 1 207 797 posts | Créateurs individuels | Impressions du post |
| **AuthoredUp** | ~3 000 000 posts | **Profils personnels uniquement** | Multiplicateur contre la médiane du profil |
| **Socialinsider** | 1 300 000 posts | **Pages entreprise uniquement** | Impressions |
| **Metricool** | 673 658 posts | Pages et profils | Non précisé |
| **Buffer** | non chiffré | non précisée | **Non défini** |

**Le carrousel va de 1,44 % à 21,77 % d'engagement selon la source.** Un facteur 15. Ce n'est pas
réconciliable : elles ne mesurent ni la même population ni le même dénominateur. **Ne compare jamais
deux chiffres sans regarder la colonne de droite.**

Le chiffre de Buffer (21,77 % pour le carrousel) est le plus cité et le moins exploitable : ni
échantillon LinkedIn, ni période, ni dénominateur. On ne s'appuie jamais dessus.

---

## 1. La découverte qui change la stratégie d'un débutant

**Sous 5 000 abonnés, le carrousel coûte de la portée.**

AuthoredUp, portée d'un post document rapportée à la médiane du même profil :

| Abonnés | Portée relative d'un carrousel |
|---|---|
| 0 à 1 000 | **0,86x** |
| 1 001 à 5 000 | **0,94x** |
| 5 001 à 20 000 | 1,05x |
| 20 001 à 50 000 | 1,30x |
| 50 000 et plus | **1,49x** |

Le carrousel ne devient le format le plus fort **qu'au-delà de 50 000 abonnés**. Il récompense les
comptes déjà installés, pas ceux qui démarrent.

**Ce que ça impose pour un compte neuf :** le format de travail quotidien est **l'image portrait
1080 x 1350**, pas le carrousel. Un carrousel occasionnel se justifie pour la crédibilité et les
enregistrements, pas pour la portée.

---

## 2. Le mix selon la taille du compte

| | Sous 5 000 abonnés | Au-delà de 5 000 |
|---|---|---|
| **Format principal** | **Image portrait 1080 x 1350** | Texte et image, carrousel, texte et image |
| Carrousel | Occasionnel, pour la crédibilité | Régulier, il devient rentable |
| Sondage | **Non** (voir section 6) | Non |
| Republication d'un post d'autrui | **Jamais** | Jamais |
| Vidéo | Seulement si on aime ça | Seulement si on aime ça |

Le mix au-delà de 5 000 abonnés vient de Richard van der Blom (rapport sur 1,3 million de posts,
podcast Creator Science, 2 juin 2026), à 2 ou 3 posts par semaine. Il écarte explicitement le
sondage, la vidéo et le texte seul. Sur le texte seul : « si tu enlèves les 5 % de créateurs du haut
qui l'utilisent, tous les chiffres s'effondrent ».

---

## 3. L'image simple, le format de travail

### Les spécifications officielles

| Paramètre | Valeur officielle LinkedIn |
|---|---|
| Minimum | 552 x 276 px |
| **Largeur recommandée** | **1080 px** |
| **Ratios acceptés** | **de 3:1 à 4:5** |
| Hors de cette plage | Recadrage automatique centré, sans avertissement |
| Poids maximum | 5 Mo |

**Le 4:5 est le format le plus haut que LinkedIn affiche.** Un visuel en 9:16 ou en 3:4 se fait
couper. Tout guide qui recommande plus vertical que 4:5 pour « prendre plus de place » se trompe.

### Le ratio qui obtient le plus d'impressions (mesuré)

AuthoredUp, 368 489 posts à image unique, profils personnels :

| Forme | Impressions médianes | Engagement médian |
|---|---|---|
| **Portrait** | **1 204** | **2,83 %** |
| Paysage | 1 076 | 2,14 % |
| **Carré** | **831** | 2,54 % |

**Le carré fait 31 % d'impressions en moins que le portrait.** Il est pourtant recommandé comme
« défaut sûr » par une bonne partie des éditeurs. La seule donnée mesurée ne soutient pas ce conseil.

Limite honnête : c'est une corrélation sur des médianes, sans contrôle de la taille du compte ni de
la qualité de la créa. Mais trois raisonnements convergent (la seule mesure, le maximum autorisé, la
hauteur occupée dans le fil), donc **1080 x 1350** est le bon choix.

### Le multi-images

| | |
|---|---|
| Nombre d'images | **2 à 20** (officiel) |
| La mise en page | **Fixée par la première image uploadée** (officiel) |
| Rendu | Plafonné à 4:5 (officiel) |
| Nombre optimal | Pas de donnée fiable |

**C'est le format qui progresse.** Chez Socialinsider (pages entreprise), le multi-images monte de
6,45 % à 6,90 % pendant que le document recule de 7,00 % à 6,60 %, et le dépasse au deuxième
trimestre 2026.

---

## 4. La lisibilité : le calcul que personne ne fait

**Aucune étude ne mesure la lisibilité selon la taille de police.** Les recommandations des éditeurs
vont de 16 à 45 px de minimum, soit un facteur 3, en mélangeant pixels et points. Elles sont
inutilisables telles quelles.

**En revanche, la réduction d'échelle est un calcul exact.** Une slide dessinée à 1080 px de large
s'affiche dans un fil mobile d'environ **390 px**. Facteur de réduction : **1080 / 390 = 2,8**.

| Taille au dessin (canevas 1080 px) | Taille à l'écran mobile | Verdict |
|---|---|---|
| 24 px | 8,6 px | Illisible |
| 32 px | 11,4 px | Trop petit |
| 40 px | 14,3 px | Limite basse |
| **45 px** | **16,1 px** | **Le plancher** |
| 60 px | 21,4 px | Sous-titre |
| 90 px | 32,1 px | Titre de slide |
| 120 px | 42,9 px | Accroche de couverture |

Le plancher de 16 px à l'écran est la taille de référence d'un corps de texte web.

**Le barème, en pourcentage de la largeur pour être valable à toute résolution :**

| Élément | Minimum à 1080 px | En % de la largeur |
|---|---|---|
| Corps de texte | 45 px | **4,2 %** |
| Sous-titre | 60 px | 5,6 % |
| Titre de slide | 90 px | 8,3 % |
| Accroche de couverture | 120 px | **11,1 %** |

**Ce que ça invalide :** le « 24 pt minimum » (32 px, soit 11 px à l'écran), le « 28 px minimum » et
le « 16 px minimum » qui fait 5,7 px à l'écran.

**Ce qui se lit dans un fil à 390 px :** une accroche de 3 à 8 mots à 120 px et plus, un chiffre, un
label court. **Rien d'autre.** Un paragraphe dans une image ne se lit pas.

---

## 5. Le carrousel

### Les spécifications officielles

| Paramètre | Valeur officielle |
|---|---|
| Formats acceptés | PDF, DOC, DOCX, PPT, PPTX |
| Poids maximum | **100 Mo** (pas 10 Mo comme le disent certains guides) |
| Pages maximum | 300 |

**Le PDF est le seul rendu fiable**, constat unanime des praticiens. **Les liens dans un PDF ne sont
pas cliquables** : le lien va dans le texte du post ou en premier commentaire.

### Le nombre de slides : la donnée contredit le conseil courant

Le conseil quasi universel est 5 à 10 slides. **La seule mesure trouvée dit l'inverse.**

MagicPost, 67 765 carrousels, 12 mois à juin 2026 :

| Slides | Likes médians | Commentaires médians |
|---|---|---|
| 2 à 5 | **22** | 3 |
| 6 à 8 | 26 | 6 |
| 9 à 12 | **49** | 17 |
| 13 à 20 | **58** | 20 |
| 21 et plus | 60 | 13 |

**Un carrousel de 13 à 20 slides fait 2,6 fois les likes d'un carrousel de 2 à 5.** Et l'effet
survit au contrôle par taille d'audience, ce qui le rend crédible : il tient dans les trois bandes
d'abonnés.

**La nuance :** au-dessus de 50 000 abonnés la courbe s'inverse (196 likes à 13 slides et plus,
contre 253 à 9-12). Et MagicPost signale lui-même la limite : un carrousel long vient d'un auteur qui
y a mis plus de travail, et profondeur et effort voyagent ensemble.

**Donc : 9 à 15 slides.** 9 à 12 au-delà de 50 000 abonnés. On ne retient pas le 21 et plus :
l'échantillon y est le plus petit et les commentaires y redescendent.

**L'abandon au-delà de 10 slides n'est mesuré par personne.** LinkedIn n'expose pas le taux de
complétion, donc aucun outil extérieur ne peut le mesurer. Le « -40 % de complétion au-delà de 15
slides » qui circule n'a aucune source.

### Le texte par slide

**Plafond géométrique**, calculé sur un canevas 1080 x 1350 avec 50 px de marge et 45 px de corps :
environ 43 caractères par ligne, 8 lignes, soit **environ 55 à 60 mots**. C'est un plafond, pas une
cible. **La cible pratique est 25 à 35 mots**, pour garder du blanc.

**La seule règle sur laquelle toutes les sources convergent :** une idée par slide. Sept points à
faire, sept slides, pas trois slides avec deux ou trois points chacune.

### La légende du post : l'inverse du post texte

AuthoredUp, sur 3 millions de posts :

| | Portée |
|---|---|
| Carrousel avec une légende de **0 à 100 caractères** | **1,28x** |
| Post texte de 20 phrases et plus | 1,14x |
| Post texte de moins de 5 phrases | 0,64x |

**Légende longue sur un post texte, légende très courte sur un carrousel.** La légende ne doit pas
concurrencer la couverture.

### La structure (recommandation de praticiens, non mesurée)

| Slide | Ce qu'elle porte |
|---|---|
| **1, la couverture** | Une affirmation tranchée ou un chiffre, accroche à 120 px et plus, un indice de swipe. C'est **la seule chose que le fil affiche** |
| **2 à n-1** | Une idée chacune, numérotées, alternance texte et visuel |
| **3 ou 4** | Une rupture visuelle (fond différent, citation) au moment où l'attention baisse |
| **La dernière** | Un seul appel à l'action, le nom, le visage |

**Le gabarit le plus transposable** pour un courtier ou un artisan, vu chez Passionfroot : problème,
solution, résultat, un temps par slide, avec une citation client au milieu.

---

## 6. Ce qui tue la portée, classé par solidité de la preuve

| Erreur | Coût mesuré | Source |
|---|---|---|
| **Republier le post d'un autre** | **0,29x** de portée, 0,22x d'engagement | AuthoredUp, 3 M posts |
| Publier un article autonome | 0,69x | AuthoredUp |
| **Mettre un lien dans le post** | **environ 20 %** à créateur constant | MagicPost, 566 957 posts |
| Image carrée au lieu de portrait | -31 % d'impressions | AuthoredUp, 368 489 posts |
| Carrousel de 2 à 5 slides | 22 likes contre 49 à 58 | MagicPost, 67 765 carrousels |
| Carrousel sous 5 000 abonnés | 0,86x à 0,94x | AuthoredUp |
| **Sondage, depuis mi-mai 2026** | **-22 %** contre le post photo du même créateur | MagicPost, 11 123 sondages |
| Contenu générique, sans détail vécu | -13 %, puis -23 % depuis fin juillet 2026 | MagicPost, 40 937 posts |
| Texte sous 45 px dans un visuel | Illisible sur mobile | Calcul |

**Republier coûte trois fois plus cher que tout le reste.** Si on ne corrige qu'une chose, c'est
celle-là.

### Le lien : un paradoxe statistique à comprendre

MagicPost, 566 957 posts :

| Mesure | Résultat |
|---|---|
| URL dans le corps, tous comptes mélangés | **858** impressions contre 786 sans lien |
| URL dans le corps, **à créateur constant** | **21 % en dessous** des posts sans lien du même créateur |

Les deux sont vrais. Ce sont les gros comptes qui mettent des liens, et ils ont une portée de base
plus haute. **La comparaison à créateur constant est la bonne pour décider**, parce qu'elle répond à
« que se passe-t-il si **moi** je mets un lien ». Réponse : environ 20 %, pas 60 %. Et l'écart s'est
resserré à partir de mi-mai 2026 (de 39 % à 19 % pour les cartes de lien).

### Le sondage ne fait plus de portée

Il était à 1,78x de portée. **Depuis mi-mai 2026, il prend 22 % d'impressions en moins que le post
photo moyen du même créateur**, contre 9 % de plus plus tôt dans l'année (MagicPost, 11 123
sondages). Le conseil « un sondage tous les dix posts pour être vu » est périmé.

### Le contenu qui sent la machine

MagicPost, 93 740 posts notés par leur détecteur : un score d'IA de 61 à 100 obtient **15 likes
médians**, contre **35** pour un score de 0 à 20. En mai 2026, LinkedIn a annoncé agir contre ce
qu'il appelle « AI slop » : du contenu qui sonne poli sans point de vue réel. **C'est une action
contre le générique, pas contre l'IA comme outil.** Détecteur maison, non vérifié de façon
indépendante, mais la direction rejoint la règle du skill : le squelette vient de soi.

---

## 7. La vidéo

### Les spécifications

| | Annonces (officiel) | Pages entreprise (officiel) |
|---|---|---|
| Ratio | 9:16 à 16:9 | 1:2,4 à 2,4:1 |
| Durée | 3 s à 30 min | 3 s à 10 min |
| Poids | jusqu'à 200 Mo | jusqu'à 5 Go |

Format conseillé : MP4, H.264 et AAC. Le « 15 minutes sur desktop » des guides n'est confirmé sur
aucune page officielle.

### La durée : deux mesures indépendantes, même conclusion

| Durée | Likes médians (MagicPost, 100 758 vidéos) | Portée relative (AuthoredUp, 36 946 vidéos) |
|---|---|---|
| Moins de 30 s | 26 | 0,96x |
| **30 à 60 s** | 37 | **0,95x** |
| 1 à 2 min | 45 | 0,97x à 1,07x |
| **2 à 5 min** | **48** | **1,21x** au-delà de 3 min |
| Plus de 5 min | 30 | non mesuré |

**L'optimum est entre 2 et 5 minutes.** La bande 30 à 60 secondes est la plus utilisée (30 % des
vidéos) **et la pire**. La durée médiane d'une vidéo LinkedIn est de 51 secondes : la majorité des
créateurs tournent dans la bande qui performe le moins bien.

### Ce qui est établi, et ce qui ne l'est pas

| Affirmation | Statut |
|---|---|
| La vidéo fait moins de vues que les autres formats | **Établi**, quatre sources |
| Sa portée médiane a baissé de 36 % sur un an | **Établi**, AuthoredUp |
| La vidéo convertit mieux | **Non vérifiable.** Aucun outil tiers n'a accès aux rendez-vous ni au chiffre d'affaires |
| Les sous-titres augmentent le visionnage | **Pas de donnée LinkedIn.** Le seul chiffre mesuré (+12 %) vient de Facebook |
| Le vertical bat le carré | **Pas de donnée.** Fait de produit : le paysage n'apparaît pas dans le fil vidéo vertical |

**Le texte qui accompagne la vidéo, lui, est mesuré :** 20 phrases et plus font 1,13x de portée,
moins de 5 phrases font 0,73x. Sur une vidéo, on écrit long.

---

## 8. Ce que personne ne mesure, et qu'il faut arrêter de chercher

| Point | Pourquoi c'est structurel |
|---|---|
| Taux de complétion d'un carrousel | LinkedIn ne l'expose pas, aucun outil ne peut le mesurer |
| Lisibilité selon la police | Aucun test. Le calcul d'échelle est la seule base |
| Quantité de texte dans une image | Aucun test, pas de règle des 20 % comme chez Meta |
| Effet des sous-titres sur LinkedIn | Aucune étude nommée |
| Rétention des 3 premières secondes | Aucune donnée publique |
| Photos de banque d'images | Argumentation, jamais mesure |
| Conversion commerciale par format | Aucun outil tiers n'a accès au chiffre d'affaires |
| **La pondération du temps de lecture** | **LinkedIn ne l'a jamais publiée** |

**La dernière ligne compte.** L'idée que « le temps de lecture a remplacé les likes comme signal
principal » est répétée par tous les éditeurs d'outils. **C'est une inférence de praticien, jamais
documentée par LinkedIn.** Elle est plausible. Elle ne doit pas servir de fondation à une stratégie,
surtout quand la donnée mesurée montre que le carrousel perd de la portée sous 5 000 abonnés.

Même prudence sur les multiplicateurs attribués partout à van der Blom (1,39x pour le document,
1,20x pour l'image, 0,86x pour la vidéo, 1,78x pour le sondage) : **ils ne sont confirmés dans aucune
source primaire atteinte.** Ils circulent de blog en blog. Pour les citer, il faut ouvrir son rapport.

---

## 9. La fiche technique, à donner au rendu

```
IMAGE (le format de travail)
  Canevas        1080 x 1350 px, ratio 4:5
  Poids          moins de 5 Mo
  Texte          accroche de 3 à 8 mots, 120 px et plus
  Plancher       45 px pour tout texte

CARROUSEL (occasionnel sous 5 000 abonnés)
  Canevas        1080 x 1350 px, toutes les slides au même ratio
  Slides         9 à 15  (9 à 12 au-delà de 50 000 abonnés)
  Export         PDF, 300 DPI, moins de 100 Mo
  Marges         50 px minimum sur chaque bord
  Polices        corps 45 px, sous-titre 60, titre 90, couverture 120
  Texte          25 à 35 mots par slide, une idée par slide
  Slide 3 ou 4   rupture visuelle
  Liens          jamais dans le PDF
  Légende        0 à 100 caractères

VIDEO (seulement si on aime ça)
  Durée          2 à 5 minutes, jamais 30 à 60 secondes
  Ratio          1:1 pour tout couvrir, 9:16 pour le fil vertical
  Format         MP4, H.264 et AAC
  Texte du post  long, 20 phrases et plus
```

---

## 10. Les sources

**Officielles LinkedIn**
- [Partage de documents](https://www.linkedin.com/help/linkedin/answer/a564109)
- [Spécifications des images](https://www.linkedin.com/help/linkedin/answer/100983)
- [Annonces vidéo](https://www.linkedin.com/help/linkedin/answer/a424737)
- [Vidéo des pages](https://www.linkedin.com/help/linkedin/answer/a1311816)

**Jeux de données**
- [MagicPost, nombre de slides](https://magicpost.in/blog/how-many-slides-in-a-linkedin-carousel), 67 765 carrousels
- [MagicPost, meilleur format](https://magicpost.in/blog/best-linkedin-post-format), 1 207 797 posts
- [MagicPost, pénalité IA](https://magicpost.in/blog/does-linkedin-penalize-ai-content), 93 740 posts
- [AuthoredUp, meilleur contenu 2026](https://authoredup.com/blog/best-performing-content-on-linkedin), ~3 M posts
- [AuthoredUp, statistiques](https://authoredup.com/blog/linkedin-post-statistics), 368 489 posts image
- [AuthoredUp, vidéo](https://authoredup.com/blog/linkedin-video-posts), 36 946 vidéos
- [Socialinsider, benchmarks](https://www.socialinsider.io/social-media-benchmarks/linkedin), 1,3 M posts
- [Metricool, tendances 2026](https://metricool.com/linkedin-trends/), 673 658 posts

**Praticiens**
- [Creator Science ep. 307, Richard van der Blom](https://creatorscience.com/podcast/richard-van-der-blom-2/), 2 juin 2026
- [Buffer, exemples de carrousels](https://buffer.com/resources/linkedin-carousel-examples/)
- [Kleo, 31 exemples](https://kleo.so/blog/linkedin-carousel-post-examples)
