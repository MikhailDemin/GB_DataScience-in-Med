DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	-- id SERIAL,
	-- id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	firstname VARCHAR(100) COMMENT 'Имя',
	lastname VARCHAR(100) COMMENT 'Фамилия',
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE COMMENT 'Телефон', -- +7(999) 123-45-67 => 79 991 234 567
	
	INDEX idx_firstname_lastname(firstname, lastname)
) COMMENT 'Пользователи';

-- 1 x 1
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender CHAR(1) COMMENT 'Пол',
	hometown VARCHAR(200) COMMENT 'Родной город',
	created_at DATETIME DEFAULT NOW()
);

ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_id
FOREIGN KEY (user_id) REFERENCES users(id)
;

ALTER TABLE profiles ADD COLUMN birthday DATETIME;
ALTER TABLE profiles MODIFY COLUMN birthday DATE;

/* 
ALTER TABLE profiles RENAME COLUMN birthday TO day_of_birth;
ALTER TABLE profiles DROP COLUMN day_of_birth;
*/

-- 1 x M
DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	-- body VARCHAR(255),
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
	-- id SERIAL,
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	-- status TINYINT(1), -- 1, 2, 3, 4,
	status ENUM('requested', 'approved', 'declined', 'unfriended'),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
	
	PRIMARY KEY (initiator_user_id, target_user_id), 
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id),
	CHECK (initiator_user_id != target_user_id)
);

/* ALTER TABLE friend_requests
ADD CHECK (initiator_user_id <> target_user_id);
*/

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
	-- media_type ENUM('text', 'video', 'music', 'image'),
	media_type_id BIGINT UNSIGNED NOT NULL,
	body VARCHAR(255),
	-- file BLOB, -> приведет к увеличению размера базы и проблемам с производительностью
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


