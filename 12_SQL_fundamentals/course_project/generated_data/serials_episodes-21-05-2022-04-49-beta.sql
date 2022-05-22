-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
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
-- Table structure for table `serials_episodes`
--

DROP TABLE IF EXISTS `serials_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serials_episodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `serial_episode_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serials_id` bigint(20) unsigned NOT NULL,
  `season_id` bigint(20) unsigned NOT NULL,
  `episode_release_date` date DEFAULT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_episodes`
--

LOCK TABLES `serials_episodes` WRITE;
/*!40000 ALTER TABLE `serials_episodes` DISABLE KEYS */;
INSERT INTO `serials_episodes` VALUES (1,'nemo',9,7,'1998-01-11',NULL,'1973-08-19 21:13:31','2018-12-26 09:14:16'),(2,'et',4,2,'2015-07-07',NULL,'2014-10-25 21:05:11','1972-02-07 16:21:20'),(3,'dolores',2,7,'2010-05-02',NULL,'1973-10-20 09:10:16','1970-12-15 11:02:44'),(4,'facilis',3,4,'1993-11-08',NULL,'1975-01-30 13:07:39','2017-03-19 15:35:42'),(5,'natus',1,8,'1972-11-15',NULL,'1992-02-05 05:05:46','2005-08-23 00:08:56'),(6,'voluptate',3,5,'1975-11-22',NULL,'2012-03-25 15:44:41','2000-01-05 16:53:42'),(7,'dicta',7,5,'1991-09-28',NULL,'2004-05-05 09:29:35','1976-01-19 16:59:59'),(8,'iste',6,6,'1990-08-11',NULL,'1997-08-11 08:47:54','1993-08-05 03:20:48'),(9,'fugit',5,8,'2003-01-28',NULL,'2002-02-18 18:01:04','1972-01-07 04:48:35'),(10,'et',7,4,'1975-11-18',NULL,'2020-12-06 05:56:40','1993-11-11 17:02:01');
/*!40000 ALTER TABLE `serials_episodes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-21  4:49:50
