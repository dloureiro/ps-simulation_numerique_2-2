# Overview

J'ai relu ta deuxième partie, voici mes commentaires. Comme tu vas voir il y a pas mal de choses, je pense que c'est une bonne base mais qui doit être largement retravaillée avec en tête les éléments suivants : 

 - Il est important que tu choisisse les choses dont tu ne veux pas parler. Tu cherche à trop de moment à être exhaustif et ça rend le tout très complexe :
   - Tu peux a mon avis virer tous les détails pratiques d'implémentation ou d'utilisation, le but est pas que ton public sache faire de la simulation numérique mais qu'il comprenne les grandes lignes.
   - Au lieu de vouloir parler un peu de tout, tu devrais choisir un sujet et bien l'expliquer. En particulier sur les méthodes de linéarisation, a ta place, je ne parlerai que des différences finies en les détaillant beaucoup plus et citerai à la fin les éléments finis.
 - Tu t'adresse a un public sans AUCUNE notion scientifique scolaire. Alors autant te dire que beaucoup des mots ou notations que tu utilises sont interdites sans explications. En particulier, et la je vais faire mon dictateur, je t'interdis formellement d'utiliser ou de parler de matrice dans ce dossier, tu n'en a pas besoin et ça te forcera à être plus clair :). N'oublie pas qu'une formule n'est pas une explication pour les non scientifiques et qu'on s'en passe très bien (sur les slides de mes 1H de soutenance de thèse il y avait 2 formules).
 - Enfin, on a une mauvais habitude en france c'est d'énumérer ce dont on va parler avec des termes incompréhensible avant de finalement en parler. Je te propose de faire comme dans la littérature anglosaxone, tu en parle au fur et à mesure, en allant du plus simple au plus compliqué. Et surtout tu retires les "Voila deux mots sur un truc ultra complexe dont de tout de façon je vais pas vous parler"!

Voila, bon courage et désolé pour la longueur de la chose, le but est de faire un super dossier sur ce super sujet. Si besoin tu peux m'appeler au 0674186809.


# Page 1

Tu commence cette deuxième partie par une énumération très complexe, entre des concepts qui mériteraient plus qu'une seule ligne pour conclure sur le fait que tu vas parler seulement d'une des méthodes de simulation. Je te propose alors de faire ça plus à l'anglo-saxone : tu commence direct par parler de simulation continue sans dire que les autres existent et à la fin du dossier tu ouvrira en disant "ah au fait, ce n'est qu'un tout petit morceau de la simulation numérique, d'autres types existent". Et si possible, essayer d'éviter les énumérations, préfère y un texte, c'est souvent plus compliqué mais bien plus agréable à lire.

Toujours dans la même idée, fin de la première page (je travaille sur le pdf du dossier output du mail précédent), tu précise qu'il existe encore plein d'autres types de simulation. Alors que tu n'as encore parlé de rien, on est toujours dans l'intro, tu nous a déjà noyé dans des termes et des concepts complexes. Je pense que cette première page est à retirer ou à mettre en fin de dossier, en ouverture.
Par contre, du coup, si tu fais ça, il faut écrire une intro (oui je suis chiant :p), qui dit uniquement "aujourd'hui je vais répondre à cette question / je vais vous raconter cette histoire".

# Page 2

>"L’idée est en fait que la résolution analytique des équations de phénomènes physiques est très complexe et en dehors de cas particuliers ou alors avec des simplifications importantes impossible pour certaines équations comme par ex- emple celle décrivant des fluides : l’équation de Navier-Stokes2 qui possède de manière générale des termes non-linéaire."

Soyons clair, j'ai un doctorat en math-appliqués et je vois a peine de quoi tu parles en 3 lignes alors le commun des mortels non scientifique qu'est notre auditoire va avoir du mal :p
D'abord, ne met pas de gros mots sans les expliquer ("Equation de Navier-Stokes", soit tu l'explique soit tu n'en parle pas, mais la citer comme ça exclue et n'explique pas. Pas en dictateur non plus hein, tu peux exceptionnellement le faire, genre une fois par dossier). Pareil, "qui possède de manière générale des termes non-linéaire" ne veut a mon avis pas dire grand chose pour plein de monde, genre Alan par exemple. Alors que ce que tu veux dire est tout simple : c'est super compliqué donc soit on ne sait pas le résoudre en l'état soit on sait que ça nous prendra beaucoup trop de temps même avec un bon ordinateur.

