#!/bin/bash
# Créer le fichier client.pem et key.pem à partir des secrets GitHub

echo "$CLIENT_PEM" > /certs/client.crt
echo "$C_KEY" > /certs/client.key.pem
