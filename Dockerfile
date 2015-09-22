FROM ubuntu:wily
MAINTAINER Fergal Moran "Ferg@lMoran.me"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 python-setuptools && \
    apt-get clean

RUN easy_install supervisor && \
    easy_install supervisor-stdout

ADD icecast2/icecast.xml /etc/icecast2/
ADD default/icecast2 /etc/default/
ADD supervisord.conf /etc/supervisord.conf

RUN pip install -r requirements.txt
RUN pip install git+https://github.com/fergalmoran/python-shout.git#python-shout --upgrade
