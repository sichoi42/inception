FROM		debian:buster

RUN			apt-get update -y
RUN			apt-get upgrade -y
RUN			apt-get install -y \
			php7.3 php-fpm php-cli curl php-mysql wget vim dumb-init sudo

RUN			chmod +x /usr/bin/dumb-init
RUN			mkdir -p /run/php
RUN			mkdir -p /var/www/html
RUN			mkdir -p /var/www/html/wordpress
RUN			mkdir -p /var/www/html/wordpress/adminer

WORKDIR		/var/www/wordpress

COPY		./tools/init.sh /tmp/init.sh

RUN			chmod +x /tmp/init.sh

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "/tmp/init.sh"]
