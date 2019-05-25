FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /code:$PYTHONPATH

WORKDIR /code
COPY requirements.txt ./
RUN apk add --update --no-cache --virtual .build-deps \
        build-base \
        musl-dev

RUN pip install -r requirements.txt

COPY . /code/
