#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type` enum('Poster','Trailer') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('1', 'Poster', 'fugiat', NULL, '1975-08-19 10:15:20', '2022-04-12 06:29:07');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('2', 'Poster', 'aperiam', NULL, '1985-06-17 06:40:45', '2021-11-04 19:10:05');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('3', 'Trailer', 'ipsam', NULL, '1995-10-21 06:22:22', '2022-04-09 10:17:53');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('4', 'Trailer', 'ipsa', NULL, '1977-11-15 04:21:53', '2021-06-30 02:08:14');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('5', 'Trailer', 'autem', NULL, '1975-03-13 02:54:39', '2022-01-11 03:14:23');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('6', 'Poster', 'sapiente', NULL, '1983-05-03 11:15:10', '2022-04-18 13:21:29');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('7', 'Poster', 'laudantium', NULL, '2010-12-18 14:07:52', '2022-04-03 09:24:03');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('8', 'Poster', 'laboriosam', NULL, '2000-07-29 15:43:21', '2022-05-16 23:14:40');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('9', 'Trailer', 'eos', NULL, '1991-04-22 01:33:22', '2021-10-30 06:16:51');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('10', 'Poster', 'ad', NULL, '2002-07-15 23:30:59', '2021-12-28 01:34:08');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('11', 'Poster', 'labore', NULL, '1973-12-09 17:03:03', '2021-09-24 04:29:09');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('12', 'Trailer', 'iure', NULL, '1973-03-18 13:58:28', '2021-06-18 15:15:26');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('13', 'Trailer', 'ipsam', NULL, '2000-06-05 22:51:19', '2021-06-03 09:56:18');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('14', 'Poster', 'iusto', NULL, '2003-06-25 07:23:05', '2022-01-29 19:33:32');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('15', 'Trailer', 'non', NULL, '2015-02-03 21:15:05', '2022-03-16 22:10:25');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('16', 'Trailer', 'cumque', NULL, '2006-02-24 02:16:31', '2021-07-29 13:27:12');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('17', 'Poster', 'natus', NULL, '2009-02-01 12:36:02', '2021-11-26 21:39:29');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('18', 'Poster', 'voluptatibus', NULL, '2003-11-14 06:34:56', '2021-09-11 11:11:27');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('19', 'Poster', 'voluptas', NULL, '1973-09-01 05:48:59', '2021-10-31 11:08:34');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('20', 'Poster', 'natus', NULL, '1994-09-07 06:33:10', '2022-03-11 03:32:12');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('21', 'Poster', 'placeat', NULL, '1986-10-25 00:19:26', '2021-06-26 20:20:24');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('22', 'Poster', 'reiciendis', NULL, '1991-08-04 13:40:56', '2022-04-14 06:50:12');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('23', 'Trailer', 'nam', NULL, '2017-11-09 22:36:59', '2022-02-05 21:18:22');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('24', 'Poster', 'ipsum', NULL, '1979-01-05 07:24:34', '2022-01-10 21:07:12');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('25', 'Poster', 'nulla', NULL, '2008-12-26 19:04:10', '2021-07-14 06:11:08');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('26', 'Trailer', 'fugit', NULL, '2017-01-04 23:15:57', '2022-05-11 21:30:42');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('27', 'Trailer', 'magnam', NULL, '1989-06-18 00:54:21', '2022-04-08 17:38:03');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('28', 'Trailer', 'dolores', NULL, '2022-05-05 15:00:59', '2021-05-21 16:19:11');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('29', 'Trailer', 'accusantium', NULL, '1983-05-06 13:44:00', '2021-09-12 15:51:57');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('30', 'Trailer', 'porro', NULL, '1999-08-20 12:55:22', '2022-01-03 03:06:42');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('31', 'Trailer', 'velit', NULL, '1993-02-26 12:43:34', '2021-09-29 04:12:47');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('32', 'Poster', 'ipsa', NULL, '1980-04-28 03:03:19', '2021-06-05 20:16:50');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('33', 'Trailer', 'laudantium', NULL, '1975-07-12 23:13:10', '2021-07-31 15:59:30');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('34', 'Trailer', 'quo', NULL, '2005-06-29 18:05:55', '2021-09-07 04:19:36');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('35', 'Trailer', 'et', NULL, '1998-07-06 00:36:16', '2021-12-28 01:30:15');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('36', 'Trailer', 'qui', NULL, '1973-11-16 03:06:46', '2021-11-27 05:25:11');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('37', 'Poster', 'porro', NULL, '1979-07-07 07:52:05', '2021-10-02 10:48:51');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('38', 'Trailer', 'numquam', NULL, '2002-11-04 01:36:34', '2022-02-10 19:08:06');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('39', 'Trailer', 'repellendus', NULL, '2000-06-14 01:06:18', '2021-11-04 18:20:18');
INSERT INTO `media` (`id`, `media_type`, `filename`, `metadata`, `created_at`, `updated_at`) VALUES ('40', 'Poster', 'quasi', NULL, '1995-12-09 18:10:45', '2021-08-07 16:39:14');


