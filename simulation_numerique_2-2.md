# La simulation numérique 2/2

Maintenant que nous avons expliqué dans le précédent podcast les besoins de simulation, les problématiques rencontrées avec différents champs de recherche et la première simulation numérique de l'histoire (finir par le hasard et les probabilités et toutes ces choses que je déteste personnellement a été dur pour moi) nous allons retourner sur des équations déterministes.

## Discrétisation

Il existe différentes catégories de simulation numérique mais je ne me pencherais que sur la simulation continue qui couvre, d'une part ce que je connais, et aussi les équations différentielles et à dérivées partielles.

L'idée est en fait que la résolution analytique des équations de phénomènes physiques est très complexe et en dehors de cas particuliers ou alors avec des simplifications importantes impossible pour certaines équations comme par exemple celle décrivant des fluides : l'équation de Navier-Stokes qui possède de manière générale des termes non-linéaire (**expliquer ce que veut dire non-linéaire**).

Je vais aborder trois grandes méthodes de discrétisation par ordre d'apparition :

 * Les différences finies
 * Les éléments finis
 * Les volumes finis

Chacune possède une origine spécifique et a pour rôle de permettre la transformation d'un problème basé sur des équations différentielles ou aux dérivés partielles donc plutôt de l'analyse vers un problème de résolution de système linéaire de type :

$$ A.x = b $$

Où $A$ est la matrice qui représente le problème, $x$ la solution à trouver et $b$ qui représente les conditions initiales/aux limites qui est un problème d'algèbre linéaire.

Le travail que l'on fait finalement quand on part de zéro est donc le suivant :

 1. On assure que la méthode de discrétisation est capable de fournir une solution unique (toute la branche mathématique de l'analyse numérique avec des gens comme Schwartz, Cauchy, Lipschitz ou encore Jacques-Louis Lions)
 2. On ramène le problème décrit par un modèle basé sur des équations différentielles ou à dérivées partielles à un problème d'algèbre linéaire
 3. On choisit un algorithme qui possède les bonnes propriétés pour la résolution de mon système linéaire
 4. On implémente cet algorithme
 5. On l'exécute (avec ou sans parallélisation)

### Différences finies

#### Erreurs associées, condition s destabilité et de convergence

### Éléments finis

#### Erreurs associées, condition s destabilité et de convergence

### Volumes finis

#### Erreurs associées, condition s destabilité et de convergence

## Résolution de systèmes linéaires

* méthodes directes
* méthode quasi-stationnaires pour des problèmes complexes avec des méthodes de type newton en temps avec les conditions CFL, et leur adaptation, etc
* méthodes itératives : GMRES, Gradient conjugué, etc
* parallélisation de ces algos
* décomposition de domaine avec les problèmes qui apparaissent quand on découpe trop

## Les solutions informatiques qui existent

* toutes les librairies qui existent pour permettre d'avoir du calcul efficace et des choses déjà à dispo pour créer ses programmes et ses codes de calcul
* Expliquer comment l'informatique a évolué avec les modèles, les discrétisations, les codes de calcul, les maillages

## Les problèmes qui sont apparus au cours du temps

* Aborder aussi la question du passage à l'informatique avec les différents problèmes que l'on voit apparaître d'un point de vue programmatique
* Expliquer les problèmes qui sont apparus pour traiter les données de bases, intermédiaires, ou de résultat -> lien vers le bigData avec le changement de comportement par rapport au post-traitement des données, in-place avec les outils de visu intégrés aux codes de calcul, les nouveaux développements de composants pour gérer ces données, les vitesses d'écriture et de lecture (expliquer par exemple le traitement des données du LHC avec nos amis du CC IN2P3)

## Les cartes graphiques pour aider dans la simulation

* Expliquer l'intégration des outils comme par exemple les cartes graphiques au sein de ce jeu à profondément changé la donne : utilisé pour faire du calcul matricielle elles peuvent avoir de l'intérêt mais pour des calculs très spécifiques. (donner des pour et des contres, avec des exmeples : ceux des journées du CCRT ou de nos amis qui font de la RDM) (**Héhé on fait justement ça dans l'équipe ou je suis, mais pour de la PG**)

## Linpack, le top500, le green500

* Expliquer que finalement les outils comme Linpack ont servi à faire des classements des meilleurs machines de calcul
* Faire un peu de digression sur le changement d'outil pour faire les classements des machines avec notamment les limites de linpack (article en rapport à retrouver)
* Faire aussi un peu de digression sur le green500 et les problémes d'énergie qui apparaissent aujourd'hui

## La recherche informatique et les simulations à portée des quidam

* Expliquer le besoin de plate-formes comme celles de grid5000 pour tester des nouveaux algos : recherche informatique est aussi important que la recherche qui se sert de l'informatique
* Expliquer aussi qu'aujourd'hui on veut approcher un maximum tout cela de l'utilisateur et qu'il est nécessaire combler un fossé entre ces outils complexes, les utilisateurs métier et les simulations qu'ils veulent faire pour finalement, juste, comprendre et prévoir les phénomènes qui nous entourent. (**Oui t'as de plus en plus de moteur de simu**)

# Notes

## Différences entre la description lagrangienne et la description eulerienne

Il est utile de rappeler que deux points de vue peuvent être adoptés pour décrire le mouvement dans un milieu continu :

 * La description lagrangienne suit chaque particule le long de sa trajectoire : la valeur d'une variable (température, pression, vitesse…) dépend de l'instant $t$ et de la particule considérée (identifiée par sa position $\vec{\xi}$ à l'instant $t_0$ de référence).
 * La description eulérienne est associée à un repère indépendant du mouvement du fluide, généralement fixe : la valeur des variables fluides dépend alors du temps t et de la position d'observation $\vec{x}$.

La description lagrangienne est peut-être plus intuitive mais revêt un inconvénient majeur pour décrire les fluides : contrairement aux solides, les particules peuvent se déplacer librement dans la totalité d'un domaine fluide. L'analyse d'un écoulement est alors une tâche très ardue (on ne peut même pas exprimer un gradient par exemple, car on ne connait pas les particules voisines !). On préfère donc très largement utiliser un point de vue eulérien pour décrire le mouvement d'un fluide. La difficulté réside alors dans le fait que la conservation de la quantité de mouvement est physiquement vérifiée uniquement si l'on considère une particule fluide. Or la particule $\vec{\xi}$ (variable de Lagrange) coïncidant avec le point d'observation $\vec{x}$ (variable d'Euler) change à chaque instant $t$. En termes plus imagés, le randonneur qui observe un point fixe de la rivière n'a jamais les mêmes particules fluides sous les yeux. En particulier, il n'y a aucune raison pour qu'au point $\vec{x}$ il voie la même particule aux instants $t$ et $t + \delta t$. Comment peut-il alors calculer la vitesse ou l'accélération de la particule fluide qu'il a instantanément sous les yeux ?