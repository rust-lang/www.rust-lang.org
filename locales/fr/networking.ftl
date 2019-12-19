## templates/what/networking.hbs

what-networking-page-title = Réseau

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust a un écosystème grandissant de bibliothèques faciles à utiliser pour le web. Voici deux exemples :
networking-get-started-post-json = Poster du JSON
networking-get-started-take-json = Gérer un POST encodé en JSON
networking-get-started-reqwest = En apprendre plus sur reqwest
networking-get-started-rocket = En apprendre plus sur Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Faible utilisation mémoire
networking-pitch-footprint = Prenez le contrôle de l’utilisation des ressources systèmes pour garder la consommation CPU et mémoire à un seuil minimal. Aidez-vous du compilateur pour vous assurer de faire les choses correctement. Et faites-le avec un écosystème qui est et productif, et agréable à utiliser.
networking-pitch-footprint-alt = Une plume
networking-pitch-secure-header = Sûr et fiable
networking-pitch-secure = Le puissant contrôleur de type de Rust empêche toute une classe de bugs. Vous êtes sûr de savoir exactement quand et où les états sont partagés et modifiés. Vous êtes également assistés pour connaître les éventuels points d'erreur &mdash; avant le déploiement.
networking-pitch-secure-alt = Un bouclier
networking-pitch-concurrent-header = Concurrent à grande échelle
networking-pitch-concurrent = Utilisez n'importe quel mix d'approches concurrentes qui vous convient. Rust vous assurera que vous ne partagez pas par mégarde un état entre plusieurs threads ou tâches. Il vous donnera la capacité de tirer les performances jusqu'à la dernière goutte, sans risque.
networking-pitch-concurrent-alt = engrenages connectés

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla = Migrer notre infrastructure de connexion Push vers Rust nous a fourni un moyen plus facile de maintenir le code en se concentrant sur la justesse tout en fournissant des performances fantastiques. Nous pouvons maintenant, avec nos serveurs Rust, traiter jusqu'à 20 millions de connections à la fois aux heures de pic.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, ingénieur opérations, Mozilla
networking-production-testimonial-buoyant =
    Rust est fondamental dans la feuille de route technologique du projet Linkerd . Son système de type nous permet de construire des unités modulaires, testables et composables sans sacrifier les performances à l’exécution.
    Ce qui a été le plus surprenant cependant, c'est comment les systèmes de borrowing et de durée de vie nous permettent d'éviter de grandes quantités de fuites de ressources. Après deux ans, Je ne peux vraiment plus imaginer utiliser aucun autre langage pour ce travail.
networking-production-testimonial-buoyant-attribution = Oliver Gould, DSI, <a href="{ $href }">Buoyant</a>
