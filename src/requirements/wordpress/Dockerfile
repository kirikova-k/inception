FROM debian:buster

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

RUN chmod u+x /var/www/install.sh && bash /var/www/install.sh
RUN chmod +x /var/www/start.sh

# static website
COPY ./tools/mysite /var/www/mysite

# ENTRYPOINT /usr/sbin/php-fpm7.3 --nodaemonize
CMD bash /var/www/start.sh
