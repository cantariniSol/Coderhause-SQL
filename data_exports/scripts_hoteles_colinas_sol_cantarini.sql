CREATE DATABASE  IF NOT EXISTS `hoteles_colinas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hoteles_colinas`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: hoteles_colinas
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `fecha_alta` date NOT NULL,
  `contacto` int NOT NULL,
  `pais` int NOT NULL,
  `tipo_documento` int NOT NULL,
  `num_documento` varchar(15) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `pais` (`pais`),
  KEY `contacto` (`contacto`),
  KEY `tipo_documento` (`tipo_documento`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`pais`) REFERENCES `paises` (`pais_id`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`contacto`) REFERENCES `contactos` (`contacto_id`),
  CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`tipo_documento`) REFERENCES `tipos_documentos` (`tipo_doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'2019-02-01',9,42,3,'AA0005676'),(2,'2020-01-15',16,42,3,'ZBC100022'),(3,'2022-11-08',8,28,3,'WFJ882990'),(4,'2022-03-27',13,64,3,'KWI340023'),(5,'2021-04-19',22,5,3,'ZTR341111'),(6,'2019-05-04',12,62,3,'KJ2000112'),(7,'2019-02-01',20,12,3,'IAE234240'),(8,'2022-08-11',24,5,3,'QKA122200'),(9,'2021-01-15',4,13,3,'JYZ678119'),(10,'2019-07-07',19,1,3,'TRA233000'),(11,'2022-09-05',11,6,2,'34532422');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `contacto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`contacto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (1,'Adriana Carolina','Hernandez','Isla Azores 12','5141','543341212','adriana_car_27_@hotmail.com'),(2,'Alexandro','Caravajal','Padre Bayle 9','100005','123123442','alex_caravajal@gmail.com'),(3,'Camilo','Polanco Ruiz','Rio Danubio 12','100232','654543000','polanc_camilo@gmail.com'),(4,'Brigite','Watson','River Raquis Street 45','2141','992342400','big_wts@outlook.com'),(5,'Carlos Felipe','Castanio','Avenida Antonio Hurtado 22','1421','243244334','carlos_felcho@hotmail.com'),(6,'Carlos Alberto','Cruz','San Anton 7','424141','323424121','berto_car_193@gmail.com'),(7,'Daniela','Diaz Beltran','Caceres Amber 4123','4141','112222123','dan_diaz@gmail.com'),(8,'Fabian Andres','Fino','Doctor Fleming 9','100232','434141321','fino_fabian@hotmail.com'),(9,'Gabriel Mauricio','Quesada','Avenida Solano 13','100232','876546465','gabi_q@gmail.com'),(10,'Gloria Patricia','Mendoza Alvear','Ambeeres 6','JSI1313','413454534','gloria_glo_98@outlook.com'),(11,'Hugo Andres','Camargo Vargas','Avenida De Alemania 8','13131','345353545','hugo_Var@gmail.com'),(12,'Ingrid','Romanov','Roxia Rev 34','HH2324','113311313','ingrid_roma@gmail.com'),(13,'Ivonne Jouliette','Orozco','La Roche Sur 44','100232','425111558','iv_jou@outlook.com'),(14,'Juan Camilo','Jimenez','Uruguay 345','CH234324','653535435','juan_camilo34@gmail.com'),(15,'Juan Fernando','Lanoa ','Isabel De Moc 2343','100232','635524525','fer_lanoa@gmail.com'),(16,'Karen Eliana','Pulido','Gobernador Ferreira 34','W334234','666663211','k_eliana@hotmail.com'),(17,'Karla','Rodriguez','San Lucas 234','100232','534242422','karla_45@hotmail.com'),(18,'Laura Fernanda','Del Rio Ayarbe','Sauces 24','PJQ423','530298870','lau_che@gmial.com'),(19,'Laura Vanina','Duenias','Lisboa 132 2a° H','100232','536344333','vanina_duenias@gmail.com'),(20,'Maria Celeste','Cervantes','Juncal 34 3a° B','100232','542388725','celeste_cer@hotmail.com'),(21,'Pablo','Alvarez Castillo','Avenida Carcano 1233','5442','548435260','pablo_casti101@outlook.com'),(22,'Rafael Alejandro','Borda','Isla Margatira 14','24242','554480723','borda_rafa@gmail.com'),(23,'Sebastian','Ochoa','Lisando La Torre 12','10043','560526186','sebas_Ochoa08@gmail.com'),(24,'Tobias','Tahoboada','Jaranda 1344','C24234','566066176','tobi_taho@hotmail.com'),(25,'Uma ','Bostom','Posman 133 Street','100232','171198039','uma_bostom@gmail.com'),(26,'Hoteles Colinas','Espania','Avenida Rocaferrera 2300','C10002','121001201','hoteles_colinas_esp@gmail.com'),(27,'Hoteles Colinas','Brasil','Avenida Lula da Silva 300','C23442','533335356','hoteles_colinas_bra@gmail.com'),(28,'Hoteles Colinas','Mexico','Avenida Frida Kalho 500','C30000','333442525','hoteles_colinas_mex@gmail.com'),(29,'Hoteles Colinas','Argentina','Avenida Martin Fierro3900','C5152','541421312','hoteles_colinas_arg@gmail.com'),(46,'Damian Hugo','Sierra','Los Lapachos 123','55672','60001220','dami_hu@gmail.com'),(47,'Bruna','Stroch','Street 17','C1231','63121311','bruna_str@outlook');
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continentes`
--

DROP TABLE IF EXISTS `continentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continentes` (
  `continente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`continente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continentes`
--

LOCK TABLES `continentes` WRITE;
/*!40000 ALTER TABLE `continentes` DISABLE KEYS */;
INSERT INTO `continentes` VALUES (1,'Africa'),(2,'America del Norte'),(3,'America del Sur'),(4,'America Central'),(5,'Antartida'),(6,'Asia'),(7,'Europa'),(8,'Oceania');
/*!40000 ALTER TABLE `continentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleado_id` int NOT NULL AUTO_INCREMENT,
  `fecha_alta` date NOT NULL,
  `contacto` int NOT NULL,
  `pais` int NOT NULL,
  `tipo_documento` int NOT NULL,
  `num_documento` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sector` int NOT NULL,
  `jornada` int NOT NULL,
  `salario` decimal(18,2) NOT NULL,
  `hotel` int NOT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `contacto` (`contacto`),
  KEY `pais` (`pais`),
  KEY `tipo_documento` (`tipo_documento`),
  KEY `sector` (`sector`),
  KEY `jornada` (`jornada`),
  KEY `hotel` (`hotel`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`contacto`) REFERENCES `contactos` (`contacto_id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`pais`) REFERENCES `paises` (`pais_id`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`tipo_documento`) REFERENCES `tipos_documentos` (`tipo_doc_id`),
  CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`sector`) REFERENCES `sectores` (`sector_id`),
  CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`jornada`) REFERENCES `jornadas` (`jornada_id`),
  CONSTRAINT `empleados_ibfk_6` FOREIGN KEY (`hotel`) REFERENCES `hoteles` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'2019-01-01',5,28,1,'34546578','1994-04-18',1,1,10500.00,1),(2,'2019-01-01',6,5,1,'32432223','1987-03-31',2,2,12500.00,4),(3,'2020-05-25',7,42,1,'34344234','1973-11-05',3,3,10500.00,3),(6,'2022-02-02',14,5,1,'35673442','1976-05-18',6,3,10500.00,4),(8,'2019-03-02',17,42,1,'31090901','1996-11-15',8,3,11500.00,3),(9,'2022-07-07',1,42,1,'33131215','1993-01-15',4,2,10650.00,2),(11,'2022-03-01',18,12,2,'JKE3333WW','1994-06-01',8,1,10500.00,2),(12,'2019-10-05',20,106,2,'SUN2E3WEY','1994-06-01',1,3,10500.00,1),(13,'2021-06-10',13,10,2,'CHI42E3CHU','1994-06-01',3,3,50000.00,4),(16,'2022-05-16',47,160,2,'JK3123111','2000-11-09',7,2,15000.00,3);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ins_pagos_empleados` AFTER INSERT ON `empleados` FOR EACH ROW BEGIN
	DECLARE v_hotel INT;
    DECLARE v_sector INT;
    DECLARE v_jornada INT;
    DECLARE v_empleado INT;
    DECLARE v_salario DECIMAL(18,2);
    
    SELECT NEW.hotel, NEW.sector, NEW.jornada, NEW.empleado_id, NEW.salario
    INTO v_hotel, v_sector, v_jornada, v_empleado, v_salario
    FROM empleados WHERE empleado_id = NEW.empleado_id;
    
    INSERT INTO pagos_empleados(hotel, sector, jornada, empleado, salario_total)
    VALUES(v_hotel, v_sector, v_jornada, v_empleado, v_salario);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `upd_salario_empleados` BEFORE UPDATE ON `empleados` FOR EACH ROW BEGIN
    DECLARE max_salario DECIMAL(18,2);
    DECLARE salario_tope DECIMAL(18,2);
    SELECT MAX(salario) INTO max_salario FROM empleados;
    SET salario_tope = max_salario + (max_salario * 0.45);
	IF NEW.salario < OLD.salario THEN
		SET NEW.salario = OLD.salario;
	ELSEIF NEW.salario > salario_tope THEN
        SET NEW.salario = OLD.salario + (OLD.salario * 0.15);
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del_empleados` BEFORE DELETE ON `empleados` FOR EACH ROW BEGIN
  DECLARE t_fecha_hora DATETIME;
  DECLARE t_usuario VARCHAR(45);
  
  SET t_fecha_hora = (SELECT CURRENT_TIMESTAMP());
  SET t_usuario = (SELECT USER());
  
  INSERT INTO log_empleados_eliminados(empleado, fecha_alta,  contacto_empleado, fecha_hora, usuario)
  VALUES(OLD.empleado_id, OLD.fecha_alta, OLD.contacto , t_fecha_hora, t_usuario);
  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `factura_id` int NOT NULL AUTO_INCREMENT,
  `fecha_emitida` date NOT NULL,
  `reserva` int NOT NULL,
  `pago_total` decimal(18,2) DEFAULT '0.00',
  `moneda` varchar(15) DEFAULT NULL,
  `tipo_pago` int NOT NULL,
  PRIMARY KEY (`factura_id`),
  KEY `reserva` (`reserva`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`reserva`) REFERENCES `reservas` (`reserva_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2022-01-01',1,6840.00,'dolar',3),(2,'2022-03-12',2,5760.00,'dolar',1),(3,'2022-01-06',3,6750.00,'dolar',4),(4,'2022-02-14',4,3250.00,'dolar',3),(5,'2022-03-15',5,6975.00,'dolar',5),(6,'2022-03-26',6,2340.00,'dolar',3),(7,'2022-03-25',7,1820.00,'dolar',2),(8,'2022-03-13',8,13500.00,'dolar',4),(9,'2022-04-12',9,12350.00,'dolar',3),(10,'2022-03-06',10,4275.00,'dolar',5),(11,'2022-02-14',11,3960.00,'dolar',2),(12,'2022-04-15',12,10400.00,'dolar',4),(13,'2022-09-15',13,5120.00,'dolar',1),(14,'2022-05-20',14,1300.00,'dolar',5);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitaciones` (
  `habitacion_id` int NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) DEFAULT '0',
  `num_habitacion` int DEFAULT NULL,
  `piso_habitacion` int DEFAULT NULL,
  `tipo_habitacion` int NOT NULL,
  `hotel` int NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`habitacion_id`),
  KEY `tipo_habitacion` (`tipo_habitacion`),
  KEY `hotel` (`hotel`),
  CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`tipo_habitacion`) REFERENCES `tipos_habitaciones` (`tipo_habitacion_id`),
  CONSTRAINT `habitaciones_ibfk_2` FOREIGN KEY (`hotel`) REFERENCES `hoteles` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,0,301,1,1,3,''),(2,0,201,1,1,2,''),(3,0,103,1,1,1,''),(4,0,202,2,2,2,''),(5,0,302,2,2,3,''),(6,0,106,2,2,1,''),(7,0,203,3,3,2,''),(8,0,108,3,3,1,''),(9,0,303,3,4,3,''),(10,0,304,3,4,3,''),(11,0,401,1,1,4,NULL),(12,0,402,2,2,4,NULL),(13,0,403,3,4,4,NULL);
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoteles`
--

DROP TABLE IF EXISTS `hoteles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoteles` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(50) NOT NULL,
  `contacto` int NOT NULL,
  `pais` int NOT NULL,
  PRIMARY KEY (`hotel_id`),
  KEY `pais` (`pais`),
  KEY `contacto` (`contacto`),
  CONSTRAINT `hoteles_ibfk_2` FOREIGN KEY (`pais`) REFERENCES `paises` (`pais_id`),
  CONSTRAINT `hoteles_ibfk_3` FOREIGN KEY (`contacto`) REFERENCES `contactos` (`contacto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoteles`
--

LOCK TABLES `hoteles` WRITE;
/*!40000 ALTER TABLE `hoteles` DISABLE KEYS */;
INSERT INTO `hoteles` VALUES (1,'https://www.hotelescolinas.com',26,28),(2,'https://www.hotelescolinas.com',27,12),(3,'https://www.hotelescolinas.com',28,42),(4,'https://www.hotelescolinas.com',29,5);
/*!40000 ALTER TABLE `hoteles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_clientes`
--

DROP TABLE IF EXISTS `info_clientes`;
/*!50001 DROP VIEW IF EXISTS `info_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_clientes` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `tipo_documento`,
 1 AS `num_documento`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `direccion`,
 1 AS `codigo_postal`,
 1 AS `pais`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_empleados`
