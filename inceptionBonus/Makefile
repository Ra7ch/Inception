UP		= docker compose up
DOWN	= docker compose down -t 4
BUILD	= docker compose build
STOP	= docker compose stop -t 4
START	= docker compose start
RESTART	= docker compose restart -t 4
SYSINFO	= docker system df
WORKDIR	= cd srcs
INFO	= @echo "Running Containers:" && docker ps && echo "Images:" && docker images && echo "Volumes:" && docker volume ls && echo "Networks:" && docker network ls

all :
	${WORKDIR} && ${BUILD} && ${UP} -d

up :
	${WORKDIR} && ${UP}

down :
	${WORKDIR} && ${DOWN}

build :
	${WORKDIR} && ${BUILD}

start :
	${WORKDIR} && ${START}

restart :
	${WORKDIR} && ${RESTART}

stop :
	${WORKDIR} && ${STOP}

sys :
	${SYSINFO}

info :
	${INFO}

ps :
	docker ps

host :
	sudo sed -i 's|localhost|raitmous.1337.ma|g' /etc/hosts

create_vol :
	mkdir -p $(HOME)/data/mariadb
	mkdir -p $(HOME)/data/wordpress
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data

rm_vol:
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data
	rm -rf $(HOME)/data
	docker volume rm -f database
	docker volume rm -f wordpress
	make create_vol

clean: down
	docker container prune -f
	docker system prune -a
	make create_vol

fclean : down rm_vol clean
	docker volume prune -f
	docker volume rm -f database
	docker volume rm -f wordpress
	make create_vol


logs:
	${WORKDIR} && docker compose logs mariadb wordpress nginx

re : down all

