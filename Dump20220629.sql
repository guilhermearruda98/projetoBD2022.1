CREATE DATABASE  IF NOT EXISTS `projetomaiscor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projetomaiscor`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: projetomaiscor
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `cpf_cliente` char(13) NOT NULL,
  `nome_cliente` char(50) NOT NULL,
  `email_cliente` char(255) DEFAULT NULL,
  `id_endereco` int NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_endereco` (`id_endereco`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco_clientes` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1111,'9403890490390','LUANA ALVES','luana290@gmail.com',111),(2222,'8379190180901','SAULO EDUARDO','sauloedu09@gmail.com',333),(3333,'1728938903910','PAULO SILVA','paulosil12@gmail.com',222),(4444,'1748503903819','MARIA GONCALVES','mariagol23@gmail.com',555),(5555,'910193983943','CAIO JUNIOR','caiojr13@gmail.com',444);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_clientes`
--

DROP TABLE IF EXISTS `contato_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_clientes` (
  `id_contato` int NOT NULL,
  `id_cliente` int NOT NULL,
  `contato` char(15) NOT NULL,
  PRIMARY KEY (`id_contato`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `contato_clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_clientes`
--

LOCK TABLES `contato_clientes` WRITE;
/*!40000 ALTER TABLE `contato_clientes` DISABLE KEYS */;
INSERT INTO `contato_clientes` VALUES (12,1111,'+55819387367289'),(13,2222,'+55919389029038'),(14,3333,'+55938018398911'),(15,4444,'+55529817637819'),(16,5555,'+55879380204809');
/*!40000 ALTER TABLE `contato_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_clientes`
--

DROP TABLE IF EXISTS `endereco_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_clientes` (
  `id_endereco` int NOT NULL,
  `rua_endereco` char(20) NOT NULL,
  `numero_endereco` char(8) NOT NULL,
  `bairro_endereco` char(20) NOT NULL,
  `cidade_endereco` char(20) NOT NULL,
  `estado_endereco` char(20) NOT NULL,
  `complemento_endereco` char(100) NOT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_clientes`
--

LOCK TABLES `endereco_clientes` WRITE;
/*!40000 ALTER TABLE `endereco_clientes` DISABLE KEYS */;
INSERT INTO `endereco_clientes` VALUES (111,'RUA DAS MOCAS','819','ARRUDA','RECIFE','PERNAMBUCO','N/A'),(222,'AVENIDA DO FORTE','289','SAO JOSE','SAO PAULO','SAO PAULO','N/A'),(333,'RUA DOS CARNEIROS','512','APIPUCOS','SALVADOR','BAHIA','APT 301'),(444,'AVENIDA 17 DE AGOSTO','1239','CASA FORTE','RECIFE','PERNAMBUCO','CASA 12'),(555,'AVENIDA SAO PAULO','145','ALTO DA SE','MATAO','SAO PAULO','N/A');
/*!40000 ALTER TABLE `endereco_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `valor_pedido` float NOT NULL,
  `data_pedido` date NOT NULL,
  `previsao_entrega` date NOT NULL,
  `desconto_pedido` int NOT NULL,
  `forma_pagamento` char(10) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_vendedor` (`id_vendedor`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (22,1111,456,59.7,'2022-05-13','2022-05-20',15,'CREDITO'),(33,2222,456,79.9,'2022-06-30','2022-07-04',0,'DINHEIRO'),(44,3333,789,119.8,'2022-06-15','2022-05-22',0,'DEBITO'),(55,4444,123,99.8,'2022-06-14','2022-06-21',10,'PIX'),(66,5555,789,209.7,'2022-06-25','2022-07-01',25,'BOLETO');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int NOT NULL,
  `fabricante_produto` char(20) NOT NULL,
  `nome_produto` char(29) NOT NULL,
  `valor_produto` float DEFAULT NULL,
  `unidade_produto` char(10) DEFAULT NULL,
  `volume_produto` char(10) DEFAULT NULL,
  `cor_produto` char(15) DEFAULT NULL,
  `quantidade_estoque` char(15) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (10,'SUVINIL','TINTA ACRILICA',79.9,'1','3 GAL','VERDE','12'),(20,'MAISTINTA','MASSA CORRIDA',19.9,'3','500g','BRANCA','20'),(30,'CORAL','TINTA LATEX',59.9,'2','1 GAL','AMARELA','4'),(40,'iQUINE','ESMALTE SINTÉTICO',49.9,'2','3 GAL','AZUL BEBE','5'),(50,'CORION','TINTA EPOXI',69.9,'3','2 GAL','VERMELHO','10');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_pedido`
--

DROP TABLE IF EXISTS `produtos_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_pedido` (
  `id_produtos_pedido` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade_produto` int NOT NULL,
  PRIMARY KEY (`id_produtos_pedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `produtos_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `produtos_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_pedido`
--

LOCK TABLES `produtos_pedido` WRITE;
/*!40000 ALTER TABLE `produtos_pedido` DISABLE KEYS */;
INSERT INTO `produtos_pedido` VALUES (0,66,50,3),(77,22,20,3),(88,33,10,1),(99,55,40,2),(112,44,30,2);
/*!40000 ALTER TABLE `produtos_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id_vendedor` int NOT NULL,
  `nome_vendedor` char(255) NOT NULL,
  `contato_vendedor` char(15) NOT NULL,
  `cargo_vendedor` char(20) NOT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (123,'ANTONIO DE SOUZA','+55819873893093','ANALISTA DE VENDAS'),(456,'JOSE DE FREITAS','+55918903890290','SUPERVISOR'),(789,'MARIO CAVALCANTI','+55879039890390','VENDEDOR');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projetomaiscor'
--

--
-- Dumping routines for database 'projetomaiscor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-29 19:32:45
