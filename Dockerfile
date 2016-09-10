FROM mbaltrusitis/centos-python:3.5-onbuild
MAINTAINER Michail Chernogorosky <chernogorsky@gmail.com>

# runtime dependencies
RUN yum install redis
