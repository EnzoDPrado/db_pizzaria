CREATE DATABASE  IF NOT EXISTS `db_pizzaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_pizzaria`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: db_pizzaria
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('af5762b9-81f8-41ca-b867-8a98bf879606','0168a3c48a3acac7fc4c58b87ec1ad4cae7788ef0a1544d99106378a2b27fc81','2022-11-23 13:30:03.828','20221123133003_pizzaria',NULL,NULL,'2022-11-23 13:30:03.573',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bebida`
--

DROP TABLE IF EXISTS `tbl_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `imagem` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_fabricante` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_fabricante_bebida` (`id_fabricante`),
  CONSTRAINT `FK_fabricante_bebida` FOREIGN KEY (`id_fabricante`) REFERENCES `tbl_fabricante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bebida`
--

LOCK TABLES `tbl_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bebida_oferta`
--

DROP TABLE IF EXISTS `tbl_bebida_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bebida_oferta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_bebida` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_bebida_bebida_oferta` (`id_bebida`),
  CONSTRAINT `FK_bebida_bebida_oferta` FOREIGN KEY (`id_bebida`) REFERENCES `tbl_bebida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bebida_oferta`
--

LOCK TABLES `tbl_bebida_oferta` WRITE;
/*!40000 ALTER TABLE `tbl_bebida_oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bebida_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_bebida` int NOT NULL,
  `id_pizza` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_bebida_categoria` (`id_bebida`),
  KEY `FK_pizza_categoria` (`id_pizza`),
  CONSTRAINT `FK_bebida_categoria` FOREIGN KEY (`id_bebida`) REFERENCES `tbl_bebida` (`id`),
  CONSTRAINT `FK_pizza_categoria` FOREIGN KEY (`id_pizza`) REFERENCES `tbl_pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cidade`
--

DROP TABLE IF EXISTS `tbl_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_estado_cidade` (`id_estado`),
  CONSTRAINT `FK_estado_cidade` FOREIGN KEY (`id_estado`) REFERENCES `tbl_estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cidade`
--

LOCK TABLES `tbl_cidade` WRITE;
/*!40000 ALTER TABLE `tbl_cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente_contato`
--

DROP TABLE IF EXISTS `tbl_cliente_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cliente_contato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `telefone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `celular` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pizzaria` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_cliente_contato_pizzaria` (`id_pizzaria`),
  CONSTRAINT `FK_cliente_contato_pizzaria` FOREIGN KEY (`id_pizzaria`) REFERENCES `tbl_pizzaria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente_contato`
--

LOCK TABLES `tbl_cliente_contato` WRITE;
/*!40000 ALTER TABLE `tbl_cliente_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cliente_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_endereco`
--

DROP TABLE IF EXISTS `tbl_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int NOT NULL,
  `id_cidade` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_endereco_cidade` (`id_cidade`),
  CONSTRAINT `FK_endereco_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `tbl_cidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_endereco`
--

LOCK TABLES `tbl_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sigla` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fabricante`
--

DROP TABLE IF EXISTS `tbl_fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_fabricante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fabricante`
--

LOCK TABLES `tbl_fabricante` WRITE;
/*!40000 ALTER TABLE `tbl_fabricante` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pizzaria` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_funcionario_pizzaria` (`id_pizzaria`),
  CONSTRAINT `FK_funcionario_pizzaria` FOREIGN KEY (`id_pizzaria`) REFERENCES `tbl_pizzaria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_oferta_pizza_bebida`
--

DROP TABLE IF EXISTS `tbl_oferta_pizza_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_oferta_pizza_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `promocao` decimal(10,0) DEFAULT NULL,
  `id_pizza_oferta` int NOT NULL,
  `id_bebida_oferta` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_bebida_oferta_oferta_pizza_bebida` (`id_bebida_oferta`),
  KEY `FK_pizza_oferta_oferta_pizza_bebida` (`id_pizza_oferta`),
  CONSTRAINT `FK_bebida_oferta_oferta_pizza_bebida` FOREIGN KEY (`id_bebida_oferta`) REFERENCES `tbl_bebida_oferta` (`id`),
  CONSTRAINT `FK_pizza_oferta_oferta_pizza_bebida` FOREIGN KEY (`id_pizza_oferta`) REFERENCES `tbl_pizza_oferta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_oferta_pizza_bebida`
--

LOCK TABLES `tbl_oferta_pizza_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_oferta_pizza_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_oferta_pizza_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizza`
--

DROP TABLE IF EXISTS `tbl_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_pizza` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_tipo_pizza_pizza` (`id_tipo_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza`
--

LOCK TABLES `tbl_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_pizza` DISABLE KEYS */;
INSERT INTO `tbl_pizza` VALUES (12,'Calabresa','R$55,90','https://t2.rg.ltmcdn.com/pt/posts/9/8/3/pizza_calabresa_e_mussarela_4389_600.jpg',NULL,'calabresa, queijo, massa, molho de tomate',5),(13,'Calabresa','R$55,90','https://t2.rg.ltmcdn.com/pt/posts/9/8/3/pizza_calabresa_e_mussarela_4389_600.jpg',NULL,'calabresa, queijo, massa, molho de tomate',5),(14,'Calabresa 4 queijos','R$56,90','https://t2.rg.ltmcdn.com/pt/posts/9/8/3/pizza_calabresa_e_mussarela_4389_600.jpg',NULL,'calabresa, 4 queijos, massa, molho de tomate',2),(15,'iphone','R$56,90','https://t2.rg.ltmcdn.com/pt/posts/9/8/3/pizza_calabresa_e_mussarela_4389_600.jpg',NULL,'calabresa, 4 queijos, massa, molho de tomate',2);
/*!40000 ALTER TABLE `tbl_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizza_oferta`
--

DROP TABLE IF EXISTS `tbl_pizza_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza_oferta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pizza` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_pizza_pizza_oferta` (`id_pizza`),
  CONSTRAINT `FK_pizza_pizza_oferta` FOREIGN KEY (`id_pizza`) REFERENCES `tbl_pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza_oferta`
--

LOCK TABLES `tbl_pizza_oferta` WRITE;
/*!40000 ALTER TABLE `tbl_pizza_oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pizza_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizzaria`
--

DROP TABLE IF EXISTS `tbl_pizzaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizzaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_endereco` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_pizzaria_categoria` (`id_categoria`),
  KEY `FK_pizzaria_endereco` (`id_endereco`),
  CONSTRAINT `FK_pizzaria_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id`),
  CONSTRAINT `FK_pizzaria_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizzaria`
--

LOCK TABLES `tbl_pizzaria` WRITE;
/*!40000 ALTER TABLE `tbl_pizzaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pizzaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_bebida`
--

DROP TABLE IF EXISTS `tbl_tipo_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_bebida`
--

LOCK TABLES `tbl_tipo_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_pizza`
--

DROP TABLE IF EXISTS `tbl_tipo_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_pizza`
--

LOCK TABLES `tbl_tipo_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_pizza` DISABLE KEYS */;
INSERT INTO `tbl_tipo_pizza` VALUES (1,'Salgada'),(2,'Doce'),(3,'Orgânica');
/*!40000 ALTER TABLE `tbl_tipo_pizza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 10:58:51
