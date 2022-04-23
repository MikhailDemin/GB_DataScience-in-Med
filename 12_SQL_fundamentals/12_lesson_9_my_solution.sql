-- 12_lesson_9_my_solution

-- Практическое задание по теме “Транзакции, переменные, представления”

-- 1.	В базе данных shop и sample присутствуют одни и те же таблицы учебной базы данных. Переместите запись id = 1
-- из таблицы shop.users в таблицу sample.users. Используйте транзакции.
-- **************************************************************************************************************

DROP DATABASE IF EXISTS sammple;

CREATE DATABASE sample;

USE sample;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE
	CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

START TRANSACTION;

INSERT
	INTO
	sample.users
SELECT
	*
FROM
	test.users
WHERE
	id = 1;

SELECT
	*
FROM
	sample.users;

/*
|id |name    |birthday_at|created_at         |updated_at         |
|---|--------|-----------|-------------------|-------------------|
|1  |Геннадий|1990-10-05 |2022-04-10 16:51:09|2022-04-10 16:51:09|

 */
DELETE
FROM
	test.users
WHERE
	id = 1;

SELECT
	*
FROM
	test.users;

/*
|id |name     |birthday_at|created_at         |updated_at         |
|---|---------|-----------|-------------------|-------------------|
|2  |Наталья  |1984-11-12 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|3  |Александр|1985-05-20 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|4  |Сергей   |1988-02-14 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|5  |Иван     |1998-01-12 |2022-04-10 16:51:09|2022-04-10 16:51:09|
|6  |Мария    |1992-08-29 |2022-04-10 16:51:09|2022-04-10 16:51:09|

 */

-- 2.	Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее 
-- название каталога name из таблицы catalogs.
-- **************************************************************************************************************

CREATE OR REPLACE
VIEW cat_products AS
SELECT
	p.name AS product,
	c.name AS product_category
FROM
	products p
JOIN catalogs c ON
	p.catalog_id = c.id
;

SELECT
	*
FROM
	cat_products;

/*
|product                |product_category |
|-----------------------|-----------------|
|Intel Core i3-8100     |Процессоры       |
|Intel Core i5-7400     |Процессоры       |
|AMD FX-8320E           |Процессоры       |
|AMD FX-8320            |Процессоры       |
|ASUS ROG MAXIMUS X HERO|Материнские платы|
|Gigabyte H310M S2H     |Материнские платы|
|MSI B250M GAMING PRO   |Материнские платы|

*/

COMMIT;
	

-- 3*. Пусть имеется таблица с календарным полем created_at. В ней размещены разреженые календарные записи за 
-- август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список 
-- дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходной таблице и 0, если она отсутствует.
-- **************************************************************************************************************

DROP TABLE IF EXISTS august;

CREATE TABLE august (
	id SERIAL PRIMARY KEY,
	created_at DATE
);

INSERT
INTO
	august (created_at)
VALUES
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-16'),
	('2018-08-17')
;

CREATE TEMPORARY TABLE aug_days (
	day_ INT
);

INSERT INTO aug_days VALUES
	(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19),
	(20), (21), (22), (23), (24), (25), (26), (27), (28), (29), (30)
;

SELECT
	DATE(DATE('2018-08-31') - INTERVAL ad.day_ DAY) AS aug_day
FROM
	aug_days AS ad
ORDER BY
	aug_day
;

SELECT
	DATE(DATE('2018-08-31') - INTERVAL ad.day_ DAY) AS aug_day,
	NOT ISNULL(a.id) AS date_exist
FROM
	aug_days AS ad
LEFT JOIN august a
ON
	DATE(DATE('2018-08-31') - INTERVAL ad.day_ DAY) = a.created_at
ORDER BY
	aug_day
;


-- 4*.	Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет 
-- устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
-- **************************************************************************************************************

DROP TABLE IF EXISTS tab_12_1_4;

CREATE TABLE tab_12_1_4 (
	id SERIAL PRIMARY KEY,
	created_at DATE
);

INSERT
INTO
	tab_12_1_4 (created_at)
VALUES
	('2018-12-01'),
	('2018-12-04'),
	('2018-12-16'),
	('2018-11-17'),
	('2019-12-16'),
	('2018-07-17'),
	('2017-02-16'),
	('2021-04-15'),
	('2014-11-01'),
	('2007-03-25')
