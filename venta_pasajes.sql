CREATE DATABASE  IF NOT EXISTS `venta_pasajes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `venta_pasajes`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: venta_pasajes
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento` (
  `fila` int NOT NULL,
  `nro_asiento` int NOT NULL,
  `idtipo_colectivo` int NOT NULL,
  PRIMARY KEY (`fila`,`nro_asiento`,`idtipo_colectivo`),
  KEY `idtipo_colectivo_fk_idx` (`idtipo_colectivo`),
  CONSTRAINT `idtipo_colectivo_fk` FOREIGN KEY (`idtipo_colectivo`) REFERENCES `tipo_colectivo` (`idtipo_colectivo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asientos_vendidos`
--

DROP TABLE IF EXISTS `asientos_vendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asientos_vendidos` (
  `fila` int NOT NULL,
  `nroAsiento` int NOT NULL,
  `idCompra` int NOT NULL,
  `docuPasajero` varchar(45) NOT NULL,
  `estado` tinyint NOT NULL,
  PRIMARY KEY (`fila`,`nroAsiento`,`idCompra`,`docuPasajero`),
  KEY `compra_asientovendido_fk_idx` (`idCompra`),
  CONSTRAINT `compra_asientovendido_fk` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idcompra`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fila_nroasiento_asientovendido_fk` FOREIGN KEY (`fila`, `nroAsiento`) REFERENCES `asiento` (`fila`, `nro_asiento`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientos_vendidos`
--

LOCK TABLES `asientos_vendidos` WRITE;
/*!40000 ALTER TABLE `asientos_vendidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientos_vendidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idcompra` int NOT NULL AUTO_INCREMENT,
  `fecha_hora_compra` datetime NOT NULL,
  `idRecorrido` int NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `recorrido_fk_idx` (`idRecorrido`),
  KEY `usuario_compra_fk_idx` (`idUsuario`),
  CONSTRAINT `recorrido_compra_fk` FOREIGN KEY (`idRecorrido`) REFERENCES `recorrido` (`idrecorrido`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `usuario_compra_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `idlocalidad` int NOT NULL AUTO_INCREMENT,
  `nombre_loc` varchar(45) NOT NULL,
  PRIMARY KEY (`idlocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recorrido`
--

DROP TABLE IF EXISTS `recorrido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recorrido` (
  `idrecorrido` int NOT NULL AUTO_INCREMENT,
  `idtipo_colectivo` int NOT NULL,
  `hsLlegada` time NOT NULL,
  `hsSalida` time NOT NULL,
  `id_localidad_origen` int NOT NULL,
  `id_localidad_destino` int NOT NULL,
  PRIMARY KEY (`idrecorrido`),
  KEY `id_localidad_origen_fk_idx` (`id_localidad_origen`),
  KEY `id_localidad_destino_fk_idx` (`id_localidad_destino`),
  KEY `id_colectivo_recorrdio_fk_idx` (`idtipo_colectivo`),
  CONSTRAINT `id_colectivo_recorrdio_fk` FOREIGN KEY (`idtipo_colectivo`) REFERENCES `tipo_colectivo` (`idtipo_colectivo`),
  CONSTRAINT `id_localidad_destino_fk` FOREIGN KEY (`id_localidad_destino`) REFERENCES `localidades` (`idlocalidad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `id_localidad_origen_fk` FOREIGN KEY (`id_localidad_origen`) REFERENCES `localidades` (`idlocalidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorrido`
--

LOCK TABLES `recorrido` WRITE;
/*!40000 ALTER TABLE `recorrido` DISABLE KEYS */;
/*!40000 ALTER TABLE `recorrido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_colectivo`
--

DROP TABLE IF EXISTS `tipo_colectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_colectivo` (
  `idtipo_colectivo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`idtipo_colectivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_colectivo`
--

LOCK TABLES `tipo_colectivo` WRITE;
/*!40000 ALTER TABLE `tipo_colectivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_colectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-01 18:37:03
