FROM debian:bullseye


EXPOSE 443


RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*


ARG SSL_CERT_FOLDER
ARG SSL_CERT_PATH
ARG SSL_KEY_PATH
ARG COUNTRY
ARG STATE
ARG LOCALITY
ARG ORGANIZATION
ARG UNIT
ARG DOMAIN_NAME


RUN mkdir -p ${SSL_CERT_FOLDER} && \
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -keyout ${SSL_KEY_PATH} \
    -out ${SSL_CERT_PATH} \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${UNIT}/CN=${DOMAIN_NAME}"


COPY conf/nginx.conf /etc/nginx/nginx.conf


RUN mkdir -p /var/www/
RUN chown -R www-data:www-data /var/www/


CMD ["nginx", "-g", "daemon off;"]
