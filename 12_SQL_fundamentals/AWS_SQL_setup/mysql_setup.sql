SELECT user,authentication_string,plugin,host FROM mysql.user;

/* Не забудьте изменить 'password' на более надежный пароль и убедитесь, что эта команда заменит
пароль root, заданный при установке */

ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';
--ИЛИ если работаем с РНР
--ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

FLUSH PRIVILEGES;
SELECT user,authentication_string,plugin,host FROM mysql.user;
\q









