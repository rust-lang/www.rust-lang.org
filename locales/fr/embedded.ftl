### Translation file for https://www.rust-lang.org/what/embedded


## templates/what/embedded.hbs

# Page Title
what-embedded-page-title = Matériel embarqué

## Why Rust? (templates/components/what/pitch.hbs)

embedded-pitch-analysis-alt = Un microscope
embedded-pitch-analysis-heading = Analyse statique puissante
embedded-pitch-memory-alt = Une barrette de mémoire vive
embedded-pitch-memory-heading = Mémoire flexible
embedded-pitch-memory-description = L'allocation de mémoire dynamique est optionnelle. Utilisez un allocateur global et des structures de données dynamiques. Ou laissez complètement de côté le tas, et allouez tout de façon statique.
embedded-pitch-concurrency-alt = Engrenages
embedded-pitch-concurrency-heading = Concurrence apaisée
embedded-pitch-concurrency-description = Rust rend impossible le partage accidentel d'un état entre deux threads. Qu’elle que soit l’approche concurrentielle que vous voulez utiliser, vous bénéficierez toujours des assurances fortes de Rust.
embedded-pitch-interop-alt = Poignée de main
embedded-pitch-interop-heading = Interopérabilité
embedded-pitch-portability-alt = Chariot à bagage
embedded-pitch-portability-heading = Portabilité
embedded-pitch-portability-description = Écrivez une bibliothèque ou un driver une fois et utilisez-le dans différents systèmes, allant de tout petits microcontrôleurs à de puissants SBCs.
embedded-pitch-community-alt = Logo Bouclier
embedded-learn-more-link = En apprendre davantage

## Showcase (templates/components/what/showcase.hbs)

embedded-showcase-heading = Présentation
embedded-showcase-see-more-link = Voir plus

## Get started! (templates/components/what/embedded/get-started.hbs)

embedded-get-started-discovery-book-heading = Le Discovery Book
embedded-get-started-discovery-book-description = Apprenez le développement embarqué à partir de zéro&mdash;en utilisant Rust!
embedded-get-started-embedded-rust-book-heading = Le Rust Book embarqué
embedded-get-started-embedded-rust-book-description = Déjà familier avec le développement embarqué ? Sautez dedans avec Rust et commencez à en tirer les bénéfices.
embedded-get-started-embedonomicon-description = Regardez sous le capot des bibliothèques fondatrices pour l'embarqué
embedded-get-started-read-link = Lire
embedded-get-started-more-documentation-link = Plus de documentation

## Production use (templates/components/what/embedded/testimonials.hbs)

embedded-testimonials-sensirion-alt = logo Sensirion
embedded-testimonials-sensirion-quote = À Sensirion nous avons récemment utilisé Rust pour créer un démonstrateur embarqué pour le Sensirion <a href="https://sensirion-automotive.com/products#PM2_5">Particulate Matter Sensor</a>. Grace à la cross-compilation facile et à la disponibilité de beaucoup de crates de haute qualité sur crate.io <b>nous sommes arrivés très vite à un démonstrateur rapide et robuste.</b>
embedded-testimonials-airborne-quote = À Airbone Engineering Ltd. nous avons récemment utilisé Rust pour écrire un bootloader Ethernet, <a href="https://github.com/airborneengineering/blethrs">blethrs</a>, pour notre système d'acquisition maison. <b>Rust est un langage prometteur et nous sommes enthousiastes pour l'utiliser sur nos futurs projets, embarqués ou autre.
embedded-testimonials-49nord-alt = Logo 49nord
# "Fluent" requires a square bracket which is the first character of a line to be escaped like this: {"["} See https://projectfluent.org/fluent/guide/special.html
embedded-testimonials-49nord-quote =
    { "[" }Rust] nous permet de livrer du logiciel de manière plus rapide et plus correcte que nous croyions possible. Grâce à Rust, nous pouvons considérer la sécurité mémoire comme garantie, tandis que les autres bénéfices d'un langage avec un système de type complexe à zéro surcoût nous aident à développer un logiciel maintenable.
     <b>Rust rend nos clients heureux, tout comme nos ingénieurs.</b>