N'étant pas un spécialiste de la mécanique des fluides, j'ai pas non plus compris ta première figure. Je pense que tu peux la laisser mais il faut que tu "traduise" la légende en expliquant ce que sont les traits de toutes les couleurs et que tu explique pourquoi il t'a paru pertinent de la mettre là.

>"Comme dit Wikipedia", 

ça ça m'avait beaucoup choqué dans la partie 1. Il est bien évidemment bienvenue de citer wikipedia comme source quand on l'utlise mais utiliser à outrance la formule me parait pas génial. D'abord, dans le monde podcastique, cela veut souvent dire "j'ai préparé mon dossier à l'arrache hier soir en pompant wikipedia" et comme je sais que ce n'est pas le cas, c'est dommage de le laisser croire. Ensuite, quand les définitions sont des choses simples, autant ne pas citer wikipedia et plutôt expliquer ce que tu as compris.


# Page3

En l'occurence, pour la définition d'un système linéaire, je suis sur que tu sais ce que c'est sans regarder wikipedia et je suis sur que tu l'expliquera mieux qu'avec une énumération... (grrr, tu es interdit de puces jusqu'à nouvel ordre! :p). Et du coup, avec cette merveilleuse explication de la linéarité que tu vas nous faire, tu n'auras même plus besoin de mettre une formule avec des lambdas et autres choses si étranges pour les gens ne bossant pas dans le domaine (avec un exemple quotidien en plus ce serait parfait, genre chez le boulanger, pour deux fois plus d'argent, j'ai deux fois plus de pain. Par contre, pour les disques dur, pour deux fois plus d'argent j'ai en général plus que deux fois plus de stockage, c'est non linéaire).


> "a pour rôle de permettre la trans- formation d’un problème basé sur des équations différentielles ou aux dérivés partielles donc plutôt de l’analyse vers un problème de résolution de système linéaire" 

ou en utilisant ce que tu as dit plus haut, a pour rôle la transformation d'un système non-linéaire en un système linéaire. Tu peux aussi expliquer que si on fait ça c'est parce que les systèmes linéaires on sait très bien les résoudre principalement parce qu'ils sont séparables, c'est à dire que si on a un système linéaire qui est l'addition de deux sous systèmes linéaires, on peut résoudre tous les sous-systèmes indépendamment, ce qui fait qu'on réduit un problème non-linéaire très complexe à plusieurs petits problèmes simples. Aucunement besoin de parler d'équation différentielle pour le moment. 

Toujours dans la logique "ne pas mettre des mots compliqués sans les définir", je pense que tu peux complètement oublier la notion de matrice de ton dossier. C'est une notion très complexe, qu'on voit deux ou trois années après le bac en faisant des math et qui n'est pas du tout utile ici, il suffit de parler de linéarité et non linéarité.

Tu as de la chance, pour l'énumération de la fin de la page 3, je vais pas te faire chier. Fin de la page 3 donc, tu énumères plein de choses avec des mots interdits. Comme tu décris les étapes d'un algorithme pas de pb. Mais, il faut que tu simplifie, le but n'est pas d'être exhaustif et de permettre à quelqu'un qui lit ton dossier d'être capable de mettre en pratique mais de comprendre les grandes idées sans dire des anneries. Pour te donner une idée, je simplifierai ce que tu décris de la manière suivante : 

 1. On définit un modèle non-linéaire qui décrit notre système
 2. On discrétise le problème pour passer à un problème linéaire qu'on sait résoudre. On s'assure que ce problème linéaire est bien posé, c'est a dire qu'il n'admet qu'une seule solution.
 3. On choisit et execute un algorithme spécialisé dans la résolution de problèmes linéaires de ce type.

# Page4

Merci de retirer les énumérations et de plutot préciser ce que tu entend par bord : "Une poutre est fixée sur un mur" donc bien que les équation décrivent bien ses vibrations possibles, les parties fixées ne bougent pas, ce sont les limites de notre modèle.

Sur les conditions aux limites, ta présentation est très scolaire et du coup assez indigeste je pense si on est pas du domaine. Au lieu d'utiliser les termes savants "condition en limite en temps ou en espace", tu peux dire, que quand on s'interesse à ce qui se passe aux extrémités de la poutre, on s'intéresse aux limites du modèle dans l'espace, on peut aussi s'y interesser dans le temps et donner un exemple (Quand je parle des modèles du big bang, ils ne peuvent pas modéliser ce qui s'est passé avant le temps 0).

