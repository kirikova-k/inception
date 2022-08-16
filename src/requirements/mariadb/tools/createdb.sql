CREATE DATABASE wordpress;
CREATE USER 'ogarthar'@'%' IDENTIFIED BY 'passwd1001';
--  'username'@'hostт' IDENTIFIED BY 'passwd'  (% - all hosts)
GRANT ALL PRIVILEGES ON wordpress.* TO 'ogarthar'@'%';
-- дает все права пользователю над этой базой данных
FLUSH PRIVILEGES;
-- Сохранение ваших изменений

-- Чтобы изменить аутентификацию или характеристики ресурса базы данных пользователя базы данных
-- Чтобы разрешить прокси-серверу подключаться в качестве клиента без аутентификации
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root1001';