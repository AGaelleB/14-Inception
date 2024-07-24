FROM debian:bullseye

# Install MariaDB server
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom configuration files (if any)
# COPY my.cnf /etc/mysql/my.cnf

# Expose the MySQL port
EXPOSE 3306

# Start MariaDB
CMD ["mysqld"]
