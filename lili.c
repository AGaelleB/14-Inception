demander a Rayan si son .env etait dans son push

--------------
POUR MONTRER LA DATA MARIADB 

docker exec -it mariadb mysql -u root -pDBroot

SHOW DATABASES;         # Afficher toutes les bases de données
USE DBwordpress;        # Sélectionner une base de données
SHOW TABLES;            # Afficher toutes les tables dans la base de données sélectionnée
DESCRIBE <table_name>;  # Afficher la structure d'une table


--------------

si je veux voir les logs de mariadb je dois entrer dans le docker avec bash
docker exec -it mariadb bash

puis 

cat /var/log/mysql/error.log

--------------

Penser a installer docker-compose 
    sudo apt-get install docker-compose
    sudo apt-get install docker-compose-plugin

pour ensuite faire
    docker-compose ps

ATTENTION TROUVER UNE SOLUTION POUR FAIRE LA COMMANDE SANS "-", c-a-d 
    docker compose ps

