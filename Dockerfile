FROM nginx

RUN apt-get update
RUN apt-get install curl -y

MAINTAINER Kevin Yeo <kevin.yeo@uk.fujitsu.com>

RUN curl "https://raw.githubusercontent.com/keviny1273/nginx-jupyter-reverseproxy/master/nginx-default" > /etc/nginx/conf.d/default.conf

RUN apt-get update
RUN apt-get install openssl

RUN mkdir /etc/nginx/ssl/

WORKDIR /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt -subj "/C=GB/ST=London/O=Fujitsu/OU=AI Hackathon/CN=localhost"

# Restart nginx for the above settings to take effect

#RUN /etc/init.d/nginx reload

ENTRYPOINT service nginx restart && /bin/bash
