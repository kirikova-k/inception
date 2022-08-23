mkdir -p /run/php
mkdir -p /var/www/html

apt update
apt install -y procps vim
apt install -y php7.3 php-mysqli php-fpm wget mariadb-client curl sendmail

wget https://wordpress.org/latest.tar.gz
chown -R www-data:www-data /var/www/html
tar xzvf latest.tar.gz -C /var/www/html
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";

chmod -R 775  /var/www/html/wordpress/*

touch /run/php/php7.3-fpm.pid