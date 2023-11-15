#Dockerfile for container with nginx

#load the image from docker hub
FROM debian:bullseye

#update package and install utilitys
RUN apt-get update -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

#generate key and certificate
RUN openssl req -x509 -nodes -keyout /key -out /certificate -subj "/CN=rsabbah.42.fr"

#copy conf file for nginx
COPY conf /etc/nginx/conf.d/default.conf

#expose port
EXPOSE 443

#launch nginx
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
