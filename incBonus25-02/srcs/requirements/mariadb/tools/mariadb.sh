#!/bin/bash

sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' "/etc/mysql/mariadb.conf.d/50-server.cnf"

mysql_install_db;

service mariadb start
mariadb -e "create database if not exists $DBNAME;"
mariadb -e "create user if not exists $DBUSER identified by '$DBKEY';"
mariadb -e "grant all privileges on $DBNAME.* to $DBUSER;"
mariadb -e "flush privileges;"
service mariadb stop

exec mariadbd