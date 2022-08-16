FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

EXPOSE 3306

RUN service mysql start && mysql < /var/www/createdb.sql && rm -f /var/www/createdb.sql
RUN apt install -y procps

ENTRYPOINT /usr/bin/mysqld_safe


# описывает команду с аргументами, которую нужно выполнить когда контейнер будет запущен
# CMD /usr/bin/mysqld_safe

# ps -ef