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

# clean:
# 	@docker stop $$(docker ps -qa);\
# 	docker container rm $$(docker ps -qa);\
# 	docker image rm -f $$(docker images -qa);\
# 	docker volume rm $$(docker volume ls -q);\
# 	docker network rm $$(docker network ls -q);\

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume prune -f;\
	docker network prune -f;
#volumeはpruneを使えば永続化データを保持できるらしい

ps :
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
	docker exec -it wordpress /bin/bash

mariadb :
	docker exec -it mariadb /bin/bash

.PHONY: all build up down re clean ps nginx wordpress mariadb 