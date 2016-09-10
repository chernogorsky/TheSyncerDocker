FROM mbaltrusitis/centos-python:3.5
MAINTAINER Michail Chernogorosky <chernogorsky@gmail.com>

# python dependences
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN pip3 install --upgrade pip; \
	    pip3 install --no-cache-dir $(cat requirements.txt) || echo 'OK'
ONBUILD COPY . /usr/src/app

# runtime dependencies
RUN yum install -y epel-release &&  yum install -y redis