;


SELECT
	*
FROM
	tab_12_1_4
ORDER BY
	created_at DESC 
;

/*

|id |created_at|
|---|----------|
|8  |2021-04-15|
|5  |2019-12-16|
|3  |2018-12-16|
|2  |2018-12-04|
|1  |2018-12-01|
|4  |2018-11-17|
|6  |2018-07-17|
|7  |2017-02-16|
|9  |2014-11-01|
|10 |2007-03-25|

*/

START TRANSACTION;

/*
SELECT
	COUNT(*)
FROM
	tab_12_1_4;
*/

DELETE
FROM
	tab_12_1_4
ORDER BY
	created_at
LIMIT 5;

/*
|id |created_at|
|---|----------|
|8  |2021-04-15|
|5  |2019-12-16|
|3  |2018-12-16|
|2  |2018-12-04|
|1  |2018-12-01|

*/

COMMIT;


-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)

-- 1.	Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть
-- доступны только запросы на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.
-- **************************************************************************************************************

SELECT Host, User FROM mysql.user;

SELECT USER();

CREATE USER shop IDENTIFIED WITH sha256_password BY 'pass1';

CREATE USER shop_read IDENTIFIED WITH sha256_password BY 'pass2';

/*
|Host     |User            |
|---------|----------------|
|%        |shop            |
|%        |shop_read       |
|localhost|debian-sys-maint|
|localhost|mysql.infoschema|
|localhost|mysql.session   |
|localhost|mysql.sys       |
|localhost|root            |
*/

USE test;

SHOW GRANTS;

/*
|Grants for shop@%                                                                                                         |
|------------------------------------------------------------------------------------------------------------------------- |
|GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER,            |
|SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT,              |
|CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE,       |
|DROP ROLE ON *.* TO `shop`@`%`                                                                                            |
|GRANT APPLICATION_PASSWORD_ADMIN,AUDIT_ABORT_EXEMPT,AUDIT_ADMIN,AUTHENTICATION_POLICY_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,    |
|BINLOG_ENCRYPTION_ADMIN,CLONE_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,FLUSH_OPTIMIZER_COSTS,FLUSH_STATUS,FLUSH_TABLES,|
|FLUSH_USER_RESOURCES,GROUP_REPLICATION_ADMIN,GROUP_REPLICATION_STREAM,INNODB_REDO_LOG_ARCHIVE,INNODB_REDO_LOG_ENABLE,     |
|PASSWORDLESS_USER_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_APPLIER,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,      |
|RESOURCE_GROUP_USER,ROLE_ADMIN,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_USER_ID,SHOW_ROUTINE,SYSTEM_USER,     |
|SYSTEM_VARIABLES_ADMIN,TABLE_ENCRYPTION_ADMIN,XA_RECOVER_ADMIN ON *.* TO `shop`@`%`                                       |

 */

-- GRANT ALL ON *.* TO 'shop'@'%' IDENTIFIED WITH sha256_password BY 'pass1';

-- GRANT ALL ON *.* TO shop;

-- GRANT USAGE ON test.* TO shop;

/*Делал все как в уроке, но в итоге всегда получал ошибку:

SQL Error [1064] [42000]: You have an error in your SQL syntax; check the manual that corresponds to your MySQL 
server version for the right syntax to use near 'IDENTIFIED WITH sha256_password BY 'pass1'' at line 1

По итогу разобрался)
*/

REVOKE ALL ON *.* FROM 'shop'@'%';

/*
Попытка подключения к БД:

Access denied for user 'shop'@'%' to database 'mysql'
*/

GRANT ALL ON test.* TO 'shop'@'%';

SELECT USER();

/*
|USER()        |
|--------------|
|shop@localhost|

 */

SHOW DATABASES;

/*
|Database          |
|------------------|
|information_schema|
|test              |

 */

SHOW GRANTS;

/*
|Grants for shop@%                             |
|----------------------------------------------|
|GRANT USAGE ON *.* TO `shop`@`%`              |
|GRANT ALL PRIVILEGES ON `test`.* TO `shop`@`%`|

*/

GRANT SELECT ON test.* TO shop_read;

SELECT USER();

/*
|USER()             |
|-------------------|
|shop_read@localhost|

 */

