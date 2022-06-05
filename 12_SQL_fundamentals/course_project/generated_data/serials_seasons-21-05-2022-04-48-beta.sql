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
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials_seasons`
--

LOCK TABLES `serials_seasons` WRITE;
/*!40000 ALTER TABLE `serials_seasons` DISABLE KEYS */;
INSERT INTO `serials_seasons` VALUES (1,'Постпродакшен',3,6,'1989-02-03',NULL,'2007-04-02 00:23:01','1981-09-27 04:50:38'),(2,'Постпродакшен',3,1,'2018-11-25',NULL,'1985-07-24 04:11:36','2020-06-13 02:35:19'),(3,'Премьера',4,5,'2017-12-03',NULL,'2009-01-05 04:25:51','1972-12-31 21:44:12'),(4,'В производстве',5,4,'1986-02-24',NULL,'2020-05-31 21:46:34','2017-11-09 23:34:26'),(5,'В производстве',3,7,'1976-11-15',NULL,'2011-10-16 12:43:54','1992-11-18 10:12:51'),(6,'Премьера онлайн',2,10,'2014-09-08',NULL,'2020-05-16 07:25:08','1981-09-16 14:22:48'),(7,'Постпродакшен',3,9,'1992-01-27',NULL,'1999-11-30 20:44:55','2003-03-03 04:33:40'),(8,'Постпродакшен',6,3,'2001-06-21',NULL,'1976-07-14 06:52:20','1994-05-16 03:56:49');
/*!40000 ALTER TABLE `serials_seasons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-21  4:48:32
