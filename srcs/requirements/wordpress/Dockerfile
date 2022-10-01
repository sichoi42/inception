FROM		debian:buster

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get install -y \
			mariadb-client \
			php7.3 \
			php-fpm \
			php-cli \
			curl \
			php-mysql \
			php-xml \
			wget \
			vim \
			dumb-init \
			sudo \
			redis

RUN			chmod +x /usr/bin/dumb-init && \
			mkdir -p /var/www/wordpress && \
			mkdir -p /run/php && \
			mkdir -p /var/www/html

RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
			mv wp-cli.phar /usr/bin/wp && \
			chmod +x /usr/bin/wp

WORKDIR		/var/www/wordpress

COPY		./tools/init.sh /tmp/init.sh

RUN			chmod +x /tmp/init.sh

EXPOSE		9000

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "/tmp/init.sh"]
