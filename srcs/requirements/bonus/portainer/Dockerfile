FROM debian:bullseye

ARG PORTAINER_PASSWORD

RUN apt-get update -y
RUN apt-get install wget -y
RUN wget https://github.com/portainer/portainer/releases/download/2.19.2/portainer-2.19.2-linux-amd64.tar.gz -O portainer.tar.gz
RUN tar -xzvf portainer.tar.gz
CMD ["portainer", "--admin-password=$PORTAINER_PASSWORD"]
