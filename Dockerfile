FROM python:2.7
MAINTAINER Michail Chernogorosky <chernogorsky@gmail.com>

RUN apt-get update -qy \
  - apt-get install -y python-dev python-pip
RUN pip install colorlog \
                requests \
                nose \
                pyzabbix \
                httmock \
                pyfakefs \
                matplotlib \
                coverage
