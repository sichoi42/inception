#!/bin/bash

arch=$(uname -m)

if [ $arch == "arm64" ] || [ $arch == "aarch64" ]; then
	wget -O - https://github.com/gohugoio/hugo/releases/download/v0.104.3/hugo_0.104.3_linux-arm64.tar.gz > hugo.tar.gz
elif [ $arch == "amd64" ]; then
	wget -O - https://github.com/gohugoio/hugo/releases/download/v0.104.3/hugo_0.104.3_linux-amd64.tar.gz > hugo.tar.gz
else
	echo "Unsupported architecture"
	exit 1
fi

tar -xvf hugo.tar.gz

chmod +x hugo

mv hugo /usr/local/bin
