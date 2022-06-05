#
# TABLE STRUCTURE FOR: countries
#

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `countries` (`id`, `country`) VALUES ('1', 'Индия');
INSERT INTO `countries` (`id`, `country`) VALUES ('2', 'Ю. Корея');
INSERT INTO `countries` (`id`, `country`) VALUES ('3', 'Россия');
INSERT INTO `countries` (`id`, `country`) VALUES ('4', 'Франция');
INSERT INTO `countries` (`id`, `country`) VALUES ('5', 'США');
INSERT INTO `countries` (`id`, `country`) VALUES ('6', 'Великобритания');
INSERT INTO `countries` (`id`, `country`) VALUES ('7', 'Украина');
INSERT INTO `countries` (`id`, `country`) VALUES ('8', 'Франция');
INSERT INTO `countries` (`id`, `country`) VALUES ('9', 'Германия');
INSERT INTO `countries` (`id`, `country`) VALUES ('10', 'Индия');
INSERT INTO `countries` (`id`, `country`) VALUES ('11', 'Великобритания');


