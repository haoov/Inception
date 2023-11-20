FROM debian:bullseye

ARG PORT_PWD

RUN	set -ex; \
	apt-get update -y && apt-get upgrade -y; \
	apt-get install wget -y; \
	wget https://github.com/portainer/portainer/releases/download/2.19.2/portainer-2.19.2-linux-amd64.tar.gz -O portainer.tar.gz

RUN echo ${PORT_PWD} > pwd.txt

RUN tar -xzvf portainer.tar.gz

CMD ["./portainer/portainer", "--admin-password-file=pwd.txt"]
