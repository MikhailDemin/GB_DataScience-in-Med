DROP DATABASE IF EXISTS kinorium;
CREATE DATABASE kinorium;
USE kinorium;


-- Таблица пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256)
);

-- Профили пользователей
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender CHAR(1) COMMENT 'Пол',
	firstname VARCHAR(100) COMMENT 'Имя',
	lastname VARCHAR(100) COMMENT 'Фамилия',
	birthday DATE,
	
-- 	FOREIGN KEY (user_id) REFERENCES users(id),
-- 	FOREIGN KEY (social_net_id) REFERENCES social_net(id),
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW()
);

-- Таблица сообщений пользователей
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
		
-- 	FOREIGN KEY (from_user_id) REFERENCES users(id),
-- 	FOREIGN KEY (to_user_id) REFERENCES users(id),
	
	INDEX (from_user_id),
	INDEX (to_user_id)
);

-- Таблица фильмов
DROP TABLE IF EXISTS films;
CREATE TABLE films (
	id SERIAL,
	country_id BIGINT UNSIGNED NOT NULL,
	director_id BIGINT UNSIGNED NOT NULL,
	actor_id BIGINT UNSIGNED NOT NULL,
	release_date DATE,
	status ENUM('Анонс', 'В производстве', 'Скоро', 'Премьера', 'Премьера онлайн'),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP


-- 	FOREIGN KEY (user_id) REFERENCES users(id),
-- 	FOREIGN KEY (community_id) REFERENCES communities(id)б	
-- 	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
-- 	FOREIGN KEY (country_id) REFERENCES countries(id)
-- 	FOREIGN KEY (target_user_id) REFERENCES users(id)
-- );

-- Таблица стран
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
	id SERIAL primary key,
	country VARCHAR(100)
);


DROP TABLE IF EXISTS communities;
CREATE TABLE communities (
	id SERIAL,
	name VARCHAR(255),
	admin_user_id BIGINT UNSIGNED NOT NULL,
		
	INDEX (name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id)
);

-- M x M
DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities (
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
		
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (community_id) REFERENCES communities(id)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
	id SERIAL,
	name VARCHAR(255) -- 'text', 'video', 'music', 'image'
);

DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_type_id BIGINT UNSIGNED NOT NULL,
	body VARCHAR(255),
	filename VARCHAR(255),
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
		
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW()
);

ALTER TABLE likes
ADD CONSTRAINT fk_likes_user_id FOREIGN KEY (user_id) REFERENCES users(id),
ADD CONSTRAINT fk_likes_media_id FOREIGN KEY (media_id) REFERENCES media(id)
;

DROP TABLE IF EXISTS links;
CREATE TABLE links (
	id SERIAL
);


-- таблица компаний, которые представлены в соц сети, а также пользователи сети могут быть
-- сотрудниками этих кампаний
DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
	id SERIAL,
	created_at DATETIME DEFAULT NOW(),
	company_site BIGINT UNSIGNED NOT NULL,
	employee_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (employee_id) REFERENCES users(id),
	FOREIGN KEY (company_site) REFERENCES links(id)
);

ALTER TABLE profiles ADD COLUMN employee_of_company BIGINT UNSIGNED NOT NULL;
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_company_id
FOREIGN KEY (employee_of_company) REFERENCES companies(id)
;

ALTER TABLE links
ADD COLUMN media_id BIGINT UNSIGNED NOT NULL,
ADD COLUMN user_id BIGINT UNSIGNED NOT NULL,
ADD COLUMN body VARCHAR(255),
ADD COLUMN name VARCHAR(255),
ADD COLUMN created_at DATETIME DEFAULT NOW(),
ADD COLUMN updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
ADD CONSTRAINT fk_links_media_id FOREIGN KEY (media_id) REFERENCES media(id),
ADD CONSTRAINT fk_links_user_id FOREIGN KEY (user_id) REFERENCES users(id)
;

-- таблица звонков пользователей
DROP TABLE IF EXISTS calls;
CREATE TABLE calls (
	id SERIAL,
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	finished_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY (initiator_user_id, target_user_id), 
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id),
	CHECK (initiator_user_id != target_user_id)
);

ALTER TABLE profiles ADD COLUMN is_active BIT NOT NULL DEFAULT(TRUE);
ALTER TABLE profiles ADD COLUMN age TINYINT UNSIGNED NOT NULL;