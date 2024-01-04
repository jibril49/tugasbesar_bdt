-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: unissula
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumni` (
  `id_alumni` int(20) NOT NULL,
  `Nama` char(40) DEFAULT NULL,
  `id_prodi` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_alumni`),
  KEY `id_prodi` (`id_prodi`),
  CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumni`
--

LOCK TABLES `alumni` WRITE;
/*!40000 ALTER TABLE `alumni` DISABLE KEYS */;
INSERT INTO `alumni` VALUES (1,'Ani',4),(2,'Kodi',3),(3,'Lala',1),(4,'Mina',4),(5,'Neni',2),(6,'Opi',4),(7,'Rani',3);
/*!40000 ALTER TABLE `alumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakultas`
--

DROP TABLE IF EXISTS `fakultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fakultas` (
  `Id_fakultas` int(20) NOT NULL,
  `Nama` char(30) DEFAULT NULL,
  `Jumlah_mahasiswa` int(20) DEFAULT NULL,
  PRIMARY KEY (`Id_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakultas`
--

LOCK TABLES `fakultas` WRITE;
/*!40000 ALTER TABLE `fakultas` DISABLE KEYS */;
INSERT INTO `fakultas` VALUES (1,'Fakultas Agama Islam',4),(2,'Fakultas Teknologi Industri',3);
/*!40000 ALTER TABLE `fakultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `id_mhs` int(20) NOT NULL AUTO_INCREMENT,
  `Nama` char(30) DEFAULT NULL,
  `Ip` float DEFAULT NULL,
  `id_prodi` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_mhs`),
  KEY `id_prodi` (`id_prodi`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (1,'Satya',3.99,3),(2,'Ani',3.22,4),(3,'Budi',3.15,2),(4,'Cindi',3.44,1),(5,'Doni',3.36,4),(6,'Edi',3.75,3),(7,'Fredi',3.69,1),(8,'Gani',3.51,2),(9,'Anita',3.45,1),(10,'Bayu',3.21,2),(11,'Citra',3.87,3),(12,'Dito',3.65,4),(13,'Eka',3.78,1),(14,'Fandi',3.34,2),(15,'Gita',3.56,3),(16,'Hadi',3.42,4),(17,'Ira',3.79,2),(18,'Joko',3.23,3),(19,'Kartika',3.68,4),(20,'Lukman',3.54,3),(21,'Maya',3.76,3),(22,'Nanda',3.89,2),(23,'Zainal',3.33,1),(24,'Putri',3.67,3),(25,'Qori',3.58,4),(26,'Rudi',3.25,4),(27,'Sari',3.72,2),(28,'Tono',3.46,4),(29,'Utami',3.88,4),(30,'Vino',3.55,2),(31,'Wahyu',3.31,1),(32,'Yunus',3.75,4);
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER cek_ipk
BEFORE INSERT ON mahasiswa
FOR EACH ROW
BEGIN
    IF NEW.ip < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'IPK tidak bisa di bawah nol';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mhs_keluar BEFORE DELETE ON mahasiswa
FOR EACH ROW
BEGIN
    INSERT INTO mahasiswa_keluar (id_mhs, nama, id_prodi, tahun_keluar)
    VALUES (OLD.id_mhs, OLD.nama, OLD.id_prodi, YEAR(CURDATE()));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mahasiswa_keluar`
--

DROP TABLE IF EXISTS `mahasiswa_keluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa_keluar` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_mhs` int(15) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `id_prodi` int(10) DEFAULT NULL,
  `tahun_keluar` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_prodi` (`id_prodi`),
  CONSTRAINT `mahasiswa_keluar_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa_keluar`
--

LOCK TABLES `mahasiswa_keluar` WRITE;
/*!40000 ALTER TABLE `mahasiswa_keluar` DISABLE KEYS */;
INSERT INTO `mahasiswa_keluar` VALUES (1,35,'tayo',3,2024),(2,36,'Raul',4,2024);
/*!40000 ALTER TABLE `mahasiswa_keluar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mahasiswa_prodi`
--

DROP TABLE IF EXISTS `mahasiswa_prodi`;
/*!50001 DROP VIEW IF EXISTS `mahasiswa_prodi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mahasiswa_prodi` AS SELECT
 1 AS `alumni`,
  1 AS `prodi` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prodi`
--

DROP TABLE IF EXISTS `prodi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodi` (
  `id_prodi` int(20) NOT NULL,
  `Nama` char(30) DEFAULT NULL,
  `Jumlah_mahasiswa` int(20) DEFAULT NULL,
  `id_fakultas` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_prodi`),
  KEY `id_fakultas` (`id_fakultas`),
  CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`Id_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodi`
--

LOCK TABLES `prodi` WRITE;
/*!40000 ALTER TABLE `prodi` DISABLE KEYS */;
INSERT INTO `prodi` VALUES (1,'Syariah',2,1),(2,'Tarbiyah',2,1),(3,'Elektro',1,2),(4,'Informatika',2,2);
/*!40000 ALTER TABLE `prodi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'unissula'
--

--
-- Final view structure for view `mahasiswa_prodi`
--

/*!50001 DROP VIEW IF EXISTS `mahasiswa_prodi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mahasiswa_prodi` AS select `alumni`.`Nama` AS `alumni`,`prodi`.`Nama` AS `prodi` from (`alumni` join `prodi`) where `alumni`.`id_prodi` = `prodi`.`id_prodi` */;
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

-- Dump completed on 2024-01-04 18:37:54
