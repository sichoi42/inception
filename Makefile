NAME = inception
SET_DOMAIN = .set_domain

$(NAME) :
	ifeq ("$(wildcard $(SET_DOMAIN))", "")
		sudo chmod 777 /etc/hosts
		sudo echo "127.0.0.1 sichoi.42.fr" >> /etc/hosts
		touch $(SET_DOMAIN)
	endif
	sudo mkdir -p ${HOME}/data/wordpress ${HOME}/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up --force-recreate --build -d

all : $(NAME)

.PHONY : restart
restart	:
	sudo docker-compose -f srcs/docker-compose.yml restart

.PHONY : ps
ps :
	sudo docker-compose -f srcs/docker-compose.yml ps

.PHONY : log
log :
	sudo docker-compose -f srcs/docker-compose.yml logs -f

.PHONY : exec
exec :
	sudo docker-compose -f srcs/docker-compose.yml exec ${CT} /bin/bash

clean :
	sudo docker-compose -f srcs/docker-compose.yml down --remove-orphans --rmi all --volumes

fclean : clean
	sudo rm -rf ${HOME}/data
	sudo docker network prune --force
	sudo docker volume prune --force
	sudo docker system prune --all --force --volumes
	sudo rm -f $(SET_DOMAIN)

re :
	@$(MAKE) fclean
	@$(MAKE) all
