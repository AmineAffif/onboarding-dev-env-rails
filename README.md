# Environnement de Développement Rails avec Docker

Bienvenue ! Ce dépôt fournit un environnement Rails 7 **conteneurisé** comprenant :

- 🛢️ **PostgreSQL** (base de données)
- 📦 **Redis** (cache / Sidekiq)
- 🔄 **Sidekiq** (tâches en arrière-plan)
- 🌱 **Seeds** (données de test avec Faker)
- 📜 **Scripts** d'automatisation

## Prérequis

- Docker et Docker Compose installés sur votre machine

## Démarrage Rapide

1. **Cloner** le dépôt :

   ```bash
   git clone https://github.com/ton-compte/onboarding_dev_env.git
   cd onboarding_dev_env
   ```

2. **Installation** (construction des images, lancement des conteneurs, création et peuplement de la BDD) :
   ```bash
   bin/setup
   # ou
   make setup
   ```

### Tests

```bash
make test
# ou
docker-compose run web rails test
```

## Utilisation

- 🌐 Serveur Rails : http://localhost:3000
- 📊 Logs Sidekiq : `docker-compose logs -f worker`
- 🔌 Redis : `redis://redis:6379`

### Arrêt des Services

```bash
docker-compose down
```

## Structure du Projet

- `Dockerfile` - Configuration de l'image (Ruby 3.1.2, Yarn, etc.)
- `docker-compose.yml` - Définition des services (web, worker, db, redis)
- `bin/setup` - Script d'installation automatisée
- `Makefile` - Raccourcis pratiques (optionnel)
- `db/seeds.rb` - Données de test avec Faker
- `app/workers/` - Workers Sidekiq
- `config/sidekiq.yml` - Configuration Sidekiq

## Commandes Courantes

```bash
# Reconstruire les images
docker-compose build --no-cache

# Lancer l'application en arrière-plan
docker-compose up -d

# Consulter les logs
docker-compose logs -f [web|worker|db|redis]

# Console Rails
docker-compose run web rails c

# Console Sidekiq
docker-compose run worker bash

# Réinitialiser la base de données
docker-compose down -v
docker-compose run web rails db:create db:migrate db:seed
```

## Commandes Make

Nous fournissons un `Makefile` avec des raccourcis pratiques pour les opérations courantes :

- `make setup` : Lance le script d'installation initial
- `make up` : Démarre tous les conteneurs
- `make down` : Arrête tous les conteneurs
- `make build` : Reconstruit les images Docker
- `make logs` : Affiche les logs de tous les services
- `make test` : Lance la suite de tests
- `make seed` : Peuple la base de données avec les données de test
- `make worker-console` : Ouvre un terminal dans le conteneur worker

Exemple d'utilisation :

```bash
# Démarrer l'environnement
make up

# Vérifier les logs
make logs

# Arrêter l'environnement
make down
```

## Prochaines Étapes

- [ ] Enrichir les seeds pour des données plus réalistes
- [ ] Ajouter des tests (RSpec/Minitest)
- [ ] Intégrer une CI basique (GitHub Actions)
- [ ] Documenter la gestion des variables d'environnement

---

## Support

Pour toute question ou problème, n'hésitez pas à ouvrir une issue sur le dépôt.

Profitez de votre nouvel environnement de développement conteneurisé ! 🚀
