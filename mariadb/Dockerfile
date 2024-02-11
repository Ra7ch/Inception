

FROM	debian:11

RUN	apt update -y && apt upgrade -y \
	&& apt install mariadb-server -y

#EXPOSE	3306

#COPY	50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	entrypoint.sh bin/
#COPY	config.sh bin/
#EXPOSE 3306

#RUN	chmod +x bin/config.sh
#RUN chmod -R 0777 /etc/mysql
RUN	chmod +x bin/entrypoint.sh
# ENTRYPOINT	["entrypoint.sh"]
# CMD	["mariadbd"]
CMD     ["sh", "/bin/entrypoint.sh"]

#################################3

# FROM    debian:11
# RUN     apt update -y
# RUN     apt install mariadb-server -y
# COPY    ./50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY    ./entrypoint.sh /bin
# RUN     chmod 777 /bin/entrypoint.sh
# CMD     ["sh", "/bin/entrypoint.sh"]

################################

# FROM alpine:3.14

# RUN apk update && apk upgrade && \
#     apk add vim curl \
# 	&& apk add openrc && apk add mariadb-server --no-cache

# # Copy entrypoint script
# #COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY entrypoint.sh /bin/
# RUN chmod +x /bin/entrypoint.sh

# ENTRYPOINT ["sh", "/bin/entrypoint.sh"]
# CMD ["mariadbd"]
# #CMD ["/usr/bin/mysqld", "--skip-log-error"]
