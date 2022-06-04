-- Механизм "многие-ко-многим" пока не реализован. Оставил на перспективу.

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
	ROUND(AVG(ur.film_rating), 1) AS Рейтинг
-- 	f.users_rating AS Рейтинг
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
JOIN users_ratings ur ON
	f.id = ur.film_id
GROUP BY f.id
;

SELECT * FROM film_info;

SELECT * FROM film_info WHERE Название = 'Бегущий по лезвию 2049';




-- Представление карточки сериала (заменяем все ссылки на другие таблицы на значения через JOINы)
CREATE OR REPLACE
VIEW serials_info AS
SELECT
	s.serial_title AS Название,
	c.country AS 'Страна производства',
	CONCAT(d.director_firstname, ' ', d.director_lastname) AS Режиссёр,
	CONCAT(a.actor_firstname, ' ', a.actor_lastname) AS 'В ролях',
	g.name AS Жанр,
	m1.filename AS 'Постер сериала',
	m2.filename AS 'Трейлер сериала',
	ROUND(AVG(ur.serials_rating), 1) AS 'Рейтинг сериала',
	CONCAT(ss.id, ' ', 'сезон,', ' ', ss.status, ', ', ss.season_release_date) AS 'Информация о сезоне, дата выхода',
	ROUND(AVG(ur.season_rating), 1) AS 'Рейтинг сезона',
	CONCAT(se.serial_episode_title, ', ', se.episode_release_date) AS 'Эпизод, дата выхода',
	ROUND(AVG(ur.episode_rating), 1) AS 'Рейтинг эпизода'
FROM
	serials s
JOIN countries c ON
	s.country_id = c.id
JOIN directors d ON
	s.director_id = d.id
JOIN actors a ON
	s.actor_id = a.id
JOIN genres g ON
	s.genre_id = g.id
JOIN serials_seasons ss ON
	s.season_id = ss.id
JOIN serials_episodes se ON
	ss.episode_id = se.id
JOIN media m1  ON
	s.poster_id = m1.id
JOIN media m2 ON
	s.trailer_id = m2.id
JOIN users_ratings ur ON
	s.id = ur.serials_id
GROUP BY s.id
;

SELECT * FROM serials_info;



-- Считаем рейтинги внесенные пользователями (сгенерили заранее) и вносим в колонки соответствующих таблиц.
-- Создадим процедуру для подсчета рейтинга (например актера) по запросу id.
-- Далее результат процедуры нужно внести в соответствующую таблицу. Пока не удалось реализовать.

DROP PROCEDURE IF EXISTS count_actor_rate;

DELIMITER $$
CREATE PROCEDURE count_actor_rate(IN id INT)
BEGIN
	SET @search_id = id;
	SELECT
		ROUND(AVG(ur.actor_rating), 1) AS rating
	FROM users_ratings ur
-- 	JOIN test_actors ta ON ta.id = ur.actor_id
	WHERE ur.actor_id = @search_id;
END $$
DELIMITER ; 

CALL count_actor_rate(8);

INSERT INTO test_actors (`users_rating`) WHERE test_actors.id = 8
VALUES (CALL count_actor_rate(8));


DELIMITER %%

CREATE PROCEDURE rating_count()
BEGIN
	DECLARE id INT;
	DECLARE rate FLOAT;
	DECLARE currate CURSOR FOR SELECT
	ROUND(AVG(ur.actor_rating), 1) AS rating FROM users_ratings ur GROUP BY actor_id;
	OPEN currate;
		cycle : LOOP
			FETCH currate INTO id, rate;
			INSERT INTO test_actors.users_rating VALUES(rate) WHERE test_actors.id = id;
		END LOOP cycle;
	CLOSE currate;	
END%%

DELIMITER ;






SELECT
	ur.actor_id,
	ROUND(AVG(ur.actor_rating), 1) AS rating
FROM users_ratings ur
JOIN test_actors ta ON
	ta.id = ur.actor_id
GROUP BY ta.id 
;

SELECT 
	ur.actor_id, 
	ROUND(AVG(ur.actor_rating), 1) AS rating
FROM users_ratings ur
WHERE ur.actor_id = 11;

DROP TRIGGER IF EXISTS insert_actor_rating;

DELIMITER //
//
CREATE TRIGGER insert_actor_rating
AFTER INSERT
ON user_ratings FOR EACH ROW 
BEGIN
	IF NEW.actor_rating NOT NULL 
		THEN
		SELECT
			ROUND(AVG(ur.actor_rating), 1)
		FROM users_ratings ur
-- 		JOIN test_actors ta ON ta.id = ur.actor_id
		WHERE ur.actor_id = NEW.actor_id;
-- 		INSERT INTO test_actors.users_rating VALUES(rating);
	END IF;
END//

DELIMITER ;

DELIMITER //
//
CREATE TRIGGER insert_actor_rating
AFTER INSERT
ON user_ratings FOR EACH ROW 
BEGIN
	IF NEW.actor_rating NOT NULL 
		THEN
		INSERT
			ROUND(AVG(ur.actor_rating), 1)
		FROM users_ratings ur
		WHERE ur.actor_id = NEW.actor_id;
	END IF;
END//

DELIMITER ;


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

/*
CREATE TABLE f_test (
	id SERIAL,
	actor VARCHAR(255),
	users_rating FLOAT
);


INSERT INTO `test_actors` (`id`, `actor`, `users_rating`) VALUES 
('1', 'Николь', NULL),
('2', 'Брюс', NULL),
('3', 'Шарлиз', NULL),
('4', 'Энтони', NULL),
('5', 'Марго', NULL),
('6', 'Анджелина', NULL),
('7', 'Джейк', NULL),
('8', 'Моника', NULL),
('9', 'Киану', NULL),
('10', 'Чжан', NULL),
('11', 'Джеки', NULL),
('12', 'Марион', NULL),
('13', 'Том', NULL),
('14', 'Кристиан', NULL),
('15', 'Эмма', NULL);
*/


SELECT * FROM test_actors ta;

DELIMITER %%
%%
CREATE PROCEDURE rating_count ()
BEGIN
	DECLARE id INT;
	DECLARE rate FLOAT;
	DECLARE currate CURSOR FOR SELECT
	ROUND(AVG(ur.actor_rating), 1) AS rating FROM users_ratings ur GROUP BY actor_id;
	OPEN currate;
		cycle : LOOP
			FETCH currate INTO id, rate;
			INSERT INTO test_actors.users_rating VALUES(rate) WHERE id = test_actors.id;
		END LOOP cycle;
	CLOSE currate;	
END%%

DELIMITER ;




DROP FUNCTION IF EXISTS count_rate;

DELIMITER $$
$$
CREATE FUNCTION count_rate(IN value INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE search_id INT;
	SET search_id = value;
	RETURN (ROUND(AVG(ur.actor_rating), 1) FROM users_ratings ur WHERE ur.actor_id = search_id);
END
$$

DELIMITER ;





