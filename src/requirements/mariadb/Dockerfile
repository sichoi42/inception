FROM		debian:buster

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get -y install mariadb-server vim sudo procps dumb-init && \
			chmod +x /usr/bin/dumb-init
			mariadb-install-db \
			--datadir=/var/lib/mysql \
			--auth-root-authentication-method=normal
