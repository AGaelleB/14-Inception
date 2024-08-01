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
COPY ./tools/run.sh /run.sh

# Rendre le script d'initialisation exécutable
RUN chmod +x /run.sh

# Port pour MySQL
EXPOSE 3306

# Démarrer le service MySQL
CMD ["/run.sh", "mysqld"]
