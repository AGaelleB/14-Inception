# srcs/requirements/mariadb/Dockerfile
FROM debian:bullseye

# Installer MariaDB
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copier les fichiers de configuration et les scripts
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/runMariaDB.sh /runMariaDB.sh

# Rendre le script de démarrage exécutable
RUN chmod +x /runMariaDB.sh

# Définir le point d'entrée pour démarrer MariaDB via le script
CMD ["/runMariaDB.sh"]