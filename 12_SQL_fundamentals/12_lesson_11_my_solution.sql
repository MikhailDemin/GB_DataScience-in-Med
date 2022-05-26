-- 12_lesson_11_my_solution

-- Практическое задание по теме “Оптимизация запросов”

/*
 1.	Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs 
и products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор 
первичного ключа и содержимое поля name.*/
-- **************************************************************************************************************
DROP TABLE IF EXISTS insert_transaction_log;
CREATE TABLE insert_transaction_log (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(100),
	string_id BIGINT NOT NULL,
	name_value VARCHAR(100) NOT NULL	
) ENGINE = ARCHIVE;


DROP TRIGGER IF EXISTS users_log;
DELIMITER &&

CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO insert_transaction_log (created_at, table_name, string_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END &&
DELIMITER ;

DROP TRIGGER IF EXISTS catalogs_log;
DELIMITER &&

CREATE TRIGGER catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO insert_transaction_log (created_at, table_name, string_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END &&
DELIMITER ;

DROP TRIGGER IF EXISTS products_log;
DELIMITER &&

CREATE TRIGGER products_log AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO insert_transaction_log (created_at, table_name, string_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END &&
DELIMITER ;

INSERT INTO users (name, birthday_at) 
VALUES ('Пётр', '1995-04-12');
SELECT * FROM users;

/*
|id |name     |birthday_at|created_at         |updated_at         |
|---|---------|-----------|-------------------|-------------------|
|2  |Наталья  |1984-11-12 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|3  |Александр|1985-05-20 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|4  |Сергей   |1988-02-14 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|5  |Иван     |1998-01-12 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|6  |Мария    |1992-08-29 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|12 |Пётр     |1995-04-12 |2022-05-24 08:23:10|2022-05-24 08:23:10|

*/

INSERT INTO products (name, description, price, catalog_id) 
VALUES ('Intel Core i7-12600KF', 'Процессор для ПК на платформе Intel.', '43000', '1');
SELECT * FROM products;

/*
|id |name                   |description                                                                      |price |catalog_id|created_at         |updated_at         |
|---|-----------------------|---------------------------------------------------------------------------------|------|----------|-------------------|-------------------|
|1  |Intel Core i3-8100     |Процессор для настольных персональных компьютеров, основанных на платформе Intel.|7 890 |1         |2022-04-22 15:50:31|2022-04-22 15:50:31|
|2  |Intel Core i5-7400     |Процессор для настольных персональных компьютеров, основанных на платформе Intel.|12 700|1         |2022-04-22 15:50:31|2022-04-22 15:50:31|
|3  |AMD FX-8320E           |Процессор для настольных персональных компьютеров, основанных на платформе AMD.  |4 780 |1         |2022-04-22 15:50:31|2022-04-22 15:50:31|
|4  |AMD FX-8320            |Процессор для настольных персональных компьютеров, основанных на платформе AMD.  |7 120 |1         |2022-04-22 15:50:31|2022-04-22 15:50:31|
|5  |ASUS ROG MAXIMUS X HERO|Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX       |19 310|2         |2022-04-22 15:50:31|2022-04-22 15:50:31|
|6  |Gigabyte H310M S2H     |Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX           |4 790 |2         |2022-04-22 15:50:31|2022-04-22 15:50:31|
|7  |MSI B250M GAMING PRO   |Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX            |5 060 |2         |2022-04-22 15:50:31|2022-04-22 15:50:31|
|8  |Intel Core i7-12700K   |                                                                                 |      |          |2022-04-22 15:50:57|2022-04-22 15:50:57|
|9  |                       |Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX       |      |          |2022-04-22 15:50:57|2022-04-22 15:50:57|
|10 |Intel Core i7-12600KF  |Процессор для ПК на платформе Intel.                                             |43 000|1         |2022-05-24 08:28:17|2022-05-24 08:28:17|
 */

INSERT INTO catalogs (name) 
VALUES ('Блоки питания');
SELECT * FROM catalogs;

/*
|id |name              |
|---|------------------|
|1  |Процессоры        |
|2  |Материнские платы |
|3  |Видеокарты        |
|4  |Жесткие диски     |
|5  |Оперативная память|
|6  |Блоки питания     |
*/

SELECT * FROM insert_transaction_log;

/*
|created_at         |table_name|string_id|name_value           |
|-------------------|----------|---------|---------------------|
|2022-05-24 08:23:10|users     |12       |Пётр                 |
|2022-05-24 08:28:17|products  |10       |Intel Core i7-12600KF|
|2022-05-24 08:30:22|catalogs  |6        |Блоки питания        |
*/

-- 2*.	Создайте SQL-запрос, который помещает в таблицу users миллион записей.
-- **************************************************************************************************************
-- Добавление 1 миллиона записей займет очень много времени, добавим 1000.

DROP PROCEDURE IF EXISTS insert_users_generator;

DELIMITER $$

CREATE PROCEDURE insert_users_generator ()
BEGIN
	DECLARE i INT DEFAULT 100000;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END $$

DELIMITER ;

SET PROFILING=1;
set profiling_history_size=100;

CALL insert_users_generator();

SELECT * FROM users
ORDER BY id
LIMIT 15;

/*
|id |name     |birthday_at|created_at         |updated_at         |
|---|---------|-----------|-------------------|-------------------|
|2  |Наталья  |1984-11-12 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|3  |Александр|1985-05-20 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|4  |Сергей   |1988-02-14 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|5  |Иван     |1998-01-12 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|6  |Мария    |1992-08-29 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|12 |Пётр     |1995-04-12 |2022-05-24 08:23:10|2022-05-24 08:23:10|
|13 |user_0   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|14 |user_1   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|15 |user_2   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|16 |user_3   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|17 |user_4   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|18 |user_5   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|19 |user_6   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|20 |user_7   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|
|21 |user_8   |2022-05-24 |2022-05-24 10:20:38|2022-05-24 10:20:38|

*/

SELECT * FROM users
ORDER BY id DESC 
LIMIT 10;

/*
|id     |name      |birthday_at|created_at         |updated_at         |
|-------|----------|-----------|-------------------|-------------------|
|101 012|user_99999|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 011|user_99998|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 010|user_99997|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 009|user_99996|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 008|user_99995|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 007|user_99994|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 006|user_99993|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 005|user_99992|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 004|user_99991|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|
|101 003|user_99990|2022-05-24 |2022-05-24 14:50:17|2022-05-24 14:50:17|

*/

-- SHOW profiles;

-- EXPLAIN CALL insert_users_generator();


-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- *Практическое задание по теме “NoSQL"

-- 1*.	В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов..
-- **************************************************************************************************************

127.0.0.1:6379> MSET ip '127.0.0.1' '127.0.0.2' '127.0.0.3'
OK
127.0.0.1:6379> SADD ip '127.0.0.1'
(error) WRONGTYPE Operation against a key holding the wrong kind of value
127.0.0.1:6379> SMEMBERS ip
(error) WRONGTYPE Operation against a key holding the wrong kind of value
127.0.0.1:6379> MEMBERS ip
(error) ERR unknown command `MEMBERS`, with args beginning with: `ip`,
127.0.0.1:6379> MGET ip
1) "127.0.0.1"
127.0.0.1:6379> get '127.0.0.2'
"127.0.0.3"
127.0.0.1:6379> DEL '127.0.0.2'
(integer) 1
127.0.0.1:6379> GET '127.0.0.2'
(nil)
127.0.0.1:6379> GET ip
"127.0.0.1"
127.0.0.1:6379> INCR ip '127.0.0.2'
(error) ERR wrong number of arguments for 'incr' command
127.0.0.1:6379> INCR ip:'127.0.0.2'
(integer) 1
127.0.0.1:6379> INCR ip:'127.0.0.3'
(integer) 1
127.0.0.1:6379> INCR ip:'127.0.0.2'
(integer) 2
127.0.0.1:6379> INCR ip:'127.0.0.2'
(integer) 3
127.0.0.1:6379> INCR ip:'127.0.0.1'
(integer) 1
127.0.0.1:6379> INCR ip:'127.0.0.1'
(integer) 2
127.0.0.1:6379> INCR ip:'127.0.0.1'
(integer) 3
127.0.0.1:6379> INCR ip:'127.0.0.3'
(integer) 2
127.0.0.1:6379> GET ip
"127.0.0.1"
127.0.0.1:6379> GET ip:'127.0.0.2'
"3"
127.0.0.1:6379> MGET ip:'127.0.0.1' '127.0.0.2' '127.0.0.3'
1) "3"
2) (nil)
3) (nil)
127.0.0.1:6379> MGET ip:'127.0.0.1' ip:'127.0.0.2' ip:'127.0.0.3'
1) "3"
2) "3"
3) "2"
127.0.0.1:6379>

