-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: unissula_uas
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (1,'Satya',3.99,3),(2,'Ani',3.22,4),(3,'Budi',3.15,2),(4,'Cindi',3.44,1),(5,'Doni',3.36,4),(6,'Edi',3.75,3),(7,'Fredi',3.69,1),(8,'Gani',3.51,2),(9,'Anita',3.45,1),(10,'Bayu',3.21,2),(11,'Citra',3.87,3),(12,'Dito',3.65,4),(13,'Eka',3.78,1),(14,'Fandi',3.34,2),(15,'Gita',3.56,3),(16,'Hadi',3.42,4),(17,'Ira',3.79,2),(18,'Joko',3.23,3),(19,'Kartika',3.68,4),(20,'Lukman',3.54,3),(21,'Maya',3.76,3),(22,'Nanda',3.89,2),(23,'Zainal',3.33,1),(24,'Putri',3.67,3),(25,'Qori',3.58,4),(26,'Rudi',3.25,4),(27,'Sari',3.72,2),(28,'Tono',3.46,4),(29,'Utami',3.87,4),(30,'Vino',3.55,2),(31,'Wahyu',3.31,1),(38,'Supriyadi',3.9,2),(39,'Yunus',3.72,4),(47,'Yahya',3.7,4);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER riwayat_insert
AFTER INSERT ON mahasiswa
FOR EACH ROW
begin
INSERT INTO riwayat (tabel, aksi, tanggal) VALUES ('mahasiswa', 'insert', now());
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mahasiswa_insert
AFTER INSERT ON mahasiswa
FOR EACH ROW
BEGIN
    CALL perubahan_tabel_mahasiswa(NEW.nama, 'insert');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_perubahan_ipk
BEFORE UPDATE ON mahasiswa
FOR EACH ROW
BEGIN
    IF NEW.Ip != OLD.Ip THEN
        INSERT INTO perubahan_ipk (nama, id_mhs, nama_prodi, ipk_old, ipk_now, tanggal)
        VALUES (OLD.Nama, OLD.id_mhs, (SELECT Nama FROM prodi WHERE id_prodi = OLD.id_prodi), OLD.Ip, NEW.Ip, now());
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER riwayat_update
AFTER UPDATE ON mahasiswa
FOR EACH ROW 
begin
INSERT INTO riwayat (tabel, aksi, tanggal) VALUES ('mahasiswa', 'update', now());
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mahasiswa_update
AFTER UPDATE ON mahasiswa
FOR EACH ROW
BEGIN
call perubahan_tabel_mahasiswa(NEW.nama, 'update');
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER mahasiswa_delete
BEFORE DELETE ON mahasiswa
for each row
begin
call perubahan_tabel_mahasiswa(OLD.nama, 'delete');
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER riwayat_delete
AFTER DELETE ON mahasiswa
FOR EACH ROW
begin
INSERT INTO riwayat (tabel, aksi, tanggal) VALUES ('mahasiswa', 'delete', now());
end */;;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa_keluar`
--

LOCK TABLES `mahasiswa_keluar` WRITE;
/*!40000 ALTER TABLE `mahasiswa_keluar` DISABLE KEYS */;
INSERT INTO `mahasiswa_keluar` VALUES (1,35,'tayo',3,2024),(2,36,'Raul',4,2024),(3,37,'Maulana',3,2024),(4,40,'Yunus',4,2024),(5,32,'Yunus',4,2024),(6,41,'Satria',2,2024),(7,42,'Ridwan',4,2024),(8,46,'Fiaz',1,2024),(9,49,'Yunus',4,2024),(10,48,'Yunus',4,2024),(11,50,'Wahyu',2,2024),(12,51,'Joni',2,2024),(13,52,'Yahdi',1,2024);
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
-- Table structure for table `perubahan_ipk`
--

DROP TABLE IF EXISTS `perubahan_ipk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perubahan_ipk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) DEFAULT NULL,
  `id_mhs` int(20) DEFAULT NULL,
  `nama_prodi` varchar(30) DEFAULT NULL,
  `ipk_old` float DEFAULT NULL,
  `ipk_now` float DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perubahan_ipk`
--

LOCK TABLES `perubahan_ipk` WRITE;
/*!40000 ALTER TABLE `perubahan_ipk` DISABLE KEYS */;
INSERT INTO `perubahan_ipk` VALUES (1,'Yunus',39,'Informatika',3.73,3.72,'2024-01-05 07:54:59'),(2,'Supriyadi',38,'Tarbiyah',3.17,3.9,'2024-01-05 07:58:12'),(3,'Utami',29,'Informatika',3.88,3.87,'2024-01-05 08:27:29'),(4,'Yahya',47,'Informatika',3.72,3.7,'2024-01-05 10:26:41');
/*!40000 ALTER TABLE `perubahan_ipk` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `riwayat`
--

DROP TABLE IF EXISTS `riwayat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabel` varchar(30) DEFAULT NULL,
  `aksi` varchar(10) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat`
