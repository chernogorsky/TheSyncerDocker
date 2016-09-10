FROM mbaltrusitis/centos-python:3.5
MAINTAINER Michail Chernogorosky <chernogorsky@gmail.com>

# python dependences
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN cd /usr/src/app \
	    && pip3 install --upgrade pip; pip3 install  $(cat requirements.txt); echo 1 \
	    && cd /usr/local/bin \
	    && ln -f -s pip3.5 pip \
	    && ln -f -s pip3.5 pip3 

#ln -f -s python3.5 python \
# && pip3.5 install --no-cache-dir $(cat requirements.txt) || echo 'OK'; \



#ONBUILD COPY . /usr/src/app

# runtime dependencies
RUN yum install -y epel-release &&  yum install -y redis
