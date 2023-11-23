FROM debian:bullseye

RUN	apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install -y nodejs npm

COPY conf /website

WORKDIR /website

RUN	npm install

CMD ["npm", "start"]