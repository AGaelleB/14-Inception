http://abonnefo.42.fr/:443
    -> ca fonctionne et c'est normal
et 
http://abonnefo.42.fr/:80
    -> ca ne devrait pas fonctionner mais chez moi ca me bascule vers https://abonnefo.42.fr/:80/ et ca fonctionne 

NE DOIT PAS MARCHER 


resolu en exosant le port 80 egalement 

--------------

demander a Rayan si son .env etait dans son push

--------------

docker exec -it mariadb mysql
pourquoi ca s arrete ??? 
faire cette commande pour montrer la database une fois un commentaire mis sur mariadb

--------------

une fois dans mon docker mariabd pour verifier la database faire : 

SHOW DATABASES;
USE <DATABASE NAME>;
SELECT * FROM wp_comments;

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

