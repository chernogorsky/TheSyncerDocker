FROM mbaltrusitis/centos-buildpack-deps:7
MAINTAINER Matthew Baltrusitis "matthew@baltrusitis.com"

# yum install zlib-devel bzip2-devel sqlite sqlite-devel openssl-devel

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8
ENV LC_ALL C

# gpg: key F73C700D: public key "Larry Hastings <larry@hastings.org>" imported
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 97FC712E4C024BBEA48A61ED3A5CA953F73C700D

ENV PYTHON_VERSION 3.5.2

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 8.1.2

RUN yum -y install tk-devel tk || echo 1\
    && yum clean all || echo 2

RUN set -x \
    && mkdir -p /usr/src/python \
    && curl -SL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" -o python.tar.xz \
    && curl -SL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" -o python.tar.xz.asc \
    && gpg --verify python.tar.xz.asc \
    && tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
    && rm python.tar.xz* \
    && cd /usr/src/python \    
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && ldconfig \
    && pip3.5 install --no-cache-dir --upgrade --ignore-installed pip==$PYTHON_PIP_VERSION \
    && find /usr/local \
        \( -type d -a -name test -o -name tests \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' + \
    && rm -rf /usr/src/python

# make some useful symlinks that are expected to exist
RUN cd /usr/local/bin \
    && ln -fs easy_install-3.5 easy_install3 \
    && ln -fs idle3.5 idle3 \
    && ln -fs pydoc3.5 pydoc3 \
    && ln -fs python3.5 python3 \
    && ln -fs python-config3.5 python-config3

CMD ["python3"]
