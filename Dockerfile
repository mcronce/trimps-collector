FROM python:3.7-alpine

# Need edge/testing for leveldb package
RUN \
	sed -i 's/v3\.8/edge/' /etc/apk/repositories && \
	echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk add --no-cache davfs2 coreutils leveldb

RUN mkdir /app
ADD requirements.txt /app/
RUN \
	apk add --no-cache --virtual .build-deps gcc g++ leveldb-dev && \
	pip3.7 install --no-cache-dir -r /app/requirements.txt && \
	apk del --no-cache .build-deps

RUN mkdir /remote

ADD . /app
RUN \
	pip3.7 install --no-cache-dir /app && \
	rm -Rvf /app

ENTRYPOINT ["/usr/local/bin/entrypoint"]

