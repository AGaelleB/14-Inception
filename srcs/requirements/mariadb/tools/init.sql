-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}`;

-- Créer un utilisateur avec un mot de passe
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- Accorder tous les privilèges à l'utilisateur sur la base de données
-- cette ligne pose probleme car elle marche avec l image d origine pas pas manuelleent 
GRANT ALL PRIVILEGES ON `${MYSQL_DATABASE}`.* TO '${MYSQL_USER}'@'%';


-- Configurer le mot de passe root et accorder les privilèges
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

-- Appliquer les modifications
FLUSH PRIVILEGES;
