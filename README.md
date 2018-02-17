# nginx-jupyter-reverseproxy
provides jupyter notebook with a reverse proxy using nginx. Great for providing SSL and also bypassing web socket issues when accessing behind a firewall. Once running browse to https://[ip address]/. As a self-signed certificate is used, you'll need to accept any security warnings!

# Set-up Docker
This container is intended to provide reverse proxy for the Jupyter notebook provides as part of the following project - https://github.com/keviny1273/AIHackathon-AnacondawithWine. Set-up that container and docker first!

# Pulling the docker image
`docker pull keviny101/nginx-jupyter-reverseproxy`

# Running the container

Before running this container, you must have the AIHackathon-AnacondawithWine container running and it must be named anacondawithwine (this is included in the example run command specified on that repository. 

`docker run --name njrp --link anacondawithwine:jnbk -it -p 80:80 -p 443:443 keviny101/nginx-jupyter-reverseproxy`

# That's it

It should be as simple as that. As stated above, now you'll have a secure connection to your jupyter notebook (there is also a non-secure (http) connection too but this will redirect to https). From your browser navigate to the public IP address. If you have any issues, ensure that there are no firewalls (e.g. K5 security groups) blocking access to port 443 (or port 80 for http). 
