#!/bin/bash

# Path to MariaDB configuration file
CONFIG_FILE="/etc/mysql/mariadb.conf.d/50-server.cnf"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found: $CONFIG_FILE"
    exit 1
fi

sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' "$CONFIG_FILE"

if grep -q "bind-address = 0.0.0.0" "$CONFIG_FILE"; then
    echo "bind-address successfully updated to 0.0.0.0 in $CONFIG_FILE"
else
    echo "Failed to update bind-address in $CONFIG_FILE"
fi

##############

service mariadb start
mariadb -e "create database if not exists $DBNAME;"
mariadb -e "create user if not exists $DBUSER identified by '$DBKEY';"
mariadb -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO $DBUSER;"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop

mariadbd
