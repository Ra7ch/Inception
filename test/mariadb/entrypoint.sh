#!/bin/bash

# Path to MariaDB configuration file
CONFIG_FILE="/etc/mysql/mariadb.conf.d/50-server.cnf"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found: $CONFIG_FILE"
    exit 1
fi

# Use sed to modify the bind-address line
sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' "$CONFIG_FILE"

# Optional: Display a message or check if the change was successful
if grep -q "bind-address = 0.0.0.0" "$CONFIG_FILE"; then
    echo "bind-address successfully updated to 0.0.0.0 in $CONFIG_FILE"
else
    echo "Failed to update bind-address in $CONFIG_FILE"
fi

# # Set proper permissions to config files
#chmod 777 "$CONFIG_FILE"
# chown root:root "$CONFIG_FILE"

#mv 50.conf /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb start
sleep 5
mariadb -e "create database if not exists $DBNAME;"
#mysql -e "CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD1}';"
mariadb -e "create user if not exists $DBUSER identified by '$DBKEY';"
# mariadb -e "CREATE USER $DBUSER@'localhost' IDENTIFIED BY '$DBKEY';"
# mariadb -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO $DBUSER@'%' IDENTIFIED BY $DBKEY;"
mariadb -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO $DBUSER;"
#mysql -e "GRANT ALL ON *.* TO '${MYSQL_USER2}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop
mariadbd
# #exec mysqld_safe
# #exec "$@"


#################################

# #!/bin/bash
# service mariadb start
# mariadb -e "create database if not exists $DBNAME;"
# mariadb -e "create user if not exists $DBUSER identified by '$DBPASS';"
# #@% To give the user the rights to connects from any host
# mariadb -e "grant all privileges on $DBNAME.* to $DBUSER;"
# mariadb -e "flush privileges;"
# service mariadb stop
# mariadbd