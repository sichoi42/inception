FROM		debian:buster

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get install -y nginx openssl vim sudo procps dumb-init && \
			chmod +x /usr/bin/dumb-init

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=sichoi/CN=sichoi.42.fr" \
			-keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

COPY		./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD 		["nginx", "-g", "daemon off;"]
