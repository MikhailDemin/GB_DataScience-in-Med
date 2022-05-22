#
# TABLE STRUCTURE FOR: actors
#

DROP TABLE IF EXISTS `actors`;

CREATE TABLE `actors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Пол',
  `actor_firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя',
  `actor_lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `actor_birthday` date DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `users_rating` double DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('1', 'f', 'Merritt', 'Bradtke', '1980-04-23', '4', NULL, '2014-09-07 21:23:38', '2022-01-23 01:53:49');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('2', 'f', 'Lenny', 'Jerde', '2004-10-15', '5', NULL, '2015-06-18 08:09:09', '2022-02-17 06:08:17');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('3', 'f', 'Jamey', 'Hauck', '1986-10-23', '6', NULL, '2021-08-27 06:24:00', '2022-03-21 20:25:47');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('4', 'f', 'Bud', 'Douglas', '2017-05-06', '3', NULL, '2014-04-27 16:05:25', '2022-04-02 18:53:36');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('5', 'f', 'Gayle', 'Boyle', '2015-02-28', '8', NULL, '2021-05-08 14:33:21', '2022-04-23 07:51:46');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('6', 'f', 'Ava', 'Ryan', '1994-08-19', '1', NULL, '2019-02-01 03:39:17', '2021-09-28 07:08:12');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('7', 'f', 'Enrique', 'Moore', '2013-04-19', '6', NULL, '2020-06-03 11:56:42', '2021-05-20 15:39:40');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('8', 'f', 'Loraine', 'Gusikowski', '2014-03-27', '3', NULL, '2014-01-06 23:44:09', '2021-11-12 12:22:51');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('9', 'f', 'Tamia', 'Legros', '2015-09-23', '5', NULL, '2014-01-16 00:46:11', '2022-02-02 05:37:46');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('10', 'f', 'Amir', 'Cummerata', '2014-10-22', '10', NULL, '2021-02-16 21:28:41', '2022-03-22 16:13:46');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('11', 'm', 'Gunner', 'Kub', '2002-03-02', '3', NULL, '2015-02-08 23:59:00', '2021-11-21 12:24:48');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('12', 'f', 'Enos', 'Oberbrunner', '1993-04-21', '4', NULL, '2019-01-11 02:55:14', '2021-12-06 16:52:45');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('13', 'f', 'Demetrius', 'Casper', '1977-01-05', '9', NULL, '2019-11-28 16:12:16', '2021-11-19 04:53:10');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('14', 'm', 'Dayne', 'Walsh', '1991-06-25', '9', NULL, '2016-05-30 08:56:28', '2022-04-06 12:11:14');
INSERT INTO `actors` (`id`, `gender`, `actor_firstname`, `actor_lastname`, `actor_birthday`, `country_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('15', 'f', 'Eric', 'Schoen', '2013-12-26', '9', NULL, '2012-07-12 03:31:01', '2022-05-16 16:01:43');


