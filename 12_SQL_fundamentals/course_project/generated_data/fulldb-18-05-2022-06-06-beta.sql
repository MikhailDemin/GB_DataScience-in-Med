-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_22
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'f','Merritt','Bradtke','1980-04-23',4,NULL,'2014-09-07 21:23:38','2022-01-23 01:53:49'),(2,'f','Lenny','Jerde','2004-10-15',5,NULL,'2015-06-18 08:09:09','2022-02-17 06:08:17'),(3,'f','Jamey','Hauck','1986-10-23',6,NULL,'2021-08-27 06:24:00','2022-03-21 20:25:47'),(4,'f','Bud','Douglas','2017-05-06',3,NULL,'2014-04-27 16:05:25','2022-04-02 18:53:36'),(5,'f','Gayle','Boyle','2015-02-28',8,NULL,'2021-05-08 14:33:21','2022-04-23 07:51:46'),(6,'f','Ava','Ryan','1994-08-19',1,NULL,'2019-02-01 03:39:17','2021-09-28 07:08:12'),(7,'f','Enrique','Moore','2013-04-19',6,NULL,'2020-06-03 11:56:42','2021-05-20 15:39:40'),(8,'f','Loraine','Gusikowski','2014-03-27',3,NULL,'2014-01-06 23:44:09','2021-11-12 12:22:51'),(9,'f','Tamia','Legros','2015-09-23',5,NULL,'2014-01-16 00:46:11','2022-02-02 05:37:46'),(10,'f','Amir','Cummerata','2014-10-22',10,NULL,'2021-02-16 21:28:41','2022-03-22 16:13:46'),(11,'m','Gunner','Kub','2002-03-02',3,NULL,'2015-02-08 23:59:00','2021-11-21 12:24:48'),(12,'f','Enos','Oberbrunner','1993-04-21',4,NULL,'2019-01-11 02:55:14','2021-12-06 16:52:45'),(13,'f','Demetrius','Casper','1977-01-05',9,NULL,'2019-11-28 16:12:16','2021-11-19 04:53:10'),(14,'m','Dayne','Walsh','1991-06-25',9,NULL,'2016-05-30 08:56:28','2022-04-06 12:11:14'),(15,'f','Eric','Schoen','2013-12-26',9,NULL,'2012-07-12 03:31:01','2022-05-16 16:01:43');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Индия'),(2,'Ю. Корея'),(3,'Россия'),(4,'Франция'),(5,'США'),(6,'Великобритания'),(7,'Украина'),(8,'Франция'),(9,'Германия'),(10,'Индия'),(11,'Великобритания');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'f','Demond','Robel','2022-05-14',11,NULL,'1982-10-30 10:52:06','2020-05-14 04:11:31'),(2,'f','Kathryne','Hermann','2010-06-27',2,NULL,'2021-09-10 01:31:20','1990-09-19 12:12:25'),(3,'f','Marcelle','Lang','1970-12-08',2,NULL,'1974-06-25 06:32:13','1979-08-03 06:21:50'),(4,'f','Westley','Corkery','1992-03-23',2,NULL,'1986-08-19 22:38:10','2018-11-26 13:07:51'),(5,'f','Vicky','Howell','1976-08-18',9,NULL,'1981-05-23 14:04:32','2013-12-30 01:39:01'),(6,'m','Guillermo','Aufderhar','1996-01-25',10,NULL,'2011-04-09 00:33:11','1975-05-13 05:54:41'),(7,'m','Edgar','Bayer','2006-12-18',10,NULL,'1978-11-17 05:21:13','2000-11-23 06:50:09'),(8,'f','Savanna','Lemke','1973-07-23',8,NULL,'1999-12-06 18:37:21','2000-04-07 13:26:19'),(9,'f','Edward','O\'Connell','2018-12-05',2,NULL,'2017-04-30 04:40:25','1986-02-23 09:05:30'),(10,'m','Celia','Veum','2007-02-11',5,NULL,'1993-09-24 11:40:52','1973-02-26 05:08:53'),(11,'m','Travis','Braun','1972-08-17',7,NULL,'1994-04-04 02:36:27','1998-02-02 18:45:15'),(12,'m','Maria','Stracke','2015-10-10',9,NULL,'2012-10-19 20:42:18','2007-12-10 12:36:19'),(13,'f','Maxie','Hamill','2006-12-25',1,NULL,'2017-06-26 06:04:58','1994-07-30 04:01:45'),(14,'f','Marion','Hudson','2015-12-01',5,NULL,'1998-06-19 16:50:19','2013-09-16 19:17:06'),(15,'m','Coy','Green','1975-06-14',8,NULL,'1982-07-19 08:55:17','2010-12-06 05:57:07');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,1,4,4,'1983-01-30',7,'В производстве',25,37,NULL,'1980-02-01 21:15:48','2012-07-18 23:43:44'),(2,8,12,13,'2014-06-09',4,'Премьера',34,10,NULL,'2003-07-20 04:05:48','2016-03-19 21:17:47'),(3,9,10,14,'2009-03-10',14,'В производстве',23,37,NULL,'1975-09-13 06:18:54','1999-08-17 04:44:24'),(4,5,5,9,'1986-12-02',9,'Постпродакшен',40,24,NULL,'1981-03-12 14:07:44','2010-03-06 16:40:32'),(5,2,15,6,'1989-10-27',5,'Премьера онлайн',21,4,NULL,'2004-12-15 15:19:56','1983-04-02 23:34:45'),(6,10,13,9,'1982-07-04',4,'Премьера',25,3,NULL,'2017-10-29 19:03:19','2004-08-05 11:09:20'),(7,2,14,13,'2014-08-08',6,'В производстве',12,20,NULL,'1992-05-11 02:11:48','2015-07-25 14:43:42'),(8,9,4,1,'1996-02-05',6,'Премьера',18,36,NULL,'1970-09-14 00:30:38','1985-08-18 10:24:19'),(9,9,9,2,'2001-03-23',14,'Премьера онлайн',14,26,NULL,'2007-05-19 03:45:42','1976-11-12 20:05:49'),(10,3,11,10,'2018-06-03',4,'Премьера',8,25,NULL,'2016-10-04 12:27:04','1983-10-27 07:25:32');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type` enum('Poster','Trailer') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'Poster','fugiat',NULL,'1975-08-19 10:15:20','2022-04-12 06:29:07'),(2,'Poster','aperiam',NULL,'1985-06-17 06:40:45','2021-11-04 19:10:05'),(3,'Trailer','ipsam',NULL,'1995-10-21 06:22:22','2022-04-09 10:17:53'),(4,'Trailer','ipsa',NULL,'1977-11-15 04:21:53','2021-06-30 02:08:14'),(5,'Trailer','autem',NULL,'1975-03-13 02:54:39','2022-01-11 03:14:23'),(6,'Poster','sapiente',NULL,'1983-05-03 11:15:10','2022-04-18 13:21:29'),(7,'Poster','laudantium',NULL,'2010-12-18 14:07:52','2022-04-03 09:24:03'),(8,'Poster','laboriosam',NULL,'2000-07-29 15:43:21','2022-05-16 23:14:40'),(9,'Trailer','eos',NULL,'1991-04-22 01:33:22','2021-10-30 06:16:51'),(10,'Poster','ad',NULL,'2002-07-15 23:30:59','2021-12-28 01:34:08'),(11,'Poster','labore',NULL,'1973-12-09 17:03:03','2021-09-24 04:29:09'),(12,'Trailer','iure',NULL,'1973-03-18 13:58:28','2021-06-18 15:15:26'),(13,'Trailer','ipsam',NULL,'2000-06-05 22:51:19','2021-06-03 09:56:18'),(14,'Poster','iusto',NULL,'2003-06-25 07:23:05','2022-01-29 19:33:32'),(15,'Trailer','non',NULL,'2015-02-03 21:15:05','2022-03-16 22:10:25'),(16,'Trailer','cumque',NULL,'2006-02-24 02:16:31','2021-07-29 13:27:12'),(17,'Poster','natus',NULL,'2009-02-01 12:36:02','2021-11-26 21:39:29'),(18,'Poster','voluptatibus',NULL,'2003-11-14 06:34:56','2021-09-11 11:11:27'),(19,'Poster','voluptas',NULL,'1973-09-01 05:48:59','2021-10-31 11:08:34'),(20,'Poster','natus',NULL,'1994-09-07 06:33:10','2022-03-11 03:32:12'),(21,'Poster','placeat',NULL,'1986-10-25 00:19:26','2021-06-26 20:20:24'),(22,'Poster','reiciendis',NULL,'1991-08-04 13:40:56','2022-04-14 06:50:12'),(23,'Trailer','nam',NULL,'2017-11-09 22:36:59','2022-02-05 21:18:22'),(24,'Poster','ipsum',NULL,'1979-01-05 07:24:34','2022-01-10 21:07:12'),(25,'Poster','nulla',NULL,'2008-12-26 19:04:10','2021-07-14 06:11:08'),(26,'Trailer','fugit',NULL,'2017-01-04 23:15:57','2022-05-11 21:30:42'),(27,'Trailer','magnam',NULL,'1989-06-18 00:54:21','2022-04-08 17:38:03'),(28,'Trailer','dolores',NULL,'2022-05-05 15:00:59','2021-05-21 16:19:11'),(29,'Trailer','accusantium',NULL,'1983-05-06 13:44:00','2021-09-12 15:51:57'),(30,'Trailer','porro',NULL,'1999-08-20 12:55:22','2022-01-03 03:06:42'),(31,'Trailer','velit',NULL,'1993-02-26 12:43:34','2021-09-29 04:12:47'),(32,'Poster','ipsa',NULL,'1980-04-28 03:03:19','2021-06-05 20:16:50'),(33,'Trailer','laudantium',NULL,'1975-07-12 23:13:10','2021-07-31 15:59:30'),(34,'Trailer','quo',NULL,'2005-06-29 18:05:55','2021-09-07 04:19:36'),(35,'Trailer','et',NULL,'1998-07-06 00:36:16','2021-12-28 01:30:15'),(36,'Trailer','qui',NULL,'1973-11-16 03:06:46','2021-11-27 05:25:11'),(37,'Poster','porro',NULL,'1979-07-07 07:52:05','2021-10-02 10:48:51'),(38,'Trailer','numquam',NULL,'2002-11-04 01:36:34','2022-02-10 19:08:06'),(39,'Trailer','repellendus',NULL,'2000-06-14 01:06:18','2021-11-04 18:20:18'),(40,'Poster','quasi',NULL,'1995-12-09 18:10:45','2021-08-07 16:39:14');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,8,'Explicabo nam quo dolorem et magnam numquam. Est ipsa qui ducimus et est sed explicabo.','2022-05-13 03:25:29'),(2,6,1,'Ut ut sit aut et maxime ducimus. Dicta nisi debitis excepturi ut voluptates. Accusamus nihil dolorum molestiae dolor ut.','2022-05-08 05:13:06'),(3,5,5,'Laboriosam dolorem sit minus tenetur omnis. Totam quia numquam dicta porro quis quis. Rerum veniam perferendis eos vel sit tenetur. Quos corrupti reiciendis et ea quo dicta.','2022-04-26 15:26:40'),(4,9,10,'Officiis ea dolorum consequuntur vitae nisi asperiores qui. Labore minima harum aut quis earum quis voluptas. Ut iste quam saepe magnam qui laborum corporis. Voluptas delectus itaque at maxime molestiae fuga.','2022-05-09 17:32:00'),(5,3,4,'Tempore voluptatibus impedit doloremque illo et quaerat quam quidem. Nihil libero aspernatur voluptatum quo. Fugiat sapiente soluta harum cupiditate quia quis nulla. Non aliquam voluptatem eligendi eos quis repellendus. Sed neque temporibus ut est modi magnam sint.','2022-05-10 00:04:32'),(6,3,3,'Et optio omnis reprehenderit sint corrupti dolor quod. Sit ut dicta corporis explicabo nam. Quia ut et quo impedit.','2022-05-15 08:47:16'),(7,8,3,'Eaque dicta corporis eius voluptate illo ex. Dolores quis accusantium soluta voluptas similique soluta rerum. Perspiciatis voluptas sit perspiciatis.','2022-05-10 08:02:40'),(8,1,2,'Incidunt sit laudantium voluptatum natus perferendis quod animi. Saepe a est et optio eos assumenda ut. Dolor totam est voluptas ratione error nesciunt. Aperiam non sit aut ipsum recusandae in et occaecati.','2022-04-20 10:53:43'),(9,1,1,'Cumque dolorem beatae dolore corporis provident quia inventore. Et voluptatem sint iste aut similique accusamus vel. Inventore sed quis aut. Sint ut sit quia culpa voluptatem optio libero.','2022-04-22 23:59:52'),(10,5,1,'Reiciendis quis et quam eum sint nulla commodi. Doloribus omnis nisi itaque iste vel dolorem. Ut quae odit tenetur quo autem. Corrupti sint animi voluptatem aut.','2022-04-30 02:10:46');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','Joaquin','Schaefer','2017-06-11','2014-02-26 09:26:17','2022-04-18 10:15:06'),(2,'m','Cornell','Prohaska','2022-04-14','2016-03-24 20:36:56','2022-05-06 16:07:47'),(3,'m','Nicola','Towne','1993-05-14','2016-09-06 18:36:13','2022-04-22 19:25:49'),(4,'m','Llewellyn','O\'Reilly','1994-07-07','2016-12-23 03:14:09','2022-04-25 04:21:38'),(5,'m','Jeromy','Macejkovic','1995-07-02','2016-12-07 18:56:45','2022-05-12 08:00:45'),(6,'f','Antonietta','Mayert','2005-06-17','2015-09-03 04:13:09','2022-05-01 13:33:19'),(7,'m','Maryse','Dare','1998-06-23','2017-07-22 14:10:52','2022-05-09 14:29:22'),(8,'m','Jarrell','Mayer','2009-09-25','2019-09-09 15:00:02','2022-04-30 20:13:26'),(9,'f','Don','Dickinson','2021-10-18','2020-08-19 14:33:08','2022-04-21 02:26:18'),(10,'f','Johnny','Grady','2008-04-29','2015-02-03 09:48:39','2022-05-16 13:04:38');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials`
--

