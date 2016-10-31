# The aim of this docker image is to set up an environment in which we can
# run 32-bit tests for Astropy

FROM ubuntu:14.04
MAINTAINER Thomas P. Robitaille <thomas.robitaille@gmail.com>

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y libpython2.7-dev:i386 \
                       gcc:i386 \
                       python-dev:i386 \
                       python-numpy:i386 \
                       cython:i386

ENV CC "gcc -m32"
ENV LDSHARED "gcc -m32 -shared"
ENV LDFLAGS "-m32 -shared"

# Install setuptools - python-setuptools:i386 doesn't exist in apt
CMD wget https://pypi.python.org/packages/1d/04/97e37cf85972ea19364c22db34ee8192db3876a80ed5bffd6413dcdabe2d/setuptools-28.7.1.tar.gz
CMD tar xvzf setuptools-28.7.1.tar.gz
CMD cd setuptools-28.7.1
CMD python setup.py install
CMD cd ..

# Install jinja2 - python-jinja2:i386 doesn't exist in apt
CMD easy_install jinja2

