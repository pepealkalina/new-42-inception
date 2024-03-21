#!/bin/bash

WP_CONFIG_FILE="/var/www/wordpress/wp-config.php"
WP_CONFIG_SAMPLE="/var/www/wordpress/wp-config-sample.php"
WP_CLI_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

if ! [[ -f /var/www/wordpress/wp-config.php ]]; then

    curl -o /usr/local/bin/wp $WP_CLI_URL
    chmod +x /usr/local/bin/wp

    cp $WP_CONFIG_SAMPLE $WP_CONFIG_FILE

    sed -i "s/password_here/$DB_PWD/g" $WP_CONFIG_FILE
    sed -i "s/localhost/mariadb:3306/g" $WP_CONFIG_FILE
    sed -i "s/username_here/$DB_USER/g" $WP_CONFIG_FILE
    sed -i "s/database_name_here/$DB_NAME/g" $WP_CONFIG_FILE

    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --path=/var/www/wordpress
    wp user create $WP_USER $WP_EMAIL2 --user_pass=$WP_PWD --role=author --allow-root --path=/var/www/wordpress
else
    echo "wp-config.php exists. Skipping installation..."
fi

/usr/sbin/php-fpm7.4 -y /etc/php/7.4/fpm/php-fpm.conf -F
