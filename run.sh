#!/bin/bash

# Backup the original config.php file
cp /DATA/AppData/big-bear-nextcloud/html/config/config.php /DATA/AppData/big-bear-nextcloud/html/config/config.php.bak

# Add the LAN IP to the config.php file
awk -v '/0 => '\''localhost'\''/{print; print "    1 => '\''"nextcloud.mm62.online"'\'',"; next}1' /DATA/AppData/big-bear-nextcloud/html/config/config.php.bak > /DATA/AppData/big-bear-nextcloud/html/config/config.php

# Get the path to the docker-compose.yml file
COMPOSE_FILE="/var/lib/casaos/apps/big-bear-nextcloud/docker-compose.yml"

# Apply changes using casaos-cli
casaos-cli app-management apply "big-bear-nextcloud" --file="$COMPOSE_FILE"
