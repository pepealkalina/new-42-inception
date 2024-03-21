FROM debian:bullseye

RUN apt-get -y update && apt-get upgrade -y

RUN apt-get install -y wget curl php7.4 php-fpm php-mysql mariadb-client

RUN wget https://es.wordpress.org/wordpress-5.8.3-es_ES.tar.gz -P /var/www && cd /var/www && tar -xzf wordpress-5.8.3-es_ES.tar.gz && rm wordpress-5.8.3-es_ES.tar.gz

RUN useradd -m -s /bin/bash preina-g && groupadd 42mlg && usermod -aG 42mlg preina-g

COPY conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

COPY conf/www.conf /etc/php/7.4/fpm/www.conf

COPY tools/init.sh /

RUN chmod +x /init.sh

EXPOSE 9000

CMD  ["/init.sh"]