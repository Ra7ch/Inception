# FROM alpine:3.19
# ENV TERM ansi
# RUN apk update
# RUN apk add mariadb openrc mariadb-client
# ADD startup /startup
# RUN chmod +x /startup
# CMD ["/startup"]

FROM alpine:3.17

RUN apk -U upgrade && apk add mariadb
RUN mariadb-install-db --user=root --datadir=/var/lib/mysql --skip-test-db
RUN mkdir /run/mysqld/
COPY mariadb-init.sql startup.sh /etc/

#ENTRYPOINT ["sh", "/etc/startup.sh"]