#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('1', 'kling.myrtie@gmail.com', 'a2ce1584e07cafaaddd6098c54477ab400c32dd2');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('2', 'adaline.brown@gmail.com', 'e07744a8b47b53b3c16789231181cf8dd9982029');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('3', 'qleffler@yahoo.com', '09ebed1dbb26b116cab62732a3150a69da510588');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('4', 'uriel.stiedemann@gmail.com', '38781a5cfa5dd6c05899a52cadf86acda76bda69');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('5', 'conner15@gmail.com', 'f9d96680d6dbdf4663b6895a4974194849c5aa37');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('6', 'herman.wilbert@gmail.com', '687bfefcc1e644c17878538ac05278b380f1ea9f');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('7', 'landen.lebsack@yahoo.com', 'e45228d7464c89a81bd7fedcc095961e8b4de578');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('8', 'mherzog@hotmail.com', 'ecd6ea5d5a6afeea2fe52c7ee297c010fc9e2354');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('9', 'schaefer.kevon@yahoo.com', '98e661cb93769d4e2a7b0548263d003925c7b0ac');
INSERT INTO `users` (`id`, `email`, `password_hash`) VALUES ('10', 'tanderson@gmail.com', '4374a08fc0b3bf5daf491b2c2d93e077db215616');