--

DROP TABLE IF EXISTS `info_empleados`;
/*!50001 DROP VIEW IF EXISTS `info_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_empleados` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `tipo_documento`,
 1 AS `num_documento`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `sector`,
 1 AS `jornada`,
 1 AS `salario`,
 1 AS `hotel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_facturas`
--

DROP TABLE IF EXISTS `info_facturas`;
/*!50001 DROP VIEW IF EXISTS `info_facturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_facturas` AS SELECT 
 1 AS `nombre_cliente`,
 1 AS `tipo_doc`,
 1 AS `num_doc`,
 1 AS `telefono_cliente`,
 1 AS `email_cliente`,
 1 AS `fecha_emitida`,
 1 AS `hotel`,
 1 AS `num_habitacion`,
 1 AS `tipo_habitacion`,
 1 AS `tarifa_estandar`,
 1 AS `descuento`,
 1 AS `precio_con_descuento`,
 1 AS `cantidad_dias`,
 1 AS `pago_total`,
 1 AS `tipo_pago`,
 1 AS `moneda`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_habitaciones`
--

DROP TABLE IF EXISTS `info_habitaciones`;
/*!50001 DROP VIEW IF EXISTS `info_habitaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_habitaciones` AS SELECT 
 1 AS `hotel`,
 1 AS `num_habitacion`,
 1 AS `tipo_habitacion`,
 1 AS `precio_estandar`,
 1 AS `descuento`,
 1 AS `precio_final`,
 1 AS `inicio_promo`,
 1 AS `fin_promo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_hoteles`
--

DROP TABLE IF EXISTS `info_hoteles`;
/*!50001 DROP VIEW IF EXISTS `info_hoteles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_hoteles` AS SELECT 
 1 AS `hotel`,
 1 AS `cantidad_empleados`,
 1 AS `pago_total_salarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_personal_de_empleados`
--

DROP TABLE IF EXISTS `info_personal_de_empleados`;
/*!50001 DROP VIEW IF EXISTS `info_personal_de_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_personal_de_empleados` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `tipo_documento`,
 1 AS `num_documento`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `direccion`,
 1 AS `nacionalidad`,
 1 AS `fecha_nacimiento`,
 1 AS `edad`,
 1 AS `cumpleanios`,
 1 AS `hotel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_reservas`
--

DROP TABLE IF EXISTS `info_reservas`;
/*!50001 DROP VIEW IF EXISTS `info_reservas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_reservas` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `hotel`,
 1 AS `tipo_habitacion`,
 1 AS `num_habitacion`,
 1 AS `piso_habitacion`,
 1 AS `fecha_desde`,
 1 AS `fecha_hasta`,
 1 AS `cantidad_dias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_tipos_habitaciones`
--

DROP TABLE IF EXISTS `info_tipos_habitaciones`;
/*!50001 DROP VIEW IF EXISTS `info_tipos_habitaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_tipos_habitaciones` AS SELECT 
 1 AS `tipo_habitacion`,
 1 AS `num_habitaciones`,
 1 AS `precio_estandar`,
 1 AS `descuento`,
 1 AS `precio_final`,
 1 AS `inicio_promo`,
 1 AS `fin_promo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jornadas`
--

DROP TABLE IF EXISTS `jornadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornadas` (
  `jornada_id` int NOT NULL AUTO_INCREMENT,
  `horario_inicio` date NOT NULL,
  `horario_fin` date NOT NULL,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`jornada_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornadas`
--

LOCK TABLES `jornadas` WRITE;
/*!40000 ALTER TABLE `jornadas` DISABLE KEYS */;
INSERT INTO `jornadas` VALUES (1,'0008-00-00','2014-00-00','Diurna A'),(2,'2014-00-00','2020-00-00','Diurna B'),(3,'2020-00-00','0002-00-00','Nocturna'),(4,'0002-00-00','0008-00-00','Mixta');
/*!40000 ALTER TABLE `jornadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_empleados_eliminados`
--

DROP TABLE IF EXISTS `log_empleados_eliminados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_empleados_eliminados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `contacto_empleado` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_empleados_eliminados`
--

LOCK TABLES `log_empleados_eliminados` WRITE;
/*!40000 ALTER TABLE `log_empleados_eliminados` DISABLE KEYS */;
INSERT INTO `log_empleados_eliminados` VALUES (1,7,'2021-05-01',15,'2022-04-14 13:12:13','root@localhost');
/*!40000 ALTER TABLE `log_empleados_eliminados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_empleados`
--

DROP TABLE IF EXISTS `pagos_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_empleados` (
  `pago_empleado_id` int NOT NULL AUTO_INCREMENT,
  `hotel` int DEFAULT NULL,
  `sector` int NOT NULL,
  `jornada` int NOT NULL,
  `empleado` int NOT NULL DEFAULT '0',
  `salario_total` decimal(18,2) NOT NULL,
  PRIMARY KEY (`pago_empleado_id`),
  KEY `hotel` (`hotel`),
  KEY `sector` (`sector`),
  KEY `jornada` (`jornada`),
  KEY `empleado` (`empleado`),
  CONSTRAINT `pagos_empleados_ibfk_1` FOREIGN KEY (`hotel`) REFERENCES `hoteles` (`hotel_id`),
  CONSTRAINT `pagos_empleados_ibfk_2` FOREIGN KEY (`sector`) REFERENCES `sectores` (`sector_id`),
  CONSTRAINT `pagos_empleados_ibfk_3` FOREIGN KEY (`jornada`) REFERENCES `jornadas` (`jornada_id`),
  CONSTRAINT `pagos_empleados_ibfk_4` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_empleados`
--

LOCK TABLES `pagos_empleados` WRITE;
/*!40000 ALTER TABLE `pagos_empleados` DISABLE KEYS */;
INSERT INTO `pagos_empleados` VALUES (1,1,1,1,1,10500.00),(2,4,2,2,2,12500.00),(3,3,3,3,3,10500.00),(4,4,6,3,6,10500.00),(5,3,8,3,8,11500.00),(6,2,4,2,9,10650.00),(7,2,8,1,11,10500.00),(8,1,1,3,12,10500.00),(9,4,3,3,13,50000.00),(10,3,7,2,16,15000.00);
/*!40000 ALTER TABLE `pagos_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_reservas`
--

DROP TABLE IF EXISTS `pagos_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_reservas` (
  `pago_reserva_id` int NOT NULL,
  `hotel` int DEFAULT NULL,
  `cliente` int NOT NULL DEFAULT '0',
  `reserva` int NOT NULL DEFAULT '0',
  `promocion` int DEFAULT NULL,
  `factura` int NOT NULL DEFAULT '0',
  `pago_sub_total` decimal(28,2) DEFAULT '0.00',
  `pago_total` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`pago_reserva_id`),
  KEY `hotel` (`hotel`),
  KEY `cliente` (`cliente`),
  KEY `promocion` (`promocion`),
  KEY `factura` (`factura`),
  KEY `reserva` (`reserva`),
  CONSTRAINT `pagos_reservas_ibfk_1` FOREIGN KEY (`hotel`) REFERENCES `hoteles` (`hotel_id`),
  CONSTRAINT `pagos_reservas_ibfk_2` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `pagos_reservas_ibfk_3` FOREIGN KEY (`promocion`) REFERENCES `promociones` (`promocion_id`),
  CONSTRAINT `pagos_reservas_ibfk_4` FOREIGN KEY (`factura`) REFERENCES `facturas` (`factura_id`),
  CONSTRAINT `pagos_reservas_ibfk_5` FOREIGN KEY (`reserva`) REFERENCES `reservas` (`reserva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_reservas`
--

LOCK TABLES `pagos_reservas` WRITE;
/*!40000 ALTER TABLE `pagos_reservas` DISABLE KEYS */;
INSERT INTO `pagos_reservas` VALUES (1,4,1,1,16,1,7600.00,6840.00),(2,1,2,2,16,2,6400.00,5760.00),(3,2,3,3,16,3,7500.00,6750.00),(4,3,5,4,16,4,5000.00,3250.00),(5,1,9,5,16,5,7750.00,6975.00),(6,2,8,6,17,6,3600.00,2340.00),(7,1,7,7,17,7,2800.00,1820.00),(8,2,1,8,16,8,15000.00,13500.00),(9,3,8,9,17,9,19000.00,12350.00),(10,1,5,10,16,10,4750.00,4275.00),(11,2,3,11,16,11,4400.00,3960.00),(12,4,1,12,17,12,16000.00,10400.00),(13,1,10,13,18,13,6400.00,5120.00),(14,4,7,14,17,14,2000.00,1300.00);
/*!40000 ALTER TABLE `pagos_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pais_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `continente` int NOT NULL,
  PRIMARY KEY (`pais_id`),
  KEY `continente` (`continente`),
  CONSTRAINT `paises_ibfk_1` FOREIGN KEY (`continente`) REFERENCES `continentes` (`continente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Australia',8),(2,'Austria',7),(3,'Azerbaiyan',6),(4,'Anguilla',2),(5,'Argentina',3),(6,'Armenia',7),(7,'Bielorrusia',7),(8,'Belice',4),(9,'Belgica',7),(10,'Bermudas',2),(11,'Bulgaria',7),(12,'Brasil',3),(13,'Reino Unido',7),(14,'HungrÃ­a',7),(15,'Vietnam',6),(16,'Haiti',4),(17,'Guadalupe',2),(18,'Alemania',7),(19,'Holanda',7),(20,'Grecia',7),(21,'Georgia',7),(22,'Dinamarca',7),(23,'Egipto',1),(24,'Israel',6),(25,'India',6),(26,'Iran',6),(27,'Irlanda',7),(28,'Espania',7),(29,'Italia',7),(30,'Kazajstan',6),(31,'Camerun',1),(32,'Canada',2),(33,'Chipre',7),(34,'Kirguistan',6),(35,'China',6),(36,'Costa Rica',4),(37,'Kawait',6),(38,'Letonia',7),(39,'Libia',1),(40,'Lituania',7),(41,'Luxemburgo',7),(42,'Mexico',2),(43,'Moldavia',7),(44,'Monaco',7),(45,'Nueva Zelanza',8),(46,'Noruega',7),(47,'Polonia',7),(48,'Portugal',7),(49,'Reunion',1),(50,'Rusia',6),(51,'El Salvador',4),(52,'Eslovaqui',7),(53,'Eslovenia',7),(54,'Surinam',3),(55,'Estados Unidos',2),(56,'Tadjikistan',6),(57,'Turkmenistan',6),(58,'Islas Turcas y Caicos',6),(59,'Turquia',6),(60,'Uganda',1),(61,'Uzbekistan',6),(62,'Ucrania',7),(63,'Finlandia',7),(64,'Francia',7),(65,'Republica Checa',7),(66,'Suiza',7),(67,'Suecia',7),(68,'Estonia',7),(69,'Corea del Sur',6),(70,'Japon',6),(71,'Croacia',7),(72,'Rumania',7),(73,'Hong Kong',6),(74,'Indonesia',6),(75,'Jordania',6),(76,'Malasia',6),(77,'Singapur',6),(78,'Taiwan',6),(79,'Bosnia',7),(80,'Bahamas',2),(81,'Chile',3),(82,'Colombia',3),(83,'Islandia',7),(84,'Corea del Norte',6),(85,'Macedonia',7),(86,'Malta',7),(87,'PakistÃ¡n',6),(88,'Papua Nueva Guinea',8),(89,'Peru',4),(90,'Filipinas',6),(91,'Arabia Saudita',6),(92,'Tailandia',6),(93,'Emiratos Arabes Unidos',6),(94,'Groenlandia',2),(95,'Venezuela',3),(96,'Zimbabwe',1),(97,'Kenia',1),(98,'Algeria',1),(99,'Libano',6),(100,'Botsuana',1),(101,'Tanzania',1),(102,'Namibia',1),(103,'Ecuador',4),(104,'Marruecos',1),(105,'Ghana',1),(106,'Siria',6),(107,'Nepal',1),(108,'Mauritania',1),(109,'Seychelles',1),(110,'Paraguay',3),(111,'Uruguay',3),(112,'Congo',1),(113,'Cuba',2),(114,'Albania',7),(115,'Nigeria',1),(116,'Zambia',1),(117,'Mozambique',1),(118,'Angola',1),(119,'Sri Lanka',6),(120,'Etiopia',4),(121,'Tunez',1),(122,'Bolivia',3),(123,'Panama',4),(124,'Malawi',1),(125,'Liechtenstein',7),(126,'Bahrein',6),(127,'Barbados',2),(128,'Chad',1),(129,'Isla de Man',7),(130,'Jamaica',4),(131,'Mali',1),(132,'Madagascar',1),(133,'Senegal',1),(134,'Togo',1),(135,'Honduras',4),(136,'Republica Dominicana',4),(137,'Mongolia',6),(138,'Irak',6),(139,'Sudafrica',1),(140,'Aruba',3),(141,'Gibraltar',7),(142,'Afganistan',6),(143,'Andorra',7),(144,'Antigua y Barbuda',4),(145,'Bangladesh',6),(146,'Benin',1),(147,'Butan',6),(148,'Islas Virgenes Britanicas',2),(149,'Brunei',6),(150,'Burkina Faso',1),(151,'Burundi',1),(152,'Camboya',6),(153,'Cabo Verde',1),(154,'Comores',1),(155,'Congo',1),(156,'Costa Marfil',1),(157,'Guinea Ecuatorial',1),(158,'Eritrea',1),(159,'Fiyi',8),(160,'Polinesia Francesa',8),(161,'Gabon',1),(162,'Gambia',1),(163,'Granada',3),(164,'Guatemala',3),(165,'Guernsey',7),(166,'Guinea ',1),(167,'Catar',6),(168,'Samoa',8),(169,'Puerto Rico',4),(170,'Sierra Leona',1),(171,'Mauricio',1),(172,'Nicaragua',4),(173,'Isla Salomon',8);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `promocion_id` int NOT NULL AUTO_INCREMENT,
  `fecha_desde` date DEFAULT NULL,
  `fecha_hasta` date DEFAULT NULL,
  `descuento` float NOT NULL,
  PRIMARY KEY (`promocion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'2019-01-01','2019-03-20',20),(2,'2019-03-21','2019-06-20',45),(3,'2019-06-21','2019-09-20',30),(4,'2019-09-21','2019-12-20',25),(5,'2019-12-21','2019-12-31',10),(6,'2020-01-01','2020-03-20',5),(7,'2020-03-21','2020-06-20',20),(8,'2020-06-21','2020-09-20',10),(9,'2020-09-21','2020-12-20',10),(10,'2020-12-21','2020-12-31',20),(11,'2021-01-01','2021-03-20',20),(12,'2021-03-21','2021-06-20',45),(13,'2021-06-21','2021-09-20',30),(14,'2021-09-21','2021-12-20',25),(15,'2021-12-21','2021-12-31',15),(16,'2022-01-01','2022-03-20',10),(17,'2022-03-21','2022-06-20',35),(18,'2022-06-21','2022-09-20',20),(19,'2022-09-21','2022-12-20',15),(20,'2022-12-21','2022-12-31',5);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `reserva_id` int NOT NULL AUTO_INCREMENT,
  `cliente` int NOT NULL,
  `habitacion` int NOT NULL,
  `fecha_desde` datetime NOT NULL,
  `fecha_hasta` datetime NOT NULL,
  `cantidad_dias` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`reserva_id`),
  KEY `cliente` (`cliente`),
  KEY `habitacion` (`habitacion`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`habitacion`) REFERENCES `habitaciones` (`habitacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,12,'2022-01-01 09:30:00','2022-01-20 08:30:00',19),(2,2,6,'2022-03-12 10:00:00','2022-03-28 12:00:00',16),(3,3,7,'2022-01-06 13:00:00','2022-01-16 12:00:00',10),(4,5,10,'2022-02-14 20:00:00','2022-02-20 20:30:00',5),(5,9,3,'2022-03-15 14:30:00','2022-04-15 13:00:00',31),(6,8,4,'2022-03-26 14:30:00','2022-04-04 13:00:00',9),(7,7,6,'2022-03-25 12:00:00','2022-04-01 13:00:00',7),(8,1,7,'2022-03-13 14:30:00','2022-04-02 13:00:00',20),(9,8,10,'2022-04-12 13:30:00','2022-05-01 12:30:00',19),(10,5,3,'2022-03-06 17:00:00','2022-03-25 16:00:00',19),(11,3,4,'2022-02-14 09:30:00','2022-02-25 08:30:00',11),(12,1,13,'2022-04-15 12:30:00','2022-05-01 11:30:00',16),(13,10,6,'2022-09-15 12:30:00','2022-10-01 11:30:00',16),(14,7,12,'2022-05-20 10:00:00','2022-05-25 09:00:00',5);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ins_factura` AFTER INSERT ON `reservas` FOR EACH ROW BEGIN
    DECLARE v_reserva INT;
    DECLARE v_fecha_emitida DATE;
	DECLARE v_cantidad_dias INT DEFAULT '0';
    
    DECLARE v_pago_total DECIMAL(18,2) DEFAULT '0.0';
    
    DECLARE v_tipo_pago INT DEFAULT '1';
    
    SELECT NEW.reserva_id INTO v_reserva FROM reservas WHERE reserva_id = NEW.reserva_id;
    SELECT NEW.fecha_desde INTO v_fecha_emitida FROM reservas WHERE reserva_id = NEW.reserva_id ;
    SELECT NEW.cantidad_dias INTO v_cantidad_dias FROM reservas WHERE reserva_id = NEW.reserva_id ;
    
    
    SELECT fun_pago_total(NEW.reserva_id, NEW.habitacion, NEW.fecha_desde) INTO v_pago_total FROM DUAL;
    
    SELECT ROUND((RAND() * (5 - 1) + 1 )) INTO v_tipo_pago FROM DUAL;
    
    INSERT INTO facturas(fecha_emitida, reserva, pago_total, moneda, tipo_pago)
    VALUES(v_fecha_emitida, NEW.reserva_id, v_pago_total, 'dolar', v_tipo_pago);
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sectores`
--

DROP TABLE IF EXISTS `sectores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectores` (
  `sector_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(170) DEFAULT NULL,
  PRIMARY KEY (`sector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectores`
--

LOCK TABLES `sectores` WRITE;
/*!40000 ALTER TABLE `sectores` DISABLE KEYS */;
INSERT INTO `sectores` VALUES (1,'Conserjeria','Recibir al huesped y guiarle por dentro del establecimiento'),(2,'Recepcion','Gestionar las reservas formalizar las entradas y salidas atender la seguridad de los clientes e informar'),(3,'Limpieza','Mantener en perfecto estado de higiene y orden las habitaciones'),(4,'Servicio de habitaciones','Llevar a las habitaciones lo mas rapidamente posible la comida solicitada al restaurante o cualquier otro recado prioritario para el huesped'),(5,'Cocina','Realizar los disitintos menus del Hotel'),(6,'Direccion general','Responsable  que todas las actividades del hotel funcionen como gestionar los sueldos de los empleados'),(7,'Mantenimiento','Gestionar el corrector mantenimiento de los hoteles'),(8,'Administracion','Gestionar todo los asutos sobre la administracion de los hoteles');
/*!40000 ALTER TABLE `sectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documentos`
--

DROP TABLE IF EXISTS `tipos_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_documentos` (
  `tipo_doc_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tipo_doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documentos`
--

LOCK TABLES `tipos_documentos` WRITE;
/*!40000 ALTER TABLE `tipos_documentos` DISABLE KEYS */;
INSERT INTO `tipos_documentos` VALUES (1,'DNI','Documeto Nacional de Indentificacion'),(2,'Carnet de Extranjeria','Carnet Extreajeria'),(3,'Pasaporte','Pasaporte'),(4,'Partida de Nacimiento','Partida de Nacimiento'),(5,'Otro','Otro');
/*!40000 ALTER TABLE `tipos_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_habitaciones`
--

DROP TABLE IF EXISTS `tipos_habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_habitaciones` (
  `tipo_habitacion_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `tarifa_estandar` decimal(18,2) NOT NULL,
  `promocion` int NOT NULL,
  PRIMARY KEY (`tipo_habitacion_id`),
  KEY `promocion` (`promocion`),
  CONSTRAINT `tipos_habitaciones_ibfk_1` FOREIGN KEY (`promocion`) REFERENCES `promociones` (`promocion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_habitaciones`
--

LOCK TABLES `tipos_habitaciones` WRITE;
/*!40000 ALTER TABLE `tipos_habitaciones` DISABLE KEYS */;
INSERT INTO `tipos_habitaciones` VALUES (1,'Individual',250.00,17),(2,'Matrimonial',400.00,17),(3,'Familiar',750.00,17),(4,'Suit',1000.00,17);
/*!40000 ALTER TABLE `tipos_habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_pagos`
--

DROP TABLE IF EXISTS `tipos_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_pagos` (
  `tipo_pago_id` int NOT NULL AUTO_INCREMENT,
  `pago` varchar(20) NOT NULL,
  PRIMARY KEY (`tipo_pago_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_pagos`
--

LOCK TABLES `tipos_pagos` WRITE;
/*!40000 ALTER TABLE `tipos_pagos` DISABLE KEYS */;
INSERT INTO `tipos_pagos` VALUES (1,'Efectivo'),(2,'Tarjeta Debito'),(3,'Tarjeta Credito'),(4,'Cheque'),(5,'Transferencia');
/*!40000 ALTER TABLE `tipos_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hoteles_colinas'
--

--
-- Dumping routines for database 'hoteles_colinas'
--
/*!50003 DROP FUNCTION IF EXISTS `fun_cantidad_dias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_cantidad_dias`(fecha_desde DATE, fecha_hasta DATE) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE cant_dias INT;

    SET cant_dias = (SELECT timestampdiff(DAY, fecha_desde, fecha_hasta) FROM DUAL);
    
    RETURN cant_dias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_cuantos_anios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_cuantos_anios`(fecha_nacimiento DATE) RETURNS int
    READS SQL DATA
BEGIN
   DECLARE edad INT;
   DECLARE fecha_actual DATE;
   SET fecha_actual = NOW();
   SET edad = (SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento, fecha_actual) FROM DUAL);
   RETURN edad;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_es_cumpleanios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_es_cumpleanios`(fecha_nacimiento DATE) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
   DECLARE fecha_actual DATE;
   DECLARE es_cumpleanios BOOLEAN DEFAULT FALSE;
   SET fecha_actual = CURDATE();
   
   IF MONTH(fecha_actual) = MONTH(fecha_nacimiento) THEN 
		IF DAY(Fecha_actual) = DAY(fecha_nacimiento) THEN
			SET es_cumpleanios = TRUE;
		END IF;
   END IF;
   RETURN es_cumpleanios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_insert_nombre_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_insert_nombre_cliente`(cliente_id INT) RETURNS varchar(40) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE nombre_cliente VARCHAR(40);
    SET nombre_cliente= (SELECT CONCAT_WS(' ', co.nombre, co.apellido) AS NOMBRE_CLIENTE 
                         FROM clientes cl, contactos co
                         WHERE cl.contacto = co.contacto_id
                         AND cl.cliente_id = cliente_id);
                         
	RETURN nombre_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_insert_nombre_hotel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_insert_nombre_hotel`(hotel_id INT) RETURNS varchar(40) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE nombre_hotel VARCHAR(40);
    SET nombre_hotel = (SELECT CONCAT_WS(' ', co.nombre, co.apellido) AS HOTEL 
                         FROM hoteles h, contactos co
                         WHERE h.contacto = co.contacto_id
                         AND h.hotel_id = hotel_id);
                         
	RETURN nombre_hotel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_pago_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_pago_total`(p_reserva INT, p_habitacion INT, p_fecha DATE) RETURNS decimal(18,2)
    READS SQL DATA
BEGIN
    DECLARE v_resultado DECIMAL(18,2) DEFAULT '0.0';
    DECLARE v_tarifa_estandar DECIMAL(18, 2) DEFAULT '0.0';
    DECLARE v_cantidad_dias INT DEFAULT '0';
    DECLARE v_descuento FLOAT DEFAULT '0.0';
    
	SELECT th.tarifa_estandar INTO v_tarifa_estandar 
    FROM tipos_habitaciones th, habitaciones h, reservas r 
	WHERE th.tipo_habitacion_id = h.tipo_habitacion
	AND h.habitacion_id = p_habitacion
    AND r.reserva_id = p_reserva;
    
    SELECT descuento INTO v_descuento 
    FROM promociones p WHERE p_fecha BETWEEN p.fecha_desde AND p.fecha_hasta; 
    
    SELECT cantidad_dias INTO v_cantidad_dias FROM reservas r WHERE r.reserva_id = p_reserva;
    
    SET v_resultado = ( v_tarifa_estandar - (v_tarifa_estandar *  (  v_descuento / 100)));
    
    SET v_resultado = v_resultado * v_cantidad_dias;
    
    RETURN v_resultado;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_precio_final_habitacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_precio_final_habitacion`(precio DECIMAL(18,2), descuento FLOAT) RETURNS decimal(18,2)
    NO SQL
BEGIN
    DECLARE resultado DECIMAL(18,2);
    SET resultado = (precio - (precio * (descuento / 100)));
    RETURN resultado;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_reservas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reservas`()
BEGIN
   
    SELECT r.reserva_id AS reserva_id,
	   r.cliente AS cliente_id,
       fun_insert_nombre_cliente(r.cliente) AS cliente, 
	   h.hotel AS hotel_id,
	   fun_insert_nombre_hotel(h.hotel) AS hotel,
	   h.num_habitacion AS num_habitacion,
	   h.piso_habitacion AS piso_habitacion,
       th.nombre AS tipo_habitacion,
	   r.fecha_desde AS fecha_desde,
	   r.fecha_hasta AS fecha_hasta,
       fun_cantidad_dias(r.fecha_desde, r.fecha_hasta) AS cantidad_dias
   FROM reservas r, habitaciones h, tipos_habitaciones th
   WHERE r.habitacion = h.habitacion_id
   AND   h.tipo_habitacion = th.tipo_habitacion_id
   ORDER BY r.fecha_desde DESC;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_reservas_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reservas_cliente`(IN cliente_id INT)
BEGIN
   DECLARE cliente INT;
   DECLARE EXIT HANDLER FOR SQLWARNING SELECT 'CUIDADO: El ID del Cliente ingresado no existe!!' Message;

   SELECT r.cliente INTO cliente FROM reservas r WHERE r.cliente = cliente_id LIMIT 1;
   
   IF cliente_id  = cliente THEN
	   SELECT r.reserva_id AS reserva_id,
			  r.cliente AS cliente_id,
			  fun_insert_nombre_cliente(cliente_id) AS cliente, 
			  h.hotel AS hotel_id,
			  fun_insert_nombre_hotel(h.hotel) AS hotel,
			  h.num_habitacion AS num_habitacion,
			  h.piso_habitacion AS piso_habitacion,
			  th.nombre AS tipo_habitacion,
			  r.fecha_desde AS fecha_desde,
			  r.fecha_hasta AS fecha_hasta,
			  fun_cantidad_dias(r.fecha_desde, r.fecha_hasta) AS cantidad_dias
		FROM reservas r, habitaciones h, tipos_habitaciones th
		WHERE r.habitacion = h.habitacion_id
		AND   h.tipo_habitacion = th.tipo_habitacion_id
		AND cliente_id = r.cliente
		ORDER BY r.fecha_desde DESC;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_reservas_hotel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_reservas_hotel`(IN hotel_id INT)
BEGIN
   DECLARE hotel INT;
   DECLARE EXIT HANDLER FOR SQLWARNING SELECT 'CUIDADO: El ID del Hotel ingresado no existe!!' Message;

   SELECT hab.hotel INTO hotel FROM habitaciones hab WHERE hab.hotel = hotel_id LIMIT 1;
   
   IF hotel_id  =  hotel THEN
	   SELECT r.reserva_id AS reserva_id,
			  r.cliente AS cliente_id,
			  fun_insert_nombre_cliente(r.cliente) AS cliente, 
			  hab.hotel AS hotel_id,
			  fun_insert_nombre_hotel(hab.hotel) AS hotel,
			  hab.num_habitacion AS num_habitacion,
			  hab.piso_habitacion AS piso_habitacion,
			  th.nombre AS tipo_habitacion,
			  r.fecha_desde AS fecha_desde,
			  r.fecha_hasta AS fecha_hasta,
			  fun_cantidad_dias(r.fecha_desde, r.fecha_hasta) AS cantidad_dias
		FROM reservas r, habitaciones hab, tipos_habitaciones th
		WHERE r.habitacion = hab.habitacion_id
		AND   hab.tipo_habitacion = th.tipo_habitacion_id
		AND hotel_id = hab.hotel
		ORDER BY r.fecha_desde DESC;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_reserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_reserva`(IN p_cliente INT, IN p_habitacion INT, IN p_fecha_desde DATETIME, IN p_fecha_hasta DATETIME)
BEGIN
   DECLARE v_cant_dias INT;
   SELECT fun_cantidad_dias(p_fecha_desde, p_fecha_hasta) INTO v_cant_dias FROM DUAL;
   
   INSERT INTO reservas(cliente, fecha_desde, fecha_hasta, cantidad_dias, habitacion)
           VALUES(p_cliente, p_fecha_desde, p_fecha_hasta, v_cant_dias, p_habitacion);
   #Una forma de hacerlo que muestre solo un solo registro
   #SELECT * FROM reservas r WHERE r.reserva_id = (SELECT LAST_INSERT_ID() AS reserva_id FROM reservas LIMIT 1);
   
   #En este caso muestra todos los registros del cliente
   call get_reservas_cliente(p_cliente);
   ######### EJEMPLO DE PRUEBA:
  -- call set_reserva_cliente(9, '2022-04-15 12:30:00', '2022-05-01 11:30:00', 6);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_reservas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_reservas`(IN p_cliente INT, IN p_habitacion INT, IN p_fecha_desde DATETIME, IN p_fecha_hasta DATETIME)
BEGIN
   DECLARE v_cant_dias INT;
   SELECT fun_cantidad_dias(p_fecha_desde, p_fecha_hasta) INTO v_cant_dias FROM DUAL;
   
   INSERT INTO reservas(cliente, fecha_desde, fecha_hasta, cantidad_dias, habitacion)
           VALUES(p_cliente, p_fecha_desde, p_fecha_hasta, v_cant_dias, p_habitacion);
   #Una forma de hacerlo que muestre solo un solo registro
   #SELECT * FROM reservas r WHERE r.reserva_id = (SELECT LAST_INSERT_ID() AS reserva_id FROM reservas LIMIT 1);
   
   #En este caso muestra todos los registros del cliente
   call get_reservas_cliente(p_cliente);
   ######### EJEMPLO DE PRUEBA:
  -- call set_reserva_cliente(9, '2022-04-15 12:30:00', '2022-05-01 11:30:00', 6);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_reserva_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_reserva_cliente`(IN p_cliente INT, IN p_habitacion INT, IN p_fecha_desde DATETIME, IN p_fecha_hasta DATETIME)
BEGIN
   DECLARE v_cant_dias INT;
   SELECT fun_cantidad_dias(p_fecha_desde, p_fecha_hasta) INTO v_cant_dias FROM DUAL;
   
   INSERT INTO reservas(cliente, fecha_desde, fecha_hasta, cantidad_dias, habitacion)
           VALUES(p_cliente, p_fecha_desde, p_fecha_hasta, v_cant_dias, p_habitacion);
   #Una forma de hacerlo que muestre solo un solo registro
   #SELECT * FROM reservas r WHERE r.reserva_id = (SELECT LAST_INSERT_ID() AS reserva_id FROM reservas LIMIT 1);
   
   #En este caso muestra todos los registros del cliente
   call get_reservas_cliente(p_cliente);
   ######### EJEMPLO DE PRUEBA:
  -- call set_reserva_cliente(9, '2022-04-15 12:30:00', '2022-05-01 11:30:00', 6);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `info_clientes`
--

/*!50001 DROP VIEW IF EXISTS `info_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_clientes` AS select concat_ws(' ',`co`.`nombre`,`co`.`apellido`) AS `nombre_completo`,`t`.`nombre` AS `tipo_documento`,`cl`.`num_documento` AS `num_documento`,`co`.`telefono` AS `telefono`,`co`.`email` AS `email`,`co`.`direccion` AS `direccion`,`co`.`codigo_postal` AS `codigo_postal`,`p`.`nombre` AS `pais` from (((`clientes` `cl` join `contactos` `co`) join `tipos_documentos` `t`) join `paises` `p`) where ((`cl`.`contacto` = `co`.`contacto_id`) and (`cl`.`tipo_documento` = `t`.`tipo_doc_id`) and (`cl`.`pais` = `p`.`pais_id`)) order by `cl`.`cliente_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_empleados`
--

/*!50001 DROP VIEW IF EXISTS `info_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_empleados` AS select concat_ws(' ',`co`.`nombre`,`co`.`apellido`) AS `nombre_completo`,`td`.`nombre` AS `tipo_documento`,`e`.`num_documento` AS `num_documento`,`co`.`telefono` AS `telefono`,`co`.`email` AS `email`,`s`.`nombre` AS `sector`,`j`.`nombre` AS `jornada`,`e`.`salario` AS `salario`,`FUN_INSERT_NOMBRE_HOTEL`(`e`.`hotel`) AS `hotel` from ((((`empleados` `e` join `contactos` `co`) join `tipos_documentos` `td`) join `sectores` `s`) join `jornadas` `j`) where ((`co`.`contacto_id` = `e`.`contacto`) and (`td`.`tipo_doc_id` = `e`.`tipo_documento`) and (`s`.`sector_id` = `e`.`sector`) and (`j`.`jornada_id` = `e`.`jornada`)) order by concat(`co`.`nombre`,' ',`co`.`apellido`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_facturas`
--

/*!50001 DROP VIEW IF EXISTS `info_facturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_facturas` AS select `FUN_INSERT_NOMBRE_CLIENTE`(`r`.`cliente`) AS `nombre_cliente`,`t_doc`.`nombre` AS `tipo_doc`,`cl`.`num_documento` AS `num_doc`,`co`.`telefono` AS `telefono_cliente`,`co`.`email` AS `email_cliente`,`f`.`fecha_emitida` AS `fecha_emitida`,`FUN_INSERT_NOMBRE_HOTEL`(`h`.`hotel`) AS `hotel`,`h`.`num_habitacion` AS `num_habitacion`,`th`.`nombre` AS `tipo_habitacion`,`th`.`tarifa_estandar` AS `tarifa_estandar`,concat('-',(select `p`.`descuento` from `promociones` `p` where (`r`.`fecha_desde` between `p`.`fecha_desde` and `p`.`fecha_hasta`)),'%') AS `descuento`,`FUN_PRECIO_FINAL_HABITACION`(`th`.`tarifa_estandar`,(select `p`.`descuento` from `promociones` `p` where (`r`.`fecha_desde` between `p`.`fecha_desde` and `p`.`fecha_hasta`))) AS `precio_con_descuento`,`r`.`cantidad_dias` AS `cantidad_dias`,`FUN_PAGO_TOTAL`(`r`.`reserva_id`,`r`.`habitacion`,`r`.`fecha_desde`) AS `pago_total`,`tp`.`pago` AS `tipo_pago`,`f`.`moneda` AS `moneda` from ((((((((`facturas` `f` join `reservas` `r` on((`r`.`reserva_id` = `f`.`reserva`))) join `clientes` `cl` on((`cl`.`cliente_id` = `r`.`cliente`))) join `tipos_documentos` `t_doc` on((`t_doc`.`tipo_doc_id` = `cl`.`tipo_documento`))) join `contactos` `co` on((`co`.`contacto_id` = `cl`.`contacto`))) join `habitaciones` `h` on((`h`.`habitacion_id` = `r`.`habitacion`))) join `tipos_habitaciones` `th` on((`th`.`tipo_habitacion_id` = `h`.`tipo_habitacion`))) join `promociones` `p` on((`p`.`promocion_id` = `th`.`promocion`))) join `tipos_pagos` `tp` on((`tp`.`tipo_pago_id` = `f`.`tipo_pago`))) order by `f`.`factura_id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_habitaciones`
--

/*!50001 DROP VIEW IF EXISTS `info_habitaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_habitaciones` AS select `FUN_INSERT_NOMBRE_HOTEL`(`h`.`hotel`) AS `hotel`,`h`.`num_habitacion` AS `num_habitacion`,`t`.`nombre` AS `tipo_habitacion`,`t`.`tarifa_estandar` AS `precio_estandar`,`p`.`descuento` AS `descuento`,round(`FUN_PRECIO_FINAL_HABITACION`(`t`.`tarifa_estandar`,`p`.`descuento`),2) AS `precio_final`,`p`.`fecha_desde` AS `inicio_promo`,`p`.`fecha_hasta` AS `fin_promo` from ((`habitaciones` `h` join `tipos_habitaciones` `t`) join `promociones` `p`) where ((`h`.`tipo_habitacion` = `t`.`tipo_habitacion_id`) and (`p`.`promocion_id` = `t`.`promocion`)) order by `h`.`num_habitacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_hoteles`
--

/*!50001 DROP VIEW IF EXISTS `info_hoteles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_hoteles` AS select `FUN_INSERT_NOMBRE_HOTEL`(`e`.`hotel`) AS `hotel`,count(1) AS `cantidad_empleados`,sum(`e`.`salario`) AS `pago_total_salarios` from `empleados` `e` group by `e`.`hotel` order by `cantidad_empleados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_personal_de_empleados`
--

/*!50001 DROP VIEW IF EXISTS `info_personal_de_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_personal_de_empleados` AS select concat_ws(' ',`co`.`nombre`,`co`.`apellido`) AS `nombre_completo`,`td`.`nombre` AS `tipo_documento`,`e`.`num_documento` AS `num_documento`,`co`.`telefono` AS `telefono`,`co`.`email` AS `email`,`co`.`direccion` AS `direccion`,`p`.`nombre` AS `nacionalidad`,`e`.`fecha_nacimiento` AS `fecha_nacimiento`,`FUN_CUANTOS_ANIOS`(`e`.`fecha_nacimiento`) AS `edad`,`FUN_ES_CUMPLEANIOS`(`e`.`fecha_nacimiento`) AS `cumpleanios`,`FUN_INSERT_NOMBRE_HOTEL`(`e`.`hotel`) AS `hotel` from (((`empleados` `e` join `contactos` `co`) join `tipos_documentos` `td`) join `paises` `p`) where ((`e`.`contacto` = `co`.`contacto_id`) and (`e`.`tipo_documento` = `td`.`tipo_doc_id`) and (`e`.`pais` = `p`.`pais_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_reservas`
--

/*!50001 DROP VIEW IF EXISTS `info_reservas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_reservas` AS select `FUN_INSERT_NOMBRE_CLIENTE`(`r`.`cliente`) AS `nombre_completo`,`FUN_INSERT_NOMBRE_HOTEL`(`hns`.`hotel`) AS `hotel`,`th`.`nombre` AS `tipo_habitacion`,`hns`.`num_habitacion` AS `num_habitacion`,`hns`.`piso_habitacion` AS `piso_habitacion`,`r`.`fecha_desde` AS `fecha_desde`,`r`.`fecha_hasta` AS `fecha_hasta`,`r`.`cantidad_dias` AS `cantidad_dias` from (((`reservas` `r` join `clientes` `cl` on((`r`.`cliente` = `cl`.`cliente_id`))) join `habitaciones` `hns` on((`hns`.`habitacion_id` = `r`.`habitacion`))) join `tipos_habitaciones` `th` on((`th`.`tipo_habitacion_id` = `hns`.`tipo_habitacion`))) order by `r`.`reserva_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_tipos_habitaciones`
--

/*!50001 DROP VIEW IF EXISTS `info_tipos_habitaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_tipos_habitaciones` AS select `info_habitaciones`.`tipo_habitacion` AS `tipo_habitacion`,group_concat(distinct `info_habitaciones`.`num_habitacion` order by `info_habitaciones`.`num_habitacion` ASC separator ' - ') AS `num_habitaciones`,`info_habitaciones`.`precio_estandar` AS `precio_estandar`,`info_habitaciones`.`descuento` AS `descuento`,`info_habitaciones`.`precio_final` AS `precio_final`,`info_habitaciones`.`inicio_promo` AS `inicio_promo`,`info_habitaciones`.`fin_promo` AS `fin_promo` from `info_habitaciones` group by `info_habitaciones`.`tipo_habitacion` */;
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

-- Dump completed on 2022-05-17 20:13:58
