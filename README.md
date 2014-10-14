#Lumberjack Builder
> a [docker](http://docker.io) image to build Ubuntu .deb images of the [Logstash Forwarder](https://github.com/elasticsearch/logstash-forwarder) (formally Lumberjack)

## Introduction

To build the Logstash Forwarder your environment needs quite a few source dependencies that you might not otherwise want to polute your Docker images with. Instead this repo does the messy work for you and just produces a single Debian *deb* file. 

## Standard Usage

	sudo docker run -v /path/to/share:/app/bin lifegadget/lumberjack-builder 
	
The docker container exposes `/app/bin` which is where the built deb file will be placed. Just put in the appropriate mount point for your host. If you want to avoid the hassle of having a mounted share point then you can also send the file back via `stdout` with the following command:

	sudo docker run -e STDOUT=true lifegadget/lumberjack-builder > lumberjack_0.3.1_amd64.deb
	
> note: in this case you can choose any filename you like, there are no restrictions ... right now this STDOUT solution is getting mildly poluted with outputs from other commands so best to use the volume sharing

## Pre-built Images

If you just want to use a pre-built *deb* file then you can use those included in this repo. Just look in the "resources" folder and then include something like the following in your Dockerfile:

	ENV LUMBERJACK_VERSION 0.3.1
	RUN	wget --no-check-certificate -O/tmp/lumberjack_${LUMBERJACK_VERSION}_amd64.deb https://github.com/lifegadget/lumberjack-builder/raw/master/resources/lumberjack_${LUMBERJACK_VERSION}_amd64.deb \
		&& dpkg -i /tmp/lumberjack_${LUMBERJACK_VERSION}_amd64.deb \
		&& rm /tmp/lumberjack_${LUMBERJACK_VERSION}_amd64.deb

