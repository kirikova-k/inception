# -openssl
# Утилита для создания сертификата
# -Команда req
# В первую очередь создает и обрабатывает запросы сертификатов
# -x509
# эта опция выводит самозаверяющий сертификат вместо запроса сертификата. 
# Обычно это используется для создания тестового сертификата или самозаверяющего корневого ЦС
# -nodes
# если эта опция указана, то если будет создан закрытый ключ, он не будет зашифрован
# days n
# когда используется опция -x509 , она указывает количество дней для сертификации сертификата
# -newkey аргумент
# эта опция создает новый запрос сертификата и новый закрытый ключ. Аргумент принимает одну из нескольких форм. 
# rsa:nbits , где nbits — количество битов, генерирует ключ RSA размером nbits
# -keyout имя файла
# это дает имя файла для записи вновь созданного закрытого ключа
# -out имя файла
# Это указывает имя выходного файла для записи или стандартный вывод по умолчанию
# -subj аргумент
# Заменяет поле темы входного запроса указанными данными и выводит измененный запрос
if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=wordpress/CN=rbiodies.42.fr";
echo "Nginx: ssl is set up!";
fi

# Run nginx
# Nginx использует daemon off директиву для запуска на переднем плане
nginx -g 'daemon off;';