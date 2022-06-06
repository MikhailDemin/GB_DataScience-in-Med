-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: kinorium
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) DEFAULT NULL COMMENT 'Пол',
  `actor_firstname` varchar(100) DEFAULT NULL COMMENT 'Имя',
  `actor_lastname` varchar(100) DEFAULT NULL COMMENT 'Фамилия',
  `actor_birthday` date DEFAULT NULL,
  `country_id` bigint unsigned NOT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'f','Николь','Кидман','1980-04-23',4,NULL,'2014-09-07 21:23:38','2022-01-23 01:53:49'),(2,'m','Брюс','Уиллис','2004-10-15',5,NULL,'2015-06-18 08:09:09','2022-02-17 06:08:17'),(3,'f','Шарлиз','Терон','1980-12-19',6,NULL,'2021-08-27 06:24:00','2022-03-21 20:25:47'),(4,'m','Энтони','Хопкинс','2017-05-06',3,NULL,'2014-04-27 16:05:25','2022-04-02 18:53:36'),(5,'f','Марго','Робби','2015-02-28',8,NULL,'2021-05-08 14:33:21','2022-04-23 07:51:46'),(6,'f','Анджелина','Джоли','1994-08-19',1,NULL,'2019-02-01 03:39:17','2021-09-28 07:08:12'),(7,'m','Джейк','Джилленхол','2013-04-19',6,NULL,'2020-06-03 11:56:42','2021-05-20 15:39:40'),(8,'f','Моника','Белуччи','2014-03-27',3,NULL,'2014-01-06 23:44:09','2021-11-12 12:22:51'),(9,'m','Киану','Ривз','2015-09-23',5,NULL,'2014-01-16 00:46:11','2022-02-02 05:37:46'),(10,'f','Чжан','Цзыи','2014-10-22',10,NULL,'2021-02-16 21:28:41','2022-03-22 16:13:46'),(11,'m','Джеки','Чан','2002-03-02',3,NULL,'2015-02-08 23:59:00','2021-11-21 12:24:48'),(12,'f','Марион','Котийяр','1993-04-21',4,NULL,'2019-01-11 02:55:14','2021-12-06 16:52:45'),(13,'m','Том','Харди','1977-01-05',9,NULL,'2019-11-28 16:12:16','2021-11-19 04:53:10'),(14,'m','Кристиан','Бэйл','1991-06-25',9,NULL,'2016-05-30 08:56:28','2022-04-06 12:11:14'),(15,'f','Эмма','Стоун','2013-12-26',9,NULL,'2012-07-12 03:31:01','2022-05-16 16:01:43');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Индия'),(2,'Ю. Корея'),(3,'Россия'),(4,'Франция'),(5,'США'),(6,'Великобритания'),(7,'Украина'),(8,'Канада'),(9,'Германия'),(10,'Китай'),(11,'Автралия');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) DEFAULT NULL COMMENT 'Пол',
  `director_firstname` varchar(100) DEFAULT NULL COMMENT 'Имя',
  `director_lastname` varchar(100) DEFAULT NULL COMMENT 'Фамилия',
  `director_birthday` date DEFAULT NULL,
  `country_id` bigint unsigned NOT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'m','Роланд','Эммерих','2022-05-14',11,NULL,'1982-10-30 10:52:06','2020-05-14 04:11:31'),(2,'f','Хлоя','Чжао','2010-06-27',2,NULL,'2021-09-10 01:31:20','1990-09-19 12:12:25'),(3,'f','София','Коппола','1970-12-08',2,NULL,'1974-06-25 06:32:13','1979-08-03 06:21:50'),(4,'m','Бен','Аффлек','1992-03-23',2,NULL,'1986-08-19 22:38:10','2018-11-26 13:07:51'),(5,'m','Стивен','Спилберг','1976-08-18',9,NULL,'1981-05-23 14:04:32','2013-12-30 01:39:01'),(6,'m','Ридли','Скотт','1996-01-25',10,NULL,'2011-04-09 00:33:11','1975-05-13 05:54:41'),(7,'m','Джеймс','Кэмерон','2006-12-18',10,NULL,'1978-11-17 05:21:13','2000-11-23 06:50:09'),(8,'m','Дэвид','Финчер','1973-07-23',8,NULL,'1999-12-06 18:37:21','2000-04-07 13:26:19'),(9,'m','Кристофер','Нолан','2018-12-05',2,NULL,'2017-04-30 04:40:25','2022-05-27 04:31:47'),(10,'m','Нил','Бломкамп','2007-02-11',5,NULL,'1993-09-24 11:40:52','1973-02-26 05:08:53'),(11,'m','Квентин','Тарантино','1972-08-17',7,NULL,'1994-04-04 02:36:27','1998-02-02 18:45:15'),(12,'m','Дэни','Вильнёв','2015-10-10',9,NULL,'2012-10-19 20:42:18','2007-12-10 12:36:19'),(13,'m','Гай','Ричи','2006-12-25',1,NULL,'2017-06-26 06:04:58','1994-07-30 04:01:45'),(14,'m','Люк','Бессон','2015-12-01',5,NULL,'1998-06-19 16:50:19','2013-09-16 19:17:06'),(15,'m','Клинт','Иствуд','1975-06-14',8,NULL,'1982-07-19 08:55:17','2010-12-06 05:57:07');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `film_info`
