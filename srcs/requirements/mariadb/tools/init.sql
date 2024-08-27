-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS `DBwordpress`;

-- Créer un utilisateur avec un mot de passe
CREATE USER IF NOT EXISTS 'wpUser'@'%' IDENTIFIED BY '123';

-- Accorder tous les privilèges à cet utilisateur
GRANT ALL PRIVILEGES ON `DBwordpress`.* TO 'wpUser'@'%';

-- Configurer le mot de passe root et accorder les privilèges
ALTER USER 'root'@'localhost' IDENTIFIED BY 'DBroot';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

-- Appliquer les modifications
FLUSH PRIVILEGES;
