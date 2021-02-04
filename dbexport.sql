-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: coffee_right
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `ac_id` int NOT NULL AUTO_INCREMENT,
  `ac_email` varchar(50) DEFAULT NULL,
  `ac_password` text,
  `ac_name` varchar(100) DEFAULT NULL,
  `ac_phone` varchar(20) DEFAULT NULL,
  `ac_level` int DEFAULT NULL,
  `ac_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ac_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'ikrima@gmail.com','$2b$10$ZRhi/UvOOtlhenIOOMU9ZuX7gLVcBkYkK/04xv1IT2thCNcbzePX2','Ikrima','081298056468',0,'2021-01-25 01:30:53','2021-01-25 01:32:54'),(2,'rosadi@gmail.com','$2b$10$wkBNRgmnDhhewFGS5QplhOqDmIIbuqsjn6hT1.4C1y65I8ZTSbr3O','Rosyid Rosadi','089609960946',1,'2021-01-25 01:31:19','2021-01-26 18:13:53'),(4,'alvita@gmail.com','$2b$10$nGWADHkwv9jTM9M/Rirge.KnbIkchcVs2GngkzbpjkMnl4.RI1mWO','Miqdad','081298056468',0,'2021-01-25 00:55:18','2021-01-29 01:50:23'),(5,'yolanda@gmail.com','$2b$10$TCwJA24syejdsDc7rIj8sum3kgnSGUELpNTK3gxCep.2BWbh.zUBe','Yolanda','086788543123',0,'2021-01-25 23:42:36','2021-01-25 23:42:36'),(6,'ajizul@gmail.com','$2b$10$XheYCX2.548kcuL2tITcZeDX9Cq4ZESEuDzKoKJBvMxnYjVrQ7WKS','aji','086788543123',0,'2021-01-26 15:27:59','2021-01-26 15:27:59'),(7,'admin@gmail.com','$2b$10$bw9eje0pUacKBQX4/VsOmOWjJUiQrSb77qugylIOw2i2mxYoalHF6','mamang','082987651222',1,'2021-01-26 16:05:21','2021-01-26 16:05:21'),(8,'miqdad.ihbs71777@gmail.com','$2b$10$gGU0FCIeYYSRVkAgChHPlOIYcgYxX06CJ91aV9YKpuysDGobKM7z.','','081298056468',0,'2021-01-27 03:35:34','2021-01-27 03:35:34'),(9,'amala@gmail.com','$2b$10$uMfoYpryzDte3MrHuMs8p.GJLcy8wRK7ahJF42oZ..7cgF1PGsc1O','Amala','089655433211',0,'2021-01-28 14:53:11','2021-01-30 18:51:35'),(10,'rosyid15@gmail.com','$2b$10$uKrcvYXPPUXf3KWw9kAJruT8bdaP1lto9vLUiMr0zbz3GbBD.xInW','Rosyid Rosadi','08819585970',0,'2021-01-29 00:49:46','2021-01-31 08:52:33'),(11,'muh.hibban71777@gmail.com','$2b$10$WE5B3/odfrvykQJaBEhAbuXD1Vi97dlhV39lECeAiKzka0lv21ppC','Miqdad','081298056468',0,'2021-01-29 01:52:29','2021-01-29 01:55:10'),(12,'karmawan@gmail.com','$2b$10$/p9mqoL28utdNsKl8yoZIO1HVy4jfX/Q60vvFbN26G9shBLeEXBiK','Miqdad IHBS','081298056468',0,'2021-01-29 02:10:59','2021-01-30 15:33:16'),(13,'marinda@gmail.com','$2b$10$CbwimHzJHJh6DYcbepiZ6OFjjSszlgMHRBgAR1E5lks9DBvEBwZTW','','08964321234',0,'2021-01-30 08:21:10','2021-01-30 08:21:10'),(14,'jesse@gmail.com','$2b$10$nmLnhCcFEIuXHjU0AZL5Me3vXJKQDt0i9oZxN/Tab5xvZqN57YXcy','Jesse','089766567890',0,'2021-01-30 18:50:55','2021-02-01 09:11:03'),(15,'putri@gmail.com','$2b$10$96Nx7TTxneyCMRCJRWCAsuMZvGk/9CUqOByke5b2kpXipFrlCKuqG','Putro','082987651222',1,'2021-01-31 12:28:45','2021-01-31 12:28:45'),(16,'agam@gmail.com','$2b$10$wZjtzSOvg85fzeS.X4LDg.tD3DHJKjBVeVDkV6flJx4xEm46eyyAq','','085796969760',0,'2021-01-31 12:45:15','2021-01-31 12:45:15'),(17,'tinus@gmail.com','$2b$10$NAGDOh03aN7hboEMhuq4z.BRv/eu98CLJVdILk8emGOhecue3MC.2','Tinus','089788766544',0,'2021-01-31 13:30:25','2021-02-01 00:00:11'),(18,'azzam@gmail.com','$2b$10$r.qVFKvbu.oZG8DYxLTS2OUOWnpFz4/96fnxmkr98AFhzSNZz7kt2','Azzam Ganesha','085632157849',0,'2021-01-31 14:05:45','2021-01-31 15:43:23'),(19,'unseen@gmail.com','$2b$10$M3whFX.V1skZP75C3YvixenPfk3p0.A.4EYiukBrHhegGeo7AcCZa','Unseen','081298056468',0,'2021-01-31 16:45:54','2021-01-31 16:48:20'),(20,'miqdad1@gmail.com','$2b$10$ffPzx8cDvYL2i/IiBw2q9.4IguOX251HWltxw.cVZFniW.oIe01jC','miqdad1','081212121',0,'2021-01-31 17:05:44','2021-02-02 04:25:12'),(21,'david@gmail.com','$2b$10$SO3WqQSMIw8QrzU0x1MVA.LMoUv5P0FNezefdMxCWsyOMXWNXcnAW','David','12345678',0,'2021-01-31 17:33:56','2021-02-01 01:25:49'),(22,'coba@oke.com','$2b$10$ucas5tEeUccGbFqqsLy/j.KtBZRzKquO351S/Ril9f2u41eWhOkp6','coba','121212121212',0,'2021-01-31 21:01:14','2021-01-31 21:02:17'),(23,'haris@gmail.com','$2b$10$LVOxpO9B5ImJIjiYEardTetLB9p5syhCNX5QQeqa/2IJ2KgrUiPRm','','085123321567',0,'2021-02-01 00:13:35','2021-02-01 00:13:35'),(24,'erdin.sdzeko@gmail.com','$2b$10$amr9/BToq9alera3hGnv.Oz38002/c84ixvW5dbsuV1rEkNVFPHu6','','089501019875',0,'2021-02-01 02:58:57','2021-02-01 03:34:12'),(25,'erdinsuharyadi@gmail.com','$2b$10$TFD0k2oHRFuR55td8OHOleJBRy.juRSt9hjsO.CINlEvAPyPi.3.i','Erdin Suharyadi','089501019876',0,'2021-02-01 02:59:56','2021-02-01 03:31:30'),(26,'arkademy@gmail.com','$2b$10$974fGjfSxscLxlU9AtVfxOdNlgt5wRAUkOkXfYhbsXqvnrKVTX/0y','Arka Android','088232165497',0,'2021-02-01 03:09:24','2021-02-03 00:48:50'),(27,'f@gmail.com','$2b$10$V4BuadTiosN5btpTEPvzLe5kRgws/gP3Fmq43xJLzwx9fv.dtOUsa','ffff','088543216',0,'2021-02-01 03:10:31','2021-02-01 03:20:58'),(28,'erdin@gmail.com','$2b$10$GGBcLS8hS.dsojokvd67JOk8X8p7SZGRfbpb9rRUnMGTqxktabLS2','Erdin','089501019876',0,'2021-02-01 09:13:29','2021-02-01 09:14:43'),(29,'king@gmail.com','$2b$10$g0au16aKz98OaxTV7/xpeev8tYw/P02cztWPRSIhk/T/sTtoAztPi','king','123456789012',0,'2021-02-02 05:39:23','2021-02-02 05:45:14');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `ac_id` int DEFAULT NULL,
  `ad_image` text,
  `ad_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ad_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ad_id`),
  KEY `ac_id` (`ac_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,2,'IMG-1611538464230.jpg','2021-01-25 01:31:19','2021-01-25 01:34:24'),(3,7,NULL,'2021-01-26 16:05:21','2021-01-26 16:05:21'),(4,15,NULL,'2021-01-31 12:28:45','2021-01-31 12:28:45');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `co_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cs_id` int NOT NULL AUTO_INCREMENT,
  `ac_id` int DEFAULT NULL,
  `cs_gender` enum('Male','Female') DEFAULT NULL,
  `cs_birthday` date DEFAULT NULL,
  `cs_address` text,
  `cs_image` text,
  `cs_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cs_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cs_id`),
  KEY `ac_id` (`ac_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'Female','1998-11-04','Bekasi','IMG-1611538629406.jpg','2021-01-25 01:30:53','2021-01-26 15:10:55'),(2,4,'Male','1998-03-04','Bekasi','IMG-1611841766113.jpeg','2021-01-25 00:55:18','2021-01-29 01:50:23'),(3,5,'Female','1997-07-29','Malang','IMG-1611721248428.jpg','2021-01-25 23:42:36','2021-01-27 04:20:48'),(4,6,'Male','2009-02-04','Bojong Gede','IMG-1612448302346.jpg','2021-01-26 15:27:59','2021-02-04 14:18:22'),(5,8,NULL,NULL,NULL,NULL,'2021-01-27 03:35:34','2021-01-27 03:35:34'),(6,9,'Female','2021-01-28','Granada, Spain','IMG-1612135795380.jpg','2021-01-28 14:53:11','2021-01-31 23:29:55'),(7,10,'Male','2021-01-05','Mojokerto, Jawa Timur','IMG-1612107049685.jpg','2021-01-29 00:49:46','2021-01-31 15:30:51'),(8,11,'Male','2021-01-29','Bekasi','IMG-1611885310267.jpeg','2021-01-29 01:52:29','2021-01-29 01:55:10'),(9,12,'Male','2021-01-29','Bekasi, Pondok Melati','IMG-1611994761022.jpeg','2021-01-29 02:10:59','2021-01-30 08:19:21'),(10,13,NULL,NULL,NULL,NULL,'2021-01-30 08:21:10','2021-01-30 08:21:10'),(11,14,'Male','2021-01-01','Sawojajar, Malang','IMG-1612147197752.jpg','2021-01-30 18:50:55','2021-02-01 09:11:03'),(12,16,NULL,NULL,NULL,NULL,'2021-01-31 12:45:15','2021-01-31 12:45:15'),(13,17,'Male','2021-01-04','Malang','IMG-1612137626842.jpg','2021-01-31 13:30:25','2021-02-01 00:00:27'),(14,18,'Male','2021-01-19','Sao Paolo, Brazil','IMG-1612107410326.jpg','2021-01-31 14:05:45','2021-01-31 15:36:51'),(15,19,'Male','2021-01-31','Bekasi, Pondok Melati',NULL,'2021-01-31 16:45:54','2021-01-31 17:05:12'),(16,20,'Male','2021-02-01','adada','IMG-1612148066830.jpeg','2021-01-31 17:05:44','2021-02-01 02:54:27'),(17,21,'Male','2021-02-01','Testing','IMG-1612141914461.jpg','2021-01-31 17:33:56','2021-02-01 01:11:55'),(18,22,'Male','2021-02-01','Jakarta','IMG-1612127031678.jpg','2021-01-31 21:01:14','2021-01-31 21:03:53'),(19,23,NULL,NULL,NULL,NULL,'2021-02-01 00:13:35','2021-02-01 00:13:35'),(20,24,NULL,NULL,NULL,NULL,'2021-02-01 02:58:57','2021-02-01 02:58:57'),(21,25,'Female','2021-02-28','Karawang','IMG-1612170767174.png','2021-02-01 02:59:56','2021-02-01 09:12:49'),(22,26,'Male','2021-02-25','Alexandria, Turkey','IMG-1612149155618.jpeg','2021-02-01 03:09:24','2021-02-03 00:25:22'),(23,27,'Female','2021-02-01','jalan kenangan',NULL,'2021-02-01 03:10:31','2021-02-01 03:21:06'),(24,28,'Female','2021-02-11','kar','IMG-1612170898149.jpeg','2021-02-01 09:13:29','2021-02-01 09:14:58'),(25,29,'Male','2021-02-02','here','IMG-1612244714911.jpg','2021-02-02 05:39:23','2021-02-02 05:45:23');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `dv_id` int NOT NULL AUTO_INCREMENT,
  `cs_id` int DEFAULT NULL,
  `dv_dt` enum('DI','DD','PU') DEFAULT NULL,
  `dv_yn` enum('Y','N') DEFAULT NULL,
  `dv_st` time DEFAULT NULL,
  `dv_address` text,
  `dv_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dv_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (4,2,'DI','Y','12:00:00','Malang','2021-01-25 09:23:33','2021-01-26 01:48:26'),(5,2,'PU','Y','15:00:00','Malang','2021-01-25 13:10:01','2021-01-26 01:46:15'),(8,2,'PU','Y','15:00:00','Belimbing, Malang','2021-01-26 05:19:55','2021-01-26 05:19:55'),(9,2,'PU','Y','15:00:00','Singosari, Malang','2021-01-26 05:51:52','2021-01-26 05:51:52'),(15,3,'PU','Y','15:00:00','Bojong Gede','2021-01-26 12:47:39','2021-01-26 12:47:39'),(16,3,'DI','N','13:00:00','Bojong Kenyot','2021-01-28 02:13:19','2021-01-28 02:13:19'),(17,3,'DD','N','12:15:00','Malang','2021-01-28 02:31:36','2021-01-28 02:31:36'),(18,3,'DI','N','13:00:00','Bojong Kenyot','2021-01-28 02:31:43','2021-01-28 02:31:43'),(19,3,'DD','N','15:00:00','Not set','2021-01-28 13:54:49','2021-01-28 13:54:49'),(20,3,'PU','N','15:00:00','Malang','2021-01-28 14:13:06','2021-01-28 14:13:06'),(23,4,'PU','N','15:00:00','Not set','2021-01-28 16:10:22','2021-01-28 16:10:22'),(26,4,'PU','N','15:00:00','Not set','2021-01-28 16:21:25','2021-01-28 16:21:25'),(27,4,'PU','N','00:00:00','Not set','2021-01-28 16:23:23','2021-01-28 16:23:23'),(28,4,'PU','N','02:00:00','Not set','2021-01-28 16:25:43','2021-01-28 16:25:43'),(29,4,'PU','N','01:00:00','Not set','2021-01-28 17:03:04','2021-01-28 17:03:04'),(30,3,'DI','Y','00:00:00','Malang','2021-01-28 17:04:33','2021-01-28 17:04:33'),(31,3,'DI','Y','00:00:00','Malang','2021-01-28 17:04:46','2021-01-28 17:04:46'),(32,3,'DI','Y','00:00:00','Malang','2021-01-28 17:08:38','2021-01-28 17:08:38'),(33,4,'PU','N','15:00:00','Not set','2021-01-28 17:12:22','2021-01-28 17:12:22'),(34,4,'PU','N','10:00:00','Not set','2021-01-28 17:16:38','2021-01-28 17:16:38'),(35,6,'PU','N','10:00:00','Not set','2021-01-28 19:25:56','2021-01-28 19:25:56'),(36,6,'PU','N','15:00:00','Not set','2021-01-30 05:43:43','2021-01-30 05:43:43'),(37,6,'PU','N','10:00:00','Not set','2021-01-30 06:00:43','2021-01-30 06:00:43'),(41,6,'PU','N','05:00:00','Not set','2021-01-30 06:16:39','2021-01-30 06:16:39'),(42,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:30:52','2021-01-30 06:30:52'),(43,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:31:23','2021-01-30 06:31:23'),(44,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:38:25','2021-01-30 06:38:25'),(45,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:48:01','2021-01-30 06:48:01'),(46,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:49:11','2021-01-30 06:49:11'),(47,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:49:46','2021-01-30 06:49:46'),(48,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:50:30','2021-01-30 06:50:30'),(49,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:51:06','2021-01-30 06:51:06'),(50,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:51:41','2021-01-30 06:51:41'),(51,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:52:14','2021-01-30 06:52:14'),(52,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:52:43','2021-01-30 06:52:43'),(53,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 06:53:35','2021-01-30 06:53:35'),(54,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 07:04:49','2021-01-30 07:04:49'),(55,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 07:05:35','2021-01-30 07:05:35'),(56,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 07:06:31','2021-01-30 07:06:31'),(57,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 07:06:53','2021-01-30 07:06:53'),(58,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 07:07:12','2021-01-30 07:07:12'),(59,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 07:07:36','2021-01-30 07:07:36'),(60,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 07:09:02','2021-01-30 07:09:02'),(61,9,'PU','Y','15:00:00','Cakung','2021-01-30 07:13:24','2021-01-30 07:13:24'),(62,9,'PU','Y','15:00:00','Cakung','2021-01-30 07:22:33','2021-01-30 07:22:33'),(63,9,'PU','Y','15:00:00','Cakung','2021-01-30 07:35:21','2021-01-30 07:35:21'),(64,6,'PU','N','10:00:00','Not set','2021-01-30 07:54:37','2021-01-30 07:54:37'),(65,6,'DI','Y','00:00:00','Not set','2021-01-30 08:07:44','2021-01-30 08:07:44'),(66,6,'DI','Y','00:00:00','Not set','2021-01-30 08:08:12','2021-01-30 08:08:12'),(67,6,'DI','Y','00:00:00','Not set','2021-01-30 08:08:58','2021-01-30 08:08:58'),(68,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 08:15:56','2021-01-30 08:15:56'),(69,9,'DI','Y','00:00:00','Bekasi, Pondok Melati','2021-01-30 08:16:52','2021-01-30 08:16:52'),(70,6,'DI','Y','00:00:00','Not set','2021-01-30 08:17:58','2021-01-30 08:17:58'),(71,6,'DI','Y','00:00:00','Not set','2021-01-30 08:19:53','2021-01-30 08:19:53'),(72,10,'DI','Y','00:00:00','Not set','2021-01-30 08:21:43','2021-01-30 08:21:43'),(73,10,'DI','Y','00:00:00','Not set','2021-01-30 08:22:26','2021-01-30 08:22:26'),(74,10,'DI','Y','00:00:00','Not set','2021-01-30 08:22:49','2021-01-30 08:22:49'),(75,10,'DI','Y','00:00:00','Not set','2021-01-30 08:23:52','2021-01-30 08:23:52'),(76,10,'DI','Y','00:00:00','Not set','2021-01-30 08:42:35','2021-01-30 08:42:35'),(77,10,'DI','Y','00:00:00','Not set','2021-01-30 08:43:42','2021-01-30 08:43:42'),(78,10,'DI','Y','00:00:00','Not set','2021-01-30 08:49:04','2021-01-30 08:49:04'),(79,10,'DI','Y','00:00:00','Not set','2021-01-30 08:52:53','2021-01-30 08:52:53'),(80,10,'DI','Y','00:00:00','Not set','2021-01-30 08:53:55','2021-01-30 08:53:55'),(81,10,'DI','Y','00:00:00','Not set','2021-01-30 08:54:18','2021-01-30 08:54:18'),(82,4,'DI','Y','00:00:00','Not set','2021-01-30 17:23:48','2021-01-30 17:23:48'),(83,10,'DI','Y','00:00:00','Not set','2021-01-30 18:27:34','2021-01-30 18:27:34'),(84,10,'DD','N','15:00:00','Not set','2021-01-30 18:32:23','2021-01-30 18:32:23'),(85,11,'DI','Y','00:00:00','Not set','2021-01-30 18:52:23','2021-01-30 18:52:23'),(86,11,'DI','Y','00:00:00','Not set','2021-01-30 18:54:53','2021-01-30 18:54:53'),(87,11,'DI','Y','00:00:00','Not set','2021-01-31 12:16:53','2021-01-31 12:16:53'),(89,12,'DI','Y','00:00:00','Not set','2021-01-31 12:47:41','2021-01-31 12:47:41'),(90,11,'DI','Y','00:00:00','Jakarta Utara','2021-01-31 13:06:51','2021-01-31 13:06:51'),(91,13,'DI','Y','00:00:00','Not set','2021-01-31 13:35:57','2021-01-31 13:35:57'),(92,11,'DD','N','15:02:15','Jakarta Utara','2021-01-31 14:04:42','2021-01-31 14:04:42'),(93,11,'DD','N','10:00:03','Jakarta Utara','2021-01-31 14:19:17','2021-01-31 14:19:17'),(94,11,'DI','Y','00:00:00','Jakarta Utara','2021-01-31 15:25:52','2021-01-31 15:25:52'),(97,12,'DI','Y','00:00:00','Not set','2021-01-31 15:55:09','2021-01-31 15:55:09'),(98,14,'DI','Y','00:00:00','Sao Paolo, Brazil','2021-01-31 16:24:23','2021-01-31 16:24:23'),(99,11,'DI','Y','00:00:00','Jakarta Utara','2021-01-31 17:26:38','2021-01-31 17:26:38'),(102,17,'DD','N','16:41:50','Not set','2021-01-31 17:41:56','2021-01-31 17:41:56'),(103,18,'DI','Y','00:00:00','Jakarta','2021-01-31 21:04:34','2021-01-31 21:04:34'),(105,13,'DI','N','10:05:29','Malang','2021-02-01 00:07:53','2021-02-01 00:07:53'),(106,13,'DI','Y','00:00:00','Malang','2021-02-01 00:12:01','2021-02-01 00:12:01'),(108,19,'PU','N','12:22:52','Not set','2021-02-01 00:25:14','2021-02-01 00:25:14'),(112,19,'DD','N','10:01:25','Not set','2021-02-01 02:03:51','2021-02-01 02:03:51'),(113,4,'DD','N','05:08:17','Not set','2021-02-01 02:10:42','2021-02-01 02:10:42'),(114,21,'DD','N','15:06:21','Not set','2021-02-01 03:06:28','2021-02-01 03:06:28'),(115,21,'DD','N','12:13:19','Not set','2021-02-01 03:13:24','2021-02-01 03:13:24'),(117,11,'DI','Y','00:00:00','Jakarta Utara','2021-02-01 03:20:32','2021-02-01 03:20:32'),(118,23,'DI','Y','00:00:00','Not set','2021-02-01 03:24:05','2021-02-01 03:24:05'),(120,21,'DI','N','12:26:30','Not set','2021-02-01 03:26:56','2021-02-01 03:26:56'),(121,23,'DI','Y','00:00:00','Not set','2021-02-01 03:29:50','2021-02-01 03:29:50'),(122,21,'DI','N','12:26:30','Not set','2021-02-01 03:30:04','2021-02-01 03:30:04'),(123,21,'DD','N','00:43:43','Karawang','2021-02-01 03:43:47','2021-02-01 03:43:47'),(126,22,'DD','N','12:45:14','Alexandria, Turkey','2021-02-01 03:45:19','2021-02-01 03:45:19'),(127,21,'PU','N','04:45:40','Karawang','2021-02-01 03:45:43','2021-02-01 03:45:43'),(128,21,'DI','Y','00:00:00','Karawang','2021-02-01 03:50:47','2021-02-01 03:50:47'),(129,21,'DD','N','04:23:11','Karawang','2021-02-01 03:51:16','2021-02-01 03:51:16'),(130,21,'DI','Y','00:00:00','Karawang','2021-02-01 08:21:10','2021-02-01 08:21:10'),(131,25,'DI','Y','00:00:00','Not set','2021-02-02 06:18:56','2021-02-02 06:18:56'),(137,4,'DI','Y','00:00:00','Not set','2021-02-03 09:24:22','2021-02-03 09:24:22'),(138,4,'DI','Y','00:00:00','Not set','2021-02-03 09:31:17','2021-02-03 09:31:17'),(139,4,'DI','Y','00:00:00','Not set','2021-02-03 12:43:12','2021-02-03 12:43:12'),(142,4,'DI','Y','00:00:00','Not set','2021-02-03 12:55:53','2021-02-03 12:55:53'),(147,4,'DI','Y','00:00:00','Not set','2021-02-03 13:09:19','2021-02-03 13:09:19');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `dc_id` int NOT NULL AUTO_INCREMENT,
  `dc_nominal` double DEFAULT NULL,
  `dc_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dc_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,0,'2021-01-25 00:53:14','2021-01-25 00:53:14'),(2,0.1,'2021-01-25 00:53:49','2021-01-25 00:53:49');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `od_id` int NOT NULL AUTO_INCREMENT,
  `cs_id` int DEFAULT NULL,
  `dv_id` int DEFAULT NULL,
  `od_total_price_before_tax` int DEFAULT NULL,
  `co_id` int DEFAULT NULL,
  `od_totalPrice` int DEFAULT NULL,
  `od_status` enum('Unpaid','Paid','Ready','Deliver','Done') DEFAULT NULL,
  `od_payment_method` enum('Card','Bank','COD') DEFAULT NULL,
  `od_tax` int DEFAULT NULL,
  `od_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `od_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `od_transaction_id` text,
  PRIMARY KEY (`od_id`),
  KEY `cs_id` (`cs_id`),
  KEY `dv_id` (`dv_id`),
  KEY `co_id` (`co_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`dv_id`) REFERENCES `delivery` (`dv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_detail_ibfk_5` FOREIGN KEY (`co_id`) REFERENCES `coupon` (`co_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (3,2,5,59000,NULL,64900,'Done','COD',5900,'2021-01-25 13:11:36','2021-01-31 23:31:13',''),(12,2,8,74000,NULL,81400,'Done','COD',7400,'2021-01-26 05:20:38','2021-01-26 05:29:11',''),(15,3,15,73600,NULL,80960,'Done','Card',7360,'2021-01-26 12:48:46','2021-01-26 19:14:34',''),(16,4,23,102000,NULL,112200,'Done','COD',10200,'2021-01-28 16:10:50','2021-01-28 16:14:42',''),(18,4,26,24300,NULL,26730,'Done','COD',2430,'2021-01-28 16:22:15','2021-01-28 16:54:28',''),(20,4,28,50000,NULL,55000,'Done','Card',5000,'2021-01-28 16:25:51','2021-01-31 23:36:16',''),(21,4,29,49300,NULL,54230,'Done','Card',4930,'2021-01-28 17:03:14','2021-01-28 17:09:03',''),(22,4,33,24300,NULL,26730,'Done','Card',2430,'2021-01-28 17:12:27','2021-01-28 17:12:51',''),(23,4,34,27000,NULL,29700,'Done','COD',2700,'2021-01-28 17:16:50','2021-01-28 17:17:01',''),(24,6,35,24300,NULL,26730,'Done','COD',2430,'2021-01-28 19:26:05','2021-01-30 05:48:25',''),(25,6,36,53800,NULL,59180,'Done','COD',5380,'2021-01-30 05:43:52','2021-01-30 05:56:43',''),(31,9,42,24300,NULL,26730,'Done','Card',2430,'2021-01-30 06:31:01','2021-01-30 06:35:32',''),(46,9,58,24300,NULL,26730,'Done','Bank',2430,'2021-01-30 07:07:15','2021-01-31 23:38:26',''),(47,9,59,24300,NULL,26730,'Done','COD',2430,'2021-01-30 07:07:39','2021-01-31 23:38:35',''),(49,9,61,24300,NULL,26730,'Done','Card',2430,'2021-01-30 07:13:46','2021-01-30 07:17:43',''),(50,9,62,48600,NULL,53460,'Done','Card',4860,'2021-01-30 07:22:44','2021-01-30 07:23:29',''),(53,6,65,50000,NULL,55000,'Done','Bank',5000,'2021-01-30 08:07:48','2021-01-31 23:39:48',''),(54,6,66,28800,NULL,31680,'Done','COD',2880,'2021-01-30 08:08:18','2021-01-31 23:39:56',''),(55,6,67,18000,NULL,19800,'Done','Card',1800,'2021-01-30 08:09:03','2021-01-31 23:40:03',''),(59,6,70,15300,NULL,16830,'Done','Bank',1530,'2021-01-30 08:18:05','2021-01-31 23:41:14',''),(64,10,74,9000,NULL,9900,'Done','COD',900,'2021-01-30 08:22:54','2021-01-31 23:42:13',''),(69,10,79,28800,NULL,31680,'Done','Card',2880,'2021-01-30 08:52:59','2021-01-31 23:43:29',''),(70,10,80,25000,NULL,27500,'Done','Card',2500,'2021-01-30 08:54:01','2021-01-31 23:43:34',''),(71,10,81,9000,NULL,9900,'Done','COD',900,'2021-01-30 08:54:24','2021-01-31 23:43:40',''),(72,4,82,21600,NULL,23760,'Done','Bank',2160,'2021-01-30 17:24:10','2021-01-31 23:43:49',''),(73,10,83,125000,NULL,137500,'Done','Card',12500,'2021-01-30 18:27:40','2021-01-31 23:43:58',''),(74,10,84,97200,NULL,106920,'Done','Bank',9720,'2021-01-30 18:32:33','2021-01-30 18:44:57',''),(75,11,85,9000,NULL,9900,'Done','COD',900,'2021-01-30 18:52:27','2021-01-30 18:52:45',''),(76,11,86,33300,NULL,36630,'Done','Card',3330,'2021-01-30 18:54:59','2021-01-30 18:55:28',''),(77,11,87,34000,NULL,37400,'Done','Card',3400,'2021-01-31 12:17:09','2021-01-31 13:05:21',''),(78,12,89,24300,NULL,26730,'Done','Bank',2430,'2021-01-31 12:47:46','2021-01-31 23:44:09',''),(79,11,90,21600,NULL,23760,'Done','Bank',2160,'2021-01-31 13:06:56','2021-01-31 13:14:29',''),(80,13,91,48600,NULL,53460,'Done','COD',4860,'2021-01-31 13:36:03','2021-01-31 23:44:17',''),(81,11,92,106200,NULL,116820,'Done','COD',10620,'2021-01-31 14:04:47','2021-01-31 14:06:06',''),(82,11,93,75000,NULL,82500,'Done','COD',7500,'2021-01-31 14:19:21','2021-01-31 14:19:56',''),(83,11,94,25000,NULL,27500,'Done','COD',2500,'2021-01-31 15:25:57','2021-01-31 23:44:23',''),(84,12,97,49300,NULL,54230,'Done','COD',4930,'2021-01-31 15:55:22','2021-01-31 23:44:36',''),(85,14,98,36000,NULL,39600,'Done','Card',3600,'2021-01-31 16:24:29','2021-01-31 23:44:43',''),(86,11,99,50000,NULL,55000,'Done','COD',5000,'2021-01-31 17:26:43','2021-01-31 17:28:02',''),(87,17,102,27000,NULL,29700,'Done','COD',2700,'2021-01-31 17:42:02','2021-01-31 23:44:48',''),(88,18,103,54000,NULL,59400,'Done','Card',5400,'2021-01-31 21:04:40','2021-01-31 23:44:53',''),(89,13,105,36000,NULL,39600,'Done','Bank',3600,'2021-02-01 00:08:24','2021-02-01 00:12:45',''),(90,13,106,55800,NULL,61380,'Done','Card',5580,'2021-02-01 00:12:05','2021-02-01 00:12:50',''),(92,19,108,25000,NULL,27500,'Done','COD',2500,'2021-02-01 00:25:21','2021-02-01 00:26:21',''),(93,19,112,28800,NULL,31680,'Done','Bank',2880,'2021-02-01 02:03:58','2021-02-01 02:07:14',''),(94,4,113,25000,NULL,27500,'Done','Card',2500,'2021-02-01 02:10:47','2021-02-01 02:10:54',''),(95,21,114,43000,NULL,47300,'Done','COD',4300,'2021-02-01 03:08:47','2021-02-01 03:22:03',''),(96,21,115,99900,NULL,109890,'Done','COD',9990,'2021-02-01 03:14:00','2021-02-01 03:21:58',''),(97,11,117,106200,NULL,116820,'Done','COD',10620,'2021-02-01 03:20:47','2021-02-01 03:21:53',''),(98,23,118,52200,NULL,57420,'Paid','Bank',5220,'2021-02-01 03:24:12','2021-02-01 03:24:12',''),(99,23,121,26100,NULL,28710,'Paid','Bank',2610,'2021-02-01 03:29:54','2021-02-01 03:29:54',''),(100,21,122,25000,NULL,27500,'Paid','Card',2500,'2021-02-01 03:30:14','2021-02-01 03:30:14',''),(107,22,126,77400,NULL,85140,'Done','COD',7740,'2021-02-01 03:45:25','2021-02-01 04:58:19',''),(108,21,127,27000,NULL,29700,'Paid','COD',2700,'2021-02-01 03:45:52','2021-02-01 03:45:52',''),(109,21,128,25000,NULL,27500,'Paid','Bank',2500,'2021-02-01 03:50:53','2021-02-01 03:50:53',''),(110,21,129,27000,NULL,29700,'Paid','Bank',2700,'2021-02-01 03:51:20','2021-02-01 03:51:20',''),(111,21,130,50000,NULL,55000,'Paid','COD',5000,'2021-02-01 08:22:52','2021-02-01 08:22:52',''),(112,25,131,486000,NULL,534600,'Paid','Bank',48600,'2021-02-02 06:19:03','2021-02-02 06:19:03',''),(113,4,139,24300,NULL,26730,'Unpaid','COD',2430,'2021-02-03 12:43:20','2021-02-03 12:43:20','6579add0-661d-11eb-94ad-6d414e50439a'),(117,4,147,13500,NULL,14850,'Unpaid','COD',1350,'2021-02-03 13:09:35','2021-02-03 13:09:35','106524b0-6621-11eb-94ad-6d414e50439a');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tb`
--

DROP TABLE IF EXISTS `order_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tb` (
  `or_id` int NOT NULL AUTO_INCREMENT,
  `pr_id` int DEFAULT NULL,
  `cs_id` int DEFAULT NULL,
  `or_status` enum('Cart','Done') DEFAULT NULL,
  `or_amount` int DEFAULT NULL,
  `or_price` int DEFAULT NULL,
  `od_id` int DEFAULT NULL,
  `or_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `or_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`or_id`),
  KEY `cs_id` (`cs_id`),
  KEY `pr_id` (`pr_id`),
  KEY `od_id` (`od_id`),
  CONSTRAINT `order_tb_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_tb_ibfk_2` FOREIGN KEY (`pr_id`) REFERENCES `product` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_tb_ibfk_3` FOREIGN KEY (`od_id`) REFERENCES `order_detail` (`od_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tb`
--

LOCK TABLES `order_tb` WRITE;
/*!40000 ALTER TABLE `order_tb` DISABLE KEYS */;
INSERT INTO `order_tb` VALUES (5,4,2,'Done',1,27000,3,'2021-01-25 12:49:49','2021-01-26 00:22:37'),(18,7,3,'Done',2,48600,15,'2021-01-26 12:45:23','2021-01-26 12:52:10'),(19,1,3,'Done',1,25000,15,'2021-01-26 12:45:49','2021-01-26 12:52:10'),(20,7,3,'Cart',1,24300,NULL,'2021-01-27 02:17:49','2021-01-28 14:11:30'),(21,1,3,'Cart',1,25000,NULL,'2021-01-27 13:53:00','2021-01-28 14:12:21'),(22,1,4,'Done',1,25000,16,'2021-01-28 14:54:48','2021-01-28 16:13:55'),(23,1,4,'Done',2,50000,16,'2021-01-28 14:55:17','2021-01-28 16:13:55'),(24,4,4,'Done',1,27000,16,'2021-01-28 15:06:15','2021-01-28 16:13:55'),(25,7,2,'Cart',1,24300,NULL,'2021-01-28 15:11:43','2021-01-28 15:11:43'),(26,1,4,'Done',1,25000,16,'2021-01-28 16:15:44','2021-01-28 16:17:11'),(27,7,4,'Done',2,48600,16,'2021-01-28 16:15:54','2021-01-28 16:17:11'),(28,7,4,'Done',1,24300,16,'2021-01-28 16:21:11','2021-01-28 16:22:15'),(29,4,4,'Done',1,27000,18,'2021-01-28 16:23:12','2021-01-28 16:23:26'),(30,1,4,'Done',2,50000,20,'2021-01-28 16:25:16','2021-01-28 16:25:51'),(31,1,4,'Done',1,25000,20,'2021-01-28 17:00:55','2021-01-28 17:03:14'),(32,7,4,'Done',1,24300,20,'2021-01-28 17:01:13','2021-01-28 17:03:14'),(33,7,4,'Done',1,24300,22,'2021-01-28 17:12:11','2021-01-28 17:12:27'),(34,4,4,'Done',1,27000,23,'2021-01-28 17:16:22','2021-01-28 17:16:50'),(54,1,6,'Done',1,25000,24,'2021-01-30 05:42:49','2021-01-30 05:43:52'),(55,8,6,'Done',1,28800,24,'2021-01-30 05:43:11','2021-01-30 05:43:52'),(56,1,6,'Done',1,25000,25,'2021-01-30 05:59:13','2021-01-30 06:00:56'),(62,7,9,'Done',1,24300,31,'2021-01-30 06:30:34','2021-01-30 06:31:27'),(63,7,9,'Done',1,24300,31,'2021-01-30 06:37:47','2021-01-30 06:38:36'),(78,7,9,'Done',1,24300,46,'2021-01-30 07:07:28','2021-01-30 07:07:39'),(79,7,9,'Done',1,24300,47,'2021-01-30 07:08:56','2021-01-30 07:09:11'),(83,1,6,'Done',2,50000,53,'2021-01-30 07:54:08','2021-01-30 08:07:48'),(84,8,6,'Done',1,28800,54,'2021-01-30 08:08:07','2021-01-30 08:08:18'),(85,15,6,'Done',1,18000,55,'2021-01-30 08:08:53','2021-01-30 08:09:04'),(88,19,6,'Done',1,15300,59,'2021-01-30 08:17:52','2021-01-30 08:18:37'),(92,21,10,'Done',1,9000,64,'2021-01-30 08:22:46','2021-01-30 08:22:54'),(97,8,10,'Done',1,28800,69,'2021-01-30 08:52:50','2021-01-30 08:52:59'),(98,1,10,'Done',1,25000,70,'2021-01-30 08:53:51','2021-01-30 08:54:02'),(99,21,10,'Done',1,9000,71,'2021-01-30 08:54:16','2021-01-30 08:54:25'),(100,1,10,'Done',5,125000,73,'2021-01-30 08:57:49','2021-01-30 18:27:40'),(101,20,4,'Done',2,21600,72,'2021-01-30 11:58:09','2021-01-30 17:24:11'),(102,8,10,'Done',3,86400,74,'2021-01-30 18:31:30','2021-01-30 18:32:33'),(103,20,10,'Done',1,10800,74,'2021-01-30 18:31:59','2021-01-30 18:32:33'),(104,21,11,'Done',1,9000,75,'2021-01-30 18:51:37','2021-01-30 18:52:28'),(105,19,11,'Done',1,15300,76,'2021-01-30 18:54:43','2021-01-30 18:54:59'),(106,18,11,'Done',1,18000,76,'2021-01-30 18:54:48','2021-01-30 18:54:59'),(112,1,11,'Done',1,25000,77,'2021-01-31 11:51:03','2021-01-31 12:17:09'),(113,21,11,'Done',1,9000,77,'2021-01-31 11:51:13','2021-01-31 12:17:09'),(114,7,12,'Done',1,24300,78,'2021-01-31 12:47:33','2021-01-31 12:47:47'),(115,20,11,'Done',2,21600,79,'2021-01-31 13:06:42','2021-01-31 13:06:56'),(116,19,13,'Done',2,30600,80,'2021-01-31 13:35:38','2021-01-31 13:36:03'),(117,18,13,'Done',1,18000,80,'2021-01-31 13:35:43','2021-01-31 13:36:03'),(118,4,7,'Cart',1,27000,NULL,'2021-01-31 13:39:45','2021-01-31 13:39:45'),(119,8,11,'Done',2,57600,81,'2021-01-31 14:04:06','2021-01-31 14:04:48'),(120,7,11,'Done',2,48600,81,'2021-01-31 14:04:12','2021-01-31 14:04:48'),(121,1,11,'Done',3,75000,82,'2021-01-31 14:18:44','2021-01-31 14:19:22'),(122,1,11,'Done',1,25000,83,'2021-01-31 15:25:45','2021-01-31 15:25:57'),(123,1,12,'Done',1,25000,84,'2021-01-31 15:51:14','2021-01-31 15:55:23'),(124,7,12,'Done',1,24300,84,'2021-01-31 15:55:02','2021-01-31 15:55:23'),(125,15,14,'Done',2,36000,85,'2021-01-31 16:23:29','2021-01-31 16:24:29'),(126,1,11,'Done',2,50000,86,'2021-01-31 17:26:29','2021-01-31 17:26:43'),(128,4,17,'Done',1,27000,87,'2021-01-31 17:40:53','2021-01-31 17:42:02'),(129,1,17,'Cart',1,25000,NULL,'2021-01-31 17:49:28','2021-02-01 01:12:19'),(131,4,18,'Done',2,54000,88,'2021-01-31 21:04:21','2021-01-31 21:04:40'),(132,15,13,'Done',2,36000,89,'2021-02-01 00:00:54','2021-02-01 00:08:24'),(133,8,13,'Done',1,28800,90,'2021-02-01 00:09:21','2021-02-01 00:12:05'),(134,4,13,'Done',1,27000,90,'2021-02-01 00:11:41','2021-02-01 00:12:05'),(136,1,19,'Done',1,25000,92,'2021-02-01 00:19:59','2021-02-01 00:25:22'),(137,14,17,'Cart',1,26100,NULL,'2021-02-01 01:12:50','2021-02-01 01:12:50'),(138,1,14,'Cart',1,25000,NULL,'2021-02-01 01:16:52','2021-02-01 01:16:52'),(139,8,19,'Done',1,28800,93,'2021-02-01 01:59:42','2021-02-01 02:03:58'),(140,1,4,'Done',1,25000,94,'2021-02-01 02:08:37','2021-02-01 02:10:47'),(144,1,1,'Cart',1,25000,NULL,'2021-02-01 03:04:58','2021-02-01 03:04:58'),(145,15,21,'Done',1,18000,95,'2021-02-01 03:05:14','2021-02-01 03:08:48'),(146,1,21,'Done',1,25000,95,'2021-02-01 03:05:22','2021-02-01 03:08:48'),(147,8,21,'Done',2,57600,96,'2021-02-01 03:12:23','2021-02-01 03:14:01'),(148,15,21,'Done',1,18000,96,'2021-02-01 03:12:38','2021-02-01 03:14:01'),(149,7,21,'Done',1,24300,96,'2021-02-01 03:12:43','2021-02-01 03:14:01'),(151,14,23,'Done',2,52200,98,'2021-02-01 03:15:30','2021-02-01 03:24:12'),(153,8,11,'Done',2,57600,97,'2021-02-01 03:19:56','2021-02-01 03:20:47'),(154,7,11,'Done',2,48600,97,'2021-02-01 03:20:08','2021-02-01 03:20:47'),(156,1,21,'Done',1,25000,100,'2021-02-01 03:24:52','2021-02-01 03:30:14'),(157,14,23,'Done',1,26100,99,'2021-02-01 03:29:43','2021-02-01 03:29:55'),(158,1,20,'Cart',1,25000,NULL,'2021-02-01 03:34:32','2021-02-01 03:34:32'),(159,7,21,'Done',1,24300,100,'2021-02-01 03:38:57','2021-02-01 03:44:03'),(160,1,21,'Done',3,75000,100,'2021-02-01 03:41:54','2021-02-01 03:44:03'),(161,7,22,'Done',2,48600,107,'2021-02-01 03:42:07','2021-02-01 03:45:26'),(162,8,22,'Done',1,28800,107,'2021-02-01 03:44:50','2021-02-01 03:45:26'),(163,4,21,'Done',1,27000,108,'2021-02-01 03:45:36','2021-02-01 03:45:52'),(164,1,21,'Done',1,25000,109,'2021-02-01 03:50:30','2021-02-01 03:50:54'),(165,4,21,'Done',1,27000,110,'2021-02-01 03:51:01','2021-02-01 03:51:20'),(166,1,21,'Done',2,50000,111,'2021-02-01 08:19:19','2021-02-01 08:22:52'),(168,7,25,'Done',20,486000,112,'2021-02-02 06:18:23','2021-02-02 06:19:03'),(169,18,22,'Cart',1,18000,NULL,'2021-02-02 11:09:35','2021-02-02 17:38:23'),(171,7,22,'Cart',1,24300,NULL,'2021-02-02 23:39:48','2021-02-02 23:39:48'),(172,7,4,'Done',1,24300,113,'2021-02-03 09:14:35','2021-02-03 12:43:21'),(177,16,4,'Done',1,13500,117,'2021-02-03 13:09:16','2021-02-03 13:09:36');
/*!40000 ALTER TABLE `order_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pr_id` int NOT NULL AUTO_INCREMENT,
  `dc_id` int DEFAULT NULL,
  `pr_name` varchar(50) DEFAULT NULL,
  `pr_desc` text,
  `pr_unit_price` int DEFAULT NULL,
  `pr_image` text,
  `pr_favorite` enum('Y','N') DEFAULT NULL,
  `pr_category` enum('Food','Drink') DEFAULT NULL,
  `pr_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pr_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pr_id`),
  KEY `dc_id` (`dc_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`dc_id`) REFERENCES `discount` (`dc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Hazelnut Latte','Ahh, the hazelnut. The Italians have explored its virtues since time immemorial. And why not? Toasty and sweet, the hazelnut has made legends out of cakes and pastries. It\'ll do the same for your drinks. Add a splash and revel in its creamy goodness.',25000,'IMG-1611564216226.png','Y','Drink','2021-01-25 08:43:36','2021-01-27 04:35:07'),(4,1,'Creamy Ice Latte','But Oreo doesn\'t have any of that fancy cacao. It has cocoa, which is raw cacao that\'s been roasted at high temperatures. It\'s also been processed with alkali like the label says, which, as Food Crumbles explains, results in a reduction of the cocoa\'s bitterness and changes its color.',27000,'IMG-1611578879909.png','Y','Drink','2021-01-25 12:47:59','2021-01-28 14:56:24'),(7,2,'Choco Oreo','Good taste of choco oreo',27000,'IMG-1611663972201.png','Y','Drink','2021-01-26 12:03:42','2021-01-28 17:15:39'),(8,2,'Summer Fried Rice','Summer squash matchsticks, Leftover white rice, 1 egg, beaten sliced scallions with splash of oyster sauce and chopped fresh basil',32000,'IMG-1611810040157.jpg','Y','Food','2021-01-28 05:00:40','2021-01-28 05:00:40'),(14,2,'Caramel Macchiato','Freshly steamed milk with vanilla-flavored syrup marked with espresso and topped with a caramel drizzle for an oh-so-sweet finish.',29000,'IMG-1611928458777.jpg','N','Drink','2021-01-29 13:54:19','2021-01-29 13:54:19'),(15,2,'Green Tea Latte','Smooth and creamy matcha sweetened just right and served with steamed milk. This favorite will transport your senses to pure green delight.',20000,'IMG-1611992842094.jpg','Y','Drink','2021-01-30 07:47:22','2021-01-30 07:47:22'),(16,2,'Espresso Coffee','Espresso is a type of coffee. More specifically, it\'s a method of brewing coffee that uses high water pressure and finely ground beans to make a small, concentrated shot (the term also refers to the shot itself). While darkly roasted beans have historically been more popular in Italy, where espresso was invented, any kind of coffee bean from any origin and at any roast level can be used to make espresso. ',15000,'IMG-1611992918518.jpg','Y','Drink','2021-01-30 07:48:39','2021-01-30 07:48:39'),(17,2,'Americano Coffee','The rise of coffee culture is exciting for some coffee enthusiasts. However, it can be overwhelming for some to navigate the menus of specialty coffee shops. Honestly, some shops may as well write them in Greek. \n\nIf you’re new to the different kinds of coffee beverages, you may wonder what drink will suit your tastebuds the best.',15000,'IMG-1611993007779.jpg','Y','Drink','2021-01-30 07:50:08','2021-01-30 07:50:08'),(18,2,'Red Velvet Latte','Red Velvet Latte is a decadent mocha latte with an extra touch of vanilla and made beautifully red velvet naturally with beet juice. Enjoy all the taste and joy of a fancy red velvet coffee at home, affordably, in just a minute. This red velvet coffee would be my second fancy coffee.',20000,'IMG-1611993082614.jpg','Y','Drink','2021-01-30 07:51:23','2021-01-30 07:51:23'),(19,2,'Croissant',' is a buttery, flaky, viennoiserie pastry of Austrian origin, named for its historical crescent shape. Croissants and other viennoiserie are made of a layered yeast-leavened dough. The process results in a layered, flaky texture, similar to a puff pastry.',17000,'IMG-1611993151118.jpg','Y','Food','2021-01-30 07:52:31','2021-01-30 07:52:31'),(20,2,'Sausage Rolls',' Sausage rolls are a staple of both British and Irish food. They\'re so common that it is easy to forget what clever things they are: A buttery puff pastry baked to golden perfection gives a delightful flakiness and crisp texture to accompany the hearty meat filling made out of eggs, sausage, onions, and spices.',12000,'IMG-1611993222604.png','Y','Food','2021-01-30 07:53:43','2021-01-30 07:53:43'),(21,2,'Cheese Slice Cake','The chiffon cake itself is infused lightly with cheddar cheese. The solid cheese is melted together with milk and oil over medium heat until you have a nice milky and cheesy liquid. That liquid is mixed together with a yolk batter made of egg yolks, sugar, flour and baking powder.',10000,'IMG-1611993294258.jpg','Y','Food','2021-01-30 07:54:54','2021-01-30 07:54:54');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-04 15:27:50
