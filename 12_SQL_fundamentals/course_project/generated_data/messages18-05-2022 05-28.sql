#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('1', '4', '8', 'Explicabo nam quo dolorem et magnam numquam. Est ipsa qui ducimus et est sed explicabo.', '2022-05-13 03:25:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('2', '6', '1', 'Ut ut sit aut et maxime ducimus. Dicta nisi debitis excepturi ut voluptates. Accusamus nihil dolorum molestiae dolor ut.', '2022-05-08 05:13:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('3', '5', '5', 'Laboriosam dolorem sit minus tenetur omnis. Totam quia numquam dicta porro quis quis. Rerum veniam perferendis eos vel sit tenetur. Quos corrupti reiciendis et ea quo dicta.', '2022-04-26 15:26:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('4', '9', '10', 'Officiis ea dolorum consequuntur vitae nisi asperiores qui. Labore minima harum aut quis earum quis voluptas. Ut iste quam saepe magnam qui laborum corporis. Voluptas delectus itaque at maxime molestiae fuga.', '2022-05-09 17:32:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('5', '3', '4', 'Tempore voluptatibus impedit doloremque illo et quaerat quam quidem. Nihil libero aspernatur voluptatum quo. Fugiat sapiente soluta harum cupiditate quia quis nulla. Non aliquam voluptatem eligendi eos quis repellendus. Sed neque temporibus ut est modi magnam sint.', '2022-05-10 00:04:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('6', '3', '3', 'Et optio omnis reprehenderit sint corrupti dolor quod. Sit ut dicta corporis explicabo nam. Quia ut et quo impedit.', '2022-05-15 08:47:16');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('7', '8', '3', 'Eaque dicta corporis eius voluptate illo ex. Dolores quis accusantium soluta voluptas similique soluta rerum. Perspiciatis voluptas sit perspiciatis.', '2022-05-10 08:02:40');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('8', '1', '2', 'Incidunt sit laudantium voluptatum natus perferendis quod animi. Saepe a est et optio eos assumenda ut. Dolor totam est voluptas ratione error nesciunt. Aperiam non sit aut ipsum recusandae in et occaecati.', '2022-04-20 10:53:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('9', '1', '1', 'Cumque dolorem beatae dolore corporis provident quia inventore. Et voluptatem sint iste aut similique accusamus vel. Inventore sed quis aut. Sint ut sit quia culpa voluptatem optio libero.', '2022-04-22 23:59:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('10', '5', '1', 'Reiciendis quis et quam eum sint nulla commodi. Doloribus omnis nisi itaque iste vel dolorem. Ut quae odit tenetur quo autem. Corrupti sint animi voluptatem aut.', '2022-04-30 02:10:46');


