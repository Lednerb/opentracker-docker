FROM alpine

MAINTAINER Lednerb <code@lednerb.de>

WORKDIR /tmp

# All-in-One RUN for a very small image size (< 5 MB)
RUN apk add --no-cache \
	gcc \
	g++ \
	make \
	git \
	cvs \
	zlib-dev \

	&& cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat \
	&& cd libowfat \
	&& make \
	&& cd ../ \

	&& git clone git://erdgeist.org/opentracker \
		&& cd opentracker \
		&& make \

	&& mv /tmp/opentracker/opentracker /bin/ \

	&& apk del gcc g++ make git cvs zlib-dev \
	&& rm -rf /var/cache/apk/* /tmp/* 

COPY ./opentracker.conf /etc/opentracker/opentracker.conf
COPY ./whitelist.txt	/etc/opentracker/whitelist.txt
COPY ./blacklist.txt	/etc/opentracker/blacklist.conf

EXPOSE 6969

CMD opentracker -f /etc/opentracker/opentracker.conf
