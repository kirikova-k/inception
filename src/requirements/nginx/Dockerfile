FROM debian:buster

RUN apt update
RUN apt install -y nginx openssl openssl procps vim

EXPOSE 443

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=DVSGroup/OU=ogarthar/CN=https:\/\/github.com\/kirikova-k/emailAddress=dvs. kirickova.k@yandex.ru"

# COPY ./res /var/www/html/res

COPY ./conf/default /etc/nginx/sites-enabled/default

# COPY ./tools/start.sh var/www

ENTRYPOINT ["nginx", "-g", "daemon off;"]
# CMD bash /var/www/start.sh