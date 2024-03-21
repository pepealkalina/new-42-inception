#FROM set the base image for the container, I'm using debian:bullseye because is more stable than apilne
FROM debian:bullseye

#RUN run a command inside the container while building
#the ppackage manager for debian is apt and we use this to install nginx
RUN apt update && apt upgrade && apt install -y nginx openssl

COPY tools/config_nginx.sh /config_nginx.sh

RUN chmod +x config_nginx.sh

#cambia el fichero conf.d por nginx.conf y establece la configuracion de nginx
COPY ./conf/default /etc/nginx/sites-available/default

EXPOSE 443

ENTRYPOINT [ "/config_nginx.sh" ]

