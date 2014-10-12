#Lumberjack Builder
> a [docker](http://docker.io) image to build Ubuntu .deb images of the [Logstash Forwarder](https://github.com/elasticsearch/logstash-forwarder) (formally Lumberjack)

## Introduction

To build Logstash Forwarder from source quite a few source dependencies that you might not otherwise want to polute your Docker images with. Instead this repo does the messy work for you. By running:

	sudo docker run lifegadget/logstash-forwarder > lumberjack.deb
	
This handy little docker image will generate a new logstash-forwarder for you from source. Of course, you may not even want to go through this step as this repo has a number of pre-built *deb* files in the resources folder.