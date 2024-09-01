# Variables
DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
DOCKER = docker

# Start
make:
	mkdir -p /home/abonnefo/data/mariadb
	mkdir -p /home/abonnefo/data/wordpress
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

# Stop
down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

# View logs
logs:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

# Clean up Docker resources
fclean:
	$(DOCKER) stop $$(docker ps -qa) || true
	$(DOCKER) rm $$(docker ps -qa) || true
	$(DOCKER) rmi -f $$(docker images -qa) || true
	$(DOCKER) volume rm $$(docker volume ls -q) || true
	$(DOCKER) network rm $$(docker network ls -q) 2>/dev/null || true

# Rebuild
re: down fclean make

# Targets
.PHONY: build up down logs clean rebuild
