-- Механизм "многие-ко-многим" не реализован в данном проекте. Оставил на перспективу.

-- Представление карточки фильма (заменяем все ссылки на другие таблицы на значения через JOINы)

CREATE OR REPLACE
VIEW film_info AS
SELECT
	f.film_title AS Название,
	f.film_release_date AS 'Дата выхода',
	c.country AS 'Страна производства',
	CONCAT(d.director_firstname, ' ', d.director_lastname) AS Режиссёр,
	CONCAT(a.actor_firstname, ' ', a.actor_lastname) AS 'В ролях',
	g.name AS Жанр,
	m1.filename AS Постер,
	m2.filename AS Трейлер,
	f.status AS Статус,
-- 	ROUND(AVG(ur.actor_rating), 1) AS Рейтинг
	f.users_rating AS Рейтинг
FROM
	films f
JOIN countries c ON
	f.country_id = c.id
JOIN directors d ON
	f.director_id = d.id
JOIN actors a ON
	f.actor_id = a.id
JOIN genres g ON
	f.genre_id = g.id
JOIN media m1  ON
	f.poster_id = m1.id
JOIN media m2 ON
	f.trailer_id = m2.id
/*JOIN users_ratings ur ON
	f.id = ur.film_id
GROUP BY f.id*/
;


SELECT * FROM film_info;

SELECT * FROM film_info WHERE Название = 'Бегущий по лезвию 2049';

-- Считаем рейтинги внесенные пользователями (сгенерили заранее) и вносим в колонки соответствующих таблиц
SELECT 
	CONCAT(a.actor_firstname, ' ', a.actor_lastname) AS actor,
-- 	a.country_id AS country,
	ur.actor_rating AS rating
FROM
	actors a 
-- JOIN countries c ON
-- 	a.country_id = c.id
JOIN users_ratings ur ON
	a.id = ur.actor_id
GROUP BY actor_firstname
;

SELECT
	ur.actor_id,
	ROUND(AVG(ur.actor_rating), 1) AS rating
FROM users_ratings ur
GROUP BY actor_id 
;

/*CREATE TABLE kino_test (
	id SERIAL,
	film_title VARCHAR(255),
	users_rating FLOAT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `kino_test` (`id`, `film_title`, `users_rating`, `created_at`, `updated_at`) VALUES 
('1', 'Матрица', NULL, '1980-02-01 21:15:48', '2012-07-18 23:43:44'),
('2', 'Правдивая ложь', NULL, '2003-07-20 04:05:48', '2016-03-19 21:17:47'),
('3', 'Мистер и миссис Смит', NULL, '1975-09-13 06:18:54', '1999-08-17 04:44:24'),
('4', 'Бойцовский клуб', NULL, '1981-03-12 14:07:44', '2010-03-06 16:40:32'),
('5', 'Интерстеллар', NULL, '2004-12-15 15:19:56', '1983-04-02 23:34:45'),
('6', 'Бегущий по лезвию 2049', NULL, '2017-10-29 19:03:19', '2004-08-05 11:09:20'),
('7', 'Джентельмены', NULL, '1992-05-11 02:11:48', '2015-07-25 14:43:42'),
('8', 'Криминальное чтиво', NULL, '1970-09-14 00:30:38', '1985-08-18 10:24:19'),
('9', 'Район №9', NULL, '2007-05-19 03:45:42', '1976-11-12 20:05:49'),
('10', 'Пятый элемент', NULL, '2016-10-04 12:27:04', '1983-10-27 07:25:32');*/
	
UPDATE kino_test INNER JOIN users_ratings USING (users_ratings.film_rating)
SET users_rating = ROUND(AVG(users_ratings.actor_rating), 1);


