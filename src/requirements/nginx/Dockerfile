FROM debian:buster

RUN apt update
RUN apt install -y nginx openssl 
RUN apt install -y openssl
RUN apt install -y procps


EXPOSE 443

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=DVSGroup/OU=ogarthar/CN=https:\/\/github.com\/kirikova-k/emailAddress=dvs. kirickova.k@yandex.ru"

COPY ./conf/default /etc/nginx/sites-enabled/default
# COPY ./res /var/www/res

# COPY ./tools/start.sh var/www


CMD ["nginx", "-g", "daemon off;"]
# CMD bash /var/www/start.sh