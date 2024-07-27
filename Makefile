# Makefile for Docker Compose setup

# Variables
DOCKER_COMPOSE = docker-compose
DOCKER = docker

# Targets
.PHONY: all build up down logs clean rebuild

# Default target
all: build up

# Build the Docker containers
build:
	$(DOCKER_COMPOSE) build

# Start the Docker containers
up:
	$(DOCKER_COMPOSE) up -d

# Stop the Docker containers
down:
	$(DOCKER_COMPOSE) down

# View logs for all Docker containers
logs:
	$(DOCKER_COMPOSE) logs -f

# Clean up Docker resources
clean:
	$(DOCKER) stop $$(docker ps -qa) || true
	$(DOCKER) rm $$(docker ps -qa) || true
	$(DOCKER) rmi -f $$(docker images -qa) || true
	$(DOCKER) volume rm $$(docker volume ls -q) || true
	$(DOCKER) network rm $$(docker network ls -q) 2>/dev/null || true

# Rebuild the Docker containers
rebuild: down clean build up
