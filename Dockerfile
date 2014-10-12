FROM ubuntu:14.04
MAINTAINER LifeGadget <contact-us@lifegadget.co>

ENV LUMBERJACK_VERSION 0.3.1
RUN apt-get update \
	&& apt-get install -yqq build-essential python-software-properties wget unzip \
	&& apt-add-respository ppa:duh/golang \
	&& apt-get update \
	&& apt-get install -yqq golang ruby ruby-dev \
	&& gem install fpm 
	
RUN wget -O/tmp/lumberjack.zip https://github.com/elasticsearch/logstash-forwarder/archive/v${LUMBERJACK_VERSION}.zip \
	&& cd /tmp \
	&& unzip lumberjack.zip 
	
RUN ls -l /tmp

RUN umask 022 \
	&& make deb \
	

	
	