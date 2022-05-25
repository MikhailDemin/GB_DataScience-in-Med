DROP DATABASE IF EXISTS kinorium;
CREATE DATABASE kinorium;
USE kinorium;


-- 1. Таблица пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256)
);

-- 2. Профили пользователей
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender CHAR(1) COMMENT 'Пол',
	firstname VARCHAR(100) COMMENT 'Имя',
	lastname VARCHAR(100) COMMENT 'Фамилия',
	birthday DATE,
		
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW(),
	
 	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3. Таблица сообщений пользователей
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
		
	INDEX (from_user_id),
	INDEX (to_user_id),
	
 	FOREIGN KEY (from_user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
 	FOREIGN KEY (to_user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 4. Таблица стран
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
	id SERIAL primary key,
	country VARCHAR(100)
);

-- 5. Таблица жанров
DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
	id SERIAL,
	name VARCHAR(255) -- 'Хоррор', 'Комедия', 'Драма', 'Биографический', 'Документальный', и т. д.
);

-- 6. Таблица медиа (постеры и трейлеры к фильмам)
DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL,
	media_type ENUM('Poster', 'Trailer'),
	filename VARCHAR(255),
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

-- 7. Таблица актеров
DROP TABLE IF EXISTS actors;
CREATE TABLE actors (
	id SERIAL,
	gender CHAR(1) COMMENT 'Пол',
	actor_firstname VARCHAR(100) COMMENT 'Имя',
	actor_lastname VARCHAR(100) COMMENT 'Фамилия',
	actor_birthday DATE,
	country_id BIGINT UNSIGNED NOT NULL,
	users_rating FLOAT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Таблица режиссеров
DROP TABLE IF EXISTS directors;
CREATE TABLE directors (
	id SERIAL,
	gender CHAR(1) COMMENT 'Пол',
	director_firstname VARCHAR(100) COMMENT 'Имя',
	director_lastname VARCHAR(100) COMMENT 'Фамилия',
	director_birthday DATE,
	country_id BIGINT UNSIGNED NOT NULL,
	users_rating FLOAT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 9. Таблица фильмов
DROP TABLE IF EXISTS films;
CREATE TABLE films (
	id SERIAL,
	film_title VARCHAR(255),
	country_id BIGINT UNSIGNED NOT NULL,
	director_id BIGINT UNSIGNED NOT NULL,
	actor_id BIGINT UNSIGNED NOT NULL,
	film_release_date DATE,
	genre_id BIGINT UNSIGNED NOT NULL,
	status ENUM('Анонс', 'В производстве', 'Постпродакшен', 'Премьера', 'Премьера онлайн'),
	poster_id BIGINT UNSIGNED NOT NULL,
	trailer_id BIGINT UNSIGNED NOT NULL,
	users_rating FLOAT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (director_id) REFERENCES directors(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (actor_id) REFERENCES actors(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (poster_id) REFERENCES media(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (trailer_id) REFERENCES media(id) ON DELETE CASCADE ON UPDATE CASCADE
);
	
	
-- 10. Таблица сериалов
DROP TABLE IF EXISTS serials;
CREATE TABLE serials (
	id SERIAL,
	serial_title VARCHAR(255),
	country_id BIGINT UNSIGNED NOT NULL,
	director_id BIGINT UNSIGNED NOT NULL,
	actor_id BIGINT UNSIGNED NOT NULL,
	season_id BIGINT UNSIGNED NOT NULL,
	genre_id BIGINT UNSIGNED NOT NULL,
	poster_id BIGINT UNSIGNED NOT NULL,
	trailer_id BIGINT UNSIGNED NOT NULL,
	users_rating FLOAT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (director_id) REFERENCES directors(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (actor_id) REFERENCES actors(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (poster_id) REFERENCES media(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (trailer_id) REFERENCES media(id) ON DELETE CASCADE ON UPDATE CASCADE
);

	
-- 11. Таблица сезонов сериалов
DROP TABLE IF EXISTS serials_seasons;
CREATE TABLE serials_seasons (
	id SERIAL,
	status ENUM('Анонс', 'В производстве', 'Постпродакшен', 'Премьера', 'Премьера онлайн'),
	episode_id BIGINT UNSIGNED NOT NULL,
	serials_id BIGINT UNSIGNED NOT NULL,
	season_release_date DATE,
	users_rating FLOAT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

/*
ALTER TABLE serials
ADD CONSTRAINT serials_ibfk_7 FOREIGN KEY (season_id) REFERENCES serials_seasons(id) ON DELETE CASCADE ON UPDATE CASCADE
;
*/

-- 12. Таблица эпизодов сериалов
DROP TABLE IF EXISTS serials_episodes;
CREATE TABLE serials_episodes (
	id SERIAL,
	serial_episode_title VARCHAR(255),
-- 	status ENUM('Анонс', 'В производстве', 'Постпродакшен', 'Премьера', 'Премьера онлайн'),
	serials_id BIGINT UNSIGNED NOT NULL,
	season_id BIGINT UNSIGNED NOT NULL,
	episode_release_date DATE,
	users_rating FLOAT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY (serials_id) REFERENCES serials(id)
);

/*
ALTER TABLE serials_seasons
ADD CONSTRAINT serials_seasons_ibfk_1 FOREIGN KEY (episode_id) REFERENCES serials_episodes(id) ON DELETE CASCADE ON UPDATE CASCADE
;
*/

-- 13. Таблица пользовательских рейтингов
DROP TABLE IF EXISTS users_ratings;
CREATE TABLE users_ratings (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	serials_id BIGINT UNSIGNED NOT NULL,
	serials_rating FLOAT,
	season_id BIGINT UNSIGNED NOT NULL,
	season_rating FLOAT,
	episode_id BIGINT UNSIGNED NOT NULL,
	episode_rating FLOAT,
	film_id BIGINT UNSIGNED NOT NULL,
	film_rating FLOAT,
	actor_id BIGINT UNSIGNED NOT NULL,
	actor_rating FLOAT,
	director_id BIGINT UNSIGNED NOT NULL,
	director_rating FLOAT,
	
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (serials_id) REFERENCES serials(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (season_id) REFERENCES serials_seasons(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (episode_id) REFERENCES serials_episodes(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (film_id) REFERENCES films(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (actor_id) REFERENCES actors(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (director_id) REFERENCES directors(id) ON DELETE CASCADE ON UPDATE CASCADE
);

/*
Комментарии преподавателя:
--------------------------------------
Кирилл Иванов・Преподаватель
- Правильно, что пересоздаете БД заново перед работой с ней.
- Правильно, что выбираете БД по умолчанию для скрипта командой USE <db_name>;
- Количество таблиц достаточное.
- ER-диаграмму можно добавить в виде скриншота или файлом *.mwb из Workbench.
*/