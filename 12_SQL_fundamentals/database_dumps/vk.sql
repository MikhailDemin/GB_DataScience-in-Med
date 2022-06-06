-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: vk
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
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `initiator_user_id` bigint unsigned NOT NULL,
  `target_user_id` bigint unsigned NOT NULL,
  `started_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `finished_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  UNIQUE KEY `id` (`id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `calls_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `calls_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `calls_chk_1` CHECK ((`initiator_user_id` <> `target_user_id`))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
INSERT INTO `calls` VALUES (31,1,13,'1984-03-14 00:41:03','1999-02-24 01:04:44'),(32,2,25,'1994-03-11 05:49:48','2018-09-21 01:51:20'),(33,3,4,'1985-01-03 04:00:53','2008-05-12 11:56:08'),(34,4,1,'1982-01-30 19:17:06','2020-11-03 20:57:40'),(35,5,24,'1999-12-20 09:57:14','1986-07-02 06:35:12'),(36,6,9,'2017-08-24 12:36:23','1971-12-16 10:59:39'),(37,7,27,'1987-11-16 21:29:00','2012-06-08 13:03:17'),(38,8,14,'2007-10-17 16:51:36','1995-12-12 03:19:58'),(39,9,10,'1998-02-21 06:47:37','1981-05-25 05:09:24'),(40,10,2,'1995-10-20 04:10:27','2005-02-09 15:55:01'),(41,11,19,'2000-04-03 13:47:56','2005-05-20 17:24:37'),(42,12,5,'2013-06-07 14:59:54','2016-01-30 23:59:04'),(43,13,8,'1971-09-29 09:49:28','1972-04-11 02:07:51'),(44,14,15,'1976-01-03 20:04:40','1988-12-26 12:40:42'),(45,15,6,'2017-11-01 04:34:05','2004-11-18 13:05:13'),(46,16,12,'2012-05-24 06:34:23','2001-01-16 00:43:14'),(47,17,3,'1974-11-27 20:29:55','2014-05-13 16:49:26'),(48,18,26,'1994-07-18 18:22:18','2011-09-15 02:26:37'),(49,19,28,'1982-12-04 21:58:24','1994-05-16 21:44:07'),(50,20,18,'1994-08-09 09:23:48','2016-03-24 07:38:49'),(51,22,16,'2011-09-30 15:31:29','2002-07-20 01:33:12'),(52,24,7,'1971-11-16 05:20:15','2014-01-03 05:58:17'),(53,25,29,'1984-11-09 15:09:31','1982-07-02 18:06:45'),(54,26,30,'1992-11-09 21:38:51','2021-11-10 11:41:43'),(55,27,11,'1972-03-05 15:32:45','1996-01-04 11:21:56'),(56,28,17,'1980-07-05 01:10:51','1971-10-03 04:34:20'),(57,29,22,'1984-07-30 11:25:28','1996-02-04 03:45:03'),(58,30,20,'2011-12-23 08:02:46','1977-07-11 18:52:47');
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `admin_user_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'facilis',1),(2,'libero',2),(3,'inventore',3),(4,'explicabo',4),(5,'id',5),(6,'esse',6),(7,'impedit',7),(8,'est',8),(9,'voluptatem',9),(10,'omnis',10),(11,'sint',11),(12,'qui',12),(13,'eius',13),(14,'quis',14),(15,'dolor',15),(16,'omnis',16),(17,'similique',17),(18,'assumenda',18),(19,'et',19),(20,'qui',20),(21,'cumque',21),(22,'maxime',22),(23,'necessitatibus',23),(24,'culpa',24),(25,'quibusdam',25),(26,'error',26),(27,'neque',27),(28,'sapiente',28),(29,'ipsam',29),(30,'ex',30);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `company_site` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `company_site` (`company_site`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`),
  CONSTRAINT `companies_ibfk_2` FOREIGN KEY (`company_site`) REFERENCES `links` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'1979-01-29 00:00:00',56,1),(2,'1971-07-25 00:00:00',18,2),(3,'2013-12-10 00:00:00',9,3),(4,'2010-01-29 00:00:00',38,4),(5,'2019-09-18 00:00:00',10,5),(6,'2010-02-25 00:00:00',40,6),(7,'1976-11-11 00:00:00',25,7),(8,'1986-02-18 00:00:00',68,8),(9,'2008-07-01 00:00:00',26,9),(10,'1988-09-29 00:00:00',4,10),(11,'2013-02-05 00:00:00',37,11),(12,'2022-01-15 00:00:00',12,12),(13,'1988-08-20 00:00:00',20,13),(14,'1992-05-12 00:00:00',3,14),(15,'2020-11-27 00:00:00',51,15),(16,'1993-06-13 00:00:00',49,16),(17,'1992-03-18 00:00:00',57,17),(18,'2012-01-16 00:00:00',15,18),(19,'2018-09-16 00:00:00',11,19),(20,'1984-12-07 00:00:00',23,20),(21,'1985-01-08 00:00:00',35,21),(22,'1975-03-19 00:00:00',44,22),(23,'2022-02-21 00:00:00',48,23),(24,'2007-08-14 00:00:00',62,24),(25,'1979-11-23 00:00:00',66,25),(26,'2011-09-03 00:00:00',70,26),(27,'1989-02-27 00:00:00',19,27),(28,'2005-01-07 00:00:00',54,28),(29,'2011-06-16 00:00:00',2,29),(30,'2006-12-13 00:00:00',41,30);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint unsigned NOT NULL,
  `target_user_id` bigint unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_chk_1` CHECK ((`initiator_user_id` <> `target_user_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,16,'unfriended','2002-06-13 06:03:23','2021-09-08 15:03:31'),(2,24,'approved','1994-08-21 17:32:19','2022-02-01 20:35:26'),(3,20,'requested','1992-12-23 22:33:41','2021-07-01 13:42:26'),(4,28,'declined','2012-04-28 04:54:14','2021-11-03 05:43:33'),(5,13,'unfriended','2014-03-08 03:31:37','2021-10-02 17:17:24'),(6,5,'requested','1992-08-29 00:20:43','2021-12-20 22:59:13'),(7,10,'declined','2010-09-01 14:18:39','2021-08-02 01:07:25'),(8,9,'requested','2017-02-10 04:59:32','2021-03-30 21:53:53'),(9,6,'requested','2010-12-13 12:02:36','2021-10-07 10:50:50'),(10,19,'unfriended','2013-08-25 23:05:05','2022-02-25 22:42:09'),(12,29,'declined','1998-02-01 10:06:47','2021-05-28 16:38:51'),(13,14,'declined','2022-01-07 09:53:29','2021-12-23 17:21:00'),(14,18,'declined','2018-06-03 14:20:29','2021-07-21 13:52:56'),(15,23,'unfriended','2002-09-11 12:45:48','2021-03-21 09:45:05'),(16,22,'approved','2019-02-25 00:45:11','2021-07-26 12:29:00'),(17,25,'unfriended','2014-08-10 10:28:40','2022-02-27 02:01:34'),(18,21,'unfriended','2016-04-25 11:26:27','2021-05-18 10:20:39'),(19,26,'declined','1992-11-24 06:23:56','2021-06-18 18:10:07'),(20,4,'requested','2009-01-23 03:15:52','2021-04-20 23:11:31'),(21,27,'declined','2003-06-21 18:29:05','2021-06-21 11:29:09'),(22,1,'declined','2005-01-19 21:08:14','2021-07-13 23:03:16'),(23,17,'unfriended','2013-02-04 20:09:02','2021-12-09 08:58:14'),(24,2,'approved','1999-05-06 19:23:23','2021-08-07 03:02:01'),(25,8,'approved','2017-01-09 09:08:55','2021-06-05 18:43:02'),(26,30,'requested','2004-07-02 05:03:04','2022-01-31 10:32:34'),(27,15,'unfriended','1993-11-24 07:56:10','2021-11-24 18:37:50'),(28,3,'requested','1996-12-08 15:05:59','2021-10-16 01:48:11'),(29,12,'declined','1999-06-15 22:17:37','2021-11-10 15:54:09'),(30,7,'declined','2015-12-11 21:13:53','2021-12-08 10:30:16');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `fk_likes_user_id` (`user_id`),
  KEY `fk_likes_media_id` (`media_id`),
  CONSTRAINT `fk_likes_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,29,31,'2021-12-15 13:11:28'),(2,16,28,'2021-07-12 04:42:20'),(3,8,33,'2021-05-10 18:50:59'),(4,17,34,'2021-07-20 09:23:24'),(5,8,50,'2021-09-09 00:23:26'),(6,24,43,'2021-03-26 11:45:02'),(7,17,8,'2021-09-13 01:15:14'),(8,9,28,'2021-12-23 09:54:04'),(9,2,36,'2021-11-04 11:07:34'),(10,20,35,'2021-05-01 06:32:31'),(11,16,16,'2021-09-27 03:37:45'),(12,20,50,'2022-01-08 11:19:32'),(13,18,9,'2021-11-25 20:04:53'),(14,13,18,'2021-06-13 23:31:54'),(15,25,33,'2021-11-06 18:40:34'),(16,16,12,'2021-04-25 14:41:28'),(17,30,38,'2021-09-22 08:44:07'),(18,20,38,'2022-02-02 14:07:35'),(19,14,43,'2021-04-05 15:56:01'),(20,21,11,'2021-09-28 15:42:28'),(21,27,35,'2021-04-10 22:41:50'),(22,9,46,'2021-12-31 21:25:56'),(23,22,39,'2021-10-05 13:58:28'),(24,8,32,'2021-11-03 16:35:57'),(25,21,11,'2021-10-23 23:07:06'),(26,26,45,'2021-09-19 00:14:37'),(27,29,27,'2021-07-25 05:42:44'),(28,26,35,'2021-09-03 20:16:27'),(29,11,26,'2022-02-14 07:17:14'),(30,26,18,'2021-04-01 14:25:31'),(31,17,5,'2021-11-06 14:55:29'),(32,27,28,'2022-01-16 16:15:32'),(33,29,8,'2021-08-30 22:36:06'),(34,30,42,'2021-08-12 01:41:03'),(35,12,21,'2021-11-23 23:32:09'),(36,26,34,'2022-01-02 16:13:32'),(37,28,45,'2021-10-09 18:24:45'),(38,16,48,'2021-07-25 01:50:53'),(39,6,44,'2022-02-17 05:24:36'),(40,30,44,'2022-01-26 01:34:59'),(41,11,46,'2021-03-27 09:13:53'),(42,21,14,'2021-06-12 20:14:47'),(43,12,42,'2021-07-15 06:01:39'),(44,27,10,'2021-08-21 16:11:04'),(45,26,17,'2021-04-29 23:08:41'),(46,26,11,'2021-12-24 20:44:07'),(47,13,24,'2021-05-05 08:21:55'),(48,22,29,'2021-12-16 01:18:48'),(49,18,40,'2021-12-16 23:47:14'),(50,15,38,'2021-12-06 05:40:55');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `fk_links_media_id` (`media_id`),
  KEY `fk_links_user_id` (`user_id`),
  CONSTRAINT `fk_links_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_links_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,18,22,'http://www.kohler.com/','ullam','1982-02-01 09:13:50','2022-02-22 03:22:26'),(2,2,21,'http://www.jacobsonschumm.com/','debitis','2013-02-07 20:46:09','2022-02-19 08:29:48'),(3,18,25,'http://hickle.org/','nisi','2014-08-27 19:25:56','2022-03-01 19:26:31'),(4,33,26,'http://olson.com/','dolore','1983-02-22 20:40:47','2022-02-17 13:49:50'),(5,24,16,'http://wilkinsonconnelly.com/','ut','1983-08-05 02:47:50','2022-03-11 05:03:02'),(6,22,23,'http://www.dickinsonohara.com/','labore','2007-04-15 05:45:22','2022-03-08 22:30:32'),(7,14,29,'http://mckenzierogahn.info/','ipsam','1977-09-19 13:40:31','2022-03-06 16:26:22'),(8,37,17,'http://www.cormiercarter.biz/','qui','1976-08-08 15:41:27','2022-03-06 00:43:44'),(9,47,7,'http://www.hamill.org/','nisi','1971-09-25 21:37:18','2022-03-14 21:20:38'),(10,16,2,'http://adams.com/','et','1995-04-17 07:22:40','2022-03-05 07:55:43'),(11,3,23,'http://www.kuhlmanbogan.com/','saepe','1976-06-17 12:09:58','2022-03-04 15:57:36'),(12,48,21,'http://www.greenpfeffer.net/','et','1989-07-26 03:35:37','2022-02-22 06:20:04'),(13,48,13,'http://www.labadie.com/','aperiam','2009-04-24 18:07:32','2022-03-12 14:36:15'),(14,14,16,'http://oreilly.biz/','tempora','2020-06-22 07:06:00','2022-03-11 23:37:01'),(15,3,10,'http://www.mitchell.biz/','ipsam','1995-07-09 23:12:54','2022-03-10 08:04:52'),(16,27,25,'http://zulaufbatz.biz/','repellat','1989-08-30 11:54:35','2022-02-24 03:56:03'),(17,15,28,'http://hicklepfannerstill.com/','praesentium','2003-01-20 09:48:43','2022-03-09 21:56:38'),(18,30,13,'http://reynolds.com/','corporis','1991-06-14 18:22:17','2022-02-21 20:04:23'),(19,4,10,'http://harvey.com/','nam','1984-12-21 08:53:41','2022-02-25 16:12:12'),(20,35,27,'http://haley.biz/','deserunt','1990-12-26 17:04:30','2022-03-11 12:58:56'),(21,50,17,'http://schummfarrell.net/','accusantium','1987-06-03 14:49:56','2022-03-10 22:58:52'),(22,40,12,'http://bednar.com/','qui','1980-07-09 17:15:32','2022-02-27 21:05:57'),(23,9,17,'http://treutel.com/','impedit','1970-12-02 14:17:53','2022-02-20 07:50:01'),(24,12,18,'http://www.dubuque.info/','repellat','1983-10-28 06:06:27','2022-03-03 06:00:14'),(25,23,9,'http://brekke.com/','qui','1984-12-27 19:52:48','2022-03-02 02:44:59'),(26,20,21,'http://www.jerde.com/','odit','1989-06-23 21:03:01','2022-02-21 08:17:14'),(27,12,11,'http://www.hamillreichel.com/','eos','2006-08-28 00:14:02','2022-03-12 06:16:31'),(28,18,11,'http://corwin.com/','sed','1997-12-24 20:17:28','2022-03-09 03:58:26'),(29,32,1,'http://mueller.com/','quos','2019-07-18 10:44:27','2022-02-20 16:21:55'),(30,47,19,'http://boehm.com/','sunt','1973-03-30 06:13:09','2022-03-14 15:54:25'),(31,47,6,'http://hansenreichel.biz/','voluptas','2016-07-11 14:31:37','2022-02-22 08:47:38'),(32,36,8,'http://www.torphy.com/','corporis','2014-09-08 06:06:17','2022-03-03 17:12:19'),(33,50,4,'http://hansen.info/','harum','1981-10-01 10:43:13','2022-03-10 13:39:27'),(34,19,19,'http://www.mckenzie.info/','sapiente','2014-09-21 02:45:04','2022-03-05 19:42:18'),(35,2,25,'http://jenkins.com/','fuga','1981-01-22 11:29:10','2022-02-22 10:53:12'),(36,19,18,'http://www.stehrgrady.net/','qui','2001-12-20 07:53:50','2022-03-05 17:21:12'),(37,45,7,'http://kundespencer.info/','eos','1974-02-22 15:59:19','2022-02-19 05:40:15'),(38,12,15,'http://www.halvorson.info/','dicta','2013-06-15 19:19:54','2022-03-10 07:29:01'),(39,43,2,'http://www.larkin.com/','unde','2008-09-04 01:39:23','2022-03-06 16:44:31'),(40,36,16,'http://www.roberts.com/','reiciendis','2010-08-28 20:30:29','2022-03-01 15:51:08'),(41,17,16,'http://parisian.biz/','aut','2012-12-24 06:31:56','2022-03-15 01:10:37'),(42,17,4,'http://medhurst.biz/','inventore','2011-01-21 21:23:29','2022-02-20 07:47:40'),(43,50,3,'http://www.franecki.com/','occaecati','1985-02-25 12:58:28','2022-03-13 07:24:51'),(44,12,6,'http://www.croninklocko.net/','et','2011-08-09 23:12:27','2022-03-02 16:17:45'),(45,7,18,'http://heathcotepouros.com/','sunt','2002-12-31 00:23:05','2022-03-01 14:34:55'),(46,45,12,'http://borer.biz/','blanditiis','2014-12-08 21:17:53','2022-03-01 14:52:40'),(47,19,24,'http://www.wisoky.com/','rem','1999-07-04 20:45:03','2022-03-04 15:00:54'),(48,32,8,'http://www.bosco.biz/','consectetur','1990-07-23 08:01:11','2022-03-05 10:47:38'),(49,33,8,'http://www.thompson.com/','quam','1995-01-17 23:32:22','2022-02-28 20:19:00'),(50,6,2,'http://www.rosenbaummurphy.org/','dolorem','2016-05-25 13:49:09','2022-02-22 03:31:41'),(51,7,19,'http://lynchledner.org/','incidunt','1994-04-26 11:07:25','2022-02-18 05:42:42'),(52,19,7,'http://nienow.com/','omnis','2011-06-06 18:30:28','2022-02-17 15:05:03'),(53,18,18,'http://www.fritschmetz.com/','rem','2017-07-21 00:59:10','2022-03-11 11:01:48'),(54,47,14,'http://www.wolff.info/','voluptas','2020-08-28 12:18:50','2022-03-09 20:16:25'),(55,28,4,'http://armstrong.info/','dolores','2009-09-20 10:24:19','2022-03-07 06:16:42'),(56,43,1,'http://rau.com/','dolores','2018-02-28 23:46:07','2022-03-12 22:19:19'),(57,26,8,'http://www.emard.com/','aliquid','1974-12-17 21:58:53','2022-02-22 18:48:45'),(58,22,20,'http://www.beahan.com/','a','1987-10-06 10:03:52','2022-03-12 16:13:56'),(59,18,1,'http://schoen.biz/','rerum','1999-08-28 06:47:36','2022-03-11 19:26:37'),(60,36,13,'http://stokes.net/','cum','1970-07-27 11:07:57','2022-02-20 22:28:08'),(61,43,20,'http://cassin.com/','et','1994-12-17 17:18:58','2022-02-22 06:23:53'),(62,5,14,'http://www.hicklehermiston.com/','libero','1971-03-22 13:23:02','2022-03-10 07:00:49'),(63,23,23,'http://altenwerthkoelpin.com/','ea','1976-10-13 18:54:08','2022-03-15 10:26:04'),(64,18,25,'http://www.okon.info/','ipsum','2005-04-06 09:17:43','2022-02-16 12:54:34'),(65,46,30,'http://www.metzjenkins.com/','ea','2013-05-23 11:27:01','2022-03-14 03:33:09'),(66,49,14,'http://www.lockman.com/','ad','1982-08-04 08:41:43','2022-02-18 11:34:13'),(67,24,11,'http://haagbecker.info/','sit','1980-10-24 22:36:35','2022-03-07 06:51:43'),(68,11,22,'http://schulistparker.biz/','rem','2006-02-22 02:34:58','2022-03-02 21:38:40'),(69,5,18,'http://bergnaum.biz/','voluptatem','1991-11-12 03:51:17','2022-03-09 14:36:09'),(70,36,18,'http://jacobson.com/','reprehenderit','1971-10-13 06:53:10','2022-03-02 16:42:16');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_type_id` bigint unsigned NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Voluptates beatae non nisi inventore mollitia qui. \r\nVoluptas consequuntur officiis voluptatem ex et nesciunt rerum. Animi nihil voluptatem dolorum. \r\nCumque corporis quos aut.','quos',NULL,'2021-09-20 09:31:05','2022-02-28 01:02:21'),(2,2,2,'Recusandae praesentium ea cum aut. Voluptatem eveniet vel est harum harum. Omnis qui tenetur \r\nquidem eius culpa. Iste quod est dolore magnam ducimus.','consequatur',NULL,'2021-09-28 02:38:47','2022-03-09 03:00:48'),(3,3,3,'Placeat sapiente ut ut ut est delectus. Dignissimos dolorum ex enim quasi \r\nrerum vel dolores. Perferendis et vero quis praesentium atque non. Autem aut consequatur hic \r\namet natus fuga ducimus.','modi',NULL,'2021-10-14 22:42:00','2022-02-20 12:47:10'),(4,4,4,'Molestias perspiciatis eius fuga doloribus voluptatum quas repellendus. Provident distinctio temporibus \r\nut voluptas non numquam inventore. Minima sunt molestiae magnam.','distinctio',NULL,'2021-09-10 04:33:22','2022-03-08 08:04:59'),(5,5,1,'Adipisci soluta repudiandae quia ipsum ea numquam quas. Neque et doloremque \r\npraesentium autem. Molestiae minima quis amet iste vel quisquam et. Ut perferendis qui ut ut quia enim.','ipsa',NULL,'2022-02-12 05:19:34','2022-02-24 05:51:28'),(6,6,2,'Aut ad alias voluptas autem nemo assumenda \r\nab. Doloremque consequatur rerum id non dolorem quod perferendis. Omnis corrupti sit sint et accusamus enim \r\nvoluptas.','eum',NULL,'2021-08-06 03:18:56','2022-03-16 02:20:45'),(7,7,3,'Blanditiis autem est in qui sit \r\naut. Expedita explicabo repellendus omnis autem laudantium animi nihil et. Quasi cum neque qui mollitia \r\npossimus. Qui vel non debitis alias illo.','dolorem',NULL,'2021-03-25 06:37:03','2022-02-22 13:52:27'),(8,8,4,'Voluptatum et sit consequuntur beatae. Et qui magnam repudiandae. Sint pariatur esse illo odit ea \r\ncum. Explicabo quis sunt qui autem quibusdam aspernatur.','totam',NULL,'2021-07-23 23:56:27','2022-02-21 01:40:08'),(9,9,1,'Neque dolorum eius accusantium minima. Beatae voluptas quo voluptatum ex. \r\nProvident blanditiis qui quia repellat. Excepturi magni ut perspiciatis maiores nesciunt.','perspiciatis',NULL,'2021-12-16 07:27:29','2022-03-03 21:23:49'),(10,10,2,'Laudantium ab id nesciunt eum laborum. \r\nReprehenderit qui officiis modi est odit in error ex. Rerum expedita sit temporibus mollitia consequatur \r\naliquam quis. A dolores illum exercitationem modi magni fugiat.','facere',NULL,'2022-01-24 04:50:08','2022-02-28 06:55:21'),(11,11,3,'Voluptatibus quis qui quisquam incidunt distinctio rerum ea. Et laborum \r\namet sed est aut. Animi quo unde rerum repudiandae et eos expedita voluptatibus. Libero voluptas \r\nreiciendis ab est asperiores ad eos.','quis',NULL,'2021-06-01 22:41:03','2022-03-12 01:18:19'),(12,12,4,'Quod doloremque autem et suscipit. Dolore sed ipsam omnis quidem repudiandae accusamus enim. \r\nMagni inventore dolorem qui deleniti neque. Hic quos in beatae dicta et eum.','eius',NULL,'2021-05-31 00:52:16','2022-02-16 14:23:11'),(13,13,1,'Est hic adipisci aut aperiam hic. Impedit \r\ninventore et sunt aliquam ut. Eligendi laboriosam culpa blanditiis quam cumque. Iusto corrupti ut \r\nvoluptatem aspernatur.','eum',NULL,'2021-07-29 01:41:51','2022-03-10 20:50:30'),(14,14,2,'Voluptatem sit aliquam ut et sapiente. Tempore impedit omnis sit nam libero. Fugiat sit ut voluptates \r\nvoluptatibus.','ipsa',NULL,'2021-09-28 17:05:06','2022-02-24 04:06:55'),(15,15,3,'Dolorem tenetur \r\nnon necessitatibus. Blanditiis minus omnis velit consequuntur. Ut reiciendis omnis nihil perspiciatis \r\nnam eveniet.','ducimus',NULL,'2021-06-15 07:15:03','2022-03-01 05:51:21'),(16,16,4,'Rerum aut est \r\naccusantium laborum. Dolorem nulla harum praesentium dolor similique quis.','assumenda',NULL,'2021-05-04 00:07:37','2022-03-06 18:48:18'),(17,17,1,'Ut voluptatem placeat odio. Non aut quo reiciendis maxime \r\nratione aut enim. Odit doloremque nisi similique animi exercitationem nemo qui. Quisquam natus dolorum \r\nsapiente molestiae officiis voluptatem officiis. Nesciunt non ex at corporis hic.','voluptatem',NULL,'2021-11-21 06:57:30','2022-02-26 06:44:11'),(18,18,2,'Nisi reiciendis quis ipsum et nobis. Eaque enim \r\nsit libero iure ipsum rem aut. Voluptas qui et est commodi quia cum explicabo.','rerum',NULL,'2021-06-07 08:35:38','2022-03-06 14:06:13'),(19,19,3,'Amet ut amet est sunt maiores. Ut hic quia in \r\nducimus. Rerum nisi voluptas consequatur quibusdam est. Voluptas enim omnis doloremque et suscipit et.','sit',NULL,'2021-03-25 10:56:55','2022-02-23 12:47:25'),(20,20,4,'Officiis sit ratione voluptas sed non \r\nnon. Ab nemo vel consequuntur ea perspiciatis ipsam placeat. Est nemo deserunt magni inventore sit dolore.','rerum',NULL,'2021-04-05 15:52:40','2022-02-21 19:10:52'),(21,21,1,'Qui ullam facilis aut voluptatum qui \r\nillum officiis. Aspernatur id ducimus alias ut inventore mollitia voluptas. Ex labore sed aut assumenda ea.','eos',NULL,'2021-12-13 13:18:16','2022-03-14 16:19:10'),(22,22,2,'Ipsum recusandae enim dolorem voluptas. \r\nNatus sit sit ex aliquam voluptatem ut excepturi. Quia quasi eum iste quia ipsam.','ut',NULL,'2021-10-14 15:13:47','2022-02-24 14:12:47'),(23,23,3,'Quaerat asperiores animi optio sint soluta ipsum. \r\nTenetur dicta reprehenderit possimus qui architecto quibusdam. Est et eaque dolore at et perspiciatis. \r\nDolores et enim id voluptas.','aperiam',NULL,'2021-04-22 20:44:47','2022-03-13 02:40:30'),(24,24,4,'Et provident voluptates officiis consequatur et debitis quod. Ab vero quis rerum adipisci. \r\nCommodi qui cupiditate harum est sint impedit et cum.','ea',NULL,'2021-11-04 05:10:27','2022-02-24 19:24:46'),(25,25,1,'In dolore optio laboriosam. Ut quia odit cupiditate voluptatem et. \r\nImpedit eius praesentium ut necessitatibus sapiente autem atque. Quibusdam et nulla accusantium ducimus enim.','illo',NULL,'2021-09-11 07:33:55','2022-02-19 15:50:01'),(26,26,2,'Earum voluptas quia enim laboriosam \r\nquisquam voluptatibus quas. Ea quibusdam rerum enim asperiores. Temporibus excepturi officiis voluptatem.','numquam',NULL,'2022-03-07 06:09:43','2022-02-18 09:53:41'),(27,27,3,'Vero veritatis est ut accusamus ea \r\nesse omnis est. Ut fugiat in assumenda sunt ut officiis. Et commodi aut eligendi perferendis nihil. Est \r\nnatus sit magni nihil et qui fugit.','dignissimos',NULL,'2021-07-09 02:48:30','2022-03-05 20:10:37'),(28,28,4,'Quibusdam molestias sit magnam magnam aut unde recusandae. Deserunt unde voluptates qui \r\nvoluptas perferendis aut. Architecto est unde facere possimus.','cumque',NULL,'2021-11-06 04:07:10','2022-02-22 19:57:41'),(29,29,1,'Deserunt velit non rerum consequatur et optio voluptas. Quibusdam placeat \r\nvoluptas laboriosam. Vel asperiores eaque consequuntur quas distinctio ad sed.','quis',NULL,'2022-02-24 19:43:37','2022-03-11 18:50:15'),(30,30,2,'Non perspiciatis omnis laborum exercitationem neque \r\nharum. In accusamus commodi qui sequi nesciunt voluptas. Sit eum voluptas illum consequatur sit et \r\nprovident. Explicabo aspernatur tempore laboriosam architecto et quod velit explicabo.','expedita',NULL,'2022-02-15 23:42:04','2022-02-19 14:30:59'),(31,1,3,'Aut sed blanditiis reprehenderit dignissimos nemo est \r\nnecessitatibus. Qui sint nihil ut eveniet temporibus minima et et. Velit ratione inventore vero et suscipit \r\nreprehenderit sed.','veniam',NULL,'2021-06-14 05:29:36','2022-03-04 12:31:22'),(32,2,4,'Accusantium doloribus nulla maxime qui. Dolorem ea id \r\nest voluptatum. Inventore voluptatem quia et quo quibusdam aperiam molestias.','omnis',NULL,'2022-02-22 14:07:00','2022-02-20 13:27:09'),(33,3,1,'Natus sint aliquid ut quia et. Exercitationem iusto alias \r\nblanditiis sit qui quibusdam. Officia accusamus et aut accusantium non. Odit dolorem hic consequatur ut \r\neveniet saepe.','similique',NULL,'2021-10-21 08:31:48','2022-03-11 03:04:27'),(34,4,2,'Sed dolor facere \r\net labore voluptatem harum. Voluptatem ut explicabo omnis commodi ab et quia culpa. Omnis odio mollitia \r\nvoluptas omnis.','quaerat',NULL,'2021-08-04 13:36:44','2022-03-14 18:36:50'),(35,5,3,'Voluptatem et amet \r\nneque corporis quam modi. Nemo ullam praesentium error ab et iusto. Occaecati laboriosam commodi rerum vel \r\nreprehenderit vel. Sequi laboriosam a officia sint rerum est velit mollitia.','quia',NULL,'2021-04-08 19:43:13','2022-02-20 06:44:32'),(36,6,4,'Quas recusandae maiores voluptas et voluptatem. Laborum quos \r\ncorrupti laudantium aut.','velit',NULL,'2021-09-26 20:46:55','2022-02-23 18:55:29'),(37,7,1,'Quia aut sunt \r\ntotam qui dolor. Numquam eum animi porro nisi ut officiis eligendi. Minus harum molestiae sit exercitationem.','praesentium',NULL,'2022-02-12 23:47:53','2022-03-04 22:33:58'),(38,8,2,'Omnis rerum minima non aut reiciendis. \r\nNam expedita praesentium et consequatur nesciunt quisquam. Nemo dignissimos possimus nam cumque debitis \r\nrepudiandae. Vitae et qui occaecati totam.','voluptatem',NULL,'2022-02-26 18:50:26','2022-02-24 10:24:06'),(39,9,3,'Ullam ullam rem quaerat. Quas ea et quibusdam tenetur. Debitis quibusdam voluptatem mollitia \r\nexercitationem vero. Reiciendis molestias fugit cumque est.','delectus',NULL,'2021-09-07 21:52:43','2022-03-03 06:09:04'),(40,10,4,'Unde nostrum perspiciatis alias praesentium qui sequi. Beatae ex quaerat quo \r\nvoluptatem earum eius et. Dolorem quisquam qui nihil omnis veniam consequuntur pariatur ut.','est',NULL,'2021-05-29 00:14:48','2022-03-09 04:30:08'),(41,11,1,'Sint consequatur quas fugit consectetur necessitatibus \r\nenim in. Atque nihil inventore aperiam sed nostrum unde. Quia vel expedita alias occaecati nostrum aut. Ad \r\nnisi et autem rerum corporis officia aliquam.','tenetur',NULL,'2021-05-19 14:23:39','2022-03-09 03:35:52'),(42,12,2,'Sed cupiditate debitis dolorem. Ut nihil dignissimos sequi ullam in voluptas voluptas sed. Soluta \r\nrem et voluptas vel accusamus. Deserunt hic facere ad necessitatibus.','aut',NULL,'2022-02-27 06:44:58','2022-02-26 21:20:12'),(43,13,3,'Reprehenderit similique id dolor dolorem est quia. Vel veritatis natus \r\ndignissimos ad dolorem qui. Sunt repellendus unde a temporibus possimus provident. Molestias natus totam \r\ntempore qui consectetur.','ratione',NULL,'2022-01-27 13:30:22','2022-03-08 15:53:27'),(44,14,4,'Est error \r\nut accusamus et laudantium ad. Quia porro id possimus tempore deserunt qui. Eius architecto omnis unde. \r\nAspernatur perferendis hic voluptatem.','inventore',NULL,'2021-10-16 19:51:40','2022-03-13 02:59:48'),(45,15,1,'Rerum iste blanditiis exercitationem voluptatem architecto illo rerum. Sint mollitia fugit quam \r\nnesciunt. Sed repellat fugiat atque.','nesciunt',NULL,'2022-02-14 19:45:39','2022-03-07 02:48:30'),(46,16,2,'Praesentium non qui dicta enim voluptatum quod corporis hic. Eos minus deleniti eaque ut. \r\nVoluptas quaerat est et est aut culpa architecto. Numquam quos explicabo esse accusantium.','sit',NULL,'2021-06-19 15:09:55','2022-02-23 00:29:24'),(47,17,3,'Consectetur architecto debitis deleniti delectus \r\nassumenda culpa. Necessitatibus vitae natus reiciendis error perspiciatis id. Voluptatem vel officia ea \r\nvoluptatum mollitia qui. Totam et quae ratione fuga in sequi.','cupiditate',NULL,'2021-06-11 08:27:28','2022-02-16 23:16:54'),(48,18,4,'Illo sit nulla hic vel. Molestiae placeat nihil aspernatur sint a animi. \r\nNemo ipsa ullam est quaerat saepe. Aut ipsam optio non voluptatem.','numquam',NULL,'2021-08-14 16:42:56','2022-03-01 23:44:48'),(49,19,1,'Consectetur illo quibusdam esse voluptatem aperiam consequuntur ut qui. \r\nVoluptatum commodi sint quo exercitationem aliquid voluptas dignissimos voluptatum. Aut quo saepe et qui \r\ndolores omnis ad. Expedita tempora eum aliquid iure animi.','aut',NULL,'2021-12-12 08:02:09','2022-02-19 20:10:30'),(50,20,2,'Eligendi est suscipit veritatis occaecati sint neque necessitatibus quos. Ea aut \r\nsapiente debitis voluptas quos accusamus unde. Ut et voluptatibus labore. Est recusandae ab omnis \r\naccusantium ducimus.','minus',NULL,'2022-02-25 10:49:28','2022-02-27 10:04:14');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'image'),(2,'audio'),(3,'text'),(4,'video');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
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
  `is_read` bit(1) DEFAULT b'0',
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,7,8,'Corporis exercitationem ut incidunt dolores. Sed autem laudantium eum \r\nvitae.','2022-03-01 23:33:24',_binary '\0'),(2,26,13,'Neque autem est quia architecto similique. Eaque veniam voluptate \r\nquia. Rem ratione ut sit dolorum. Earum harum voluptas quis quidem similique. Sed velit et doloremque ab \r\nnobis rerum id.','2022-03-08 11:50:31',_binary '\0'),(3,25,11,'Commodi id repellat voluptas perspiciatis. In facilis \r\npossimus nisi asperiores saepe qui. Vitae consectetur iure accusamus excepturi provident laborum. Rem \r\nvoluptatibus non velit qui dolor ad dolorem.','2022-03-12 12:58:04',_binary '\0'),(4,18,22,'Nihil eum et consequuntur \r\nmagnam. Facilis aspernatur accusamus eum similique et. Molestiae iste excepturi et ullam nobis.','2022-03-05 16:35:11',_binary '\0'),(5,9,24,'Eveniet voluptas magnam dolorum pariatur reprehenderit quos. Placeat quis repellendus \r\nnecessitatibus ipsa voluptas id eius. Exercitationem dolores ut molestiae ullam. Enim enim nemo consectetur \r\nerror sed. Quis repellendus sit hic quisquam sunt fuga.','2022-03-16 23:10:50',_binary '\0'),(6,29,14,'Aperiam vero odit \r\nsimilique et non suscipit. Consequuntur voluptate ut omnis aut. Itaque ea eum quam et quis ratione.','2022-03-16 17:20:32',_binary '\0'),(7,26,22,'Tempore possimus alias quidem ut. Aut et sint sint dolorem rem debitis. \r\nIllo perferendis recusandae error est repudiandae.','2022-03-01 13:05:34',_binary '\0'),(8,8,19,'Facere quaerat temporibus \r\nconsectetur sunt. Consequuntur cupiditate voluptatem molestiae consequuntur. Sunt repellat est nihil \r\nrepellendus qui minus eius.','2022-03-08 12:00:37',_binary '\0'),(10,23,26,'Dolore nisi \r\net perferendis quibusdam occaecati amet incidunt. Porro est iure architecto.','2022-03-03 15:43:08',_binary '\0'),(11,27,12,'Consequatur non molestiae repellat. Qui molestiae est praesentium distinctio et est placeat. \r\nLaborum ut eos illo explicabo atque ducimus. Ipsa quia accusamus nobis voluptatibus dolores.','2022-03-09 20:42:39',_binary '\0'),(12,9,12,'Vel quo quasi aut eius. Omnis harum rerum velit veritatis ut dolorum. Vel non harum \r\nquaerat dolorum deserunt dolor sapiente. Perferendis rem voluptatem optio eum et explicabo numquam.','2022-03-14 02:13:40',_binary '\0'),(13,25,9,'Eum iure aliquam ab. Exercitationem nulla et qui eaque. Sapiente iusto sed \r\nnumquam voluptatem in quibusdam dicta quia. Placeat ut officia non et rerum.','2022-02-23 21:23:07',_binary '\0'),(14,24,2,'Tempore quo illum omnis. Ipsa atque sapiente molestiae libero nobis.','2022-03-06 12:06:49',_binary '\0'),(15,2,13,'Adipisci dolorem qui tenetur debitis doloribus. Dolor iste est ut.','2022-03-02 06:04:43',_binary '\0'),(17,17,6,'Earum id ipsa ut alias. Consequuntur temporibus eos corporis porro. Corporis dolor delectus ratione.','2022-02-27 14:30:35',_binary '\0'),(18,5,24,'Pariatur sed maiores harum sit perspiciatis itaque. Id hic consequuntur cumque \r\neveniet quaerat facere vitae optio. Earum quam voluptate doloribus aperiam voluptatibus sapiente eum.','2022-03-06 09:00:16',_binary '\0'),(19,3,1,'Dolorum consectetur ipsam est repudiandae commodi aut deserunt. Voluptas fuga \r\nnobis et. Rerum rerum sapiente omnis laborum dolores. Temporibus tenetur dignissimos cupiditate sapiente dolore \r\nfuga. Unde numquam illo distinctio corrupti totam voluptate incidunt.','2022-03-09 17:28:44',_binary '\0'),(20,8,15,'Ea \r\nlaudantium vitae mollitia eum eveniet praesentium optio. Sed ea esse minus amet voluptatem fugit. Pariatur \r\naspernatur architecto quam sint eveniet occaecati. A distinctio sapiente quis sequi veniam voluptatum excepturi \r\nin.','2022-03-08 01:09:18',_binary '\0'),(21,18,6,'Et ut officiis quas officiis voluptas ab. In non cupiditate voluptatem \r\ndelectus. Soluta iure occaecati dolor sed.','2022-03-13 17:58:09',_binary '\0'),(23,7,27,'Nulla maxime sit laudantium quasi. Suscipit sit \r\nasperiores enim omnis reprehenderit sint. Sapiente accusamus saepe distinctio omnis nihil ut ut. Omnis enim \r\ndolor excepturi in nulla quibusdam amet.','2022-03-03 09:36:29',_binary '\0'),(25,1,25,'Molestias nesciunt ut aliquam. \r\nSed nisi alias ut est.','2022-03-14 13:59:26',_binary '\0'),(26,16,7,'Explicabo culpa nihil aut. Nesciunt et in cumque \r\nfugiat quas voluptate ipsum qui. Assumenda hic ea sequi magnam numquam dolorum dolorum nihil. Ducimus illum \r\nut culpa est at est laboriosam.','2022-03-05 05:38:37',_binary '\0'),(27,24,18,'Sunt iure placeat impedit nihil aperiam \r\nodio laboriosam. Consequatur minima vel sunt quisquam nesciunt. Rem rem a doloremque nam nihil.','2022-03-13 20:24:34',_binary '\0'),(29,5,8,'Quia aut voluptas sit et rerum harum. \r\nLibero deleniti alias cumque iste tenetur aspernatur quidem repellendus. In illum asperiores eum id eos culpa.','2022-03-12 01:06:23',_binary '\0'),(30,6,7,'Iure unde quae et adipisci rerum officiis. Laborum ut possimus minus. Tempore \r\ndebitis accusamus vel nobis temporibus. Accusantium ducimus dignissimos iste quasi omnis cupiditate quaerat.','2022-03-14 10:36:26',_binary '\0'),(31,1,12,'Eos asperiores rem voluptatem et. Saepe eum dolores tenetur nulla distinctio. \r\nQuasi autem quo placeat dolore tempora aut praesentium. Non expedita dicta repellendus ut ut blanditiis \r\naspernatur.','2022-03-03 16:21:47',_binary '\0'),(32,21,6,'Sit architecto error et esse. Et consequatur voluptates sint. \r\nFacilis in rerum voluptas.','2022-03-04 13:17:46',_binary '\0'),(34,22,14,'Vel vel similique et ab blanditiis adipisci. Id quaerat eos repellat ullam. Quia ut cumque voluptatem \r\ndeleniti quia vero occaecati est.','2022-03-02 12:35:40',_binary '\0'),(35,25,6,'Earum id eligendi officiis praesentium \r\ntempora reiciendis provident numquam. Itaque vero dignissimos corporis id beatae.','2022-03-12 01:20:17',_binary '\0'),(38,24,12,'Ea dolorem et eveniet omnis iure. Hic distinctio explicabo dolores ea magni. Sunt aut \r\ntemporibus dolor non eos rem pariatur. Autem accusamus modi ratione dolore fugit.','2022-03-01 10:45:40',_binary '\0'),(40,22,14,'Ut aut non velit voluptatem dicta sint. Architecto dolore asperiores rerum corrupti ullam. \r\nSunt veniam et quisquam sed ut. Quos animi harum illum praesentium.','2022-03-07 03:27:34',_binary '\0'),(41,9,29,'Corporis rem velit sint cumque impedit velit itaque. Occaecati sunt et expedita at. Sit blanditiis fugit \r\ncum laudantium ut. Qui neque natus voluptatem neque ad quos laborum earum.','2022-03-16 18:07:57',_binary '\0'),(46,2,21,'Commodi ut ducimus et molestiae non rerum magnam voluptatem. Cum et quas \r\nrerum minima ut in sunt laudantium. Molestias corporis quia quas in maiores.','2022-03-13 13:57:48',_binary '\0'),(47,28,30,'Voluptates recusandae quibusdam veritatis inventore reprehenderit et. Voluptatem aliquam et harum \r\ntotam amet dolore accusamus est. Qui exercitationem voluptate laboriosam possimus laboriosam ut. Voluptatibus \r\neos asperiores commodi qui illo.','2022-03-14 10:06:55',_binary '\0'),(48,22,24,'Nam dicta dolorum est distinctio et eum \r\nqui quia. Occaecati modi sunt soluta tempore magnam ex. Nesciunt quos velit quo voluptas explicabo. Ut aut \r\ntemporibus sequi doloremque ut voluptate at quisquam.','2022-03-15 20:41:57',_binary '\0'),(50,13,12,'Voluptatem provident \r\nullam ea eum et vel aut. Id quas ut quod nostrum reprehenderit nisi. Maiores et consequatur doloremque et. \r\nConsectetur earum aut laudantium molestiae quia cupiditate.','2022-03-08 05:48:17',_binary '\0'),(51,13,20,'Cum officia \r\nlibero odio. Officia magni autem et ad non assumenda deleniti. Ad soluta et neque odit quo est aspernatur.','2022-03-15 01:53:36',_binary '\0'),(53,4,11,'Cumque est animi architecto aut. Qui quos velit \r\nconsequuntur animi. Optio neque omnis blanditiis omnis.','2022-03-14 03:58:31',_binary '\0'),(54,30,5,'Nisi modi omnis \r\na accusantium aut. Cumque autem et dolorem sint ut. Commodi officia culpa est incidunt voluptatum et. Et \r\naliquam cum quia consequatur optio aut dolores neque. Occaecati voluptatem sint dolores eos.','2022-03-07 16:43:51',_binary '\0'),(55,17,30,'Libero corrupti dolorem at culpa fugit. Qui ut fugit voluptatem et accusantium \r\npraesentium magnam. Suscipit tempora commodi vel.','2022-03-16 07:19:46',_binary '\0'),(56,1,15,'Tenetur quibusdam a \r\net beatae iste inventore ut quia. Minus ut quis laudantium illo voluptas. Quia sequi quod labore dolorem ut.','2022-03-05 23:09:47',_binary '\0'),(57,9,6,'Quis aperiam cum odio amet architecto suscipit autem. Quia non adipisci aut est. \r\nPerferendis nesciunt cum labore excepturi.','2022-03-09 21:11:37',_binary '\0'),(59,12,17,'Velit non autem neque quae eveniet reiciendis. Molestiae itaque \r\nunde veritatis. Sapiente asperiores omnis rem ratione animi. Ea sit amet aut sed soluta esse facere.','2022-03-09 03:43:18',_binary '\0'),(60,18,8,'Qui at nostrum praesentium voluptas. Consequatur beatae pariatur ratione \r\nvoluptatem. Necessitatibus sed eius possimus. Velit ut earum natus rerum iste maxime ea.','2022-03-07 16:29:33',_binary '\0'),(61,30,12,'Quod quis rem tenetur occaecati. Aut ratione ea eum modi blanditiis iste. Rem \r\nvoluptatibus blanditiis unde consequatur quia temporibus itaque. Et ratione aut consequatur et vero.','2022-03-02 17:53:33',_binary '\0'),(63,29,12,'In reprehenderit est suscipit quibusdam magni numquam. Sed ipsam numquam temporibus \r\nvoluptatem et debitis consectetur. Eius porro aperiam laborum provident.','2022-02-25 09:13:02',_binary '\0'),(64,24,27,'Explicabo sequi voluptatum est vero nobis eos tenetur. Eaque ex ut esse laudantium exercitationem \r\nreiciendis. Nihil adipisci consequatur quis beatae corrupti autem. Aut ut quisquam deleniti dolore enim \r\nincidunt maiores.','2022-03-16 01:40:49',_binary '\0'),(65,6,4,'A et incidunt quis aut. Error voluptates repellat \r\nexpedita occaecati. Eius cupiditate iure provident ipsa at neque consequatur nesciunt. Et magni et illum \r\nmodi ut quidem. Est pariatur numquam excepturi voluptates qui aut aliquid.','2022-02-23 23:13:16',_binary '\0'),(66,19,30,'Nihil eius ea sapiente omnis vero et quis quia. Animi dicta esse asperiores laboriosam et. \r\nRatione ea repellendus debitis ut voluptates quidem quasi. Sed repellendus consectetur voluptatum quasi \r\nnecessitatibus eos distinctio.','2022-03-09 19:25:57',_binary '\0'),(67,27,30,'Est et quis animi molestiae et dolorem \r\nexplicabo quis. Enim enim a aliquam mollitia.','2022-03-03 08:38:34',_binary '\0'),(68,9,25,'Quis dolorem natus \r\nreiciendis aliquam voluptatibus eligendi atque. Fuga et qui ipsa voluptate fuga. Consequatur perferendis \r\nquis dolor distinctio assumenda necessitatibus ea exercitationem. Et voluptatem sed quis sunt aut \r\nquisquam. Voluptas dolorem rerum nulla.','2022-03-07 21:52:17',_binary '\0'),(69,6,28,'Aut minus sed at modi ratione \r\nrepudiandae sapiente. Laudantium recusandae necessitatibus inventore ipsam velit. Est odit pariatur aut \r\nmollitia consequatur vero. Cupiditate ut autem iusto laudantium.','2022-03-10 03:28:00',_binary '\0'),(70,23,3,'Sint \r\nvel non reprehenderit eius labore. Ea maiores quod esse. Enim nemo aspernatur non.','2022-03-02 15:06:50',_binary '\0'),(71,9,26,'Dolores neque alias velit. Temporibus qui quia autem. Facilis consequatur quae nisi optio sunt \r\nrerum consequatur enim.','2022-03-12 18:55:44',_binary '\0'),(72,15,10,'Quas laborum est velit excepturi et et. Ipsam \r\nsed odit delectus itaque dolorem quia dolorum. Architecto ullam autem est rerum excepturi rem accusantium. \r\nSunt ea non eius autem.','2022-03-12 23:06:34',_binary '\0'),(73,16,16,'Sit et est esse ipsum. In labore et in \r\naccusantium recusandae. Tempore repudiandae illum placeat ipsam. Sit temporibus facilis veritatis voluptas et.','2022-03-03 04:32:42',_binary '\0'),(74,28,23,'Qui ut et quibusdam nemo aut libero. Et aliquid quos expedita. Soluta maiores \r\nvoluptatum quo veritatis soluta. Omnis dicta dicta dolorem doloribus labore asperiores quos.','2022-03-06 16:11:32',_binary '\0'),(75,19,14,'Illum sint perspiciatis enim. Sed voluptatibus voluptas veritatis est. Enim laborum rem \r\nsimilique vitae dicta. Odio dolore consequatur ea et unde.','2022-03-02 14:13:09',_binary '\0'),(76,16,17,'Aut autem \r\nvoluptas non fuga id quaerat. Eos aliquid quia sint voluptatem rerum. Eveniet voluptatem ab et illum ex dolor \r\ndoloribus. Iure optio aperiam nobis sit praesentium eum.','2022-02-26 09:13:05',_binary '\0'),(77,15,1,'Quia sapiente \r\nvelit possimus dolores eum molestias. Officia vitae accusamus possimus eaque magni maiores repellat. Quia \r\nexercitationem harum tenetur sapiente. Eligendi quae harum libero deserunt accusamus eligendi.','2022-03-11 03:39:18',_binary '\0'),(78,8,28,'Similique impedit dolores excepturi delectus et quos reprehenderit. Distinctio molestiae \r\nrepudiandae eveniet esse natus sapiente ipsa. Quia voluptas distinctio provident ea in provident. Atque ex ut \r\naspernatur voluptatem dolores ab.','2022-03-01 03:59:04',_binary '\0'),(79,18,1,'Delectus occaecati et nulla officia quia \r\nnulla rem. Optio quo earum modi animi quia. Tempora blanditiis rem et quos. Tempore aut unde iusto tenetur. \r\nModi sed omnis officia omnis.','2022-03-08 18:48:13',_binary '\0'),(80,13,1,'Cumque nihil praesentium dolores enim ea quia. \r\nRem ea quia sequi voluptates beatae. Nam id ea quis sunt dolorum. Et animi sed enim repellendus. Eum \r\nexercitationem atque facere corporis qui error.','2022-03-13 15:58:49',_binary '\0'),(81,17,19,'Ratione ea perferendis \r\nfugiat vero repellat. Vero et dolores inventore aut ex eveniet.','2022-02-19 12:25:50',_binary '\0'),(82,6,23,'Quis officia \r\nodit quasi quaerat consequatur qui. Aspernatur odio quia id nostrum est fugiat repudiandae. Cumque et \r\narchitecto et aut dolores. Optio eius doloremque quis rerum accusamus ut vero velit.','2022-02-25 16:19:57',_binary '\0'),(83,20,23,'Commodi voluptates ducimus aspernatur facere sequi quia placeat. Doloribus inventore autem \r\nnecessitatibus aut.','2022-02-26 23:49:37',_binary '\0'),(84,29,12,'Rem sit officiis necessitatibus quisquam dolor nihil. \r\nDolorum quae et officia. Ea est corporis praesentium voluptatibus voluptatum debitis explicabo.','2022-02-22 13:28:57',_binary '\0'),(85,19,30,'Eum magnam ut nostrum ut et. Quam accusantium explicabo recusandae et aspernatur dicta \r\nvoluptatem. Error explicabo accusantium cum odit et. Sit provident blanditiis animi ut officiis.','2022-03-16 23:40:33',_binary '\0'),(86,30,17,'Quasi excepturi omnis expedita. Atque assumenda harum enim possimus. \r\nEius aut eveniet a numquam animi. Commodi quas accusantium in ut tenetur maiores est. Explicabo et soluta \r\nquaerat odio consequatur magni.','2022-02-26 10:13:14',_binary '\0'),(87,1,24,'Consequuntur reiciendis nihil saepe quia \r\ndistinctio magni voluptas ipsum. Esse at minima voluptatem ipsam nobis aut ut nihil. Vero et nesciunt \r\ntemporibus provident voluptatem.','2022-03-03 05:40:05',_binary '\0'),(88,22,3,'Dignissimos voluptate rerum atque \r\nlaudantium facilis. Occaecati itaque quo quam fugiat explicabo consequatur. Fugit rem similique totam harum \r\nest atque. Odio non eum ratione quia explicabo.','2022-03-16 15:09:32',_binary '\0'),(89,8,1,'Aperiam porro incidunt et \r\ndolores earum placeat. Ex rerum adipisci nemo adipisci facilis sed incidunt. Et est cumque perferendis at \r\nautem molestiae. Accusantium quasi incidunt in quos commodi.','2022-03-08 02:34:41',_binary '\0'),(90,6,5,'Quidem nulla \r\nassumenda deleniti sequi quisquam nulla. Culpa ut aut qui ut veniam.','2022-02-20 21:12:36',_binary '\0'),(91,9,2,'Fuga \r\nqui impedit iste doloribus quo quia doloremque. Vitae ipsam quasi ullam qui id deserunt. Maiores quisquam \r\neveniet praesentium laudantium. Totam optio magni temporibus blanditiis.','2022-02-22 23:07:49',_binary '\0'),(92,28,15,'Voluptatem odio culpa dolores ratione iste. Tempora necessitatibus facilis dicta labore incidunt atque ut \r\nenim. Cupiditate eaque eum distinctio alias excepturi aut. Ut consequatur a cupiditate iste.','2022-03-01 21:19:24',_binary '\0'),(93,16,5,'Accusantium illum et libero alias consequuntur adipisci sunt. Iure dolorem sunt \r\nperferendis pariatur dolor. Dolore magnam blanditiis omnis. Doloribus placeat nesciunt iusto.','2022-03-03 18:46:27',_binary '\0'),(94,29,16,'Doloribus optio et culpa et dolore atque eveniet fuga. Eum nesciunt id similique qui \r\nquos blanditiis. At magnam sit consectetur quia repellendus.','2022-02-23 09:41:42',_binary '\0'),(95,12,16,'Quia fugit \r\nqui laboriosam maiores. Doloremque consequatur non quia tenetur rerum et. Voluptas et quia voluptas quis \r\ndolores.','2022-02-27 00:11:28',_binary '\0'),(96,28,6,'Eum sed animi ipsum libero laudantium magnam quia. Quas modi \r\nquisquam in. Asperiores earum soluta earum consequatur consectetur aut suscipit eos.','2022-03-15 09:00:57',_binary '\0'),(97,11,29,'Qui atque eos deserunt quia. Nobis eveniet voluptas veritatis tempore labore veniam cum. Ut \r\nconsectetur assumenda est.','2022-02-18 16:20:18',_binary '\0'),(98,7,16,'Magni quae quibusdam architecto totam enim eum \r\nvelit. Occaecati sit dolorum quaerat magni quis. Odit sit rerum corporis sit ducimus delectus ab modi. Facere \r\nveritatis ducimus ut corporis. Omnis beatae repellat aut est odio ducimus non.','2022-03-15 22:02:25',_binary '\0'),(99,11,8,'Vitae exercitationem suscipit doloremque quisquam non. Autem est praesentium qui quisquam saepe \r\nipsa assumenda sit. Nemo provident porro non. Dignissimos eaque ullam aut harum nostrum.','2022-03-06 15:37:48',_binary '\0'),(100,4,15,'Non iusto iure iure laudantium. Illum enim suscipit est exercitationem.','2022-03-15 13:27:54',_binary '\0');
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
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Пол',
  `hometown` varchar(200) DEFAULT NULL COMMENT 'Родной город',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `employee_of_company` bigint unsigned NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `age` tinyint unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_profiles_company_id` (`employee_of_company`),
  CONSTRAINT `fk_profiles_company_id` FOREIGN KEY (`employee_of_company`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','Mosciskimouth','2013-12-19 04:01:13','1972-09-21',15,_binary '',50),(2,'m','New Theodoraburgh','2015-11-27 11:51:00','2011-12-04',9,_binary '\0',11),(3,'m','Rogeliostad','2014-07-19 16:36:54','1974-08-19',30,_binary '',48),(4,'f','New Giuseppehaven','2016-12-21 10:08:38','2008-10-01',24,_binary '\0',14),(5,'f','West Oswaldfurt','2012-10-24 07:35:27','2003-10-07',17,_binary '',19),(6,'f','New Cindy','2013-02-22 01:43:44','1983-10-04',29,_binary '',39),(7,'f','Buckridgebury','2013-10-06 07:39:17','1976-01-10',26,_binary '',46),(8,'f','Nettieberg','2014-08-26 01:21:01','1986-10-25',28,_binary '',36),(9,'m','North Javierland','2020-11-13 07:26:02','1984-12-10',14,_binary '',38),(10,'m','Port Jaredside','2013-04-02 09:55:58','2007-09-03',22,_binary '\0',15),(11,'m','North Percy','2019-01-27 13:14:15','2012-07-07',20,_binary '\0',10),(12,'m','Abnerfurt','2018-05-01 01:40:18','1996-12-06',6,_binary '',26),(13,'m','West Tierra','2021-05-26 01:11:09','2015-11-19',18,_binary '\0',7),(14,'m','Paigeborough','2021-05-02 18:12:40','2012-03-04',25,_binary '\0',10),(15,'m','Donnellyborough','2014-02-15 19:36:24','1979-09-05',3,_binary '',43),(16,'m','Lake Kaiaside','2017-03-21 04:04:50','1983-12-14',27,_binary '',39),(17,'m','Port Marjorieland','2017-09-26 14:50:24','2008-08-19',13,_binary '\0',14),(18,'m','North Devan','2014-12-09 12:49:07','1997-03-01',5,_binary '',25),(19,'m','South Medashire','2019-12-04 15:17:01','2013-12-31',7,_binary '\0',9),(20,'f','Gleasonton','2020-03-01 09:01:45','1975-09-25',6,_binary '',47),(21,'m','North Clifford','2014-10-05 02:41:27','2018-12-04',24,_binary '\0',4),(22,'f','South Vergie','2020-04-03 01:53:21','2015-08-06',25,_binary '\0',7),(23,'f','Joebury','2016-11-30 07:12:52','1973-05-16',21,_binary '',49),(24,'m','Lake Theodoreshire','2013-02-10 17:35:17','2001-10-08',30,_binary '',21),(25,'f','Port Mabelleview','2014-02-12 05:48:06','2017-05-27',4,_binary '\0',5),(26,'m','Maverickmouth','2016-11-23 07:57:48','1972-11-02',22,_binary '',50),(27,'f','Lednerton','2013-10-25 17:02:39','1977-05-15',17,_binary '',45),(28,'m','West Martin','2017-12-19 03:45:23','1997-05-18',23,_binary '',25),(29,'m','North Stanton','2017-03-25 10:43:43','2013-08-19',9,_binary '\0',9),(30,'m','East Pamela','2015-02-05 11:56:11','2007-05-14',8,_binary '\0',15);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL COMMENT 'Имя',
  `lastname` varchar(100) DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(256) DEFAULT NULL,
  `phone` bigint unsigned DEFAULT NULL COMMENT 'Телефон',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_firstname_lastname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Patrick','Emmerich','ulueilwitz@example.net','d21ba81cbe9c8f8a98b7677b875658c942182537',89778636094),(2,'Tiffany','Paucek','cassandre.little@example.org','9d462770191578b83cb42cd24a1daa06bb958308',89706590147),(3,'Corrine','Bashirian','cronin.terrill@example.org','6f3f47d174709e124a2fd8ce8e3d6694e73d368c',89788479379),(4,'Helene','Lowe','felipe.daniel@example.net','61322197937416e27c7323f67806be6e5c5161c5',89081639457),(5,'Elisa','Hirthe','wbailey@example.com','a066d62375b0e4044e6c805bffbfb6861fbdb41b',89586607417),(6,'Maxime','Pollich','leannon.margarett@example.org','f53f517bf07f15e8d0419d680a538f3e1ec7a313',89185701848),(7,'Eliseo','Ortiz','fwest@example.org','4fffbb98dba458bfaf556430ee20729ba230a8ce',89620993781),(8,'Garrett','Mante','davion23@example.net','71b551888f17e946042f6d6ecf7f176442391a34',89635147547),(9,'Pietro','Braun','mertz.theodora@example.com','939255901566787b0ce5eb19e926919912bc989e',89723496369),(10,'Aliya','Dickinson','brice.lind@example.org','32ea06444a67c635ccb5f0c38fbe378c5df34904',89561149421),(11,'Braeden','Nicolas','mills.ramiro@example.org','0c6c8b911b8083122c94af871a9b4dc06ab06214',89294730817),(12,'Jordon','Rath','jkuhn@example.org','1c90b9d466a18f22d76d06fcea8c5d5a901f4fd8',89827462946),(13,'Hulda','Fay','devyn.jakubowski@example.com','8697137de7f2698d3eb57022e0c62bf94ac22e1c',89605073595),(14,'Maria','Wisoky','vbode@example.org','52b1c6c8914d00bf32fd6afe94bcb51228959e77',89929184845),(15,'Caterina','Fritsch','kolby.jerde@example.net','fc1aa8d643ff3c15661c071f118c517fcd2c746c',89677277253),(16,'Winona','Trantow','robel.shanny@example.com','66e0d8b1e34fe71fe147f55595149ebbac10c280',89337538269),(17,'Alexane','Morar','mittie03@example.org','74786c9e4c93807a0f044234ed60af9d21536cd4',89993036037),(18,'Kendrick','Thiel','daphnee31@example.org','ab3acc065065a81aeb663875e3f759be4feb5b09',89812470493),(19,'Consuelo','Gislason','sschmeler@example.org','c1e7e3dc1dbfc66c92ef8191d777f98237f76cde',89680058529),(20,'Lennie','Anderson','naomie09@example.net','8e6a3efc2d71d83d803bef283cf0366d1becbebd',89999603989),(21,'Gerson','Daniel','stefanie42@example.net','476ca01729087d541df8966431e7aff41c07e54b',89041844011),(22,'Chesley','Bashirian','linnea.russel@example.net','83e8c01db6c6ce1f31658413150797da5066e4b9',89042762612),(23,'Taryn','Carter','iwindler@example.net','5aa5696c73c768931c15a1871a98ef67c69067da',89390337300),(24,'Alyson','Braun','kuphal.aracely@example.com','283135d05593d869cde36183bfac9ba94d242dde',89674157181),(25,'Herman','Goyette','walsh.valentina@example.com','1561337497a72506e266b391c70bef39e0ee3b75',89787459468),(26,'Jacinthe','Lesch','lmraz@example.com','1d0f339a04171d8ecf2233375a46cb82fa9cd3c7',89101362276),(27,'Elena','Parker','alta68@example.com','38857c3682b61f0b58bc535aa1637ffc5b14f81d',89418446151),(28,'Manley','Kozey','claudia.parisian@example.org','563a2336bae84980766b303765a33c0f5457b006',89754216891),(29,'Gisselle','Pagac','ephraim52@example.org','5e31a393a35df72562862b392c66b17aaf09710b',89409002610),(30,'Carleton','Beer','moses.mcglynn@example.net','6c5ef7cd8457d9598c1c4eb53309e53fe3c1c804',89641230802);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `user_id` bigint unsigned NOT NULL,
  `community_id` bigint unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06  3:40:50
