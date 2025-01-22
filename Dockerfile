# ------------ Dockerfile ------------
# Étape 1 : Choisir une image de base. 
# Ici on prend une image officielle Ruby (avec Node et Yarn inclus).
FROM ruby:3.1.2

# Installer les dépendances système
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    nodejs \
    npm \
    vim

# Installer Yarn si besoin
RUN npm install --global yarn

# Configurer le dossier de travail à l'intérieur du conteneur
WORKDIR /app

# Copier les fichiers Gem et Gemlock, puis installer les gems
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# Copier le reste du code 
COPY . /app

# Exposer le port 3000 (optionnel en dev)
EXPOSE 3000

# La commande par défaut (on pourra la surcharger dans docker-compose)
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0"]
