#!/bin/bash

sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' "/etc/mysql/mariadb.conf.d/50-server.cnf"
service mariadb start
while ! mysqladmin ping --silent; do
	sleep 1
done

mariadb -e "create database if not exists $DBNAME;"
mariadb -e "create user if not exists $MYSQL_USER identified by '$MYSQL_PASSWORD';"
mariadb -e "grant all privileges on $DBNAME.* to $MYSQL_USER;"
mariadb -e "flush privileges;"
sleep 5
service mariadb stop

###################################

exec mysqld_safe