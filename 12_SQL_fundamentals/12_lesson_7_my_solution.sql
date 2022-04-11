-- 12_lesson_7_my_solution

-- Практическое задание по теме “Сложные запросы”. 

-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
-- **************************************************************************************************************

/*
INSERT INTO orders (user_id)
VALUES (2), (6), (5), (3), (2), (5);
*/

SELECT u.name, COUNT(o.user_id) AS orders 
FROM
	orders AS o
LEFT JOIN
	users AS u
ON
	u.id = o.user_id
GROUP BY name
HAVING 
	orders >= 1
;

/*
|name     |orders|
|---------|------|
|Наталья  |2     |
|Александр|1     |
|Иван     |2     |
|Мария    |1     |

*/

/*
Для лучшего оформления задачи по идее необходимо добавить поля "заказ оформлен", "заказ оплачен", "заказ получен" и т. п.
в таблицу orders, тогда задача станет нагляднее. В данном решении добавление HAVING ничего не меняет, ну или я не так
понял)))
*/

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
-- **************************************************************************************************************

SELECT prod.id, prod.name, prod.price, cat.name
FROM
	products AS prod
JOIN
	catalogs AS cat
ON
	cat.id = prod.catalog_id
;

/*
|id |name                   |price |name             |
|---|-----------------------|------|-----------------|
|1  |Intel Core i3-8100     |7 890 |Процессоры       |
|2  |Intel Core i5-7400     |12 700|Процессоры       |
|3  |AMD FX-8320E           |4 780 |Процессоры       |
|4  |AMD FX-8320            |7 120 |Процессоры       |
|5  |ASUS ROG MAXIMUS X HERO|19 310|Материнские платы|
|6  |Gigabyte H310M S2H     |4 790 |Материнские платы|
|7  |MSI B250M GAMING PRO   |5 060 |Материнские платы|

 */

/*
3*.	Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights
с русскими названиями городов.
 */

/* flights
|id |  from  |   to   |
|---|--------|--------|
|1  |moscow  |omsk    |
|2  |novgorod|kazan   |
|3  |irkutsk |moscow  |
|4  |omsk    |irkutsk |
|5  |moscow  |kazan   |

 */

/* cities
| label  |  name  |
|--------|--------|
|moscow  |Москва  |
|irkutsk |Иркутск |
|novgorod|Новгород|
|kazan   |Казань  |
|omsk    |Омск    |

 */
-- **************************************************************************************************************

/*
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_ VARCHAR(255) COMMENT 'Откуда',
  to_ VARCHAR(255) COMMENT 'Куда'
) COMMENT = 'Рейсы'
;

INSERT INTO flights (from_, to_) VALUES
  ('moscow', 'omsk'), ('novgorod', 'kazan'), ('irkutsk', 'moscow'), ('omsk', 'irkutsk'), ('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255) COMMENT 'Обозначение',
  name VARCHAR(255) COMMENT 'Город (RU)'
) COMMENT = 'Города'
;

INSERT INTO cities (label, name) VALUES
  ('moscow', 'Москва'), ('irkutsk', 'Иркутск'), ('novgorod', 'Новгород'), ('kazan', 'Казань'), ('omsk', 'Омск');
 */

SELECT f.id, c1.name AS from_, c2.name AS to_
FROM
	flights AS f
LEFT JOIN
	cities AS c1
ON
	f.from_ = c1.label
LEFT JOIN
	cities AS c2
ON
	f.to_ = c2.label
;


/*
Комментарии преподавателя:
--------------------------------------
Кирилл Иванов・Преподаватель
