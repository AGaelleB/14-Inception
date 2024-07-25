# srcs/requirements/nginx/Dockerfile

FROM debian:bullseye

# Définir les arguments de construction
ARG SSL_CERT_FOLDER
ARG SSL_CERT_PATH
ARG SSL_KEY_PATH
ARG SSL_CSR_PATH
ARG DOMAIN_NAME

# Installer Nginx et OpenSSL
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl gettext-base && \
    rm -rf /var/lib/apt/lists/*

# Créer les répertoires pour les certificats SSL
RUN mkdir -p "$SSL_CERT_FOLDER"

# Générer les certificats SSL
RUN openssl genrsa -out "$SSL_KEY_PATH" 2048 && \
    openssl req -new -key "$SSL_KEY_PATH" -out "$SSL_CSR_PATH" -subj "/CN=$DOMAIN_NAME" && \
    openssl x509 -req -days 365 -in "$SSL_CSR_PATH" -signkey "$SSL_KEY_PATH" -out "$SSL_CERT_PATH"

# Copier le fichier de configuration Nginx directement
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 443 pour HTTPS
EXPOSE 443

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
