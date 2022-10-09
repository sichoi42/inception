FROM		debian:buster

RUN			apt-get update -y
RUN			apt-get upgrade -y
RUN			apt-get install -y \
			mariadb-client php7.3 php-fpm php-cli curl php-mysql wget vim dumb-init sudo redis

RUN			chmod +x /usr/bin/dumb-init
RUN			mkdir -p /var/www/wordpress
RUN			mkdir -p /run/php
RUN			mkdir -p /var/www/html

RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			mv wp-cli.phar /usr/bin/wp
RUN			chmod +x /usr/bin/wp

WORKDIR		/var/www/wordpress

COPY		./tools/init.sh /tmp/init.sh

RUN			chmod +x /tmp/init.sh

EXPOSE		9000

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "/tmp/init.sh"]