SHOW DATABASES;

/*
|Database          |
|------------------|
|information_schema|
|test              |

 */

SHOW GRANTS;

/*
|Grants for shop_read@%                     |
|-------------------------------------------|
|GRANT USAGE ON *.* TO `shop_read`@`%`      |
|GRANT SELECT ON `test`.* TO `shop_read`@`%`|
*/

INSERT INTO catalogs (name) VALUES ('Блоки питания');

/*
SQL Error [1142] [42000]: INSERT command denied to user 'shop_read'@'localhost' for table 'catalogs'

*/

-- 2*.	Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ,
-- имя пользователя и его пароль. Создайте представление username таблицы accounts, предоставляющий доступ к столбцу
-- id и name. Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать
-- записи из представления username.
-- **************************************************************************************************************

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	password_hash VARCHAR(255)
);

/*
 * SELECT firstname, password_hash FROM vk.users
LIMIT 5;
*/

INSERT INTO test.accounts (name, password_hash) VALUES
	 ('Patrick','d21ba81cbe9c8f8a98b7677b875658c942182537'),
	 ('Tiffany','9d462770191578b83cb42cd24a1daa06bb958308'),
	 ('Corrine','6f3f47d174709e124a2fd8ce8e3d6694e73d368c'),
	 ('Helene','61322197937416e27c7323f67806be6e5c5161c5'),
	 ('Elisa','a066d62375b0e4044e6c805bffbfb6861fbdb41b')
;

SELECT * FROM accounts a;

/*
|id |name   |password_hash                           |
|---|-------|----------------------------------------|
|1  |Patrick|d21ba81cbe9c8f8a98b7677b875658c942182537|
|2  |Tiffany|9d462770191578b83cb42cd24a1daa06bb958308|
|3  |Corrine|6f3f47d174709e124a2fd8ce8e3d6694e73d368c|
|4  |Helene |61322197937416e27c7323f67806be6e5c5161c5|
|5  |Elisa  |a066d62375b0e4044e6c805bffbfb6861fbdb41b|

 */

CREATE OR REPLACE
VIEW username AS
SELECT
	id,
	name
FROM
	test.accounts a;

SELECT * FROM username u;

/*
|id |name   |
|---|-------|
|1  |Patrick|
|2  |Tiffany|
|3  |Corrine|
|4  |Helene |
|5  |Elisa  |

 */

CREATE USER user_read IDENTIFIED WITH sha256_password BY 'pass3';

GRANT SELECT ON test.username TO 'user_read'@'%';

SELECT USER();

/*
|USER()             |
|-------------------|
|user_read@localhost|

 */

SHOW DATABASES;

/*
|Database          |
|------------------|
|information_schema|
|test              |

 */

SHOW GRANTS;

/*
|Grants for user_read@%                              |
|----------------------------------------------------|
|GRANT USAGE ON *.* TO `user_read`@`%`               |
|GRANT SELECT ON `test`.`username` TO `user_read`@`%`|

*/

SELECT id, name FROM accounts;

-- SQL Error [1142] [42000]: SELECT command denied to user 'user_read'@'localhost' for table 'accounts',

SELECT * FROM username u;

/*
|id |name   |
|---|-------|
|1  |Patrick|
|2  |Tiffany|
|3  |Corrine|
|4  |Helene |
|5  |Elisa  |

 */


-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

-- 1.	Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу 
-- "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
-- **************************************************************************************************************

SELECT VERSION();

DROP FUNCTION IF EXISTS test.hello;

DELIMITER $$
$$
CREATE FUNCTION test.hello()
RETURNS TINYTEXT NO SQL
BEGIN
	DECLARE hour_day INT;
	SET hour_day = HOUR(NOW());
	CASE
		WHEN hour_day BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour_day BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour_day BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour_day BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END CASE;
END$$
DELIMITER ;

SELECT NOW(), hello();

/*
|NOW()              |hello()    |
|-------------------|-----------|
|2022-04-22 04:51:53|Доброй ночи|

*/

DELIMITER $$
$$
CREATE FUNCTION test.hello_if()
RETURNS TINYTEXT NO SQL
BEGIN
	DECLARE hour_day INT;
	SET hour_day = HOUR(NOW());
	IF hour_day BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		ELSEIF hour_day BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		ELSEIF hour_day BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		ELSEIF hour_day BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END IF;
