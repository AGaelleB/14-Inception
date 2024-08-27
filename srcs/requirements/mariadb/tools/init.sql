-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS `DBwordpress`;

-- Créer un utilisateur avec un mdp
CREATE USER IF NOT EXISTS 'wpUser'@'%' IDENTIFIED BY '123';

-- Accorder tous les privilèges
GRANT ALL PRIVILEGES ON `DBwordpress`.* TO 'wpUser'@'%';

-- Configurer le mdp root et accorder les privilèges
ALTER USER 'root'@'localhost' IDENTIFIED BY 'DBroot';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

-- Appliquer les modif
FLUSH PRIVILEGES;
