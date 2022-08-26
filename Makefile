all:	up
up:
		@mkdir -p /home/${USER}/data/db
		@mkdir -p /home/${USER}/data/wp

		@docker-compose -f src/docker-compose.yml build

		@docker-compose -f src/docker-compose.yml up -d

down:
		docker-compose -f src/docker-compose.yml down

ps:		
		docker-compose -f src/docker-compose.yml ps
		docker ps -a

fclean: down
		# docker rmi -f $$(docker images -qa);\
		# docker volume rm $$(docker volume ls -q);\
		# docker system prune -a --force
		sudo rm -Rf /home/${USER}/data/db
		sudo rm -Rf /home/${USER}/data/wp
		mkdir /home/${USER}/data/db
		mkdir /home/${USER}/data/wp

re:		fclean all
		# @mkdir -p ../data/wp
		# @mkdir -p ../data/db
		# @docker-compose -f src/docker-compose.yml build
		# docker-compose -f src/docker-compose.yml up

mariadb:
		docker exec -it mariadb bash
nginx:
		docker exec -it nginx bash

wordpress:
		docker exec -it wordpress bash

redis:
		docker exec -it redis bash
ftp:
		docker exec -it ftp_server bash

.PHONY: all up down ps fclean re 