DROP TABLE IF EXISTS `serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `director_id` bigint(20) unsigned NOT NULL,
  `actor_id` bigint(20) unsigned NOT NULL,
  `season_id` bigint(20) unsigned NOT NULL,
  `genre_id` bigint(20) unsigned NOT NULL,
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
  KEY `serials_ibfk_7` (`season_id`),
  CONSTRAINT `serials_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_4` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_5` FOREIGN KEY (`poster_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_6` FOREIGN KEY (`trailer_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `serials_ibfk_7` FOREIGN KEY (`season_id`) REFERENCES `serials_seasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials`
--

LOCK TABLES `serials` WRITE;
/*!40000 ALTER TABLE `serials` DISABLE KEYS */;
/*!40000 ALTER TABLE `serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials_episodes`
--

DROP TABLE IF EXISTS `serials_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serials_episodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `serials_id` bigint(20) unsigned NOT NULL,
  `season_id` bigint(20) unsigned NOT NULL,
  `episode_release_date` date DEFAULT NULL,
  `users_rating` double DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `serials_id` (`serials_id`),
  CONSTRAINT `serials_episodes_ibfk_1` FOREIGN KEY (`serials_id`) REFERENCES `serials` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_episodes`
--

LOCK TABLES `serials_episodes` WRITE;
/*!40000 ALTER TABLE `serials_episodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `serials_episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serials_seasons`
--

DROP TABLE IF EXISTS `serials_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serials_seasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('Анонс','В производстве','Постпродакшен','Премьера','Премьера онлайн') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `episode_id` bigint(20) unsigned NOT NULL,
  `serials_id` bigint(20) unsigned NOT NULL,
  `season_release_date` date DEFAULT NULL,
  `users_rating` double DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `serials_seasons_ibfk_1` (`episode_id`),
  CONSTRAINT `serials_seasons_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `serials_episodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_seasons`
--

LOCK TABLES `serials_seasons` WRITE;
/*!40000 ALTER TABLE `serials_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `serials_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `serials_id` bigint(20) unsigned NOT NULL,
  `serials_rating` double DEFAULT NULL,
  `season_id` bigint(20) unsigned NOT NULL,
  `season_rating` double DEFAULT NULL,
  `episode_id` bigint(20) unsigned NOT NULL,
  `episode_rating` double DEFAULT NULL,
  `film_id` bigint(20) unsigned NOT NULL,
  `film_rating` double DEFAULT NULL,
  `actor_id` bigint(20) unsigned NOT NULL,
  `actor_rating` double DEFAULT NULL,
  `director_id` bigint(20) unsigned NOT NULL,
  `director_rating` double DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_ratings`
--

LOCK TABLES `users_ratings` WRITE;
/*!40000 ALTER TABLE `users_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18  6:06:54
