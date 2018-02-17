
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

# Install SSL Certificates - this needs a valid hostname which is passed during with the docker run command
# This will use Let's Encrypt and Certbot

RUN apt-get install python-certbot-nginx -y

# When we run the container the last part of the set-up will occur this will
# Stop nginx
# configure the nginx server to use the current server host name - which should be passed using the docker run --hostname attribute
# run certbot to install the Let's Encrypt SSL certificate
# start nginx for the above settings to take effect
# run a command prompt

#RUN /etc/init.d/nginx reload

ENTRYPOINT service nginx stop && /bin/sed -i "s/localhost/$HOSTNAME/g" /etc/nginx/conf.d/default.conf && service nginx start && /bin/bash
#     certbot certonly --standalone -d $HOSTNAME --agree-tos --register-unsafely-without-email && service nginx start && /bin/bash

