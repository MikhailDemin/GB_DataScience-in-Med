#
# TABLE STRUCTURE FOR: films
#

DROP TABLE IF EXISTS `films`;

CREATE TABLE `films` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `director_id` bigint(20) unsigned NOT NULL,
  `actor_id` bigint(20) unsigned NOT NULL,
  `film_release_date` date DEFAULT NULL,
  `genre_id` bigint(20) unsigned NOT NULL,
  `status` enum('Анонс','В производстве','Постпродакшен','Премьера','Премьера онлайн') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poster_id` bigint(20) unsigned NOT NULL,
  `trailer_id` bigint(20) unsigned NOT NULL,
  `users_rating` double DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `country_id` (`country_id`),
  KEY `director_id` (`director_id`),
  KEY `actor_id` (`actor_id`),
  KEY `genre_id` (`genre_id`),
  KEY `poster_id` (`poster_id`),
  KEY `trailer_id` (`trailer_id`),
  CONSTRAINT `films_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_ibfk_4` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_ibfk_5` FOREIGN KEY (`poster_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_ibfk_6` FOREIGN KEY (`trailer_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('1', '1', '4', '4', '1983-01-30', '7', 'В производстве', '25', '37', NULL, '1980-02-01 21:15:48', '2012-07-18 23:43:44');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('2', '8', '12', '13', '2014-06-09', '4', 'Премьера', '34', '10', NULL, '2003-07-20 04:05:48', '2016-03-19 21:17:47');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('3', '9', '10', '14', '2009-03-10', '14', 'В производстве', '23', '37', NULL, '1975-09-13 06:18:54', '1999-08-17 04:44:24');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('4', '5', '5', '9', '1986-12-02', '9', 'Постпродакшен', '40', '24', NULL, '1981-03-12 14:07:44', '2010-03-06 16:40:32');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('5', '2', '15', '6', '1989-10-27', '5', 'Премьера онлайн', '21', '4', NULL, '2004-12-15 15:19:56', '1983-04-02 23:34:45');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('6', '10', '13', '9', '1982-07-04', '4', 'Премьера', '25', '3', NULL, '2017-10-29 19:03:19', '2004-08-05 11:09:20');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('7', '2', '14', '13', '2014-08-08', '6', 'В производстве', '12', '20', NULL, '1992-05-11 02:11:48', '2015-07-25 14:43:42');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('8', '9', '4', '1', '1996-02-05', '6', 'Премьера', '18', '36', NULL, '1970-09-14 00:30:38', '1985-08-18 10:24:19');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('9', '9', '9', '2', '2001-03-23', '14', 'Премьера онлайн', '14', '26', NULL, '2007-05-19 03:45:42', '1976-11-12 20:05:49');
INSERT INTO `films` (`id`, `country_id`, `director_id`, `actor_id`, `film_release_date`, `genre_id`, `status`, `poster_id`, `trailer_id`, `users_rating`, `created_at`, `updated_at`) VALUES ('10', '3', '11', '10', '2018-06-03', '4', 'Премьера', '8', '25', NULL, '2016-10-04 12:27:04', '1983-10-27 07:25:32');


