FROM jamper/syncer:3.5
MAINTAINER Michail Chernogorosky <chernogorsky@gmail.com>

# python dependences
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
COPY yum-requirements.txt /usr/src/app/
RUN cd /usr/src/app  \
        && yum install -y epel-release \
        && yum install -y $(cat yum-requirements.txt) || echo 1 \
        && yum clean all || echo 2 \
	    && pip3 install --upgrade pip \
	    && pip3 install  $(cat requirements.txt) \
	    && cd /usr/local/bin \
	    && ln -f -s pip3.5 pip \
	    && ln -f -s pip3.5 pip3 


