#!/bin/bash

# Path to your MariaDB configuration file
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

