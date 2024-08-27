FROM debian:bullseye

# Installer les paquets nécessaires
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Créer les répertoires nécessaires et ajuster les permissions
RUN mkdir -p /var/run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# Copier les fichiers de configuration personnalisés
COPY conf/my.cnf /etc/mysql/my.cnf

# Copier le script d'initialisation
COPY tools/runMariaDB.sh /runMariaDB.sh

# Rendre le script d'initialisation exécutable
RUN chmod +x /runMariaDB.sh

# Port pour MySQL
EXPOSE 3306

# Démarrer le service MySQL
CMD ["/runMariaDB.sh", "mysqld"]