/*
2*.	При помощи базы данных Redis решите задачу поиска имени пользователя по электронному 
адресу и наоборот, поиск электронного адреса пользователя по его имени.*/
-- **************************************************************************************************************
-- Так как в Redis поиск можно производить только по ключу, то приходится выбирать, что будет ключом: имя или email.

127.0.0.1:6379> SET user_1 User_1@mail.ru
OK
127.0.0.1:6379> SET user_2@mail.ru user_2
OK
127.0.0.1:6379> MGET user_1 user_2@mail.ru
1) "User_1@mail.ru"
2) "user_2"

127.0.0.1:6379> GET User_1@mail.ru
(nil)


-- 3*.	Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
-- **************************************************************************************************************
/*
Установка MongoDB на AWS Linux Ubuntu сервер:
Взято здесь:
https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-20-04-ru


ubuntu@ip-172-31-84-37:~$ sudo apt install mongo
Чтение списков пакетов… Готово
Построение дерева зависимостей
Чтение информации о состоянии… Готово
E: Невозможно найти пакет mongo
ubuntu@ip-172-31-84-37:~$ sudo apt install mongodb-org
Чтение списков пакетов… Готово
Построение дерева зависимостей
Чтение информации о состоянии… Готово
E: Невозможно найти пакет mongodb-org
ubuntu@ip-172-31-84-37:~$ curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
OK
ubuntu@ip-172-31-84-37:~$ apt-key list
/etc/apt/trusted.gpg
--------------------
pub   rsa4096 2019-05-28 [SC] [годен до: 2024-05-26]
      2069 1EEC 3521 6C63 CAF6  6CE1 6564 08E3 90CF B1F5
uid         [ неизвестно ] MongoDB 4.4 Release Signing Key <packaging@mongodb.com>

/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-archive.gpg
------------------------------------------------------
pub   rsa4096 2012-05-11 [SC]
      790B C727 7767 219C 42C8  6F93 3B4F E6AC C0B2 1F32
uid         [ неизвестно ] Ubuntu Archive Automatic Signing Key (2012) <ftpmaster@ubuntu.com>

/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg
------------------------------------------------------
pub   rsa4096 2012-05-11 [SC]
      8439 38DF 228D 22F7 B374  2BC0 D94A A3F0 EFE2 1092
uid         [ неизвестно ] Ubuntu CD Image Automatic Signing Key (2012) <cdimage@ubuntu.com>

/etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg
------------------------------------------------------
pub   rsa4096 2018-09-17 [SC]
      F6EC B376 2474 EDA9 D21B  7022 8719 20D1 991B C93C
uid         [ неизвестно ] Ubuntu Archive Automatic Signing Key (2018) <ftpmaster@ubuntu.com>

ubuntu@ip-172-31-84-37:~$ echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse
ubuntu@ip-172-31-84-37:~$ sudo apt update
Сущ:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu focal InRelease
Пол:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Пол:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu focal-backports InRelease [108 kB]
Игн:4 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 InRelease
Пол:5 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 Release [5 389 B]
Пол:6 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 Release.gpg [801 B]
Пол:7 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Пол:8 http://us-east-1.ec2.archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [1 811 kB]
Пол:9 http://us-east-1.ec2.archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [924 kB]
Пол:10 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse arm64 Packages [18,3 kB]
Пол:11 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 Packages [23,6 kB]
Пол:12 http://security.ubuntu.com/ubuntu focal-security/main amd64 Packages [1 471 kB]
Пол:13 http://security.ubuntu.com/ubuntu focal-security/main Translation-en [252 kB]
Пол:14 http://security.ubuntu.com/ubuntu focal-security/restricted amd64 Packages [934 kB]
Пол:15 http://security.ubuntu.com/ubuntu focal-security/restricted Translation-en [133 kB]
Получено 5 910 kB за 2с (2 945 kB/s)
Чтение списков пакетов… Готово
Построение дерева зависимостей
Чтение информации о состоянии… Готово
Все пакеты имеют последние версии.
ubuntu@ip-172-31-84-37:~$ sudo apt install mongodb-org
Чтение списков пакетов… Готово
Построение дерева зависимостей
Чтение информации о состоянии… Готово
Будут установлены следующие дополнительные пакеты:
  mongodb-database-tools mongodb-org-database-tools-extra mongodb-org-mongos mongodb-org-server mongodb-org-shell
  mongodb-org-tools
Следующие НОВЫЕ пакеты будут установлены:
  mongodb-database-tools mongodb-org mongodb-org-database-tools-extra mongodb-org-mongos mongodb-org-server
  mongodb-org-shell mongodb-org-tools
Обновлено 0 пакетов, установлено 7 новых пакетов, для удаления отмечено 0 пакетов, и 0 пакетов не обновлено.
Необходимо скачать 96,6 MB архивов.
После данной операции объём занятого дискового пространства возрастёт на 203 MB.
Хотите продолжить? [Д/н] y
Пол:1 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 mongodb-database-tools amd64 100.5.2 [46,5 MB]
Пол:2 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 mongodb-org-shell amd64 4.4.14 [13,4 MB]
Пол:3 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 mongodb-org-server amd64 4.4.14 [20,7 MB]
Пол:4 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 mongodb-org-mongos amd64 4.4.14 [16,0 MB]
Пол:5 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 mongodb-org-database-tools-extra amd64 4.4.14 [7 752 B]
Пол:6 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 mongodb-org-tools amd64 4.4.14 [2 896 B]
Пол:7 https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4/multiverse amd64 mongodb-org amd64 4.4.14 [3 520 B]
Получено 96,6 MB за 1с (69,3 MB/s)
Выбор ранее не выбранного пакета mongodb-database-tools.
(Чтение базы данных … на данный момент установлено 126754 файла и каталога.)
Подготовка к распаковке …/0-mongodb-database-tools_100.5.2_amd64.deb …
Распаковывается mongodb-database-tools (100.5.2) …
Выбор ранее не выбранного пакета mongodb-org-shell.
Подготовка к распаковке …/1-mongodb-org-shell_4.4.14_amd64.deb …
Распаковывается mongodb-org-shell (4.4.14) …
Выбор ранее не выбранного пакета mongodb-org-server.
Подготовка к распаковке …/2-mongodb-org-server_4.4.14_amd64.deb …
Распаковывается mongodb-org-server (4.4.14) …
Выбор ранее не выбранного пакета mongodb-org-mongos.
Подготовка к распаковке …/3-mongodb-org-mongos_4.4.14_amd64.deb …
Распаковывается mongodb-org-mongos (4.4.14) …
Выбор ранее не выбранного пакета mongodb-org-database-tools-extra.
Подготовка к распаковке …/4-mongodb-org-database-tools-extra_4.4.14_amd64.deb …
Распаковывается mongodb-org-database-tools-extra (4.4.14) …
Выбор ранее не выбранного пакета mongodb-org-tools.
Подготовка к распаковке …/5-mongodb-org-tools_4.4.14_amd64.deb …
Распаковывается mongodb-org-tools (4.4.14) …
Выбор ранее не выбранного пакета mongodb-org.
Подготовка к распаковке …/6-mongodb-org_4.4.14_amd64.deb …
Распаковывается mongodb-org (4.4.14) …
Настраивается пакет mongodb-org-server (4.4.14) …
Добавляется системный пользователь «mongodb» (UID 115) ...
Добавляется новый пользователь «mongodb» (UID 115) в группу «nogroup» ...
Не создаётся домашний каталог «/home/mongodb».
Добавляется группа «mongodb» (GID 121) ...
Готово.
Добавляется пользователь «mongodb» в группу «mongodb» ...
Добавление пользователя mongodb в группу mongodb
Готово.
Настраивается пакет mongodb-org-shell (4.4.14) …
Настраивается пакет mongodb-database-tools (100.5.2) …
Настраивается пакет mongodb-org-mongos (4.4.14) …
Настраивается пакет mongodb-org-database-tools-extra (4.4.14) …
Настраивается пакет mongodb-org-tools (4.4.14) …
Настраивается пакет mongodb-org (4.4.14) …
Обрабатываются триггеры для man-db (2.9.1-1) …
ubuntu@ip-172-31-84-37:~$ sudo systemctl start mongod.service
ubuntu@ip-172-31-84-37:~$ sudo systemctl status mongod
● mongod.service - MongoDB Database Server
     Loaded: loaded (/lib/systemd/system/mongod.service; disabled; vendor preset: enabled)
     Active: active (running) since Wed 2022-05-25 10:06:30 UTC; 9s ago
       Docs: https://docs.mongodb.org/manual
   Main PID: 1437658 (mongod)
     Memory: 107.2M
     CGroup: /system.slice/mongod.service
             └─1437658 /usr/bin/mongod --config /etc/mongod.conf

мая 25 10:06:30 ip-172-31-84-37 systemd[1]: Started MongoDB Database Server.
ubuntu@ip-172-31-84-37:~$ sudo systemctl enable mongod
Created symlink /etc/systemd/system/multi-user.target.wants/mongod.service → /lib/systemd/system/mongod.service.
ubuntu@ip-172-31-84-37:~$ mongo --eval 'db.runCommand({ connectionStatus: 1 })'
MongoDB shell version v4.4.14
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("b6afaa4d-72a7-466a-ba00-a79ed0ab7253") }
MongoDB server version: 4.4.14
{
        "authInfo" : {
                "authenticatedUsers" : [ ],
                "authenticatedUserRoles" : [ ]
        },
        "ok" : 1
}
ubuntu@ip-172-31-84-37:~$ 
*/

