DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) DEFAULT 'user' COMMENT 'имя пользователя'
);
INSERT INTO users (name) VALUES ('developer');
INSERT INTO users (name) VALUES ('user_1'), ('admin'), (DEFAULT);