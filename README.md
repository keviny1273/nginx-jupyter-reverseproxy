# nginx-jupyter-reverseproxy
provides jupyter notebook with a reverse proxy using nginx


# Docker Network

To ensure this docker contain can talk to the jupyter notebook, ensure that you have created a docker network and both images are running with the network setting. Configure a network using the following command.

`docker network create ai-net`

# Running the container

`docker run --name njrp -it -p 80:80 -p 443:443 --net ai-net keviny101/nginx-jupyter-reverseproxy`
