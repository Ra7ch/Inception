FROM	debian:11

RUN	apt update -y && apt upgrade -y \
	&& apt install mariadb-server -y

COPY	tools/entrypoint.sh bin/

#EXPOSE 3306

RUN	chmod +x bin/entrypoint.sh

CMD     ["sh", "/bin/entrypoint.sh"]