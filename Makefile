# -----------------------------------------------------------------------------
# Makefile for Docker Compose dev environment
# -----------------------------------------------------------------------------

# Paths
SHELL := /usr/bin/env bash
SCRIPT_DIR := $(abspath environments/dev/scripts)
UP_SCRIPT := $(SCRIPT_DIR)/dev-up.sh
DOWN_SCRIPT := $(SCRIPT_DIR)/dev-down.sh
RESET_SCRIPT := $(SCRIPT_DIR)/dev-reset.sh
RESTART_SCRIPT := $(SCRIPT_DIR)/dev-restart.sh


REGISTRY_USER := thaidoan868
COMPOSE_FILE := $(abspath modules/docker/docker-compose-build.yml)
COMPOSE := docker compose



# Default help
.PHONY: help
help:
	@echo ""
	@echo "Available targets:"
	@echo "  make up            - Start dev stack"
	@echo "  make down          - Stop dev stack"
	@echo "  make reset         - Stop, wipe volumes, and start fresh"
	@echo "  make restart       - Stop and start fresh"

	@echo "  make build         - Build Docker images"
	@echo "  make login         - Login to Docker registry"
	@echo "  make build         - Build Docker images"
	@echo "  make push          - Push Docker images to registry"
	@echo ""

.PHONY: up down reset restart
up:
	bash $(UP_SCRIPT)

down:
	bash $(DOWN_SCRIPT)

reset:
	bash $(RESET_SCRIPT)

restart:
	bash $(RESTART_SCRIPT)

.PHONY: login build push
login:
	docker login -u $(REGISTRY_USER)

build:
	$(COMPOSE) -f $(COMPOSE_FILE) build --pull

push:
	$(COMPOSE) -f $(COMPOSE_FILE) push
