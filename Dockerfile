FROM node:20.9-alpine

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier package.json pour installer les dépendances
COPY package.json ./

# Installer les dépendances NPM
RUN npm install

# Mettre à jour apk, ajouter curl et les certificats SSL
RUN apk update && \
    apk add --no-cache curl ca-certificates && \
    update-ca-certificates

# Copier le script d'initialisation des certificats dans le conteneur
COPY init-certificates.sh ./init-certificates.sh
RUN chmod +x ./init-certificates.sh

# Copier tout le reste du code source dans le conteneur
COPY . .

# Exécuter le script d'init des certificats avant de démarrer l'application
CMD [ "npm", "start", "sh", "-c", "/init-certificates.sh && npm start" ]
