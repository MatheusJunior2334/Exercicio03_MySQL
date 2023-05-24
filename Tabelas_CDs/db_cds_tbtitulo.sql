-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: db_cds
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbtitulo`
--

DROP TABLE IF EXISTS `tbtitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbtitulo` (
  `idTitulo` int NOT NULL AUTO_INCREMENT,
  `idCategoria` int NOT NULL,
  `idGravadora` int NOT NULL,
  `NomeCD` varchar(100) NOT NULL,
  `ValorCD` decimal(10,2) NOT NULL DEFAULT '1.00',
  `QuantidadeEstoque` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTitulo`),
  KEY `fkTituloCategoria` (`idCategoria`),
  KEY `fkTituloGravadora` (`idGravadora`),
  CONSTRAINT `fkTituloCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `tbcategoria` (`idCategoria`),
  CONSTRAINT `fkTituloGravadora` FOREIGN KEY (`idGravadora`) REFERENCES `tbgravadora` (`idGravadora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtitulo`
--

LOCK TABLES `tbtitulo` WRITE;
/*!40000 ALTER TABLE `tbtitulo` DISABLE KEYS */;
INSERT INTO `tbtitulo` VALUES (1,1,1,'Selling England by the Pound',275.50,635),(2,2,2,'Kim Wilde',150.50,311),(3,3,3,'Close to the Edge',480.50,88),(4,4,4,'Like a Virgin',95.50,258),(5,5,5,'The Kick Inside',318.50,128);
/*!40000 ALTER TABLE `tbtitulo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-23 22:07:45
