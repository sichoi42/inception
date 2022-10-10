# Stage for build
FROM		debian:buster AS builder

RUN			apt-get update
RUN			apt-get install -y \
			git

RUN			mkdir $HOME/src
RUN			cd $HOME/src
RUN			git clone https://github.com/gohugoio/hugo.git
RUN			cd hugo
RUN			go install --tags extended

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