--

DROP TABLE IF EXISTS `film_info`;
/*!50001 DROP VIEW IF EXISTS `film_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `film_info` AS SELECT 
 1 AS `Название`,
 1 AS `Дата выхода`,
 1 AS `Страна производства`,
 1 AS `Режиссёр`,
 1 AS `В ролях`,
 1 AS `Жанр`,
 1 AS `Постер`,
 1 AS `Трейлер`,
 1 AS `Статус`,
 1 AS `Рейтинг`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned NOT NULL,
  `director_id` bigint unsigned NOT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `film_release_date` date DEFAULT NULL,
  `genre_id` bigint unsigned NOT NULL,
  `status` enum('Анонс','В производстве','Постпродакшен','Премьера','Премьера онлайн') DEFAULT NULL,
  `poster_id` bigint unsigned NOT NULL,
  `trailer_id` bigint unsigned NOT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `film_title` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,1,4,9,'1983-01-30',7,'В производстве',25,37,NULL,'1980-02-01 21:15:48','2022-05-27 04:45:51','Матрица'),(2,8,6,13,'2014-06-09',4,'Премьера',34,10,NULL,'2003-07-20 04:05:48','2022-05-27 04:36:06','Правдивая ложь'),(3,9,8,14,'2009-03-10',14,'В производстве',23,37,NULL,'1975-09-13 06:18:54','2022-05-27 04:36:07','Мистер и миссис Смит'),(4,5,5,9,'1986-12-02',9,'Постпродакшен',40,24,NULL,'1981-03-12 14:07:44','2010-03-06 16:40:32','Бойцовский клуб'),(5,2,15,6,'1989-10-27',5,'Премьера онлайн',21,4,NULL,'2004-12-15 15:19:56','1983-04-02 23:34:45','Интерстеллар'),(6,10,12,11,'1982-07-04',4,'Премьера',25,3,NULL,'2017-10-29 19:03:19','2022-05-27 04:45:52','Бегущий по лезвию 2049'),(7,2,13,13,'2014-08-08',6,'В производстве',12,20,NULL,'1992-05-11 02:11:48','2022-05-27 04:36:08','Джентельмены'),(8,9,11,2,'1996-02-05',6,'Премьера',18,36,NULL,'1970-09-14 00:30:38','2022-05-27 04:45:53','Криминальное чтиво'),(9,9,10,7,'2001-03-23',14,'Премьера онлайн',14,26,NULL,'2007-05-19 03:45:42','2022-05-27 04:45:54','Район №9'),(10,3,14,10,'2018-06-03',4,'Премьера',8,25,NULL,'2016-10-04 12:27:04','2022-05-27 04:36:11','Пятый элемент');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Комедия'),(2,'Мелодрама'),(3,'Мультфильм'),(4,'Фантастика'),(5,'Документальный'),(6,'Боевик'),(7,'Триллер'),(8,'Приключения'),(9,'Драма'),(10,'Детектив'),(11,'Романтический'),(12,'Детский'),(13,'Хоррор'),(14,'Фэнтэзи'),(15,'Нуар'),(16,'Семейный'),(17,'Биографический');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type` enum('Poster','Trailer') DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Poster','fugiat',NULL,'1975-08-19 10:15:20','2022-04-12 06:29:07'),(2,'Poster','aperiam',NULL,'1985-06-17 06:40:45','2021-11-04 19:10:05'),(3,'Trailer','ipsam',NULL,'1995-10-21 06:22:22','2022-04-09 10:17:53'),(4,'Trailer','ipsa',NULL,'1977-11-15 04:21:53','2021-06-30 02:08:14'),(5,'Trailer','autem',NULL,'1975-03-13 02:54:39','2022-01-11 03:14:23'),(6,'Poster','sapiente',NULL,'1983-05-03 11:15:10','2022-04-18 13:21:29'),(7,'Poster','laudantium',NULL,'2010-12-18 14:07:52','2022-04-03 09:24:03'),(8,'Poster','laboriosam',NULL,'2000-07-29 15:43:21','2022-05-16 23:14:40'),(9,'Trailer','eos',NULL,'1991-04-22 01:33:22','2021-10-30 06:16:51'),(10,'Poster','ad',NULL,'2002-07-15 23:30:59','2021-12-28 01:34:08'),(11,'Poster','labore',NULL,'1973-12-09 17:03:03','2021-09-24 04:29:09'),(12,'Trailer','iure',NULL,'1973-03-18 13:58:28','2021-06-18 15:15:26'),(13,'Trailer','ipsam',NULL,'2000-06-05 22:51:19','2021-06-03 09:56:18'),(14,'Poster','iusto',NULL,'2003-06-25 07:23:05','2022-01-29 19:33:32'),(15,'Trailer','non',NULL,'2015-02-03 21:15:05','2022-03-16 22:10:25'),(16,'Trailer','cumque',NULL,'2006-02-24 02:16:31','2021-07-29 13:27:12'),(17,'Trailer','natus',NULL,'2009-02-01 12:36:02','2021-11-26 21:39:29'),(18,'Poster','voluptatibus',NULL,'2003-11-14 06:34:56','2021-09-11 11:11:27'),(19,'Poster','voluptas',NULL,'1973-09-01 05:48:59','2021-10-31 11:08:34'),(20,'Poster','natus',NULL,'1994-09-07 06:33:10','2022-03-11 03:32:12'),(21,'Poster','placeat',NULL,'1986-10-25 00:19:26','2021-06-26 20:20:24'),(22,'Poster','reiciendis',NULL,'1991-08-04 13:40:56','2022-04-14 06:50:12'),(23,'Trailer','nam',NULL,'2017-11-09 22:36:59','2022-02-05 21:18:22'),(24,'Poster','ipsum',NULL,'1979-01-05 07:24:34','2022-01-10 21:07:12'),(25,'Poster','nulla',NULL,'2008-12-26 19:04:10','2021-07-14 06:11:08'),(26,'Trailer','fugit',NULL,'2017-01-04 23:15:57','2022-05-11 21:30:42'),(27,'Trailer','magnam',NULL,'1989-06-18 00:54:21','2022-04-08 17:38:03'),(28,'Trailer','dolores',NULL,'2022-05-05 15:00:59','2021-05-21 16:19:11'),(29,'Trailer','accusantium',NULL,'1983-05-06 13:44:00','2021-09-12 15:51:57'),(30,'Trailer','porro',NULL,'1999-08-20 12:55:22','2022-01-03 03:06:42'),(31,'Trailer','velit',NULL,'1993-02-26 12:43:34','2021-09-29 04:12:47'),(32,'Poster','ipsa',NULL,'1980-04-28 03:03:19','2021-06-05 20:16:50'),(33,'Trailer','laudantium',NULL,'1975-07-12 23:13:10','2021-07-31 15:59:30'),(34,'Trailer','quo',NULL,'2005-06-29 18:05:55','2021-09-07 04:19:36'),(35,'Trailer','et',NULL,'1998-07-06 00:36:16','2021-12-28 01:30:15'),(36,'Trailer','qui',NULL,'1973-11-16 03:06:46','2021-11-27 05:25:11'),(37,'Poster','porro',NULL,'1979-07-07 07:52:05','2021-10-02 10:48:51'),(38,'Trailer','numquam',NULL,'2002-11-04 01:36:34','2022-02-10 19:08:06'),(39,'Trailer','repellendus',NULL,'2000-06-14 01:06:18','2021-11-04 18:20:18'),(40,'Poster','quasi',NULL,'1995-12-09 18:10:45','2021-08-07 16:39:14');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,8,'Hello dude.','2022-05-13 03:25:29'),(2,6,1,'Do you like this?','2022-05-08 05:13:06'),(3,5,5,'Laboriosam dolorem sit minus tenetur omnis.','2022-04-26 15:26:40'),(4,9,10,'Officiis ea dolorum consequuntur vitae nisi asperiores qui.','2022-05-09 17:32:00'),(5,3,4,'Tempore voluptatibus impedit doloremque illo et quaerat quam quidem.','2022-05-10 00:04:32'),(6,3,3,'Et optio omnis reprehenderit sint corrupti dolor quod.','2022-05-15 08:47:16'),(7,8,3,'Eaque dicta corporis eius voluptate illo ex.','2022-05-10 08:02:40'),(8,1,2,'Incidunt sit laudantium voluptatum natus perferendis quod animi.','2022-04-20 10:53:43'),(9,1,1,'Cumque dolorem beatae dolore corporis provident quia inventore.','2022-04-22 23:59:52'),(10,5,1,'Reiciendis quis et quam eum sint nulla commodi.','2022-04-30 02:10:46');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` char(1) DEFAULT NULL COMMENT 'Пол',
  `firstname` varchar(100) DEFAULT NULL COMMENT 'Имя',
  `lastname` varchar(100) DEFAULT NULL COMMENT 'Фамилия',
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','Joaquin','Schaefer','2017-06-11','2014-02-26 09:26:17','2022-04-18 10:15:06'),(2,'f','Cheryl','Prohaska','2022-04-14','2016-03-24 20:36:56','2022-05-06 16:07:47'),(3,'m','Nate','Towne','1993-05-14','2016-09-06 18:36:13','2022-04-22 19:25:49'),(4,'f','Nicole','OReilly','1994-07-07','2016-12-23 03:14:09','2022-04-25 04:21:38'),(5,'m','Jeromy','Macejkovic','1995-07-02','2016-12-07 18:56:45','2022-05-12 08:00:45'),(6,'f','Antonietta','Mayert','2005-06-17','2015-09-03 04:13:09','2022-05-01 13:33:19'),(7,'m','Maryse','Dare','1998-06-23','2017-07-22 14:10:52','2022-05-09 14:29:22'),(8,'m','Jarrell','Mayer','2009-09-25','2019-09-09 15:00:02','2022-04-30 20:13:26'),(9,'f','Dorothy','Dickinson','2021-10-18','2020-08-19 14:33:08','2022-04-21 02:26:18'),(10,'f','Jane','Grady','2008-04-29','2015-02-03 09:48:39','2022-05-16 13:04:38');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials`
--

DROP TABLE IF EXISTS `serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned NOT NULL,
  `director_id` bigint unsigned NOT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `season_id` bigint unsigned NOT NULL,
  `genre_id` bigint unsigned NOT NULL,
  `poster_id` bigint unsigned NOT NULL,
  `trailer_id` bigint unsigned NOT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `serial_title` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `country_id` (`country_id`),
  KEY `director_id` (`director_id`),
  KEY `actor_id` (`actor_id`),
  KEY `genre_id` (`genre_id`),
  KEY `poster_id` (`poster_id`),
  KEY `trailer_id` (`trailer_id`),
  KEY `serials_ibfk_7` (`season_id`),
  CONSTRAINT `serials_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_4` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_5` FOREIGN KEY (`poster_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_6` FOREIGN KEY (`trailer_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_7` FOREIGN KEY (`season_id`) REFERENCES `serials_seasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials`
--

LOCK TABLES `serials` WRITE;
/*!40000 ALTER TABLE `serials` DISABLE KEYS */;
INSERT INTO `serials` VALUES (1,11,7,6,2,15,29,26,NULL,'1981-05-05 03:51:16','1971-09-29 11:27:04','Ходячие мертвецы'),(2,7,6,14,4,13,3,30,NULL,'1977-12-05 18:15:32','2000-08-13 04:50:55','Игра престолов'),(3,6,11,10,5,12,40,13,NULL,'2014-12-21 23:19:19','2009-07-07 09:09:24','Игра в кальмара'),(4,1,5,8,6,17,32,39,NULL,'2014-01-07 20:56:58','1981-03-04 15:41:43','Декстер'),(5,9,6,13,3,4,18,23,NULL,'1978-03-03 16:03:40','2000-03-11 00:49:52','Во все тяжкие'),(6,3,10,14,2,4,9,1,NULL,'2004-11-13 23:25:55','2015-06-06 21:49:19','Острые козырьки'),(7,8,7,8,5,2,23,39,NULL,'2014-01-09 15:06:58','2012-12-27 11:14:05','Флэш'),(8,10,1,12,4,1,30,1,NULL,'1974-04-22 11:27:50','2006-02-04 11:13:06','Ход королевы'),(9,6,10,3,6,2,34,3,NULL,'1970-01-17 22:36:15','2005-07-24 00:43:29','Китайский городовой'),(10,7,13,11,6,11,37,26,NULL,'1995-08-15 01:26:09','2015-08-12 23:52:00','Отчаянные домохозяйки');
/*!40000 ALTER TABLE `serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials_episodes`
--

DROP TABLE IF EXISTS `serials_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serials_episodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serials_id` bigint unsigned NOT NULL,
  `season_id` bigint unsigned NOT NULL,
  `episode_release_date` date DEFAULT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `serial_episode_title` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `serials_id` (`serials_id`),
  CONSTRAINT `serials_episodes_ibfk_1` FOREIGN KEY (`serials_id`) REFERENCES `serials` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_episodes`
--

LOCK TABLES `serials_episodes` WRITE;
/*!40000 ALTER TABLE `serials_episodes` DISABLE KEYS */;
INSERT INTO `serials_episodes` VALUES (1,9,7,'1998-01-11',NULL,'1973-08-19 21:13:31','2018-12-26 09:14:16','Псы войны'),(2,4,2,'2015-07-07',NULL,'2014-10-25 21:05:11','1972-02-07 16:21:20','Пепел'),(3,2,7,'2010-05-02',NULL,'1973-10-20 09:10:16','1970-12-15 11:02:44','Враг в отражении'),(4,3,4,'1993-11-08',NULL,'1975-01-30 13:07:39','2017-03-19 15:35:42','Серия 3'),(5,1,8,'1972-11-15',NULL,'1992-02-05 05:05:46','2005-08-23 00:08:56','Игра с огнем'),(6,3,5,'1975-11-22',NULL,'2012-03-25 15:44:41','2000-01-05 16:53:42','Интрига'),(7,7,5,'1991-09-28',NULL,'2004-05-05 09:29:35','1976-01-19 16:59:59','Заказ'),(8,6,6,'1990-08-11',NULL,'1997-08-11 08:47:54','1993-08-05 03:20:48','Ограниченные условия'),(9,5,8,'2003-01-28',NULL,'2002-02-18 18:01:04','1972-01-07 04:48:35','Серия 5'),(10,7,4,'1975-11-18',NULL,'2020-12-06 05:56:40','1993-11-11 17:02:01','7-я серия');
/*!40000 ALTER TABLE `serials_episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `serials_info`
--

DROP TABLE IF EXISTS `serials_info`;
/*!50001 DROP VIEW IF EXISTS `serials_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `serials_info` AS SELECT 
 1 AS `Название`,
 1 AS `Страна производства`,
 1 AS `Режиссёр`,
 1 AS `В ролях`,
 1 AS `Жанр`,
 1 AS `Постер сериала`,
 1 AS `Трейлер сериала`,
 1 AS `Рейтинг сериала`,
 1 AS `Информация о сезоне, дата выхода`,
 1 AS `Рейтинг сезона`,
 1 AS `Эпизод, дата выхода`,
 1 AS `Рейтинг эпизода`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `serials_seasons`
--

DROP TABLE IF EXISTS `serials_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serials_seasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('Анонс','В производстве','Постпродакшен','Премьера','Премьера онлайн') DEFAULT NULL,
  `episode_id` bigint unsigned NOT NULL,
  `serials_id` bigint unsigned NOT NULL,
  `season_release_date` date DEFAULT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `serials_seasons_ibfk_1` (`episode_id`),
  CONSTRAINT `serials_seasons_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `serials_episodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_seasons`
--

LOCK TABLES `serials_seasons` WRITE;
/*!40000 ALTER TABLE `serials_seasons` DISABLE KEYS */;
INSERT INTO `serials_seasons` VALUES (1,'Постпродакшен',3,6,'1989-02-03',NULL,'2007-04-02 00:23:01','1981-09-27 04:50:38'),(2,'Постпродакшен',3,1,'2018-11-25',NULL,'1985-07-24 04:11:36','2020-06-13 02:35:19'),(3,'Премьера',4,5,'2017-12-03',NULL,'2009-01-05 04:25:51','1972-12-31 21:44:12'),(4,'В производстве',5,4,'1986-02-24',NULL,'2020-05-31 21:46:34','2017-11-09 23:34:26'),(5,'В производстве',3,7,'1976-11-15',NULL,'2011-10-16 12:43:54','1992-11-18 10:12:51'),(6,'Премьера онлайн',2,10,'2014-09-08',NULL,'2020-05-16 07:25:08','1981-09-16 14:22:48'),(7,'Постпродакшен',3,9,'1992-01-27',NULL,'1999-11-30 20:44:55','2003-03-03 04:33:40'),(8,'Постпродакшен',6,3,'2001-06-21',NULL,'1976-07-14 06:52:20','1994-05-16 03:56:49');
/*!40000 ALTER TABLE `serials_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_actors`
--

DROP TABLE IF EXISTS `test_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_actors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `actor` varchar(255) DEFAULT NULL,
  `users_rating` float DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_actors`
--

LOCK TABLES `test_actors` WRITE;
/*!40000 ALTER TABLE `test_actors` DISABLE KEYS */;
INSERT INTO `test_actors` VALUES (1,'Николь',NULL),(2,'Брюс',NULL),(3,'Шарлиз',NULL),(4,'Энтони',NULL),(5,'Марго',NULL),(6,'Анджелина',NULL),(7,'Джейк',NULL),(8,'Моника',NULL),(9,'Киану',NULL),(10,'Чжан',NULL),(11,'Джеки',NULL),(12,'Марион',NULL),(13,'Том',NULL),(14,'Кристиан',NULL),(15,'Эмма',NULL);
/*!40000 ALTER TABLE `test_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_film`
--

DROP TABLE IF EXISTS `test_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_film` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `film_title` varchar(255) DEFAULT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_film`
--

LOCK TABLES `test_film` WRITE;
/*!40000 ALTER TABLE `test_film` DISABLE KEYS */;
INSERT INTO `test_film` VALUES (1,'Матрица',NULL,'1980-02-01 21:15:48','2012-07-18 23:43:44'),(2,'Правдивая ложь',NULL,'2003-07-20 04:05:48','2016-03-19 21:17:47'),(3,'Мистер и миссис Смит',NULL,'1975-09-13 06:18:54','1999-08-17 04:44:24'),(4,'Бойцовский клуб',NULL,'1981-03-12 14:07:44','2010-03-06 16:40:32'),(5,'Интерстеллар',NULL,'2004-12-15 15:19:56','1983-04-02 23:34:45'),(6,'Бегущий по лезвию 2049',NULL,'2017-10-29 19:03:19','2004-08-05 11:09:20'),(7,'Джентельмены',NULL,'1992-05-11 02:11:48','2015-07-25 14:43:42'),(8,'Криминальное чтиво',NULL,'1970-09-14 00:30:38','1985-08-18 10:24:19'),(9,'Район №9',NULL,'2007-05-19 03:45:42','1976-11-12 20:05:49'),(10,'Пятый элемент',NULL,'2016-10-04 12:27:04','1983-10-27 07:25:32');
/*!40000 ALTER TABLE `test_film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kling.myrtie@gmail.com','a2ce1584e07cafaaddd6098c54477ab400c32dd2'),(2,'adaline.brown@gmail.com','e07744a8b47b53b3c16789231181cf8dd9982029'),(3,'qleffler@yahoo.com','09ebed1dbb26b116cab62732a3150a69da510588'),(4,'uriel.stiedemann@gmail.com','38781a5cfa5dd6c05899a52cadf86acda76bda69'),(5,'conner15@gmail.com','f9d96680d6dbdf4663b6895a4974194849c5aa37'),(6,'herman.wilbert@gmail.com','687bfefcc1e644c17878538ac05278b380f1ea9f'),(7,'landen.lebsack@yahoo.com','e45228d7464c89a81bd7fedcc095961e8b4de578'),(8,'mherzog@hotmail.com','ecd6ea5d5a6afeea2fe52c7ee297c010fc9e2354'),(9,'schaefer.kevon@yahoo.com','98e661cb93769d4e2a7b0548263d003925c7b0ac'),(10,'tanderson@gmail.com','4374a08fc0b3bf5daf491b2c2d93e077db215616');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_ratings`
--

DROP TABLE IF EXISTS `users_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_ratings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `serials_id` bigint unsigned NOT NULL,
  `serials_rating` float DEFAULT NULL,
  `season_id` bigint unsigned NOT NULL,
  `season_rating` float DEFAULT NULL,
  `episode_id` bigint unsigned NOT NULL,
  `episode_rating` float DEFAULT NULL,
  `film_id` bigint unsigned NOT NULL,
  `film_rating` float DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_rating` float DEFAULT NULL,
  `director_id` bigint unsigned NOT NULL,
  `director_rating` float DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `serials_id` (`serials_id`),
  KEY `season_id` (`season_id`),
  KEY `episode_id` (`episode_id`),
  KEY `film_id` (`film_id`),
  KEY `actor_id` (`actor_id`),
  KEY `director_id` (`director_id`),
  CONSTRAINT `users_ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ratings_ibfk_2` FOREIGN KEY (`serials_id`) REFERENCES `serials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ratings_ibfk_3` FOREIGN KEY (`season_id`) REFERENCES `serials_seasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ratings_ibfk_4` FOREIGN KEY (`episode_id`) REFERENCES `serials_episodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ratings_ibfk_5` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ratings_ibfk_6` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ratings_ibfk_7` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_ratings`
--

LOCK TABLES `users_ratings` WRITE;
/*!40000 ALTER TABLE `users_ratings` DISABLE KEYS */;
INSERT INTO `users_ratings` VALUES (1,7,5,4,4,2,2,7,6,3,7,4,15,2),(2,1,2,9,1,5,8,8,9,9,15,3,4,5),(3,1,7,9,3,2,8,5,4,9,3,6,4,3),(4,2,1,6,4,4,7,10,1,10,7,7,1,5),(5,3,2,3,6,5,6,9,9,5,1,8,7,8),(6,9,10,8,3,4,6,3,9,4,12,4,4,1),(7,3,3,4,3,2,1,9,4,6,11,5,6,9),(8,8,8,3,3,9,7,6,8,6,13,8,6,9),(9,5,4,4,1,9,5,6,3,8,14,8,1,6),(10,10,3,5,6,6,2,5,4,2,6,3,15,6),(11,6,9,1,6,4,8,9,5,5,7,3,6,2),(12,10,9,8,6,2,6,4,6,10,10,8,11,8),(13,1,10,6,6,3,8,6,10,7,15,7,10,3),(14,10,2,4,3,10,8,8,6,6,11,2,1,9),(15,7,7,8,2,7,4,9,7,7,3,4,10,5),(16,6,2,7,4,6,7,5,3,2,8,9,13,6),(17,4,10,8,4,6,6,5,3,5,8,7,14,1),(18,2,2,5,3,2,6,2,8,5,5,3,1,1),(19,8,10,7,4,3,5,7,8,6,6,3,1,7),(20,8,4,7,3,4,5,5,10,7,8,6,10,3);
/*!40000 ALTER TABLE `users_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `film_info`
--

/*!50001 DROP VIEW IF EXISTS `film_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `film_info` AS select `f`.`film_title` AS `Название`,`f`.`film_release_date` AS `Дата выхода`,`c`.`country` AS `Страна производства`,concat(`d`.`director_firstname`,' ',`d`.`director_lastname`) AS `Режиссёр`,concat(`a`.`actor_firstname`,' ',`a`.`actor_lastname`) AS `В ролях`,`g`.`name` AS `Жанр`,`m1`.`filename` AS `Постер`,`m2`.`filename` AS `Трейлер`,`f`.`status` AS `Статус`,round(avg(`ur`.`film_rating`),1) AS `Рейтинг` from (((((((`films` `f` join `countries` `c` on((`f`.`country_id` = `c`.`id`))) join `directors` `d` on((`f`.`director_id` = `d`.`id`))) join `actors` `a` on((`f`.`actor_id` = `a`.`id`))) join `genres` `g` on((`f`.`genre_id` = `g`.`id`))) join `media` `m1` on((`f`.`poster_id` = `m1`.`id`))) join `media` `m2` on((`f`.`trailer_id` = `m2`.`id`))) join `users_ratings` `ur` on((`f`.`id` = `ur`.`film_id`))) group by `f`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `serials_info`
--

/*!50001 DROP VIEW IF EXISTS `serials_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `serials_info` AS select `s`.`serial_title` AS `Название`,`c`.`country` AS `Страна производства`,concat(`d`.`director_firstname`,' ',`d`.`director_lastname`) AS `Режиссёр`,concat(`a`.`actor_firstname`,' ',`a`.`actor_lastname`) AS `В ролях`,`g`.`name` AS `Жанр`,`m1`.`filename` AS `Постер сериала`,`m2`.`filename` AS `Трейлер сериала`,round(avg(`ur`.`serials_rating`),1) AS `Рейтинг сериала`,concat(`ss`.`id`,' ','сезон,',' ',`ss`.`status`,', ',`ss`.`season_release_date`) AS `Информация о сезоне, дата выхода`,round(avg(`ur`.`season_rating`),1) AS `Рейтинг сезона`,concat(`se`.`serial_episode_title`,', ',`se`.`episode_release_date`) AS `Эпизод, дата выхода`,round(avg(`ur`.`episode_rating`),1) AS `Рейтинг эпизода` from (((((((((`serials` `s` join `countries` `c` on((`s`.`country_id` = `c`.`id`))) join `directors` `d` on((`s`.`director_id` = `d`.`id`))) join `actors` `a` on((`s`.`actor_id` = `a`.`id`))) join `genres` `g` on((`s`.`genre_id` = `g`.`id`))) join `serials_seasons` `ss` on((`s`.`season_id` = `ss`.`id`))) join `serials_episodes` `se` on((`ss`.`episode_id` = `se`.`id`))) join `media` `m1` on((`s`.`poster_id` = `m1`.`id`))) join `media` `m2` on((`s`.`trailer_id` = `m2`.`id`))) join `users_ratings` `ur` on((`s`.`id` = `ur`.`serials_id`))) group by `s`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06  3:37:39
