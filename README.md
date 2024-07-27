# 14-Inception

# Commandes du Makefile

### Build the Docker containers
```sh
make build    
```

### Start the Docker containers
```sh
make up   
```

### Stop the Docker containers
```sh
make down    
```

### View logs for all Docker containers
```sh
make logs     
```

### Clean up Docker resources
```sh
make clean   
```

### Rebuild the entire setup
```sh
make rebuild  
```

### Default target (build and up)
```sh
make          
```


# Commandes Docker et Docker Compose

### Liste les réseaux Docker
```sh
docker network ls
```

### Liste les volumes Docker
```sh
docker volume ls
```

### Affiche les conteneurs en cours d'exécution
```sh
docker ps
```

### Affiche les logs d'un conteneur
```sh
docker logs [container]
```

### Exécute une commande dans un conteneur en cours d'exécution
```sh
docker exec -it [container] [command]
```

### Arrête un conteneur en cours d'exécution
```sh
docker stop [container]
```

### Supprime un conteneur arrêté
```sh
docker rm [container]
```

### Supprime une image Docker
```sh
docker rmi [image]
```

### Télécharge une image depuis un registre
```sh
docker pull [image]
```

### Crée et démarre un nouveau conteneur
```sh
docker run [options] [image]
```

### Construit ou reconstruit les images Docker
```sh
docker-compose build
```

### Démarre les conteneurs en arrière-plan
```sh
docker-compose up -d
```

### Arrête et supprime les conteneurs, réseaux et volumes
```sh
docker-compose down
```

### Nettoie les conteneurs orphelins
```sh
docker-compose down --remove-orphans
```

### Affiche les logs des services
```sh
docker-compose logs [service]
```

### Liste les conteneurs de Docker Compose
```sh
docker-compose ps
```
