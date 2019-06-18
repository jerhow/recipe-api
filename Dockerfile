FROM python:3.7-alpine
# MAINTAINER: Jerry Howard
LABEL maintainer="Jerry Howard"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# User 'user' is solely for running the app
# Without creating a dedicated user, the app would run as root
RUN adduser -D user
USER user
