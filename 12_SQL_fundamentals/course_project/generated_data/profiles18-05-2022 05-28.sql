#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Пол',
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя',
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('1', 'm', 'Joaquin', 'Schaefer', '2017-06-11', '2014-02-26 09:26:17', '2022-04-18 10:15:06');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('2', 'm', 'Cornell', 'Prohaska', '2022-04-14', '2016-03-24 20:36:56', '2022-05-06 16:07:47');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('3', 'm', 'Nicola', 'Towne', '1993-05-14', '2016-09-06 18:36:13', '2022-04-22 19:25:49');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('4', 'm', 'Llewellyn', 'O\'Reilly', '1994-07-07', '2016-12-23 03:14:09', '2022-04-25 04:21:38');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('5', 'm', 'Jeromy', 'Macejkovic', '1995-07-02', '2016-12-07 18:56:45', '2022-05-12 08:00:45');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('6', 'f', 'Antonietta', 'Mayert', '2005-06-17', '2015-09-03 04:13:09', '2022-05-01 13:33:19');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('7', 'm', 'Maryse', 'Dare', '1998-06-23', '2017-07-22 14:10:52', '2022-05-09 14:29:22');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('8', 'm', 'Jarrell', 'Mayer', '2009-09-25', '2019-09-09 15:00:02', '2022-04-30 20:13:26');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('9', 'f', 'Don', 'Dickinson', '2021-10-18', '2020-08-19 14:33:08', '2022-04-21 02:26:18');
INSERT INTO `profiles` (`user_id`, `gender`, `firstname`, `lastname`, `birthday`, `created_at`, `updated_at`) VALUES ('10', 'f', 'Johnny', 'Grady', '2008-04-29', '2015-02-03 09:48:39', '2022-05-16 13:04:38');


