if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
echo "Wordpress: setting up..."
# После проверки требований загрузите файл wp-cli.phar , используя wget или curl:
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# «+x» означает — установить разрешение на запуск (x) файла для всех пользователей.
chmod +x wp-cli.phar;
# Чтобы использовать WP-CLI из командной строки, набрав wp, сделайте файл исполняемым и 
# переместите его куда-нибудь в PATH. Например:
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;

# static website
	mkdir -p /var/www/html/wordpress/mysite;
    mv /var/www/index.html /var/www/html/wordpress/mysite/index.html;


# Загружает и извлекает основные файлы WordPress по указанному пути

wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;

echo "Wordpress: creating users..."

# Создает таблицы WordPress в базе данных, 
# используя URL-адрес, заголовок и предоставленные данные пользователя-администратора по умолчанию
# --url=<адрес>
# Адрес нового сайта.
# --title=<название сайта>
# Название нового сайта.
# --admin_user=<имя пользователя>
# Имя пользователя-администратора.
# [--admin_password=<пароль>]
# Пароль для пользователя admin. По умолчанию используется случайно сгенерированная строка.
# --admin_email=<электронная почта>
# Адрес электронной почты администратора.

wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};

# Создает нового пользователя
# <user-login>z
# Логин пользователя для создания.
# <user-email>
# Адрес электронной почты пользователя для создания.
# [--role=<role>]
# Роль пользователя для создания. По умолчанию: роль по умолчанию
# Возможные значения включают «администратор», «редактор», «автор», «участник», «подписчик».
# [--user_pass=<password>]
# Пароль пользователя. По умолчанию: генерируется случайным образом

wp user create ogarthar ogarthar@42.fr --user_pass=passwd1001 --role=author --allow-root;

# Тема для WordPress
wp theme install inspiro --activate --allow-root

echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

# wp redis enable --allow-root

echo "Wordpress started on :9000"
# /usr/sbin/php-fpm7.3 -F

# cp /var/www/res/* /var/www/html/wordpress/mysite
cp /var/www/mysite/* /var/www/html/wordpress/mysite


/usr/sbin/php-fpm7.3 --nodaemonize