Sur les exemples de conditions aux limites spatiales, tu ne peux pas laisser ça comme ça. C'est totalement incompréhensible pour les non spécialistes et les spécialistes connaissent déjà donc ça ne sert à rien. Encore une fois, il faut que tu le digère et que tu retranscrive ce que tu considère important. En l'occurence, plutot que des formules avec des termes (y, alpha, beta..) et des notions (la dérivée...) non définies, tu explique l'idée : conditions de dirichlet, on impose une position a deux endroits : par exemple, la poutre est fixée par ses deux extrêmitées. Conditions de Neuman : on impose une vitesse à deux endroits : par exemple sur un modèle de tuyau d'arosage, on impose la vitesse à la sortie du robinet et une vitesse nulle au niveau du sol. Pour la troisème contition, soit tu n'en parles pas (c'est pas un drame de ne pas être exhaustif) soit tu te contente de l'exemple en expliquant qu'on impose une relation précise entre variation et état à deux points du système.

# Page 5 et 6

La on touche le gros de ta présentation et le problème c'est qu'on ne comprend ni l'enjeu ni pourquoi la résolution n'est pas évidente. Je pense que tu ne peux pas te passer d'expiquer ce qu'est une dérivée continue et ce qu'est en gros une équation différentielle, mais attention, interdiction formelle de mettre la formule avec les accroissements et le h qui tend vers 0, une formule n'est pas une explication. 

A chaque fois que j'ai eu l'occasion d'expliquer la dérivée (au Palais de la Découverte principalement), il se trouve que je l'expliquait par les différences finies, et vu que c'est une limite de ça, je vois mal comment tu vas y couper. Donc plutôt que parler de la formule de Taylor qui en fait ne parlera à personne (Polynome, dérivation et différentitation sont des gros mots si tu ne les explique pas), explique bien ce qu'est une dérivée continue. 
En plus ca s'explique bien "avec les mains" en parlant de variation sur un domaine de plus en plus petit.

Mais tout cela pour dire que de mon point de vue, il est inutile voire malvenu de parler de : 

 - Les trois types de différences : déja que dans la pratique ça n'a pas énormément d'importance sauf dans des cas hyper spécifique, en parler dans un dossier n'a aucun intérêt.
 - Les formules des dérivées premières et secondes : même remarque que pour les limites spatiales, les spécialistes connaissent et les non spécialistes ne comprennent rien donc autant ne pas les mettre.
 - Dire que ça s'étend au dela de la dimension 1 : pareil que précédement, soit on est spécialiste et on le sait soit on l'est pas et on comprend rien.
 - La formule au milieu de la page 6 : tu peux la laisser mais a mon avis elle n'apporte rien, le texte suffit très bien.

Et parler dans la pratique de découper le segment, a mon avis tu peux en parler après avoir expliquer comment avoir discrétisé une dérivée. Toujours dans la même optique, je vais doucement au plus général au lieu de commencer par la : voila comment on discretise la dérivée puis voila comment on traite le problème complet.

Sur la suite (je suis à la page 6), tu parle de "vecteur", tu n'as pas expliqué ce que c'est, je pense que la plupart des gens sont à 1000 lieux d'imaginer une liste de valeurs, au mieux ceux qui ont le plus de souvenirs verront une flèche comme ils faisaient au tableau, ce qui ne sert pas vraiment ton propos. Et ca tombe bien parce que le passage en question parlait de vecteur pour ensuite parler de produit matriciel sans plus le définir... Donc pareil que précédemment, soit tu explique soit tu retire et vu la complexité de la chose, je pense que tu peux retirer, c'est un tout autre dossier.

Le passage historique fin de la page 6 est super!

# Page 7

Sur les remarques et limitations, je suis partagé... Disons que je parlerai pas de limite mais ferait plutot une ouverture. Dans les faits, ce que tu décrit marche pour n'importe quel parallélogramme et pas du tout que pour les rectangles ou carré. Plus précisément même, il marche sur tout maillage de dimension n sur une variété, donc tu peux avoir des choses assez exotiques... Du coup, dire que c'est une première approche simple c'est très bien mais n'utilise pas de termes techniques, contente toi de dire que les carrés et rectangles c'est limité et que tu vas parler maintenant d'une méthode qui va plus loin. Et pareil qu'avant, "intégrale" est un mot interdit sans le définir et je pense pas que tu en ai besoin ici...