END$$
DELIMITER ;

SELECT hello_if();

/*
|NOW()              |hello()    |
|-------------------|-----------|
|2022-04-22 04:51:53|Доброй ночи|

*/

DROP FUNCTION IF EXISTS test.hello_true;

DELIMITER $$
$$
CREATE FUNCTION test.hello_true()
RETURNS TINYTEXT NO SQL
BEGIN
	DECLARE user_in (IN value TIME);
	DECLARE hour_day INT;
	SET hour_day = HOUR(user_in);
	CASE
		WHEN hour_day BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour_day BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour_day BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour_day BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END CASE;
END$$
DELIMITER ;

/*
SQL Error [1064] [42000]: You have an error in your SQL syntax; check the manual that corresponds to 
your MySQL server version for the right syntax to use near '(IN value INT);
	SET hour_day = HOUR(TIME());
	CASE
		WHEN hour_day BETWEEN 0' at line 4
*/

/*
Причина:
 SQL Error [1064] [42000]: You have an error in your SQL syntax; check the manual that corresponds to 
your MySQL server version for the right syntax to use near '(IN value TIME);

	DECLARE hour_day INT;

	SET hour_day = HOUR(user_in);

	CASE
' at line 4
*/

SELECT HOUR('18:51:53');

-- 2.	В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное 
-- значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.
-- **************************************************************************************************************

DROP TRIGGER IF EXISTS products.check_name_description_before_insert;

DELIMITER //
//
CREATE TRIGGER check_name_description_before_insert
BEFORE INSERT
ON products FOR EACH ROW 
BEGIN
	IF NEW.name IS NULL 
		AND NEW.description IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Внесение отмененно. Одно из полей должно быть заполнено.';
	END IF;
END//

DELIMITER ;

INSERT INTO test.products (name, description) VALUES
	 ('Intel Core i7-12700K', NULL),
	 (NULL, 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX')
;

SELECT id, name, description FROM products p;

/*
|id |name                   |description                                                                      |
|---|-----------------------|---------------------------------------------------------------------------------|
|1  |Intel Core i3-8100     |Процессор для настольных персональных компьютеров, основанных на платформе Intel.|
|2  |Intel Core i5-7400     |Процессор для настольных персональных компьютеров, основанных на платформе Intel.|
|3  |AMD FX-8320E           |Процессор для настольных персональных компьютеров, основанных на платформе AMD.  |
|4  |AMD FX-8320            |Процессор для настольных персональных компьютеров, основанных на платформе AMD.  |
|5  |ASUS ROG MAXIMUS X HERO|Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX       |
|6  |Gigabyte H310M S2H     |Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX           |
|7  |MSI B250M GAMING PRO   |Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX            |
|8  |Intel Core i7-12700K   |                                                                                 |
|9  |                       |Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX       |

*/

INSERT INTO test.products (name, description) VALUES
	 (NULL, NULL)
;

-- SQL Error [1644] [45000]: Внесение отмененно. Одно из полей должно быть заполнено.

-- 3.	(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
-- Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
-- Вызов функции FIBONACCI(10) должен возвращать число 55.
/*
| 0 | 1 | 2 | 3 | 4 | 5 | 6 |  7 |  8 |  9 | 10 |    
|---|---|---|---|---|---|---|----|----|----|----|
| 0 | 1 | 1 | 2 | 3 | 5 | 8 | 13 | 21 | 34 | 55 |
 */
-- **************************************************************************************************************

DROP FUNCTION IF EXISTS test.fibonacci;

DELIMITER $$
$$
CREATE FUNCTION fibonacci(num INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE five_sqrt DOUBLE;
	SET five_sqrt = SQRT(5);
	RETURN (POW((1 + five_sqrt) / 2.0, num) - POW((1 - five_sqrt)/ 2.0, num)) / five_sqrt;
END
$$

DELIMITER ;

SELECT fibonacci(10);

/*
|fibonacci(10)|
|-------------|
|55           |
*/

SELECT fibonacci(20);

/*
|fibonacci(20)|
|-------------|
|6 765        |
*/

/*
Комментарии преподавателя:
--------------------------------------
Кирилл Иванов?Преподаватель
