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
-- Table structure for table `serials`
--

DROP TABLE IF EXISTS `serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `serial_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `director_id` bigint(20) unsigned NOT NULL,
  `actor_id` bigint(20) unsigned NOT NULL,
  `season_id` bigint(20) unsigned NOT NULL,
  `genre_id` bigint(20) unsigned NOT NULL,
  `poster_id` bigint(20) unsigned NOT NULL,
  `trailer_id` bigint(20) unsigned NOT NULL,
  `users_rating` float DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serials`
--

LOCK TABLES `serials` WRITE;
/*!40000 ALTER TABLE `serials` DISABLE KEYS */;
INSERT INTO `serials` VALUES (1,'corrupti',11,7,6,2,15,29,26,NULL,'1981-05-05 03:51:16','1971-09-29 11:27:04'),(2,'et',7,6,14,4,13,3,30,NULL,'1977-12-05 18:15:32','2000-08-13 04:50:55'),(3,'nam',6,11,10,5,12,40,13,NULL,'2014-12-21 23:19:19','2009-07-07 09:09:24'),(4,'numquam',1,5,8,6,17,32,39,NULL,'2014-01-07 20:56:58','1981-03-04 15:41:43'),(5,'blanditiis',9,6,13,3,4,18,23,NULL,'1978-03-03 16:03:40','2000-03-11 00:49:52'),(6,'mollitia',3,10,14,2,4,9,1,NULL,'2004-11-13 23:25:55','2015-06-06 21:49:19'),(7,'voluptatem',8,7,8,5,2,23,39,NULL,'2014-01-09 15:06:58','2012-12-27 11:14:05'),(8,'a',10,1,12,4,1,30,1,NULL,'1974-04-22 11:27:50','2006-02-04 11:13:06'),(9,'impedit',6,10,3,6,2,34,3,NULL,'1970-01-17 22:36:15','2005-07-24 00:43:29'),(10,'labore',7,13,11,6,11,37,26,NULL,'1995-08-15 01:26:09','2015-08-12 23:52:00');
/*!40000 ALTER TABLE `serials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-21  4:44:20
