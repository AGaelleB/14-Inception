-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS `DBwordpress`;

-- Créer un utilisateur avec un mot de passe
CREATE USER IF NOT EXISTS 'wpUser'@'%' IDENTIFIED BY '123';

-- Accorder tous les privilèges à cet utilisateur
GRANT ALL PRIVILEGES ON `DBwordpress`.* TO 'wpUser'@'%';

-- Assurer que l'utilisateur root peut se connecter avec le mot de passe
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('DBroot');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'DBroot' WITH GRANT OPTION;

-- Appliquer les modifications
FLUSH PRIVILEGES;