--

LOCK TABLES `riwayat` WRITE;
/*!40000 ALTER TABLE `riwayat` DISABLE KEYS */;
INSERT INTO `riwayat` VALUES (1,'mahasiswa','insert','2024-01-05 06:20:37'),(2,'mahasiswa','insert','2024-01-05 06:21:03'),(3,'mahasiswa','insert','2024-01-05 06:21:48'),(4,'mahasiswa','delete','2024-01-05 07:38:46'),(5,'mahasiswa','insert','2024-01-05 07:45:06'),(6,'mahasiswa','delete','2024-01-05 07:47:50'),(7,'mahasiswa','delete','2024-01-05 07:48:02'),(8,'mahasiswa','insert','2024-01-05 07:49:29'),(9,'mahasiswa','delete','2024-01-05 07:49:34'),(10,'mahasiswa','update','2024-01-05 07:54:59'),(11,'mahasiswa','update','2024-01-05 07:58:12'),(12,'mahasiswa','insert','2024-01-05 07:58:27'),(13,'mahasiswa','delete','2024-01-05 07:58:31'),(17,'mahasiswa','insert','2024-01-05 08:23:25'),(18,'mahasiswa','delete','2024-01-05 08:25:10'),(19,'mahasiswa','update','2024-01-05 08:27:29'),(20,'mahasiswa','insert','2024-01-05 10:25:37'),(21,'mahasiswa','update','2024-01-05 10:26:41'),(22,'mahasiswa','insert','2024-01-05 10:38:01'),(23,'mahasiswa','insert','2024-01-05 10:39:02'),(24,'mahasiswa','delete','2024-01-05 10:44:53'),(25,'mahasiswa','delete','2024-01-05 10:45:01'),(26,'mahasiswa','insert','2024-01-05 10:46:41'),(27,'mahasiswa','delete','2024-01-05 10:46:46'),(28,'mahasiswa','insert','2024-01-05 10:48:32'),(29,'mahasiswa','delete','2024-01-05 10:48:37'),(30,'mahasiswa','insert','2024-01-05 10:49:45'),(31,'mahasiswa','delete','2024-01-05 10:49:51');
/*!40000 ALTER TABLE `riwayat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riwayat_mahasiswa`
--

DROP TABLE IF EXISTS `riwayat_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat_mahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) DEFAULT NULL,
  `aksi` varchar(10) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_mahasiswa`
--

LOCK TABLES `riwayat_mahasiswa` WRITE;
/*!40000 ALTER TABLE `riwayat_mahasiswa` DISABLE KEYS */;
INSERT INTO `riwayat_mahasiswa` VALUES (1,'Fiaz','insert','2024-01-05 08:23:25'),(2,'Fiaz','delete','2024-01-05 08:25:10'),(3,'Utami','update','2024-01-05 08:27:29'),(4,'Yahya','insert','2024-01-05 10:25:37'),(5,'Yahya','update','2024-01-05 10:26:41'),(6,'Yunus','insert','2024-01-05 10:38:01'),(7,'Yunus','insert','2024-01-05 10:39:02'),(8,'Yunus','delete','2024-01-05 10:44:53'),(9,'Yunus','delete','2024-01-05 10:45:01'),(10,'Wahyu','insert','2024-01-05 10:46:41'),(11,'Wahyu','delete','2024-01-05 10:46:46'),(12,'Joni','insert','2024-01-05 10:48:32'),(13,'Joni','delete','2024-01-05 10:48:37'),(14,'Yahdi','insert','2024-01-05 10:49:45'),(15,'Yahdi','delete','2024-01-05 10:49:51');
/*!40000 ALTER TABLE `riwayat_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_elektro`
--

DROP TABLE IF EXISTS `view_elektro`;
/*!50001 DROP VIEW IF EXISTS `view_elektro`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_elektro` AS SELECT
 1 AS `id_mhs`,
  1 AS `Nama`,
  1 AS `Ip` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_informatika`
--

DROP TABLE IF EXISTS `view_informatika`;
/*!50001 DROP VIEW IF EXISTS `view_informatika`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_informatika` AS SELECT
 1 AS `id_mhs`,
  1 AS `Nama`,
  1 AS `Ip` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_syariah`
--

DROP TABLE IF EXISTS `view_syariah`;
/*!50001 DROP VIEW IF EXISTS `view_syariah`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_syariah` AS SELECT
 1 AS `id_mhs`,
  1 AS `Nama`,
  1 AS `Ip` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_tarbiyah`
--

DROP TABLE IF EXISTS `view_tarbiyah`;
/*!50001 DROP VIEW IF EXISTS `view_tarbiyah`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_tarbiyah` AS SELECT
 1 AS `id_mhs`,
  1 AS `Nama`,
  1 AS `Ip` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'unissula_uas'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `JumlahMahasiswaFakultas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `JumlahMahasiswaFakultas`(id_fakultas_param INT) RETURNS int(11)
BEGIN
    DECLARE jumlah_mahasiswa_fakultas INT;

    SELECT COUNT(*) INTO jumlah_mahasiswa_fakultas
    FROM mahasiswa
    WHERE id_prodi IN (SELECT id_prodi FROM prodi WHERE id_fakultas = id_fakultas_param);

    RETURN jumlah_mahasiswa_fakultas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `JumlahMahasiswaProdi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `JumlahMahasiswaProdi`(id_prodi_param INT) RETURNS int(11)
BEGIN
    DECLARE jumlah_mahasiswa_prodi INT;

    SELECT COUNT(*) INTO jumlah_mahasiswa_prodi
    FROM mahasiswa
    WHERE id_prodi = id_prodi_param;

    RETURN jumlah_mahasiswa_prodi;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `JumlahMahasiswaSeluruh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `JumlahMahasiswaSeluruh`() RETURNS int(11)
BEGIN
    DECLARE jumlah_mahasiswa INT;

    SELECT COUNT(*) INTO jumlah_mahasiswa
    FROM mahasiswa;

    RETURN jumlah_mahasiswa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `RataNilaiIPKFakultas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `RataNilaiIPKFakultas`(id_fakultas_param INT) RETURNS float
BEGIN
    DECLARE total_ipk FLOAT;
    DECLARE jumlah_mahasiswa INT;

    SELECT SUM(Ip), COUNT(*) INTO total_ipk, jumlah_mahasiswa
    FROM mahasiswa
    WHERE id_prodi IN (SELECT id_prodi FROM prodi WHERE id_fakultas = id_fakultas_param);

    IF jumlah_mahasiswa > 0 THEN
        RETURN total_ipk / jumlah_mahasiswa;
    ELSE
        RETURN NULL;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `RataNilaiIPKProdi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `RataNilaiIPKProdi`(id_prodi_param INT) RETURNS float
BEGIN
    DECLARE total_ipk FLOAT;
    DECLARE jumlah_mahasiswa INT;

    SELECT SUM(Ip), COUNT(*) INTO total_ipk, jumlah_mahasiswa
    FROM mahasiswa
    WHERE id_prodi = id_prodi_param;

    IF jumlah_mahasiswa > 0 THEN
        RETURN total_ipk / jumlah_mahasiswa;
    ELSE
        RETURN NULL;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `RataNilaiIPKSeluruhMahasiswa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `RataNilaiIPKSeluruhMahasiswa`() RETURNS float
BEGIN
    DECLARE total_ipk FLOAT;
    DECLARE jumlah_mahasiswa INT;

    SELECT SUM(Ip), COUNT(*) INTO total_ipk, jumlah_mahasiswa
    FROM mahasiswa;

    IF jumlah_mahasiswa > 0 THEN
        RETURN total_ipk / jumlah_mahasiswa;
    ELSE
        RETURN NULL;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `perubahan_tabel_mahasiswa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `perubahan_tabel_mahasiswa`(IN nama VARCHAR(30), IN aksi VARCHAR(10))
BEGIN
    INSERT INTO riwayat_mahasiswa (nama, aksi, tanggal) VALUES (nama, aksi, now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

--
-- Final view structure for view `view_elektro`
--

/*!50001 DROP VIEW IF EXISTS `view_elektro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_elektro` AS select `m`.`id_mhs` AS `id_mhs`,`m`.`Nama` AS `Nama`,`m`.`Ip` AS `Ip` from (`mahasiswa` `m` join `prodi` `p` on(`m`.`id_prodi` = `p`.`id_prodi`)) where `p`.`id_prodi` = 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_informatika`
--

/*!50001 DROP VIEW IF EXISTS `view_informatika`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_informatika` AS select `m`.`id_mhs` AS `id_mhs`,`m`.`Nama` AS `Nama`,`m`.`Ip` AS `Ip` from (`mahasiswa` `m` join `prodi` `p` on(`m`.`id_prodi` = `p`.`id_prodi`)) where `p`.`id_prodi` = 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_syariah`
--

/*!50001 DROP VIEW IF EXISTS `view_syariah`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_syariah` AS select `m`.`id_mhs` AS `id_mhs`,`m`.`Nama` AS `Nama`,`m`.`Ip` AS `Ip` from (`mahasiswa` `m` join `prodi` `p` on(`m`.`id_prodi` = `p`.`id_prodi`)) where `p`.`id_prodi` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tarbiyah`
--

/*!50001 DROP VIEW IF EXISTS `view_tarbiyah`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tarbiyah` AS select `m`.`id_mhs` AS `id_mhs`,`m`.`Nama` AS `Nama`,`m`.`Ip` AS `Ip` from (`mahasiswa` `m` join `prodi` `p` on(`m`.`id_prodi` = `p`.`id_prodi`)) where `p`.`id_prodi` = 2 */;
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

-- Dump completed on 2024-01-06 12:16:29
