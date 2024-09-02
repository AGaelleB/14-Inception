# srcs/requirements/mariadb/Dockerfile
FROM debian:bullseye

# Installer MariaDB
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copier les fichiers de config et les scripts
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/runMariaDB.sh /runMariaDB.sh

# Rendre le script de démarrage exécutable
RUN chmod +x /runMariaDB.sh

# Expose le port 3306 pour les connexions MariaDB
EXPOSE 3306

CMD ["/runMariaDB.sh"]