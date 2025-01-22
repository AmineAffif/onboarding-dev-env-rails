# Dockerfile
FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  curl \
  nodejs \
  npm \
  vim

# Installer Yarn
RUN npm install --global yarn

# Définir le workspace
WORKDIR /app

# Copier Gemfile + Gemfile.lock
COPY Gemfile Gemfile.lock /app/

# Installer les gems
RUN bundle install

# Copier le reste du code
COPY . /app

EXPOSE 3000

# Commande par défaut : lance le serveur Rails (mais souvent géré par docker-compose)
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0"]
