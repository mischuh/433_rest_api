FROM resin/raspberry-pi-alpine-python:3.6

WORKDIR /app

RUN apk add --update --no-cache \
    build-base \
    git \
    bash

RUN pip3 install flask tinydb RPi.GPIO

# clone this repo
RUN git clone https://github.com/philipptrenz/433MHz-Wireless-Sockets-API && \    
    chmod 755 433MHz-Wireless-Sockets-API/433PyApi.py

EXPOSE 80

CMD ["python3",  "./433MHz-Wireless-Sockets-API/433PyApi.py"]
