# Variables
DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
DOCKER = docker

# Build
build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

# Start
up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

# Stop
down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

# View logs
logs:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

# Clean up Docker resources
clean:
	$(DOCKER) stop $$(docker ps -qa) || true
	$(DOCKER) rm $$(docker ps -qa) || true
	$(DOCKER) rmi -f $$(docker images -qa) || true
	$(DOCKER) volume rm $$(docker volume ls -q) || true
	$(DOCKER) network rm $$(docker network ls -q) 2>/dev/null || true

# Rebuild
rebuild: down clean build up

# Targets
.PHONY: build up down logs clean rebuild
