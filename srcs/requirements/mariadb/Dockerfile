# srcs/requirements/mariadb/Dockerfile

FROM debian:bullseye

# Installer les paquets nécessaires
RUN apt-get update && \
   apt-get install -y --no-install-recommends --no-install-suggests \
   mariadb-server && \
   rm -rf /var/lib/apt/lists/*

# Copier les fichiers de configuration personnalisés
COPY conf/my.cnf /etc/mysql/my.cnf

# Copier le script d'initialisation
COPY ./tools/runMariaDB.sh /runMariaDB.sh

# Rendre le script d'initialisation exécutable
RUN chmod +x /runMariaDB.sh

# Port pour MySQL
EXPOSE 3306

# Démarrer le service MySQL
CMD ["/runMariaDB.sh", "mysqld"]
