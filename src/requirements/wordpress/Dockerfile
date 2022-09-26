FROM		debian:buster

# RUN			apt-get update -y && \
# 			apt-get upgrade -y && \
# 			apt-get install -y \
# 			php7.3 \
# 			php-fpm \
# 			php-cli \
# 			# wget \
# 			curl \
# 			php-mysql \
# 			php-xml \
# 			sendmail \
# 			vim \
# 			# rsync \
# 			dumb-init

# RUN			chmod +x /usr/bin/dumb-init && \
# 			mkdir -p /var/www/wordpress

# RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp
# RUN			chmod +x /usr/bin/wp
# RUN			wp core download --path=/var/www/wordpress

# WORKDIR		/

# COPY		./tools/init.sh ./init.sh

# RUN			chmod +x ./init.sh

# RUN			./init.sh

# Handle Every Signal Correctly by Dumb Init to PID 1
# ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "./init.sh"]
