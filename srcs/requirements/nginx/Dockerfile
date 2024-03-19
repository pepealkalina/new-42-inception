FROM debian:bullseye

RUN apt update && apt -y upgrade
RUN apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/preina-g.key -out /etc/ssl/certs/preina-g.crt -subj "/C=ES/L=Malaga/O=42_Malaga/OU=student/CN=[preina-g.42.fr]"

COPY conf/default /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx" "-g" "daemon off;" ]

