#
# TABLE STRUCTURE FOR: genres
#

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `genres` (`id`, `name`) VALUES ('1', 'Комедия');
INSERT INTO `genres` (`id`, `name`) VALUES ('2', 'Мелодрама');
INSERT INTO `genres` (`id`, `name`) VALUES ('3', 'Мультфильм');
INSERT INTO `genres` (`id`, `name`) VALUES ('4', 'Фантастика');
INSERT INTO `genres` (`id`, `name`) VALUES ('5', 'Документальный');
INSERT INTO `genres` (`id`, `name`) VALUES ('6', 'Боевик');
INSERT INTO `genres` (`id`, `name`) VALUES ('7', 'Триллер');
INSERT INTO `genres` (`id`, `name`) VALUES ('8', 'Приключения');
INSERT INTO `genres` (`id`, `name`) VALUES ('9', 'Драма');
INSERT INTO `genres` (`id`, `name`) VALUES ('10', 'Детектив');
INSERT INTO `genres` (`id`, `name`) VALUES ('11', 'Романтический');
INSERT INTO `genres` (`id`, `name`) VALUES ('12', 'Детский');
INSERT INTO `genres` (`id`, `name`) VALUES ('13', 'Хоррор');
INSERT INTO `genres` (`id`, `name`) VALUES ('14', 'Фэнтэзи');
INSERT INTO `genres` (`id`, `name`) VALUES ('15', 'Нуар');
INSERT INTO `genres` (`id`, `name`) VALUES ('16', 'Семейный');
INSERT INTO `genres` (`id`, `name`) VALUES ('17', 'Биографический');


