# srcs/requirements/nginx/Dockerfile

FROM debian:bullseye

# Define build arguments
ARG SSL_CERT_FOLDER
ARG SSL_CERT_PATH
ARG SSL_KEY_PATH
ARG SSL_CSR_PATH
ARG DOMAIN_NAME

# Install Nginx and OpenSSL
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# Create directories for SSL certificates
RUN mkdir -p "$SSL_CERT_FOLDER"

# Generate SSL certificates
RUN openssl genrsa -out "$SSL_KEY_PATH" 2048 && \
    openssl req -new -key "$SSL_KEY_PATH" -out "$SSL_CSR_PATH" -subj "/CN=$DOMAIN_NAME" && \
    openssl x509 -req -days 365 -in "$SSL_CSR_PATH" -signkey "$SSL_KEY_PATH" -out "$SSL_CERT_PATH"

# Copy the custom configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
