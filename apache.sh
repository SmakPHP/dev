#!/bin/bash

apt install php php-mbstring php-json php-xml php-mysql \
php-bcmath php-tokenizer php-zip php-curl composer -y

php -v
php -m
which composer
composer --version

apt install apache2 mariadb-server -y

systemctl enable mysql
systemctl enable apache2

mysql_secure_installation # or mariadb-secure-installation

echo "
<VirtualHost *:80>
    ServerAdmin admin@tgspot.ru
    ServerName tgspot.ru
    DocumentRoot /var/www/tgspot.ru
    <Directory /var/www/tgspot.ru>
        Options FollowSymLinks
        AllowOverride All
    </Directory>
    ErrorLog /var/log/tgspot.ru.error.log
    CustomLog /var/log/tgspot.ru.access.log combined
</VirtualHost>

" > /etc/apache2/sites-available/tgspot.ru.conf

mkdir -p /var/www/{vtare.ru,tgspot.ru}
echo "<?php #phpinfo();" > /var/www/tgspot.ru/index.php
wget https://www.adminer.org/latest-mysql-en.php -O /var/www/tgspot.ru/tools.php
chown -R www-data:www-data /var/www/{vtare.ru,tgspot.ru}

a2ensite tgspot.ru.conf
systemctl restart apache2

apt install certbot python3-certbot-apache -y
certbot --apache # (y,n,domain,enter)

# systemctl status certbot.timer
# certbot renew --dry-run


"""

mariadb -u root -p

CREATE DATABASE tgspot;
CREATE USER 'tgspot'@'localhost' IDENTIFIED BY 'pwd';
GRANT ALL ON tgspot.* TO 'tgspot'@'localhost';
FLUSH PRIVILEGES;

"""


nginx -V
apt install certbot python3-certbot-nginx -y
certbot --nginx -d y2be.ru
