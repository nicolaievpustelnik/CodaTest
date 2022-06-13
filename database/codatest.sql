-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: codatest
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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `updated_at` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Nicolaiev','Brito','nicolaievbrito@gmail.com','1136228999','nico_123.jpg',0,'2022-06-12 22:23:05','2022-06-12 22:23:05'),(2,'Juan','Perez','juan123perez@gmail.com','1136228923','juan_p_123.jpg',1,'2022-06-12 22:23:56','2022-06-12 22:44:29'),(3,'Manuel','Gonzalez','gonza123@gmail.com','1136038923','mg_123.jpg',0,'2022-06-12 22:24:42','2022-06-12 22:24:42'),(4,'Felipe','Gutierrez','guti_fe@gmail.com','1136048913','guti_321_f.jpg',0,'2022-06-11 22:26:31','2022-06-12 22:26:31'),(5,'Angela','Gomez','angelagomez@gmail.com','1132348913','angegomez.jpg',0,'2022-06-10 22:27:26','2022-06-12 22:27:26'),(6,'Maria','Cabello','cabellomaria1@gmail.com','1132358313','maria_foto.jpg',0,'2022-06-10 22:28:20','2022-06-12 22:28:20'),(7,'Andrea','Bolivar','bolivarandrea@gmail.com','1132357913','ba2022.jpg',1,'2022-06-09 22:29:25','2022-06-12 22:45:21'),(8,'Samuel','Correa','samu_2912@gmail.com','1132357603','sam_cor.jpg',0,'2022-06-08 22:30:12','2022-06-12 22:30:12'),(9,'Gabriel','Fernandez','fernandezG_1297@gmail.com','1144357603','fg.jpg',0,'2022-06-07 22:31:33','2022-06-12 22:31:33'),(10,'Carlos','Lopez','LC_123@gmail.com','1144357677','carlosPhoto.jpg',1,'2022-05-06 22:32:27','2022-06-12 22:45:03'),(11,'Camila','Diaz','diaz123@gmail.com','1144333677','PhotoDIAZ.jpg',0,'2022-06-12 22:33:23','2022-06-12 22:33:23'),(12,'Juan','Marinez','juani1@gmail.com','1142933677','foto.jpg',0,'2022-04-05 22:33:53','2022-06-12 22:33:53');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_active`
--

DROP TABLE IF EXISTS `mia_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_active` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `token` text,
  `status` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_active`
--

LOCK TABLES `mia_active` WRITE;
/*!40000 ALTER TABLE `mia_active` DISABLE KEYS */;
/*!40000 ALTER TABLE `mia_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_item_role`
--

DROP TABLE IF EXISTS `mia_item_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_item_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `type` int NOT NULL DEFAULT '0',
  `permission_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_item_role`
--

LOCK TABLES `mia_item_role` WRITE;
/*!40000 ALTER TABLE `mia_item_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mia_item_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_log`
--

DROP TABLE IF EXISTS `mia_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `type_id` int NOT NULL DEFAULT '0',
  `item_id` bigint NOT NULL DEFAULT '0',
  `data` text,
  `caption` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_log`
--

LOCK TABLES `mia_log` WRITE;
/*!40000 ALTER TABLE `mia_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mia_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_permission`
--

DROP TABLE IF EXISTS `mia_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_permission`
--

LOCK TABLES `mia_permission` WRITE;
/*!40000 ALTER TABLE `mia_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mia_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_recovery`
--

DROP TABLE IF EXISTS `mia_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_recovery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `token` text,
  `status` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_recovery`
--

LOCK TABLES `mia_recovery` WRITE;
/*!40000 ALTER TABLE `mia_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `mia_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_role`
--

DROP TABLE IF EXISTS `mia_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_role`
--

LOCK TABLES `mia_role` WRITE;
/*!40000 ALTER TABLE `mia_role` DISABLE KEYS */;
INSERT INTO `mia_role` VALUES (1,'Admin',NULL),(2,'Editor',NULL);
/*!40000 ALTER TABLE `mia_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_role_access`
--

DROP TABLE IF EXISTS `mia_role_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_role_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_role_access`
--

LOCK TABLES `mia_role_access` WRITE;
/*!40000 ALTER TABLE `mia_role_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `mia_role_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mia_user`
--

DROP TABLE IF EXISTS `mia_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mia_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `photo` text,
  `phone` varchar(50) DEFAULT NULL,
  `facebook_id` varchar(100) DEFAULT NULL,
  `role` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `password` varchar(200) DEFAULT NULL,
  `status` int DEFAULT '0',
  `is_notification` int NOT NULL DEFAULT '0',
  `caption` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mia_user`
--

LOCK TABLES `mia_user` WRITE;
/*!40000 ALTER TABLE `mia_user` DISABLE KEYS */;
INSERT INTO `mia_user` VALUES (1,'empty','','matias@agencycoda.com','','',NULL,2,'2021-07-27 12:32:21','2021-07-27 12:32:21',0,'$2y$10$giSRwmR8uCrRLRupj8GYT.riEOH1GdF7xfGpn7kM9OjAc1DZ0Trgy',0,0,NULL);
/*!40000 ALTER TABLE `mia_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `caption` text CHARACTER SET utf8mb3 COLLATE utf8_general_ci,
  `deleted` int NOT NULL DEFAULT '0',
  `updated_at` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `created_at` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_FK` (`client_id`),
  CONSTRAINT `project_FK` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'Good Code','The best code with good practices',0,'2022-06-12 22:50:38','2022-06-12 22:50:38'),(2,2,'Clean Code','A handbook of agile software craftmanship',0,'2022-06-12 22:55:18','2022-06-12 22:55:18'),(3,1,'Kendall & Kendall','Systems analysis and design',0,'2022-06-12 22:57:55','2022-06-12 22:57:55'),(14,8,'Light project js','Project about animation with threeJS',0,'2022-06-12 23:10:13','2022-06-12 23:10:13'),(15,12,'PHP Project','Business logic project',0,'2022-06-12 23:11:19','2022-06-12 23:11:19');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'codatest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13  1:14:24
