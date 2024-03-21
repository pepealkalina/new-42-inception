FROM debian:bullseye

RUN apt update && apt -y upgrade

#install mmariadb-server
RUN apt install -y mariadb-server


#copy the configuration file for this mariadb server and set permission to avoid World-writable error
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

#copy an set permision for a conf mariadb script that configures a new mysql database
COPY tools/conf_mariadb.sh /
RUN chmod +x /conf_mariadb.sh

#expose the port needed to connect to wordpress
EXPOSE 3306

#run the copied script
ENTRYPOINT [ "/conf_mariadb.sh" ]