ubuntu@ip-172-31-84-37:~$ mongo
MongoDB shell version v4.4.14
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("7958e286-6d73-4bce-8489-db3c90915984") }
MongoDB server version: 4.4.14
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
        https://docs.mongodb.com/
Questions? Try the MongoDB Developer Community Forums
        https://community.mongodb.com
---
The server generated these startup warnings when booting:
        2022-05-25T10:06:32.150+00:00: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem
        2022-05-25T10:06:32.954+00:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
---
/*---
        Enable MongoDB's free cloud-based monitoring service, which will then receive and display
        metrics about your deployment (disk utilization, CPU, operation statistics, etc).

        The monitoring data will be available on a MongoDB website with a unique URL accessible to you
        and anyone you share the URL with. MongoDB may use this information to make product
        improvements and to suggest MongoDB products and deployment options to you.

        To enable free monitoring, run the following command: db.enableFreeMonitoring()
        To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
---*/
> db.version()
4.4.14
> use products
switched to db products
db.products.find({name: "AMD FX-8320"}).pretty()> db.products.insert({"name": "Intel Core i3-8100", "description": 
"Процессор длdb.products.insert({"name": "Intel Core i3-8100", "description": "Процессор для настольных ПК", "price": "8000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()})
WriteResult({ "nInserted" : 1 })
>
> db.products.insertMany([
... {"name": "AMD FX-8320", "description": "Процессор для настольных ПК", "price": "4000.00", "catalog_id": 
"Процессоры", "created_at": new Date(), "updated_at": new Date()},
... {"name": "AMD FX-8320E", "description": "Процессор для настольных ПК", "price": "4500.00", "catalog_id": 
"Процессоры", "created_at": new Date(), "updated_at": new Date()}])
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("628e01b7b8be132b0b619d9a"),
                ObjectId("628e01b7b8be132b0b619d9b")
        ]
}
>
> db.products.find().pretty()
{
        "_id" : ObjectId("628e01b7b8be132b0b619d99"),
        "name" : "Intel Core i3-8100",
        "description" : "Процессор для настольных ПК",
        "price" : "8000.00",
        "catalog_id" : "Процессоры",
        "created_at" : ISODate("2022-05-25T10:15:19.147Z"),
        "updated_at" : ISODate("2022-05-25T10:15:19.147Z")
}
{
        "_id" : ObjectId("628e01b7b8be132b0b619d9a"),
        "name" : "AMD FX-8320",
        "description" : "Процессор для настольных ПК",
        "price" : "4000.00",
        "catalog_id" : "Процессоры",
        "created_at" : ISODate("2022-05-25T10:15:19.189Z"),
        "updated_at" : ISODate("2022-05-25T10:15:19.189Z")
}
{
        "_id" : ObjectId("628e01b7b8be132b0b619d9b"),
        "name" : "AMD FX-8320E",
        "description" : "Процессор для настольных ПК",
        "price" : "4500.00",
        "catalog_id" : "Процессоры",
        "created_at" : ISODate("2022-05-25T10:15:19.189Z"),
        "updated_at" : ISODate("2022-05-25T10:15:19.189Z")
}
> db.products.find({name: "AMD FX-8320"}).pretty()
{
        "_id" : ObjectId("628e01b7b8be132b0b619d9a"),
        "name" : "AMD FX-8320",
        "description" : "Процессор для настольных ПК",
        "price" : "4000.00",
        "catalog_id" : "Процессоры",
        "created_at" : ISODate("2022-05-25T10:15:19.189Z"),
        "updated_at" : ISODate("2022-05-25T10:15:19.189Z")
}



> use catalogs
switched to db catalogs
> db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Мат.платы"}, {"name": "Видеокарты"}])
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("628e039ceacd8b1c716d96ad"),
                ObjectId("628e039ceacd8b1c716d96ae"),
                ObjectId("628e039ceacd8b1c716d96af")
        ]
}
> db.catalogs.find().pretty()
{ "_id" : ObjectId("628e039ceacd8b1c716d96ad"), "name" : "Процессоры" }
{ "_id" : ObjectId("628e039ceacd8b1c716d96ae"), "name" : "Мат.платы" }
{ "_id" : ObjectId("628e039ceacd8b1c716d96af"), "name" : "Видеокарты" }



/*
Комментарии преподавателя:
--------------------------------------
Кирилл Иванов・Преподаватель
Альтернативный способ добавления записей в таблицу с логами (вместо триггера) - отдельная хранимая процедура, которая вставляет сначала запись в нужную таблицу (users, catalogs, products), а потом уже - в логи.

Ссылка на видео с разбором ДЗ - в комментариях к следующему уроку.
*/
