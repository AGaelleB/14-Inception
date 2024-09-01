# srcs/requirements/nginx/Dockerfile
FROM debian:bullseye

# Maj des paquets et installation de NGINX et OpenSSL
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

# Déf des args pour la génération du certificat SSL
ARG SSL_CERT_FOLDER
ARG SSL_CERT_PATH
ARG SSL_KEY_PATH
ARG COUNTRY
ARG STATE
ARG LOCALITY
ARG ORGANIZATION
ARG UNIT
ARG DOMAIN_NAME

# Crée le dossier pour le certificat SSL et génère le certificat auto-signé
RUN mkdir -p ${SSL_CERT_FOLDER} && \
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -keyout ${SSL_KEY_PATH} \
    -out /etc/nginx/ssl/server.crt \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${UNIT}/CN=${DOMAIN_NAME}"

# Copie le fichier de config NGINX dans le conteneur
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Crée le répertoire et change les permissions pour l'utilisateur NGINX
RUN mkdir -p /var/www/
RUN chown -R www-data:www-data /var/www/

# Port pour HTTPS
EXPOSE 443

# Démarrer NGINX au premier plan
CMD ["nginx", "-g", "daemon off;"]
