# srcs/requirements/mariadb/Dockerfile
FROM debian:bullseye

RUN apt-get update && \
   apt-get install -y mariadb-server && \
   rm -rf /var/lib/apt/lists/*

# Create necessary directories and set permissions
RUN mkdir -p /var/run/mysqld /var/lib/mysql && \
   chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# Copy configuration files and scripts
COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/init.sql /docker-entrypoint-initdb.d/
COPY tools/runMariaDB.sh /usr/local/bin/runMariaDB.sh

# Make the startup script executable
RUN chmod +x /usr/local/bin/runMariaDB.sh

# Expose MySQL port
EXPOSE 3306

# Set entry point
ENTRYPOINT ["sh", "/usr/local/bin/runMariaDB.sh"]
