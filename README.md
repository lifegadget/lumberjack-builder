#Lumberjack Builder
> a [docker](http://docker.io) image to build Ubuntu .deb images of the [Logstash Forwarder](https://github.com/elasticsearch/logstash-forwarder) (formally Lumberjack)

## Introduction

To build the Logstash Forwarder your environment needs quite a few source dependencies that you might not otherwise want to polute your Docker images with. Instead this repo does the messy work for you and just produces a single Debian *deb* file. 

## Standard Usage

	sudo docker run -v /path/to/share:/app/bin lifegadget/lumberjack-builder 
	
The docker container exposes `/app/bin` which is where the built deb file will be placed. Just put in the appropriate mount point for your host.

## Pre-built Images

If you just want to use a pre-built *deb* file then you can use those included in this repo. Just look in the "resources" folder and then include something like the following in your Dockerfile:

	ENV LUMBERJACK_VERSION 0.3.1
	RUN	wget --no-check-certificate -O/tmp/lumberjack_${LUMBERJACK_VERSION}_amd64.deb https://github.com/lifegadget/lumberjack-builder/raw/master/resources/lumberjack_${LUMBERJACK_VERSION}_amd64.deb \
		&& dpkg -i /tmp/lumberjack_${LUMBERJACK_VERSION}_amd64.deb \
		&& rm /tmp/lumberjack_${LUMBERJACK_VERSION}_amd64.deb

