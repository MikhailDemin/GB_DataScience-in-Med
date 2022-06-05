-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
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
-- Table structure for table `users_ratings`
--

DROP TABLE IF EXISTS `users_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `serials_id` bigint(20) unsigned NOT NULL,
  `serials_rating` float DEFAULT NULL,
  `season_id` bigint(20) unsigned NOT NULL,
  `season_rating` float DEFAULT NULL,
  `episode_id` bigint(20) unsigned NOT NULL,
  `episode_rating` float DEFAULT NULL,
  `film_id` bigint(20) unsigned NOT NULL,
  `film_rating` float DEFAULT NULL,
  `actor_id` bigint(20) unsigned NOT NULL,
  `actor_rating` float DEFAULT NULL,
  `director_id` bigint(20) unsigned NOT NULL,
  `director_rating` float DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_ratings`
--

LOCK TABLES `users_ratings` WRITE;
/*!40000 ALTER TABLE `users_ratings` DISABLE KEYS */;
INSERT INTO `users_ratings` VALUES (1,7,5,4,4,2,2,7,6,3,7,4,15,2),(2,1,2,9,1,5,8,8,9,9,15,3,4,5),(3,1,7,9,3,2,8,5,4,9,3,6,4,3),(4,2,1,6,4,4,7,10,1,10,7,7,1,5),(5,3,2,3,6,5,6,9,9,5,1,8,7,8),(6,9,10,8,3,4,6,3,9,4,12,4,4,1),(7,3,3,4,3,2,1,9,4,6,11,5,6,9),(8,8,8,3,3,9,7,6,8,6,13,8,6,9),(9,5,4,4,1,9,5,6,3,8,14,8,1,6),(10,10,3,5,6,6,2,5,4,2,6,3,15,6),(11,6,9,1,6,4,8,9,5,5,7,3,6,2),(12,10,9,8,6,2,6,4,6,10,10,8,11,8),(13,1,10,6,6,3,8,6,10,7,15,7,10,3),(14,10,2,4,3,10,8,8,6,6,11,2,1,9),(15,7,7,8,2,7,4,9,7,7,3,4,10,5),(16,6,2,7,4,6,7,5,3,2,8,9,13,6),(17,4,10,8,4,6,6,5,3,5,8,7,14,1),(18,2,2,5,3,2,6,2,8,5,5,3,1,1),(19,8,10,7,4,3,5,7,8,6,6,3,1,7),(20,8,4,7,3,4,5,5,10,7,8,6,10,3);
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

-- Dump completed on 2022-05-21  0:50:35
