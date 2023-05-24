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
-- Table structure for table `tbconjuge`
--

DROP TABLE IF EXISTS `tbconjuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbconjuge` (
  `idConjuge` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `NomeConjuge` varchar(100) NOT NULL,
  `RendaConjuge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `SexoConjuge` enum('f','m') NOT NULL DEFAULT 'm',
  PRIMARY KEY (`idConjuge`),
  KEY `fkConjugeCliente` (`idCliente`),
  CONSTRAINT `fkConjugeCliente` FOREIGN KEY (`idCliente`) REFERENCES `tbcliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbconjuge`
--

LOCK TABLES `tbconjuge` WRITE;
/*!40000 ALTER TABLE `tbconjuge` DISABLE KEYS */;
INSERT INTO `tbconjuge` VALUES (1,1,'Layla do Carmo',1650.00,'f'),(2,2,'Leonardo dos Santos',1950.00,'m'),(3,3,'Matheus Silva',2150.00,'m'),(4,4,'Matheus Júnior',2150.00,'m'),(5,5,'Luana dos Anjos',2550.00,'f');
/*!40000 ALTER TABLE `tbconjuge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-23 22:07:46
