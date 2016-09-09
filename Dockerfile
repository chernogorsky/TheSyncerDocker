FROM python:3.5-onbuild
MAINTAINER Michail Chernogorosky <chernogorsky@gmail.com>

# runtime dependencies
RUN apt-get update && apt-get install -y \
		software-properties-common \
		redis-server \
	&& rm -rf /var/lib/apt/lists/*
