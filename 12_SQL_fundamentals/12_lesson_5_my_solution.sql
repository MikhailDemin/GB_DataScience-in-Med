-- 12_lesson_5_my_solution

-- ������������ ������� �� ���� ����������, ����������, ���������� � �����������

-- 1.	����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� �����
-- � ��������.
-- **************************************************************************************************************

UPDATE users SET created_at = NOW() AND updated_at = NOW
;

/* 2.	������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR � �
 ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME,
 �������� �������� ����� ��������. */
-- **************************************************************************************************************

ALTER TABLE users
MODIFY COLUMN created_at DATETIME,
MODIFY COLUMN updated_at DATETIME
;

/* 3.	� ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, 
���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������, 
����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� � �����, ����� 
���� �������. */
-- **************************************************************************************************************

/* DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
storehouse_id BIGINT UNSIGNED NOT NULL,
product_id BIGINT UNSIGNED NOT NULL,
value BIGINT,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME DEFAULT NOW()
);

INSERT INTO `storehouses_products`
VALUES (24,59,3,'2017-02-16 03:00:24','2022-03-09 19:39:07'),
(25,89,1,'1992-09-12 18:41:29','2022-03-22 17:59:33'),
(11,27,1,'1993-08-03 14:00:45','2022-03-25 20:43:43'),
(21,31,0,'2014-04-04 07:48:31','2022-03-22 05:10:52'),
(20,72,1,'1994-05-29 11:30:45','2022-03-22 03:40:10'),
(23,100,3,'1995-03-25 19:43:12','2022-02-28 03:34:44'),
(12,56,2,'2012-04-24 08:52:40','2022-03-25 04:12:24'),
(5,9,0,'2021-03-28 23:21:54','2022-03-16 15:18:42'),
(6,74,0,'2017-06-04 01:47:13','2022-03-15 09:42:18'),
(1,96,4,'1993-06-10 08:03:19','2022-03-03 14:13:22'),
(22,56,3,'2013-11-27 15:29:23','2022-02-28 22:57:10'),
(19,10,2,'1993-05-21 17:15:03','2022-03-06 19:01:48'),
(10,35,4,'2001-03-13 11:33:02','2022-03-08 06:24:20'),
(3,7,1,'2022-03-12 02:19:01','2022-03-03 10:34:58'),
(4,51,3,'2019-06-11 10:15:18','2022-03-15 23:19:32'),
(2,51,1,'2012-11-22 10:12:22','2022-03-08 07:32:40'),
(13,15,2,'2007-06-02 06:57:25','2022-02-28 05:48:24'),
(9,1,0,'1993-08-08 15:40:41','2022-03-25 05:16:27'),
(16,14,0,'2015-07-07 19:03:39','2022-03-18 09:04:09'),
(17,19,2,'1994-11-09 03:30:19','2022-03-21 14:50:55')
;
*/

SELECT * FROM storehouses_products
ORDER BY CASE WHEN value = 0 THEN 9 ELSE value END
;

/* 4.	(�� �������) �� ������� users ���������� ������� �������������, ���������� � ������� � ���. ������ ������
� ���� ������ ���������� �������� ('may', 'august') */
-- **************************************************************************************************************

SELECT * FROM users 
WHERE birthday_month='may' AND birthday_month='august'
;

-- OR

SELECT * FROM users
WHERE MONTH(birthday) IN ('may', 'august')
;

/* 5.	(�� �������) �� ������� catalogs ����������� ������ ��� ������ �������. SELECT * FROM catalogs WHERE id 
IN (5, 1, 2); ������������ ������ � �������, �������� � ������ IN. */
-- **************************************************************************************************************

SELECT * FROM catalogs WHERE id 
IN (5, 1, 2)
ORDER BY  CASE
WHEN id = 5 THEN 0
WHEN id = 1 THEN 1
WHEN id = 2 THEN 2
END;

-- ������������ ������� ���� ���������� �������

-- 1.	����������� ������� ������� ������������� � ������� users
-- **************************************************************************************************************

SELECT ROUND(AVG(age), 1) FROM users
;

-- OR

SELECT ROUND(AVG(YEAR(CURRENT_TIMESTAMP) - YEAR(birthday)), 1) FROM users
;

/* 2.	����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. ������� ������, 
��� ���������� ��� ������ �������� ����, � �� ���� ��������. */
-- **************************************************************************************************************

/* DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '����������';

INSERT INTO users (name, birthday_at) VALUES
  ('��������', '1990-10-05'),
  ('�������', '1984-11-12'),
  ('���������', '1985-05-20'),
  ('������', '1988-02-14'),
  ('����', '1998-01-12'),
  ('�����', '1992-08-29')
 ;

SELECT name,
birthday_at,
CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10)) AS current_year_birthday_date,
DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS current_year_birthday_weekday
FROM users
;
*/

SELECT
DISTINCT DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS birthday_weekday,
COUNT(*) AS current_year_birthday_weekday
FROM users
GROUP BY birthday_weekday
ORDER BY current_year_birthday_weekday
;

-- 3.	(�� �������) ����������� ������������ ����� � ������� �������
-- **************************************************************************************************************

/* DROP TABLE IF EXISTS math;
CREATE TABLE math (
	value BIGINT UNSIGNED NOT NULL
);

INSERT INTO math (value) VALUES 
(1),(2),(3),(4),(5),(6),(7)
;
*/

SELECT EXP(SUM(LOG(value))) FROM math;

