FROM alpine:latest

MAINTAINER Lednerb <Hack_EN@lednerb.de>

RUN apk add --no-cache \
	gcc \
	g++ \
	make \
	git \
	cvs \
	zlib-dev

RUN adduser -u 1000 -s /bin/bash -D trackerdriver

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