# Stage for build
FROM		debian:buster AS builder

RUN			apt-get update
RUN			apt-get install -y \
			wget

COPY		./tools/install_hugo.sh ./install_hugo.sh

RUN 		bash install_hugo.sh

COPY		./tools/app /app

WORKDIR		/app

# # Build the application with Hugo
RUN			hugo --baseURL="http://127.0.0.1:1313" -D
# RUN			hugo -D

# # Stage for Running
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
