# La simulation numérique 2/2

Maintenant que nous avons expliqué dans le précédent podcast les besoins de simulation, les problématiques rencontrées avec différents champs de recherche et la première simulation numérique de l'histoire (finir par le hasard et les probabilités et toutes ces choses que je déteste personnellement a été dur pour moi) nous allons retourner sur des équations déterministes.

## Rappel sur les types de simulation

Je ne l'avais pas forcément expliqué, mais il y a plusieurs types de simulation numériques possibles [^siminfowp] :

 * La simulation discrète dans laquelle le système est soumis à une succession d’évènements qui le modifient. Ces simulations ont vocation à appliquer des principes simples à des systèmes de grande taille. La simulation discrète se divise en deux grandes catégories :
    * asynchrone ou time-slicing : on simule à chaque fois le passage d’une unité de temps sur tout le système. Ce terme n'est généralement plus utilisé dans le domaine professionnel depuis l'apparition croissante des nouvelles technologies.
    * synchrone ou event-sequencing : on calcule l’arrivée du prochain événement, et on ne simule qu’événement par événement, ce qui permet souvent des simulations rapides, bien qu’un peu plus complexes à programmer.
 * La simulation par agents, où la simulation est segmentée en différentes entités qui interagissent entre elles. Elle est surtout utilisée dans les simulations économiques et sociales, où chaque agent représente un individu ou un groupe d’individus. Par nature, son fonctionnement est asynchrone.
 * La simulation continue, où le système se présente sous la forme d’équations différentielles à résoudre. 

Dans la suite de ce podcast, je vais sûrement me pencher sur la simulation continue.

Il existe d'ailleurs différentes méthodes de simulation, avec par exemple les méthodes de monte-carlo comme nous l'avons vu dans le précédent podcast, mais aussi les simulation atomistiques (pour certaines appelées ab initio) dont un exemple serait l'étude de l'eau avec un travail au niveau des atomes, puis des molécules, puis de la masse globale ou encore celles dont je vais parler qui sont les méthodes de discrétisation.

## Pourquoi la discrétisation ?

L'idée est en fait que la résolution analytique des équations de phénomènes physiques est très complexe et en dehors de cas particuliers ou alors avec des simplifications importantes impossible pour certaines équations comme par exemple celle décrivant des fluides : l'équation de Navier-Stokes qui possède de manière générale des termes non-linéaire.

Comme expliqué sur Wikipédia [^princsuppwp] : 
On dit qu'un système de type entrée-sortie est linéaire ou relève du principe de superposition si:
 
 * à la somme de deux entrées quelconques correspond la somme des deux sorties correspondantes,
 * à un multiple d'une entrée quelconque correspond le même multiple de la sortie correspondante.

Dans le domaine des systèmes physiques et mécaniques, on appelle souvent l'entrée *excitation* et la sortie *réponse*.
Plus précisément, si l'on note les excitations $f$ (par référence aux forces en mécanique) et les réponses $x$ (par référence aux mouvements générés par les forces) :

 * Lorsque l'on sollicite le système par une entrée (excitation) $f_1$, la réponse (déplacement) est $x_1$ ;
 * Lorsque l'on sollicite le système par une entrée (excitation) $f_2$, la réponse (déplacement) est $x_2$ ;

alors le système est dit linéaire si et seulement si pour $\lambda_1$ et $\lambda_2$ deux nombres quelconques, la réponse à l'excitation $\lambda_1.f_1 + \lambda_2.f_2$ est $\lambda_1.x_1 + \lambda_2.x_2$.

Je vais aborder trois grandes méthodes de discrétisation par ordre d'apparition :

 * Les différences finies
 * Les éléments finis
 * Les volumes finis

Chacune possède une origine spécifique et a pour rôle de permettre la transformation d'un problème basé sur des équations différentielles ou aux dérivés partielles donc plutôt de l'analyse vers un problème de résolution de système linéaire de type :

$$ A.x = b $$

Où $A$ est la matrice qui représente le problème, $x$ la solution à trouver et $b$ qui représente les conditions initiales/aux limites qui est un problème d'algèbre linéaire.

