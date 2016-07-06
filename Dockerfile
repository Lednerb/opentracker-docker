FROM ubuntu:14.04

MAINTAINER Lednerb <Hack_EN@lednerb.de>

RUN apt-get update && apt-get install -y \
	build-essential \
	libpq-dev \
	git \
	cvs

RUN useradd -u 1000 -ms /bin/bash trackerdriver

USER trackerdriver
WORKDIR /home/trackerdriver

RUN cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat \
	&& cd libowfat \
	&& make \
	&& cd ../

RUN git clone git://erdgeist.org/opentracker \
	&& cd opentracker \
	&& make

COPY ./opentracker.conf /home/trackerdriver/opentracker.conf

EXPOSE 6969

CMD opentracker/opentracker -f /home/trackerdriver/opentracker.conf