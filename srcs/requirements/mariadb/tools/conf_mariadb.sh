#!/bin/bash
#!/bin/sh
service mariadb start;

mysqladmin -u root -p 1234 shutdown

mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PWD';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';"
mysql -e "CREATE DATABASE IF NOT EXISTS '$DB_NAME';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p 1234 shutdown

kill $(cat /run/mysqld/mysqld.pid)

mysqld