# nginx-jupyter-reverseproxy
provides jupyter notebook with a reverse proxy using nginx

# Set-up Docker
This container is intended to provide reverse proxy for the Jupyter notebook provides as part of the following project - https://github.com/keviny1273/AIHackathon-AnacondawithWine. Set-up that container and docker first!

# Pulling the docker image


# Running the container

`docker run --name njrp --link anacondawithwine:jnbk -it -p 80:80 -p 443:443 keviny101/nginx-jupyter-reverseproxy`