> "Pour les éléments finis, on n’utilise pas des développements de Taylor-Young comme pour les différences finies qui sont en fait des approximations des dérivées, mais plutôt des approximations des intégrales des équations aux dérivées par- tielles étudiées." 

Cette phrase est tout simplement incompréhensible à un non spécialiste. Il faut que tu racontes ce que ca apporte en plus, avec les mains, avec des mots simples. 

"Un peu comme une base de fonctions comme les bases dans Rn. Pareil, non seulement on a jamais défini les bases (vaguement dans mon épisode sur la transformée de Fourier et encore), mais pas non plus les réels (Ce serait un super sujet), pas non plus la notation des réels (tout autant un sujet amusant qu'a traité Eljj il me semble), mais pas non plus le produit tensoriel d'espaces.... Tout ça pour dire que tu fais dans une bête phrase appel à 4 notions ultra compliqué pour illustrer ton propos et expliquer ce que tu racontes. Je pense qu'il faut que tu prennes des exemples plus simple quitte à être moins généraliste et exhaustif.

Tu écris un "comme décrit dans 18". Ca c'est pas du tout possible. On n'est pas dans une publication scientifique (et en plus ta source n'existe pas, je pese que c'est un bug). Tu racontes une histoire ou les gens lisent de manière linéaire donc ne vont pas faire des aller retour avec tes notes de bas de page ni aller les chercher sur le web, elles doivent être optionnelles. J'ai relu plusieurs fois ce paragraphe (et je ne suis pas un spécialiste du domaine), et j'avoue que je n'ai pas compris ce que tu voulais nous dire, surtout à la fin sur la notion de travail. Si toi tu comprend pas bien et souhaitait juste le placer historiquement, autant la virer. Si tu as bien compris et que ca te parait pertinent, je pense qu'il faut que tu la reformule. En particulier, je n'ai pas compris les termes : 

 - structures à barre
 - mé- canique des milieux continus
 - problèmes d’équations différentielles “aux limites”
 - travail

> "Comme je le disais, ici l’idée est de décomposer le problème sur des bases de fonctions qui sont définies sur les arêtes des “éléments” utilisés pour le maillage, et ensuite d’utiliser la décomposition de la fonction solution sur ce maillage, et par l’usage d’analyse numérique un peu trop poussée pour être explicité ici, on arrive à trouver un système linéaire qui permet d’aboutir à un système linéaire de type A.x = b." 

Je me répète mais le plus dur dans la diffusion scientifique est de choisir de quoi on ne va pas parler. Cette partie jusqu'à la fin de cette phrase peut se résumer en caricaturant à peine : "Je vais vous parler des éléments finis, c'est un truc hyper compliqué qui permet de résoudre des problèmes super complexe que je ne détaille pas. Elle permet de passer à un problème linéaire plus simple mais je ne vous expliquerai pas comment, c'est trop compliqué". Autant supprimer cette partie. Oui c'est dommage de ne pas parler des éléments finis mais a mon avis tu as plus intérêt à bien détailler les différences finies et parler des éléments finis une autre fois. Du coup ma remarque vaut pour la fin de la page 7.

# Page 8

Tu peux par contre en dire deux mots genre : "Les différences finies utilisent donc un maillage, un nuage de points sur lesquels on va calculer et résoudre le système. On peut aussi résoudre le système en s'intéressant aux lignes qui relient ces points, c'est ce que cherchent à faire les éléments finis donc nous parlerons une autre fois."

> "Il faut cependant noter qu’il est nécessaire d’imposer une certaine régularité aux fonctions considérées : les solutions doivent notamment être suffisamment con- tinues et différentiables. Et ceci peut poser des difficultés pour des problèmes d’électromagnétisme notamment ou les solutions peuvent observer de fortes dis- continuités sur les domaines étudiées."  

C'est quelque chose de super intéressant et c'est bien d'en parler. Mais comme j'ai pu te dire avant, utilise des termes plus simples, genre "différentiable" ne parle pas, il faut que tu donne un exemple.

Le paragraphe juste avant "volumes finis" ne sert à rien de mon point de vue, il apporte de l'exhaustivité alors que l'on en a pas besoin.

