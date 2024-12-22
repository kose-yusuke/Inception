DOCKER_COMPOSE_YML = ./srcs/docker-compose.yml
SRCS_PATH = ./srcs
MARIADB_PATH = ./srcs/requirements/mariadb
NGINX_PATH = ./srcs/requirements/nginx
WORDPRESS_PATH = ./srcs/requirements/wordpress
STACK_NAME = inception

all: build up

build :
	docker compose -f $(DOCKER_COMPOSE_YML) build 

up :
	docker compose -f $(DOCKER_COMPOSE_YML) up -d --build

down :
	docker compose -f $(DOCKER_COMPOSE_YML) down

stop :
	docker compose -f $(DOCKER_COMPOSE_YML) stop

swarm :
	docker swarm init

secret :
	@if docker secret ls | grep -q "credentials"; then \
		docker secret rm credentials; \
	fi
	@if docker secret ls | grep -q "db_password"; then \
		docker secret rm db_password; \
	fi
	@if docker secret ls | grep -q "db_root_password"; then \
		docker secret rm db_root_password; \
	fi
	docker secret create credentials ./srcs/secrets/credentials.txt
	docker secret create db_password ./srcs/secrets/db_password.txt
	docker secret create db_root_password ./srcs/secrets/db_root_password.txt

re : down build up secret

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume prune -f;\
	docker network prune -f;
#volumeはpruneを使えば永続化データを保持できるらしい

ps :
	@docker secret ls
	@echo "----------------------------------------"
	@docker container ls -a
	@echo "----------------------------------------"
	@docker image ls -a
	@echo "----------------------------------------"
	@docker volume ls
	@echo "----------------------------------------"
	@docker network ls

nginx :
	docker exec -it nginx /bin/bash

wordpress :
	docker exec -it wp-php /bin/bash

mariadb :
	docker exec -it mariadb /bin/bash

.PHONY: all build up down re clean ps nginx wordpress mariadb 