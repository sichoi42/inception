FROM	debian:buster

# RUN rm /etc/nginx/conf.d/default.conf

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get install -y nginx openssl vim

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.pem -out /etc/ssl/certs/server.crt
# COPY nginx.conf /etc/nginx/conf.d