Le paragraphe Volume finis est comme ceux d'éléments finis incompréhensible en l'état. Pareil qu'élément finis, je pense que tu peux te contenter de l'évoquer à la fin des différences finies ou ne pas en parler du tout. Encore une fois, sans explications, ca perd plus que ça apprend de choses.


# Page 9

Dans la partie résolution de systèmes linéaires : Je le répète et le confirme, interdiction d'utiliser le mot matrice dans ce dossier. Tu n'en a pas besoin et ça perturbe plus qu'autre chose (alors inversion de matrice je t'en parle pas).

Encore une énumération que tu peux supprimer surtout qu'encore une fois tu balance des termes sans les définir : "méthode directe" et "méthode itérative" ca ne veut rien dire seul alors autant en parler quand tu en parlera ou ne pas en parler du tout. C'est très bien de préciser que tu travaille en stationnaire et on comprend bien ce que ça veut dire. Par contre, inutile de citer des noms de méthodes dont tu vas pas parler, tu racontes une histoire, ne fait pas une publication exhaustive.

# Page 10

Bon bon bon, tu cite comme méthode directe une méthode d'inversion de matrice (aie le mot interdit) qui, qui plus est se résoud par itérations, autant dire qu'on ne comprend pas bien pourquoi elle n'est pas itérative. Je pense que ce que tu veux dire, c'est que l'on arrive à la solution en un nombre fini d'étapes alors que l'itérative c'est à la limite en un nombre infini d'étapes.

D'autre part, je pense que la méthode directe la plus connue est la division euclidienne et ça tombe bien, t'auras pas besoin de parler de matrices comme ça :)

Sur les méthodes itératives, je me répète pas mais les critiques précédentes valent encore : matrice, vecteur, orhogonaux, produit scalaire, etc. sont autant de mot interdits qui sont parfaitement inutiles ici. (sauf encore une fois si tu développe en détail ça, ce qui peut valoir le coup ici, mais matrice reste interdit).

Or, comme tu parles en le citant du gradient conjugué, il me semble que l'on peut expliquer ça beaucoup plus simplement, sans termes barbares. Ne serait-ce que parce que ces méthodes sont celles que nous utilisons tous très souvent. On cherche à obtenir un orange bien particulier avec du rouge et du jaune. J'ajoute du jaune dans du rouge et je suis trop jaune, donc je rajoute du rouge, je suis encore trop rouge, donc j'ajoute du jaune, etc. Tu as une explication de la descente de gradient sans matrices et autres complexités. De même tu explique que si l'on rajoute toujours la même quantité de couleur on s'en sort pas, d'où viens l'idée du gradient conjugué! 

Bref, explique ces méthodes en te passant de termes techniques propres à ton domaine et en te limitant à la dimension 1, c'est largement suffisant ici (et on fait même du calcul numétrique sur des fusées avec de la dimension 1 donc c'est pas si nul!).

> "A noter que la méthode ADI34 a été l’une des premières qui fut mise en place car elle se basait sur les différences finies" 

Euh, on est censé savoir ce que c'est la méthode ADI?

# Page 11

La représentation du gradient conjugué a besoin d'explication et a mon avis elles seraient plus simple en 1D.

# Page 12 

De manière générale, donc ça vaut pour le reste du dossier, tu peux virer tous les détails techniques d'implémentation du genre : 

> "Ces méthodes peuvent diverger, et il est donc important d’avoir une solution initiale pas trop “mauvaise”, mais aussi que la matrice aient de bonnes propriétés que je n’aborderais pas ici (conditionnement notamment)."

Elles n'apportent rien et notre public n'ira pas implémenter une différence finie à la fin de l'écoute ou lecture de ton dossier.

Tes quelques mots sur la paréllistation avant la partie "Les solutions informatiques qui existent et les problèmes afférents" est très bien.

# Page 13

RAS sur la partie  "Les solutions informatiques qui existent et les problèmes afférents".

Tu peux stiouplait retirer l'énumération sur les GPU? :p (le plus fou c'est que tu commence même la deuxième puce par "cependant", donc en fait c'est pas des puces...)

Sinon c'est cool, si tu en as, ça pourrait être marrant de mettre un exemple de la complexité à utiliser des outils pour le jeu vidéo pour faire du calcul numérique. En particulier le fait que ces trucs étaient fait pour afficher des images et rien d'autre...

# Page 13

Au début de la page 14 tu parles de solutions récentes au GPU sans expliquer ce qu'elles apportent, tu peux en dire plus?
