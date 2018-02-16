# nginx-jupyter-reverseproxy
provides jupyter notebook with a reverse proxy using nginx


# Docker Network

To ensure this docker contain can talk to the jupyter notebook, ensure that you have created a docker network and both images are running with the network setting. Configure a network using the following command.

`docker network create ai-net`
