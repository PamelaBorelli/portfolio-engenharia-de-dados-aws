-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: concessionaria
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `dim_carro`
--

DROP TABLE IF EXISTS `dim_carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_carro` (
  `idCarro` int NOT NULL,
  `kmCarro` int DEFAULT NULL,
  `classiCarro` varchar(50) DEFAULT NULL,
  `marcaCarro` varchar(80) DEFAULT NULL,
  `modeloCarro` varchar(80) DEFAULT NULL,
  `anoCarro` int DEFAULT NULL,
  `tipoCombustivel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCarro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_carro`
--

LOCK TABLES `dim_carro` WRITE;
/*!40000 ALTER TABLE `dim_carro` DISABLE KEYS */;
INSERT INTO `dim_carro` VALUES (1,8500,'AAAKNS8JS76S39','Toyota','Corolla XEI',2023,'Flex'),(2,40000,'AKIUNS1JS76S39','Nissan','Versa',2019,'Etanol'),(3,152800,'DKSHKNS8JS76S39','VW','Fusca 78',1978,'Gasolina'),(4,58000,'LLLUNS1JS76S39','Nissan','Versa',2020,'Etanol'),(5,78000,'MSLUNS1JS76S39','Nissan','Frontier',2022,'Diesel'),(6,21800,'SKIUNS8JS76S39','Nissan','Versa',2019,'Gasolina'),(7,212800,'SSIUNS8JS76S39','Fiat','Fiat 147',1996,'Gasolina'),(10,211800,'LKIUNS8JS76S39','Fiat','Fiat 147',1996,'Gasolina'),(98,29450,'AKJHKN98JY76539','Fiat','Fiat Uno',2000,'Gasolina'),(99,21700,'IKJHKN98JY76539','Fiat','Fiat Palio',2010,'Gasolina');
/*!40000 ALTER TABLE `dim_carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_localizacao`
--

DROP TABLE IF EXISTS `dim_localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_localizacao` (
  `idEndereco` int NOT NULL,
  `nomeCidade` varchar(100) DEFAULT NULL,
  `nomeEstado` varchar(100) DEFAULT NULL,
  `nomePais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_localizacao`
--

LOCK TABLES `dim_localizacao` WRITE;
/*!40000 ALTER TABLE `dim_localizacao` DISABLE KEYS */;
INSERT INTO `dim_localizacao` VALUES (1,'São Paulo','São Paulo','Brasil'),(2,'Rio de Janeiro','Rio de Janeiro','Brasil'),(3,'Rio de Janeiro','Rio de Janeiro','Brasil'),(4,'Manaus','Amazonas','Brasil'),(5,'Belo Horizonte','Minas Gerais','Brasil'),(6,'Rio Branco','Acre','Brasil'),(7,'Macapá','Amapá','Brasil'),(8,'Porto Alegre','Rio Grande do Sul','Brasil'),(9,'Eusébio','Ceará','Brasil'),(10,'Campo Grande','Mato Grosso do Sul','Brasil'),(11,NULL,'São Paulo',NULL),(12,NULL,'São Paulo',NULL),(13,NULL,'Rio de Janeiro',NULL),(14,NULL,'Minas Gerais',NULL),(15,NULL,'Rio Grande do Sul',NULL),(16,NULL,'Ceará',NULL),(17,NULL,'Amazonas',NULL),(18,NULL,'Mato Grosso do Sul',NULL);
/*!40000 ALTER TABLE `dim_localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_pessoa`
--

DROP TABLE IF EXISTS `dim_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_pessoa` (
  `idPessoa` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tipoPessoa` varchar(10) DEFAULT NULL,
  `idEndereco` int DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `dim_pessoa_ibfk_1` FOREIGN KEY (`idEndereco`) REFERENCES `dim_localizacao` (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_pessoa`
--

LOCK TABLES `dim_pessoa` WRITE;
/*!40000 ALTER TABLE `dim_pessoa` DISABLE KEYS */;
INSERT INTO `dim_pessoa` VALUES (1,'Cliente dois','Cliente',1),(2,'Cliente tres','Cliente',2),(3,'Cliente quatro','Cliente',3),(4,'Cliente cinco','Cliente',4),(5,'Cliente seis','Cliente',5),(6,'Cliente dez','Cliente',6),(7,'Cliente vinte','Cliente',7),(8,'Cliente vinte e dois','Cliente',8),(9,'Cliente vinte e tres','Cliente',9),(10,'Cliente vinte e seis','Cliente',10),(16,'Vendedor cinco','Vendedor',11),(17,'Vendedora seis','Vendedor',12),(18,'Vendedora sete','Vendedor',13),(19,'Vendedora oito','Vendedor',14),(20,'Vendedor trinta','Vendedor',15),(21,'Vendedor trinta e um','Vendedor',16),(22,'Vendedor dezesseis','Vendedor',17),(23,'Vendedora trinta e dois','Vendedor',18);
/*!40000 ALTER TABLE `dim_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_tempo`
--

DROP TABLE IF EXISTS `dim_tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_tempo` (
  `idLocacao` int NOT NULL,
  `dataLocacao` date DEFAULT NULL,
  `anoLocacao` int DEFAULT NULL,
  `mesLocacao` int DEFAULT NULL,
  `diaLocacao` int DEFAULT NULL,
  `horaLocacao` time DEFAULT NULL,
  `dataEntrega` date DEFAULT NULL,
  `anoEntrega` int DEFAULT NULL,
  `mesEntrega` int DEFAULT NULL,
  `diaEntrega` int DEFAULT NULL,
  `horaEntrega` time DEFAULT NULL,
  PRIMARY KEY (`idLocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_tempo`
--

LOCK TABLES `dim_tempo` WRITE;
/*!40000 ALTER TABLE `dim_tempo` DISABLE KEYS */;
INSERT INTO `dim_tempo` VALUES (1,'2015-01-10',2015,1,10,'10:00:00','2015-01-12',2015,1,12,'10:00:00'),(2,'2015-02-10',2015,2,10,'12:00:00','2015-02-12',2015,2,12,'12:00:00'),(3,'2015-02-13',2015,2,13,'12:00:00','2015-02-15',2015,2,15,'12:00:00'),(4,'2015-02-15',2015,2,15,'13:00:00','2015-02-20',2015,2,20,'13:00:00'),(5,'2015-03-02',2015,3,2,'14:00:00','2015-03-07',2015,3,7,'14:00:00'),(6,'2016-03-02',2016,3,2,'14:00:00','2016-03-12',2016,3,12,'14:00:00'),(7,'2016-08-02',2016,8,2,'14:00:00','2016-08-12',2016,8,12,'14:00:00'),(8,'2017-01-02',2017,1,2,'18:00:00','2017-01-12',2017,1,12,'18:00:00'),(9,'2018-01-02',2018,1,2,'18:00:00','2018-01-12',2018,1,12,'18:00:00'),(10,'2018-03-02',2018,3,2,'18:00:00','2018-03-12',2018,3,12,'18:00:00'),(11,'2018-04-01',2018,4,1,'11:00:00','2018-04-11',2018,4,11,'11:00:00'),(12,'2020-04-01',2020,4,1,'11:00:00','2020-04-11',2020,4,11,'11:00:00'),(13,'2022-05-01',2022,5,1,'08:00:00','2022-05-21',2022,5,21,'18:00:00'),(14,'2022-06-01',2022,6,1,'08:00:00','2022-06-21',2022,6,21,'18:00:00'),(15,'2022-07-01',2022,7,1,'08:00:00','2022-07-21',2022,7,21,'18:00:00'),(16,'2022-08-01',2022,8,1,'08:00:00','2022-07-21',2022,7,21,'18:00:00'),(17,'2022-09-01',2022,9,1,'08:00:00','2022-09-21',2022,9,21,'18:00:00'),(18,'2022-10-01',2022,10,1,'08:00:00','2022-10-21',2022,10,21,'18:00:00'),(19,'2022-11-01',2022,11,1,'08:00:00','2022-11-21',2022,11,21,'18:00:00'),(20,'2023-01-02',2023,1,2,'18:00:00','2023-01-12',2023,1,12,'18:00:00'),(21,'2023-01-15',2023,1,15,'18:00:00','2023-01-25',2023,1,25,'18:00:00'),(22,'2023-01-25',2023,1,25,'08:00:00','2023-01-30',2023,1,30,'18:00:00'),(23,'2023-01-31',2023,1,31,'08:00:00','2023-02-05',2023,2,5,'18:00:00'),(24,'2023-02-06',2023,2,6,'08:00:00','2023-02-11',2023,2,11,'18:00:00'),(25,'2023-02-12',2023,2,12,'08:00:00','2023-02-17',2023,2,17,'18:00:00'),(26,'2023-02-18',2023,2,18,'08:00:00','2023-02-19',2023,2,19,'18:00:00');
/*!40000 ALTER TABLE `dim_tempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fato_locacao`
--

DROP TABLE IF EXISTS `fato_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fato_locacao` (
  `idLocacao` int NOT NULL,
  `idPessoaVendedor` int DEFAULT NULL,
  `idPessoaCliente` int DEFAULT NULL,
  `idCarro` int DEFAULT NULL,
  `qtdDiaria` int DEFAULT NULL,
  `vlrDiaria` decimal(18,2) DEFAULT NULL,
  `kmRodado` int DEFAULT NULL,
  PRIMARY KEY (`idLocacao`),
  KEY `idPessoaVendedor` (`idPessoaVendedor`),
  KEY `idPessoaCliente` (`idPessoaCliente`),
  KEY `idCarro` (`idCarro`),
  CONSTRAINT `fato_locacao_ibfk_1` FOREIGN KEY (`idPessoaVendedor`) REFERENCES `dim_pessoa` (`idPessoa`),
  CONSTRAINT `fato_locacao_ibfk_2` FOREIGN KEY (`idPessoaCliente`) REFERENCES `dim_pessoa` (`idPessoa`),
  CONSTRAINT `fato_locacao_ibfk_3` FOREIGN KEY (`idCarro`) REFERENCES `dim_carro` (`idCarro`),
  CONSTRAINT `fato_locacao_ibfk_4` FOREIGN KEY (`idLocacao`) REFERENCES `dim_tempo` (`idLocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fato_locacao`
--

LOCK TABLES `fato_locacao` WRITE;
/*!40000 ALTER TABLE `fato_locacao` DISABLE KEYS */;
INSERT INTO `fato_locacao` VALUES (1,16,1,98,2,100.00,4038),(2,16,1,98,2,100.00,0),(3,17,2,99,2,150.00,1000),(4,17,3,99,5,150.00,700),(5,18,3,99,5,150.00,0),(6,19,5,3,10,250.00,10100),(7,19,5,3,10,250.00,20000),(8,17,3,3,10,250.00,1000),(9,17,3,3,10,280.00,0),(10,22,6,10,10,50.00,0),(11,22,7,7,10,50.00,0),(12,22,7,6,10,150.00,0),(13,20,8,2,20,150.00,10000),(14,20,8,2,20,150.00,10000),(15,20,8,2,20,150.00,10000),(16,20,8,2,20,150.00,0),(17,21,9,4,20,150.00,1000),(18,21,9,4,20,150.00,2000),(19,21,9,4,20,150.00,0),(20,22,4,1,10,880.00,6700),(21,22,4,1,10,880.00,0),(22,23,10,5,5,600.00,10000),(23,23,10,5,5,600.00,10000),(24,23,10,5,5,600.00,20000),(25,23,10,5,5,600.00,10000),(26,23,10,5,1,600.00,0);
/*!40000 ALTER TABLE `fato_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carro`
--

DROP TABLE IF EXISTS `tb_carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_carro` (
  `idCarro` int NOT NULL,
  `kmCarro` int DEFAULT NULL,
  `classiCarro` varchar(50) DEFAULT NULL,
  `marcaCarro` varchar(80) DEFAULT NULL,
  `modeloCarro` varchar(80) DEFAULT NULL,
  `anoCarro` int DEFAULT NULL,
  `combustivel` int DEFAULT NULL,
  PRIMARY KEY (`idCarro`),
  KEY `combustivel` (`combustivel`),
  CONSTRAINT `tb_carro_ibfk_1` FOREIGN KEY (`combustivel`) REFERENCES `tb_combustivel` (`idCombustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carro`
--

LOCK TABLES `tb_carro` WRITE;
/*!40000 ALTER TABLE `tb_carro` DISABLE KEYS */;
INSERT INTO `tb_carro` VALUES (1,8500,'AAAKNS8JS76S39','Toyota','Corolla XEI',2023,3),(2,40000,'AKIUNS1JS76S39','Nissan','Versa',2019,2),(3,152800,'DKSHKNS8JS76S39','VW','Fusca 78',1978,1),(4,58000,'LLLUNS1JS76S39','Nissan','Versa',2020,2),(5,78000,'MSLUNS1JS76S39','Nissan','Frontier',2022,4),(6,21800,'SKIUNS8JS76S39','Nissan','Versa',2019,1),(7,212800,'SSIUNS8JS76S39','Fiat','Fiat 147',1996,1),(10,211800,'LKIUNS8JS76S39','Fiat','Fiat 147',1996,1),(98,29450,'AKJHKN98JY76539','Fiat','Fiat Uno',2000,1),(99,21700,'IKJHKN98JY76539','Fiat','Fiat Palio',2010,1);
/*!40000 ALTER TABLE `tb_carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cidade` (
  `idCidade` int NOT NULL AUTO_INCREMENT,
  `nomeCidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
INSERT INTO `tb_cidade` VALUES (1,'São Paulo'),(2,'Rio de Janeiro'),(3,'Belo Horizonte'),(4,'Rio Branco'),(5,'Macapá'),(6,'Porto Alegre'),(7,'Eusébio'),(8,'Manaus'),(9,'Campo Grande');
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_combustivel`
--

DROP TABLE IF EXISTS `tb_combustivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_combustivel` (
  `idCombustivel` int NOT NULL,
  `tipoCombustivel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCombustivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_combustivel`
--

LOCK TABLES `tb_combustivel` WRITE;
/*!40000 ALTER TABLE `tb_combustivel` DISABLE KEYS */;
INSERT INTO `tb_combustivel` VALUES (1,'Gasolina'),(2,'Etanol'),(3,'Flex'),(4,'Diesel');
/*!40000 ALTER TABLE `tb_combustivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco` (
  `idEndereco` int NOT NULL AUTO_INCREMENT,
  `idPessoa` int DEFAULT NULL,
  `idCidade` int DEFAULT NULL,
  `idEstado` int DEFAULT NULL,
  `idPais` int DEFAULT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `idPessoa` (`idPessoa`),
  KEY `idCidade` (`idCidade`),
  KEY `idEstado` (`idEstado`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `tb_endereco_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `tb_pessoa` (`idPessoa`),
  CONSTRAINT `tb_endereco_ibfk_2` FOREIGN KEY (`idCidade`) REFERENCES `tb_cidade` (`idCidade`),
  CONSTRAINT `tb_endereco_ibfk_3` FOREIGN KEY (`idEstado`) REFERENCES `tb_estado` (`idEstado`),
  CONSTRAINT `tb_endereco_ibfk_4` FOREIGN KEY (`idPais`) REFERENCES `tb_pais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (1,1,1,1,1),(2,2,2,2,1),(3,3,2,2,1),(4,4,8,8,1),(5,5,3,3,1),(6,6,4,4,1),(7,7,5,5,1),(8,8,6,6,1),(9,9,7,7,1),(10,10,9,9,1),(11,16,NULL,1,NULL),(12,17,NULL,1,NULL),(13,18,NULL,2,NULL),(14,19,NULL,3,NULL),(15,20,NULL,6,NULL),(16,21,NULL,7,NULL),(17,22,NULL,8,NULL),(18,23,NULL,9,NULL);
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estado` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `nomeEstado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
INSERT INTO `tb_estado` VALUES (1,'São Paulo'),(2,'Rio de Janeiro'),(3,'Minas Gerais'),(4,'Acre'),(5,'Amapá'),(6,'Rio Grande do Sul'),(7,'Ceará'),(8,'Amazonas'),(9,'Mato Grosso do Sul');
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_locacao`
--

DROP TABLE IF EXISTS `tb_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_locacao` (
  `idLocacao` int NOT NULL,
  `dataLocacao` date DEFAULT NULL,
  `horaLocacao` time DEFAULT NULL,
  `qtdDiaria` int DEFAULT NULL,
  `vlrDiaria` decimal(18,2) DEFAULT NULL,
  `dataEntrega` date DEFAULT NULL,
  `horaEntrega` time DEFAULT NULL,
  `idPessoaVendedor` int DEFAULT NULL,
  `idVendedor` int DEFAULT NULL,
  `idPessoaCliente` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `carro` int DEFAULT NULL,
  `kmRodado` int DEFAULT NULL,
  PRIMARY KEY (`idLocacao`),
  KEY `idPessoaVendedor` (`idPessoaVendedor`,`idVendedor`),
  KEY `idPessoaCliente` (`idPessoaCliente`,`idCliente`),
  KEY `carro` (`carro`),
  CONSTRAINT `tb_locacao_ibfk_1` FOREIGN KEY (`idPessoaVendedor`, `idVendedor`) REFERENCES `tb_pessoa_vendedor` (`idPessoa`, `idVendedor`),
  CONSTRAINT `tb_locacao_ibfk_2` FOREIGN KEY (`idPessoaCliente`, `idCliente`) REFERENCES `tb_pessoa_cliente` (`idPessoa`, `idCliente`),
  CONSTRAINT `tb_locacao_ibfk_3` FOREIGN KEY (`carro`) REFERENCES `tb_carro` (`idCarro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_locacao`
--

LOCK TABLES `tb_locacao` WRITE;
/*!40000 ALTER TABLE `tb_locacao` DISABLE KEYS */;
INSERT INTO `tb_locacao` VALUES (1,'2015-01-10','10:00:00',2,100.00,'2015-01-12','10:00:00',16,5,1,2,98,4038),(2,'2015-02-10','12:00:00',2,100.00,'2015-02-12','12:00:00',16,5,1,2,98,0),(3,'2015-02-13','12:00:00',2,150.00,'2015-02-15','12:00:00',17,6,2,3,99,1000),(4,'2015-02-15','13:00:00',5,150.00,'2015-02-20','13:00:00',17,6,3,4,99,700),(5,'2015-03-02','14:00:00',5,150.00,'2015-03-07','14:00:00',18,7,3,4,99,0),(6,'2016-03-02','14:00:00',10,250.00,'2016-03-12','14:00:00',19,8,5,6,3,10100),(7,'2016-08-02','14:00:00',10,250.00,'2016-08-12','14:00:00',19,8,5,6,3,20000),(8,'2017-01-02','18:00:00',10,250.00,'2017-01-12','18:00:00',17,6,3,4,3,1000),(9,'2018-01-02','18:00:00',10,280.00,'2018-01-12','18:00:00',17,6,3,4,3,0),(10,'2018-03-02','18:00:00',10,50.00,'2018-03-12','18:00:00',22,16,6,10,10,0),(11,'2018-04-01','11:00:00',10,50.00,'2018-04-11','11:00:00',22,16,7,20,7,0),(12,'2020-04-01','11:00:00',10,150.00,'2020-04-11','11:00:00',22,16,7,20,6,0),(13,'2022-05-01','08:00:00',20,150.00,'2022-05-21','18:00:00',20,30,8,22,2,10000),(14,'2022-06-01','08:00:00',20,150.00,'2022-06-21','18:00:00',20,30,8,22,2,10000),(15,'2022-07-01','08:00:00',20,150.00,'2022-07-21','18:00:00',20,30,8,22,2,10000),(16,'2022-08-01','08:00:00',20,150.00,'2022-07-21','18:00:00',20,30,8,22,2,0),(17,'2022-09-01','08:00:00',20,150.00,'2022-09-21','18:00:00',21,31,9,23,4,1000),(18,'2022-10-01','08:00:00',20,150.00,'2022-10-21','18:00:00',21,31,9,23,4,2000),(19,'2022-11-01','08:00:00',20,150.00,'2022-11-21','18:00:00',21,31,9,23,4,0),(20,'2023-01-02','18:00:00',10,880.00,'2023-01-12','18:00:00',22,16,4,5,1,6700),(21,'2023-01-15','18:00:00',10,880.00,'2023-01-25','18:00:00',22,16,4,5,1,0),(22,'2023-01-25','08:00:00',5,600.00,'2023-01-30','18:00:00',23,32,10,26,5,10000),(23,'2023-01-31','08:00:00',5,600.00,'2023-02-05','18:00:00',23,32,10,26,5,10000),(24,'2023-02-06','08:00:00',5,600.00,'2023-02-11','18:00:00',23,32,10,26,5,20000),(25,'2023-02-12','08:00:00',5,600.00,'2023-02-17','18:00:00',23,32,10,26,5,10000),(26,'2023-02-18','08:00:00',1,600.00,'2023-02-19','18:00:00',23,32,10,26,5,0);
/*!40000 ALTER TABLE `tb_locacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_kmCarro` AFTER INSERT ON `tb_locacao` FOR EACH ROW BEGIN
   UPDATE tb_carro
   SET kmCarro = kmCarro + NEW.kmRodado
   WHERE idCarro = NEW.carro;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_data_hora` AFTER INSERT ON `tb_locacao` FOR EACH ROW BEGIN
   INSERT INTO tb_locacao_data_hora (`idLocacao`, `dataLocacao`, `anoLocacao`, `mesLocacao`, `diaLocacao`, `horaLocacao`, `dataEntrega`, `anoEntrega`, `mesEntrega`, `diaEntrega`, `horaEntrega`)
   VALUES (NEW.idLocacao, NEW.dataLocacao, YEAR(NEW.dataLocacao), MONTH(NEW.dataLocacao), DAY(NEW.dataLocacao), NEW.horaLocacao, NEW.dataEntrega, YEAR(NEW.dataEntrega), MONTH(NEW.dataEntrega), DAY(NEW.dataEntrega), NEW.horaEntrega);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_locacao_data_hora`
--

DROP TABLE IF EXISTS `tb_locacao_data_hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_locacao_data_hora` (
  `idLocacao` int NOT NULL,
  `dataLocacao` date DEFAULT NULL,
  `anoLocacao` int DEFAULT NULL,
  `mesLocacao` int DEFAULT NULL,
  `diaLocacao` int DEFAULT NULL,
  `horaLocacao` time DEFAULT NULL,
  `dataEntrega` date DEFAULT NULL,
  `anoEntrega` int DEFAULT NULL,
  `mesEntrega` int DEFAULT NULL,
  `diaEntrega` int DEFAULT NULL,
  `horaEntrega` time DEFAULT NULL,
  PRIMARY KEY (`idLocacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_locacao_data_hora`
--

LOCK TABLES `tb_locacao_data_hora` WRITE;
/*!40000 ALTER TABLE `tb_locacao_data_hora` DISABLE KEYS */;
INSERT INTO `tb_locacao_data_hora` VALUES (1,'2015-01-10',2015,1,10,'10:00:00','2015-01-12',2015,1,12,'10:00:00'),(2,'2015-02-10',2015,2,10,'12:00:00','2015-02-12',2015,2,12,'12:00:00'),(3,'2015-02-13',2015,2,13,'12:00:00','2015-02-15',2015,2,15,'12:00:00'),(4,'2015-02-15',2015,2,15,'13:00:00','2015-02-20',2015,2,20,'13:00:00'),(5,'2015-03-02',2015,3,2,'14:00:00','2015-03-07',2015,3,7,'14:00:00'),(6,'2016-03-02',2016,3,2,'14:00:00','2016-03-12',2016,3,12,'14:00:00'),(7,'2016-08-02',2016,8,2,'14:00:00','2016-08-12',2016,8,12,'14:00:00'),(8,'2017-01-02',2017,1,2,'18:00:00','2017-01-12',2017,1,12,'18:00:00'),(9,'2018-01-02',2018,1,2,'18:00:00','2018-01-12',2018,1,12,'18:00:00'),(10,'2018-03-02',2018,3,2,'18:00:00','2018-03-12',2018,3,12,'18:00:00'),(11,'2018-04-01',2018,4,1,'11:00:00','2018-04-11',2018,4,11,'11:00:00'),(12,'2020-04-01',2020,4,1,'11:00:00','2020-04-11',2020,4,11,'11:00:00'),(13,'2022-05-01',2022,5,1,'08:00:00','2022-05-21',2022,5,21,'18:00:00'),(14,'2022-06-01',2022,6,1,'08:00:00','2022-06-21',2022,6,21,'18:00:00'),(15,'2022-07-01',2022,7,1,'08:00:00','2022-07-21',2022,7,21,'18:00:00'),(16,'2022-08-01',2022,8,1,'08:00:00','2022-07-21',2022,7,21,'18:00:00'),(17,'2022-09-01',2022,9,1,'08:00:00','2022-09-21',2022,9,21,'18:00:00'),(18,'2022-10-01',2022,10,1,'08:00:00','2022-10-21',2022,10,21,'18:00:00'),(19,'2022-11-01',2022,11,1,'08:00:00','2022-11-21',2022,11,21,'18:00:00'),(20,'2023-01-02',2023,1,2,'18:00:00','2023-01-12',2023,1,12,'18:00:00'),(21,'2023-01-15',2023,1,15,'18:00:00','2023-01-25',2023,1,25,'18:00:00'),(22,'2023-01-25',2023,1,25,'08:00:00','2023-01-30',2023,1,30,'18:00:00'),(23,'2023-01-31',2023,1,31,'08:00:00','2023-02-05',2023,2,5,'18:00:00'),(24,'2023-02-06',2023,2,6,'08:00:00','2023-02-11',2023,2,11,'18:00:00'),(25,'2023-02-12',2023,2,12,'08:00:00','2023-02-17',2023,2,17,'18:00:00'),(26,'2023-02-18',2023,2,18,'08:00:00','2023-02-19',2023,2,19,'18:00:00');
/*!40000 ALTER TABLE `tb_locacao_data_hora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pais` (
  `idPais` int NOT NULL AUTO_INCREMENT,
  `nomePais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais`
--

LOCK TABLES `tb_pais` WRITE;
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
INSERT INTO `tb_pais` VALUES (1,'Brasil');
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa`
--

DROP TABLE IF EXISTS `tb_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa` (
  `idPessoa` int NOT NULL AUTO_INCREMENT,
  `pessoa` varchar(40) DEFAULT NULL,
  `tipoPessoa` varchar(10) DEFAULT NULL,
  `idEndereco` int DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `tb_pessoa_ibfk_4` FOREIGN KEY (`idEndereco`) REFERENCES `tb_endereco` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
INSERT INTO `tb_pessoa` VALUES (1,'2','cliente',1),(2,'3','cliente',2),(3,'4','cliente',3),(4,'5','cliente',4),(5,'6','cliente',5),(6,'10','cliente',6),(7,'20','cliente',7),(8,'22','cliente',8),(9,'23','cliente',9),(10,'26','cliente',10),(16,'5','vendedor',11),(17,'6','vendedor',12),(18,'7','vendedor',13),(19,'8','vendedor',14),(20,'30','vendedor',15),(21,'31','vendedor',16),(22,'16','vendedor',17),(23,'32','vendedor',18);
/*!40000 ALTER TABLE `tb_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa_cliente`
--

DROP TABLE IF EXISTS `tb_pessoa_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa_cliente` (
  `idPessoa` int NOT NULL,
  `idCliente` int NOT NULL,
  `nomeCliente` varchar(50) DEFAULT NULL,
  `idEndereco` int DEFAULT NULL,
  PRIMARY KEY (`idPessoa`,`idCliente`),
  KEY `tb_pessoa_cliente_ibfk_6` (`idEndereco`),
  CONSTRAINT `tb_pessoa_cliente_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `tb_pessoa` (`idPessoa`),
  CONSTRAINT `tb_pessoa_cliente_ibfk_6` FOREIGN KEY (`idEndereco`) REFERENCES `tb_pessoa` (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa_cliente`
--

LOCK TABLES `tb_pessoa_cliente` WRITE;
/*!40000 ALTER TABLE `tb_pessoa_cliente` DISABLE KEYS */;
INSERT INTO `tb_pessoa_cliente` VALUES (1,2,'Cliente dois',1),(2,3,'Cliente tres',2),(3,4,'Cliente quatro',3),(4,5,'Cliente cinco',4),(5,6,'Cliente seis',5),(6,10,'Cliente dez',6),(7,20,'Cliente vinte',7),(8,22,'Cliente vinte e dois',8),(9,23,'Cliente vinte e tres',9),(10,26,'Cliente vinte e seis',10);
/*!40000 ALTER TABLE `tb_pessoa_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa_vendedor`
--

DROP TABLE IF EXISTS `tb_pessoa_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pessoa_vendedor` (
  `idPessoa` int NOT NULL,
  `idVendedor` int NOT NULL,
  `nomeVendedor` varchar(50) DEFAULT NULL,
  `sexoVendedor` varchar(10) DEFAULT NULL,
  `idEndereco` int DEFAULT NULL,
  PRIMARY KEY (`idPessoa`,`idVendedor`),
  KEY `tb_pessoa_vendedor_ibfk_4` (`idEndereco`),
  CONSTRAINT `tb_pessoa_vendedor_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `tb_pessoa` (`idPessoa`),
  CONSTRAINT `tb_pessoa_vendedor_ibfk_4` FOREIGN KEY (`idEndereco`) REFERENCES `tb_pessoa` (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa_vendedor`
--

LOCK TABLES `tb_pessoa_vendedor` WRITE;
/*!40000 ALTER TABLE `tb_pessoa_vendedor` DISABLE KEYS */;
INSERT INTO `tb_pessoa_vendedor` VALUES (16,5,'Vendedor cinco','0',11),(17,6,'Vendedora seis','1',12),(18,7,'Vendedora sete','1',13),(19,8,'Vendedora oito','1',14),(20,30,'Vendedor trinta','0',15),(21,31,'Vendedor trinta e um','0',16),(22,16,'Vendedor dezesseis','0',17),(23,32,'Vendedora trinta e dois','1',18);
/*!40000 ALTER TABLE `tb_pessoa_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_locacoes_completas`
--

DROP TABLE IF EXISTS `vw_locacoes_completas`;
/*!50001 DROP VIEW IF EXISTS `vw_locacoes_completas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_locacoes_completas` AS SELECT 
 1 AS `idLocacao`,
 1 AS `nomeVendedor`,
 1 AS `nomeCliente`,
 1 AS `nomeCidadeVendedor`,
 1 AS `nomeEstadoVendedor`,
 1 AS `nomePaisVendedor`,
 1 AS `nomeCidadeCliente`,
 1 AS `nomeEstadoCliente`,
 1 AS `nomePaisCliente`,
 1 AS `dataLocacao`,
 1 AS `horaLocacao`,
 1 AS `dataEntrega`,
 1 AS `horaEntrega`,
 1 AS `marcaCarro`,
 1 AS `modeloCarro`,
 1 AS `anoCarro`,
 1 AS `qtdDiaria`,
 1 AS `vlrDiaria`,
 1 AS `kmRodado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_locacoes_por_carro`
--

DROP TABLE IF EXISTS `vw_locacoes_por_carro`;
/*!50001 DROP VIEW IF EXISTS `vw_locacoes_por_carro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_locacoes_por_carro` AS SELECT 
 1 AS `idLocacao`,
 1 AS `nome`,
 1 AS `marcaCarro`,
 1 AS `modeloCarro`,
 1 AS `anoCarro`,
 1 AS `qtdDiaria`,
 1 AS `vlrDiaria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_locacoes_por_localizacao`
--

DROP TABLE IF EXISTS `vw_locacoes_por_localizacao`;
/*!50001 DROP VIEW IF EXISTS `vw_locacoes_por_localizacao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_locacoes_por_localizacao` AS SELECT 
 1 AS `idLocacao`,
 1 AS `nome`,
 1 AS `nomeCidade`,
 1 AS `nomeEstado`,
 1 AS `nomePais`,
 1 AS `qtdDiaria`,
 1 AS `vlrDiaria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_locacoes_por_tempo`
--

DROP TABLE IF EXISTS `vw_locacoes_por_tempo`;
/*!50001 DROP VIEW IF EXISTS `vw_locacoes_por_tempo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_locacoes_por_tempo` AS SELECT 
 1 AS `idLocacao`,
 1 AS `nome`,
 1 AS `dataLocacao`,
 1 AS `horaLocacao`,
 1 AS `dataEntrega`,
 1 AS `horaEntrega`,
 1 AS `qtdDiaria`,
 1 AS `vlrDiaria`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'concessionaria'
--

--
-- Final view structure for view `vw_locacoes_completas`
--

/*!50001 DROP VIEW IF EXISTS `vw_locacoes_completas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_locacoes_completas` AS select `l`.`idLocacao` AS `idLocacao`,`pv`.`nome` AS `nomeVendedor`,`pc`.`nome` AS `nomeCliente`,(select `loc`.`nomeCidade` from `dim_localizacao` `loc` where (`pv`.`idEndereco` = `loc`.`idEndereco`)) AS `nomeCidadeVendedor`,(select `loc`.`nomeEstado` from `dim_localizacao` `loc` where (`pv`.`idEndereco` = `loc`.`idEndereco`)) AS `nomeEstadoVendedor`,(select `loc`.`nomePais` from `dim_localizacao` `loc` where (`pv`.`idEndereco` = `loc`.`idEndereco`)) AS `nomePaisVendedor`,(select `loc`.`nomeCidade` from `dim_localizacao` `loc` where (`pc`.`idEndereco` = `loc`.`idEndereco`)) AS `nomeCidadeCliente`,(select `loc`.`nomeEstado` from `dim_localizacao` `loc` where (`pc`.`idEndereco` = `loc`.`idEndereco`)) AS `nomeEstadoCliente`,(select `loc`.`nomePais` from `dim_localizacao` `loc` where (`pc`.`idEndereco` = `loc`.`idEndereco`)) AS `nomePaisCliente`,`t`.`dataLocacao` AS `dataLocacao`,`t`.`horaLocacao` AS `horaLocacao`,`t`.`dataEntrega` AS `dataEntrega`,`t`.`horaEntrega` AS `horaEntrega`,`c`.`marcaCarro` AS `marcaCarro`,`c`.`modeloCarro` AS `modeloCarro`,`c`.`anoCarro` AS `anoCarro`,`l`.`qtdDiaria` AS `qtdDiaria`,`l`.`vlrDiaria` AS `vlrDiaria`,`l`.`kmRodado` AS `kmRodado` from ((((`fato_locacao` `l` join `dim_pessoa` `pv` on((`l`.`idPessoaVendedor` = `pv`.`idPessoa`))) join `dim_pessoa` `pc` on((`l`.`idPessoaCliente` = `pc`.`idPessoa`))) join `dim_tempo` `t` on((`l`.`idLocacao` = `t`.`idLocacao`))) join `dim_carro` `c` on((`l`.`idCarro` = `c`.`idCarro`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_locacoes_por_carro`
--

/*!50001 DROP VIEW IF EXISTS `vw_locacoes_por_carro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_locacoes_por_carro` AS select `l`.`idLocacao` AS `idLocacao`,`p`.`nome` AS `nome`,`c`.`marcaCarro` AS `marcaCarro`,`c`.`modeloCarro` AS `modeloCarro`,`c`.`anoCarro` AS `anoCarro`,`l`.`qtdDiaria` AS `qtdDiaria`,`l`.`vlrDiaria` AS `vlrDiaria` from ((`fato_locacao` `l` join `dim_pessoa` `p` on((`l`.`idPessoaCliente` = `p`.`idPessoa`))) join `dim_carro` `c` on((`l`.`idCarro` = `c`.`idCarro`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_locacoes_por_localizacao`
--

/*!50001 DROP VIEW IF EXISTS `vw_locacoes_por_localizacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_locacoes_por_localizacao` AS select `l`.`idLocacao` AS `idLocacao`,`p`.`nome` AS `nome`,`c`.`nomeCidade` AS `nomeCidade`,`c`.`nomeEstado` AS `nomeEstado`,`c`.`nomePais` AS `nomePais`,`l`.`qtdDiaria` AS `qtdDiaria`,`l`.`vlrDiaria` AS `vlrDiaria` from ((`fato_locacao` `l` join `dim_pessoa` `p` on((`l`.`idPessoaCliente` = `p`.`idPessoa`))) join `dim_localizacao` `c` on((`p`.`idEndereco` = `c`.`idEndereco`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_locacoes_por_tempo`
--

/*!50001 DROP VIEW IF EXISTS `vw_locacoes_por_tempo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_locacoes_por_tempo` AS select `l`.`idLocacao` AS `idLocacao`,`p`.`nome` AS `nome`,`t`.`dataLocacao` AS `dataLocacao`,`t`.`horaLocacao` AS `horaLocacao`,`t`.`dataEntrega` AS `dataEntrega`,`t`.`horaEntrega` AS `horaEntrega`,`l`.`qtdDiaria` AS `qtdDiaria`,`l`.`vlrDiaria` AS `vlrDiaria` from ((`fato_locacao` `l` join `dim_pessoa` `p` on((`l`.`idPessoaCliente` = `p`.`idPessoa`))) join `dim_tempo` `t` on((`l`.`idLocacao` = `t`.`idLocacao`))) */;
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

-- Dump completed on 2024-04-21 16:57:57
