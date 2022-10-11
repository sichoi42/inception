# Stage for build
FROM		debian:buster AS builder

RUN			apt-get update
RUN			apt-get install -y \
			wget

RUN			wget https://github.com/gohugoio/hugo/releases/download/v0.104.3/hugo_0.104.3_linux-amd64.tar.gz
RUN 		tar -xvf hugo_0.104.3_linux-amd64.tar.gz
RUN 		chmod +x hugo
RUN 		mv hugo /usr/local/bin

RUN			mkdir -p /app

WORKDIR		/app

COPY		./tools/app /app

# Build the application with Hugo
RUN			hugo -D

# Stage for Running
FROM		debian:buster AS server

RUN			apt-get update -y
RUN			apt-get upgrade -y
RUN			apt-get install -y \
			nginx vim dumb-init sudo

RUN			mkdir -p /var/www/html
COPY		--from=builder /app/public /var/www/html

COPY		./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN			chmod +x /usr/bin/dumb-init

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "nginx", "-g", "daemon off;"]
