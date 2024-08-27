demander a Rayan si son .env etait dans son push

--------------

docker exec -it mariadb mysql

une fois dans mon docker mariabd pour verifier la database faire : 


# Afficher toutes les bases de données
SHOW DATABASES;
# Sélectionner une base de données
USE <database_name>;
# Afficher toutes les tables dans la base de données sélectionnée
SHOW TABLES;
# Afficher la structure d'une table
DESCRIBE <table_name>;

--------------

peut etre enlever dans docker compose restart: on-failure

si je fais:
    docker logs mariadb

je ne devrais pas avoir pleins de : 
    Starting MariaDB database server: mariadbd.
    mysqld is alive


--------------

Penser a installer docker-compose 
    sudo apt-get install docker-compose
    sudo apt-get install docker-compose-plugin

pour ensuite faire
    docker-compose ps

ATTENTION TROUVER UNE SOLUTION POUR FAIRE LA COMMANDE SANS "-", c-a-d 
    docker compose ps

