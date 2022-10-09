#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

echo "listen = 0.0.0.0:8000" >> /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -f "/var/www/html/wordpress/adminer/index.php" ]
then
	curl -s -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php --output /var/www/html/wordpress/adminer/index.php
fi

# Run by Dumb Init php-fpm
# -F
# Force to stay in foreground and ignore daemonize option from configuration file.
exec php-fpm7.3 -R -F