Le travail que l'on fait finalement quand on part de zéro est donc le suivant :

 1. On définit les équations du modèle qui représente le phénomène que l'on souhaite étudier avec ses conditions aux limites
 2. On assure que la méthode de discrétisation est capable de fournir une solution unique (toute la branche mathématique de l'analyse numérique avec des gens comme Schwartz, Cauchy, Lipschitz ou encore Jacques-Louis Lions)
 3. On ramène le problème décrit par un modèle basé sur des équations différentielles ou à dérivées partielles à un problème d'algèbre linéaire
 4. On choisit un algorithme qui possède les bonnes propriétés pour la résolution de mon système linéaire
 5. On implémente cet algorithme
 6. On l'exécute (avec ou sans parallélisation)

## Définition du domaine

On a déjà parlé dans le premier podcast de ce que l'on entend par modèle, un point qu'il est important de précisé c'est qu'il faut expliquer sur quel domaine ce modèle va s'appliquer (on peut voir en physique par exemple que les théories de la relativité générale et celle de la mécanique quantique par exemple n'ont pas le même domaine d'application) et avec quelles conditions aux limites/initiales.

Assez souvent on va donc donner les équations qui s'appliqueront sur le domaine et on parlera des conditions aux limites pour dire ce qu'il se passe sur les "bords" :

 * une poutre est fixée à un mur
 * un flux de liquide est présent sur l'entrée d'un tuyau, etc

Ces conditions aux limites vont être ainsi de plusieurs types [^condlimiteswp] :

 * *Les conditions aux limites en temps* : assez souvent on va imposer des conditions à $t=0$ qui vont par exemple être les conditions initiales d'une simulation en météorologie. On peut aussi imposer des conditions à $t=+\inf$, mais je n'ai pas trouvé d'exemple assez parlant de l'usage de telles conditions aux limites.
 * *Les conditions aux limites en espace* : il y en a de différents types, voici les plus classiques :
    * Condition aux limites de Dirichlet[^conddirichletwp]  (nommée d'après Johan Dirichlet, 1805-1859, mathématicien allemand ayant notamment travaillé sur les séries de Fourier, l'arithmétique et on lui doit l'essentiel de la démonstration du dernier théorème de Fermat pour le cas où l'exposant est égal à 5[^dirichletwp]) : on spécifie la valeur que va prendre la solution des équations en certaines frontières ou limites du domaine étudié (pour un intervalle $[a,b]$ on aura donc $y(a)=\alpha$ et $y(b)=\beta$). Un exemple est la valeur de la température en $a$ pour l'équation de la chaleur.
    * Conditions aux limites de Neumann[^condneumannwp]  (nommée d'après Carl Neumann[^carlneumannwp] et pas John Van Neumann, 1832-925 et il travailla notamment sur les équations intégrales dont l'une des indéterminées est une intégrales et dont les équations de Maxwell sont l'un des plus célèbres représentants[^eqintegwp]) : on spécifie la valeur que va prendre la dérivée de la solution des équations en certaines frontières du domaine (pour un intervalle $[a,b]$ on aura donc $y'(a)=\alpha$ et $y'(b)=\beta$). L'exemple est le flux de température, toujours pour l'équation de la chaleur.
    * Condition aux limites de Robin[^condrobinwp]  (nommée d'après Victor Gustave Robin, 1855-1897, et non pas notre Robin national, qui a notamment travaillé sur des problèmes de thermodynamique) : ici il s'agit d'imposer aux limites du domaines un relation linéaire entre les valeurs de la fonction et celle de sa dérivée (pour un intervalle $[a,b]$, on aura donc $\alpha.y(a) - \beta.y'(a)=g(a)$ et $\alpha.y(b) - \beta.y'(b)=g(b)$ avec cette fois, $\alpha$, $\beta$ et $g$ des fonctions). L'exemple de ce type de condition est un peu plus complexe mais si on reprend notre exemple d'équation de la chaleur, si un bord est en contact avec un autre milieu, les lois de newton et de Fourier précise que le flux de températere à cette interface est proportionnel à la différence de température, mais aussi à la valeur du gradient [^excondrobin].

A côté de ces conditions aux limites en espace, on en a encore qui sont plus siouxes avec par exempledes conditions aux limites dynamiques qui ressemblent aux conditions de robin, mais qui évoluent au cours du temps et fonction des points de la frontière[^condlimdynwp].

### Différences finies

La méthode des différences finies apparaît comme la méthode la plus simple, il s'agit en effet de discrétiser les opérateurs de dérivation/différentiation grâce aux développements de Taylor-Young [^formtaylorwp]  [^brooktaylorwp]. Le mathématicien Brook Taylor établi en 1715 que l'on peut approximer des fonctions suffisamment dérivables au voisinage d'un point par un polynôme dont les coefficients ne dépendent que des dérivées de la fonction en ce point. William Henry Young est arrivé plus tard (1863-1942) lors qu'il travailla sur la théorie de la mesure, les intégrales de Lebesgue etc.

Comme il est question de discrétiser, on peut par exemple regarder ce que cela donne sur un exemple simple :

 * Prenons un segment de longueur 1
 * On le découpe en $n+1$ sous-segments dont le pas sera de $h=1/n$

On a grosso modo trois types de différences : 

 * "en avant" : on prend les valeurs en $x$ et $x+h$
 * "en arrière" : on prend les valeurs en $x-h$ et $x$,
 * "centrées" : on prend les valeurs en $x-h/2$ et $x+h/2$

On aura alors comme approximation pour la dérivée de la fonction en $x$ :

$$ f'(x) = \frac{f(x+h)-f(x)}{h} $$

Ce qui ressemble à l'expression de la dérivée en terme de limite.

En appliquant ce principe à la dérivée première pour obtenir la dérivée second on pour obtenir quelque chose de similaire :

$$ f''(x) = \frac{f(x+h) - 2f(x) + f(x+h)}{h^2} $$

Tout ceci fonctionne bien en dimension 1, mais pour peut que les fonctions soient suffisamment dérivables, cela s'étend très bien aux dimensions supérieures.

On voit donc que l'on a besoin des valeurs en différents points qui vont former le maillage et que l'on obtient une relation assez simple pour l'expression des dérivées première, seconde, etc.

Finalement on se rend compte que si notre équation implique par exemple la somme de la dérivée seconde avec le produit de la fonction par un scalaire en tout point du domaine, on se retrouve, grâce aux opérateurs discrétisés à n'avoir affaire qu'à un produit de valeurs de la fonction à trouver qui seront prises en des points
définis du maillage.

Ainsi si $x$ est la solution et $f(x)$ e

### Éléments finis

### Volumes finis

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

[^siminfowp]: [http://fr.wikipedia.org/wiki/Simulation_informatique](http://fr.wikipedia.org/wiki/Simulation_informatique)
[^princsuppwp]: [http://fr.wikipedia.org/wiki/Principe_de_superposition](http://fr.wikipedia.org/wiki/Principe_de_superposition)
[^formtaylorwp]: [http://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Taylor](http://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Taylor)
[^brooktaylorwp]: [http://fr.wikipedia.org/wiki/Brook_Taylor](http://fr.wikipedia.org/wiki/Brook_Taylor)
[^williamyoungwp]: [http://fr.wikipedia.org/wiki/William_Henry_Young](http://fr.wikipedia.org/wiki/William_Henry_Young)
[^condlimiteswp]: [http://fr.wikipedia.org/wiki/Condition_aux_limites](http://fr.wikipedia.org/wiki/Condition_aux_limites)
[^dirichletwp]: [http://fr.wikipedia.org/wiki/Dirichlet](http://fr.wikipedia.org/wiki/Dirichlet)
[^carlneumannwp]: [http://fr.wikipedia.org/wiki/Carl_Neumann](http://fr.wikipedia.org/wiki/Carl_Neumann)
[^eqintegwp]: [http://fr.wikipedia.org/wiki/%C3%89quation_int%C3%A9grale](http://fr.wikipedia.org/wiki/%C3%89quation_int%C3%A9grale)
[^condrobinwp]: [http://fr.wikipedia.org/wiki/Condition_aux_limites_de_Robin](http://fr.wikipedia.org/wiki/Condition_aux_limites_de_Robin)
[^conddirichletwp]: [http://fr.wikipedia.org/wiki/Condition_aux_limites_de_Dirichlet](http://fr.wikipedia.org/wiki/Condition_aux_limites_de_Dirichlet)
[^condneumannwp]: [http://fr.wikipedia.org/wiki/Condition_aux_limites_de_Neumann](http://fr.wikipedia.org/wiki/Condition_aux_limites_de_Neumann)
[^excondrobin]: [http://www.cmi.univ-mrs.fr/~torresan/MathPhy/cours/node16.html#SECTION0033320000000000000000](http://www.cmi.univ-mrs.fr/~torresan/MathPhy/cours/node16.html#SECTION0033320000000000000000)
[^condlimdynwp]: [http://fr.wikipedia.org/wiki/Condition_aux_limites_dynamique](http://fr.wikipedia.org/wiki/Condition_aux_limites_dynamique)