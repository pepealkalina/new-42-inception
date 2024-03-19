#!/bin/bash

db_name=wordpres_db
db_user=preina-g
db_pwd="1234"

# start the service mysql
# service mysql start

#create and configure a new database
echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql

#set root connection
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql

#The Flush Privileges statement reloads the grant tables' privileges, ensuring that any changes made to user permissions are immediately applied without requiring a restart of the MySQL server. (copy from google)
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

#kil the first mysqld proces by mysqld.pid
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld