FROM debian:bullseye

# Install necessary packages
RUN apt-get update && \
   apt-get install -y --no-install-recommends --no-install-suggests \
   mariadb-server && \
   rm -rf /var/lib/apt/lists/*

# Copy custom configuration files
COPY conf/my.cnf /etc/mysql/my.cnf

# Copy initialization script
COPY ./tools/run.sh /run.sh

RUN chmod +x /run.sh


# Expose the MySQL port
EXPOSE 3306

# Start MySQL service
CMD ["/run.sh", "mysqld"]
