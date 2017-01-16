from python:2.7-alpine

RUN apk add --no-cache --virtual .build-deps \
    linux-headers \
    musl-dev \
    gcc && \
    apk add --no-cache \
    postgresql-dev \
    bash

ADD ./ .
ADD ./install/config.ini /usr/local/share/nfldb/config.ini

RUN pip install -r requirements.txt && \
    python setup.py install && \
    apk del .build-deps
