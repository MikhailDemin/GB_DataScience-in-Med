#
# TABLE STRUCTURE FOR: directors
#

DROP TABLE IF EXISTS `directors`;

CREATE TABLE `directors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Пол',
  `director_firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя',
  `director_lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `director_birthday` date DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `users_rating` double DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('1', 'f', 'Demond', 'Robel', '2022-05-14', '11', NULL, '1982-10-30 10:52:06', '2020-05-14 04:11:31');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('2', 'f', 'Kathryne', 'Hermann', '2010-06-27', '2', NULL, '2021-09-10 01:31:20', '1990-09-19 12:12:25');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('3', 'f', 'Marcelle', 'Lang', '1970-12-08', '2', NULL, '1974-06-25 06:32:13', '1979-08-03 06:21:50');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('4', 'f', 'Westley', 'Corkery', '1992-03-23', '2', NULL, '1986-08-19 22:38:10', '2018-11-26 13:07:51');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('5', 'f', 'Vicky', 'Howell', '1976-08-18', '9', NULL, '1981-05-23 14:04:32', '2013-12-30 01:39:01');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('6', 'm', 'Guillermo', 'Aufderhar', '1996-01-25', '10', NULL, '2011-04-09 00:33:11', '1975-05-13 05:54:41');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('7', 'm', 'Edgar', 'Bayer', '2006-12-18', '10', NULL, '1978-11-17 05:21:13', '2000-11-23 06:50:09');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('8', 'f', 'Savanna', 'Lemke', '1973-07-23', '8', NULL, '1999-12-06 18:37:21', '2000-04-07 13:26:19');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('9', 'f', 'Edward', 'O\'Connell', '2018-12-05', '2', NULL, '2017-04-30 04:40:25', '1986-02-23 09:05:30');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('10', 'm', 'Celia', 'Veum', '2007-02-11', '5', NULL, '1993-09-24 11:40:52', '1973-02-26 05:08:53');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('11', 'm', 'Travis', 'Braun', '1972-08-17', '7', NULL, '1994-04-04 02:36:27', '1998-02-02 18:45:15');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('12', 'm', 'Maria', 'Stracke', '2015-10-10', '9', NULL, '2012-10-19 20:42:18', '2007-12-10 12:36:19');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('13', 'f', 'Maxie', 'Hamill', '2006-12-25', '1', NULL, '2017-06-26 06:04:58', '1994-07-30 04:01:45');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('14', 'f', 'Marion', 'Hudson', '2015-12-01', '5', NULL, '1998-06-19 16:50:19', '2013-09-16 19:17:06');
INSERT INTO `directors` (`id`, `gender`, `director_firstname`, `director_lastname`, `director_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('15', 'm', 'Coy', 'Green', '1975-06-14', '8', NULL, '1982-07-19 08:55:17', '2010-12-06 05:57:07');


