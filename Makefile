

DOCKER_COMPOSE_YML = ./srcs/docker-compose.yml
SRCS_PATH = ./srcs
MARIADB_PATH = ./srcs/requirements/mariadb
NGINX_PATH = ./srcs/requirements/nginx
WORDPRESS_PATH = ./srcs/requirements/wordpress

all: build up

build :
	docker compose -f $(DOCKER_COMPOSE_YML) build --no-cache

up :
	docker compose -f $(DOCKER_COMPOSE_YML) up -d --build

down :
	docker compose -f $(DOCKER_COMPOSE_YML) down

stop :
	docker compose -f $(DOCKER_COMPOSE_YML) stop

re : down build up

.PHONY: all build up down re clean