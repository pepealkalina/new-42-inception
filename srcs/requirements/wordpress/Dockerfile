FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y php-fpm php-mysql curl

# copy and set permissions to the script thhat configures wordpress
COPY tools/conf_wordpress.sh /
RUN chmod +x /conf_wordpress.sh

# exposes the port 9000 for connect to nginx
EXPOSE 9000

CMD [ "/conf_wordpress.sh" ]