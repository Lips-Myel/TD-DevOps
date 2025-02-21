FROM node:20.9-alpine

# Définit le répertoire de travail
WORKDIR /app

# Copier package.json pour installer les dépendances
COPY package.json .

# Installer les dépendances NPM
RUN npm install

# Mettre à jour apk, ajouter curl et les certificats SSL
RUN apk update && \
    apk add --no-cache curl ca-certificates && \
    update-ca-certificates

# Copier tout le reste du code source dans le conteneur
COPY . .

# Démarrer l'application avec npm
CMD ["npm", "start"]