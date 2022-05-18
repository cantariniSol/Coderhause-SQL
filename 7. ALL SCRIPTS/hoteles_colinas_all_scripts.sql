-- ---------------------------------------------------------------------
-- ###### NOMBRE DEL PROYECTO: CADENA HOTELES COLINAS 
######### NOMBRE Y APELLIDO: Maria Sol Cantarini
-- ---------------------------------------------------------------------
-- INTRODUCCION
/****************************************************************************************************************
INTRODUCCIÓN AL MODELO DE NEGOCIO
 Como propuesta para el proyecto final realizamos una base de datos enfocada en una 
 cadena de hoteles llamada “Hoteles Colinas”, cabe aclarar previamente que esta cadena 
 de  hoteles es ficticia. 
 
 ########################################################
 GITHUB: Link al respositorio del proyecto 
 https://github.com/cantariniSol/Coderhause-SQL.git
 ########################################################
**************************************************************************************************************************/

-- --------------------------------------------------------------------
-- CREATE TABLE 
-- --------------------------------------------------------------------
-- ------------------------------------------------
-- CREATE DE LA BASE DE DATOS hoteles_colinas
-- ------------------------------------------------
CREATE DATABASE  IF NOT EXISTS hoteles_colinas;

-- USO DE LA BASE DE DATOS hoteles_colinas
USE hoteles_colinas;
-- ------------------------------------------------------
-- CREACION DE TABLAS
-- ------------------------------------------------------

-- ------------------
-- TABLA continentes
-- ------------------
-- DROP TABLE IF EXISTS continentes;
CREATE TABLE continentes(
  continente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL
);

-- ------------------
-- TABLA paises
-- ------------------
DROP TABLE IF EXISTS paises;
CREATE TABLE paises(
  pais_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  continente INT NOT NULL,
  FOREIGN KEY(continente) REFERENCES continentes(continente_id)
);

-- ---------------------------
-- TABLA tipos_documento
-- ---------------------------
DROP TABLE IF EXISTS tipos_documentos;
CREATE TABLE tipos_documentos(
  tipo_doc_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  descripcion VARCHAR(40) DEFAULT NULL
);

-- ------------------
-- TABLA contactos
-- ------------------
DROP TABLE IF EXISTS contactos;
CREATE TABLE contactos (
  contacto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido VARCHAR(30) DEFAULT NULL,
  direccion VARCHAR(40) DEFAULT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL,
  email VARCHAR(40) NOT NULL
  );
  
-- ------------------
-- TABLA clientes
-- ------------------
DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
  cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fecha_alta DATE NOT NULL,
  contacto INT NOT NULL,
  pais INT NOT NULL,
  tipo_documento INT NOT NULL,
  num_documento varchar(15) NOT NULL,
  FOREIGN KEY(contacto) REFERENCES contactos(contacto_id),
  FOREIGN KEY(pais) REFERENCES paises(pais_id),
  FOREIGN KEY (tipo_documento) REFERENCES tipos_documentos(tipo_doc_id)
);

-- ------------------
-- TABLA hoteles
-- ------------------
DROP TABLE IF EXISTS hoteles;
CREATE TABLE hoteles(
  hotel_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  url VARCHAR(50) NOT NULL,
  contacto INT NOT NULL,
  pais INT NOT NULL,
  FOREIGN KEY (pais) REFERENCES paises(pais_id),
  FOREIGN KEY (contacto) REFERENCES contactos(contacto_id)
);

-- ----------------------
-- TABLA promociones
-- ----------------------
DROP TABLE IF EXISTS promociones;
CREATE TABLE promociones(
  promocion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fecha_desde DATE DEFAULT NULL,
  fecha_hasta DATE DEFAULT NULL,
  descuento FLOAT NOT NULL
);

-- ----------------------------------
-- TABLA tipos_habitaciones
-- ----------------------------------
DROP TABLE IF EXISTS tipos_habitaciones;
CREATE TABLE tipos_habitaciones(
  tipo_habitacion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre  VARCHAR(15) NOT NULL,
  tarifa_estandar DECIMAL(18,2) NOT NULL,
  promocion INT NOT NULL,
  FOREIGN KEY(promocion) REFERENCES promociones(promocion_id)
);

-- ---------------------
-- TABLA habitaciones
-- ---------------------
DROP TABLE IF EXISTS habitaciones;
CREATE TABLE habitaciones(
  habitacion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  estado TINYINT DEFAULT '0',
  num_habitacion  INT DEFAULT NULL,
  piso_habitacion INT DEFAULT NULL,
  tipo_habitacion INT NOT NULL,
  hotel INT NOT NULL,
  descripcion VARCHAR(150) DEFAULT NULL,
  FOREIGN KEY(tipo_habitacion) REFERENCES tipos_habitaciones(tipo_habitacion_id),
  FOREIGN KEY(hotel) REFERENCES hoteles(hotel_id)
);

-- ------------------
-- TABLA reservas
-- ------------------
DROP TABLE IF EXISTS reservas;
CREATE TABLE reservas(
  reserva_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cliente INT NOT NULL,
  habitacion INT NOT NULL,
  fecha_desde DATETIME NOT NULL,
  fecha_hasta DATETIME NOT NULL,
  cantidad_dias INT NOT NULL DEFAULT '0',
   FOREIGN KEY(cliente) REFERENCES clientes(cliente_id),
   FOREIGN KEY(habitacion) REFERENCES habitaciones(habitacion_id)
);

-- ---------------------
-- TABLA tipos_pagos
-- ----------------------
DROP TABLE IF EXISTS tipos_pagos;
CREATE TABLE tipos_pagos(
  tipo_pago_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pago VARCHAR(20) NOT NULL
);

-- ------------------
-- TABLA facturas
-- ------------------
DROP TABLE IF EXISTS facturas;
CREATE TABLE facturas(
  factura_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fecha_emitida DATE NOT NULL,
  reserva INT NOT NULL,
  pago_total DECIMAL(18,2) DEFAULT '0.00',
  moneda VARCHAR(15) DEFAULT NULL,
  tipo_pago INT NOT NULL,
  FOREIGN KEY(reserva) REFERENCES reservas(reserva_id)
);

-- ------------------
-- TABLA jornada
-- ------------------
DROP TABLE IF EXISTS jornadas;
CREATE TABLE jornadas(
  jornada_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  horario_inicio DATE NOT NULL,
  horario_fin DATE NOT NULL,
  nombre VARCHAR(15) NOT NULL
);

-- ------------------
-- TABLA sectores
-- ------------------
DROP TABLE IF EXISTS sectores;
CREATE TABLE sectores(
  sector_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) DEFAULT NULL,
  descripcion VARCHAR(170) DEFAULT NULL
);

-- ------------------
-- TABLA empleados
-- ------------------
DROP TABLE IF EXISTS empleados ;
CREATE TABLE empleados(
  empleado_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fecha_alta DATE NOT NULL,
  contacto INT NOT NULL,
  pais INT NOT NULL,
  tipo_documento INT NOT NULL,
  num_documento VARCHAR(15) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  sector INT NOT NULL,
  jornada INT NOT NULL,
  salario DECIMAL(18,2) NOT NULL,
  hotel INT NOT NULL,
  FOREIGN KEY (contacto) REFERENCES contactos(contacto_id),
  FOREIGN KEY (pais) REFERENCES paises(pais_id),
  FOREIGN KEY (tipo_documento) REFERENCES tipos_documentos(tipo_doc_id),
  FOREIGN KEY (sector) REFERENCES sectores(sector_id),
  FOREIGN KEY (jornada) REFERENCES jornadas(jornada_id),
  FOREIGN KEY (hotel) REFERENCES hoteles(hotel_id)
);

-- --------------------------------
-- TABLA log_empleados_eliminados
-- --------------------------------
DROP TABLE IF EXISTS log_empleados_eliminados;
CREATE TABLE log_empleados_eliminados(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  empleado INT NOT NULL,
  fecha_alta DATE NOT NULL,
  contacto_empleado INT NOT NULL,
  fecha_hora datetime NOT NULL,
  usuario VARCHAR(30) DEFAULT NULL
);

-- --------------------------------
-- TABLA pagos_empleados
-- --------------------------------
DROP TABLE IF EXISTS pagos_empleados;
CREATE TABLE pagos_empleados(
  pago_empleado_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  hotel INT DEFAULT NULL,
  sector INT NOT NULL,
  jornada INT NOT NULL,
  empleado INT NOT NULL DEFAULT '0',
  salario_total DECIMAL(18,2) NOT NULL,
  FOREIGN KEY (hotel) REFERENCES hoteles(hotel_id),
  FOREIGN KEY (sector) REFERENCES sectores(sector_id),
  FOREIGN KEY (jornada) REFERENCES jornadas(jornada_id),
  FOREIGN KEY (empleado) REFERENCES empleados(empleado_id)
);

-- --------------------------------
-- TABLA pagos_reservas
-- --------------------------------
DROP TABLE IF EXISTS pagos_reservas;
CREATE TABLE pagos_reservas(
  pago_reserva_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  hotel INT DEFAULT NULL,
  cliente INT NOT NULL DEFAULT '0',
  reserva INT NOT NULL DEFAULT '0',
  promocion INT DEFAULT NULL,
  factura INT NOT NULL DEFAULT '0',
  pago_sub_total DECIMAL(28,2) DEFAULT '0.00',
  pago_total DECIMAL(18,2) DEFAULT '0.00',
  FOREIGN KEY(hotel) REFERENCES hoteles(hotel_id),
  FOREIGN KEY(cliente) REFERENCES clientes(cliente_id),
  FOREIGN KEY(promocion) REFERENCES promociones(promocion_id),
  FOREIGN KEY(factura) REFERENCES facturas(factura_id),
  FOREIGN KEY(reserva) REFERENCES reservas(reserva_id)
);

-- --------------------------------------------------------------------
-- INSERTS INTO
-- --------------------------------------------------------------------
-- ------------------
-- TABLA continentes
-- ------------------
INSERT INTO continentes VALUES 
(1,'Africa'),
(2,'America del Norte'),
(3,'America del Sur'),
(4,'America Central'),
(5,'Antartida'),
(6,'Asia'),
(7,'Europa'),
(8,'Oceania');

-- ------------------
-- TABLA paises
-- ------------------
INSERT INTO paises VALUES 
(1,'Australia',8),(2,'Austria',7),(3,'Azerbaiyan',6),(4,'Anguilla',2),(5,'Argentina',3),(6,'Armenia',7),(7,'Bielorrusia',7),(8,'Belice',4),(9,'Belgica',7),(10,'Bermudas',2),(
11,'Bulgaria',7),(12,'Brasil',3),(13,'Reino Unido',7),(14,'HungrÃ­a',7),(15,'Vietnam',6),(16,'Haiti',4),(17,'Guadalupe',2),(18,'Alemania',7),(19,'Holanda',7),(20,'Grecia',7),
(21,'Georgia',7),(22,'Dinamarca',7),(23,'Egipto',1),(24,'Israel',6),(25,'India',6),(26,'Iran',6),(27,'Irlanda',7),(28,'Espania',7),(29,'Italia',7),(30,'Kazajstan',6),
(31,'Camerun',1),(32,'Canada',2),(33,'Chipre',7),(34,'Kirguistan',6),(35,'China',6),(36,'Costa Rica',4),(37,'Kawait',6),(38,'Letonia',7),(39,'Libia',1),(40,'Lituania',7),
(41,'Luxemburgo',7),(42,'Mexico',2),(43,'Moldavia',7),(44,'Monaco',7),(45,'Nueva Zelanza',8),(46,'Noruega',7),(47,'Polonia',7),(48,'Portugal',7),(49,'Reunion',1),(50,'Rusia',6),
(51,'El Salvador',4),(52,'Eslovaqui',7),(53,'Eslovenia',7),(54,'Surinam',3),(55,'Estados Unidos',2),(56,'Tadjikistan',6),(57,'Turkmenistan',6),(58,'Islas Turcas y Caicos',6),(59,'Turquia',6),(60,'Uganda',1),
(61,'Uzbekistan',6),(62,'Ucrania',7),(63,'Finlandia',7),(64,'Francia',7),(65,'Republica Checa',7),(66,'Suiza',7),(67,'Suecia',7),(68,'Estonia',7),(69,'Corea del Sur',6),(70,'Japon',6),
(71,'Croacia',7),(72,'Rumania',7),(73,'Hong Kong',6),(74,'Indonesia',6),(75,'Jordania',6),(76,'Malasia',6),(77,'Singapur',6),(78,'Taiwan',6),(79,'Bosnia',7),(80,'Bahamas',2),
(81,'Chile',3),(82,'Colombia',3),(83,'Islandia',7),(84,'Corea del Norte',6),(85,'Macedonia',7),(86,'Malta',7),(87,'PakistÃ¡n',6),(88,'Papua Nueva Guinea',8),(89,'Peru',4),(90,'Filipinas',6),
(91,'Arabia Saudita',6),(92,'Tailandia',6),(93,'Emiratos Arabes Unidos',6),(94,'Groenlandia',2),(95,'Venezuela',3),(96,'Zimbabwe',1),(97,'Kenia',1),(98,'Algeria',1),(99,'Libano',6),(100,'Botsuana',1),
(101,'Tanzania',1),(102,'Namibia',1),(103,'Ecuador',4),(104,'Marruecos',1),(105,'Ghana',1),(106,'Siria',6),(107,'Nepal',1),(108,'Mauritania',1),(109,'Seychelles',1),(110,'Paraguay',3),
(111,'Uruguay',3),(112,'Congo',1),(113,'Cuba',2),(114,'Albania',7),(115,'Nigeria',1),(116,'Zambia',1),(117,'Mozambique',1),(118,'Angola',1),(119,'Sri Lanka',6),(120,'Etiopia',4),
(121,'Tunez',1),(122,'Bolivia',3),(123,'Panama',4),(124,'Malawi',1),(125,'Liechtenstein',7),(126,'Bahrein',6),(127,'Barbados',2),(128,'Chad',1),(129,'Isla de Man',7),(130,'Jamaica',4),
(131,'Mali',1),(132,'Madagascar',1),(133,'Senegal',1),(134,'Togo',1),(135,'Honduras',4),(136,'Republica Dominicana',4),(137,'Mongolia',6),(138,'Irak',6),(139,'Sudafrica',1),(140,'Aruba',3),
(141,'Gibraltar',7),(142,'Afganistan',6),(143,'Andorra',7),(144,'Antigua y Barbuda',4),(145,'Bangladesh',6),(146,'Benin',1),(147,'Butan',6),(148,'Islas Virgenes Britanicas',2),(149,'Brunei',6),(150,'Burkina Faso',1),
(151,'Burundi',1),(152,'Camboya',6),(153,'Cabo Verde',1),(154,'Comores',1),(155,'Congo',1),(156,'Costa Marfil',1),(157,'Guinea Ecuatorial',1),(158,'Eritrea',1),(159,'Fiyi',8),(160,'Polinesia Francesa',8),
(161,'Gabon',1),(162,'Gambia',1),(163,'Granada',3),(164,'Guatemala',3),(165,'Guernsey',7),(166,'Guinea ',1),(167,'Catar',6),(168,'Samoa',8),(169,'Puerto Rico',4),(170,'Sierra Leona',1),
(171,'Mauricio',1),(172,'Nicaragua',4),(173,'Isla Salomon',8);

-- ---------------------------
-- TABLA tipos_documento
-- ---------------------------
INSERT INTO tipos_documentos VALUES 
(1,'DNI','Documeto Nacional de Indentificacion'),
(2,'Carnet de Extranjeria','Carnet Extreajeria'),
(3,'Pasaporte','Pasaporte'),
(4,'Partida de Nacimiento','Partida de Nacimiento'),
(5,'Otro','Otro');


-- ------------------
-- TABLA contactos
-- ------------------
INSERT INTO contactos VALUES
(1,'Adriana Carolina','Hernandez','Isla Azores 12','5141','543341212','adriana_car_27_@hotmail.com'),
(2,'Alexandro','Caravajal','Padre Bayle 9','100005','123123442','alex_caravajal@gmail.com'),
(3,'Camilo','Polanco Ruiz','Rio Danubio 12','100232','654543000','polanc_camilo@gmail.com'),
(4,'Brigite','Watson','River Raquis Street 45','2141','992342400','big_wts@outlook.com'),
(5,'Carlos Felipe','Castanio','Avenida Antonio Hurtado 22','1421','243244334','carlos_felcho@hotmail.com'),
(6,'Carlos Alberto','Cruz','San Anton 7','424141','323424121','berto_car_193@gmail.com'),
(7,'Daniela','Diaz Beltran','Caceres Amber 4123','4141','112222123','dan_diaz@gmail.com'),
(8,'Fabian Andres','Fino','Doctor Fleming 9','100232','434141321','fino_fabian@hotmail.com'),
(9,'Gabriel Mauricio','Quesada','Avenida Solano 13','100232','876546465','gabi_q@gmail.com'),
(10,'Gloria Patricia','Mendoza Alvear','Ambeeres 6','JSI1313','413454534','gloria_glo_98@outlook.com'),
(11,'Hugo Andres','Camargo Vargas','Avenida De Alemania 8','13131','345353545','hugo_Var@gmail.com'),
(12,'Ingrid','Romanov','Roxia Rev 34','HH2324','113311313','ingrid_roma@gmail.com'),
(13,'Ivonne Jouliette','Orozco','La Roche Sur 44','100232','425111558','iv_jou@outlook.com'),
(14,'Juan Camilo','Jimenez','Uruguay 345','CH234324','653535435','juan_camilo34@gmail.com'),
(15,'Juan Fernando','Lanoa ','Isabel De Moc 2343','100232','635524525','fer_lanoa@gmail.com'),
(16,'Karen Eliana','Pulido','Gobernador Ferreira 34','W334234','666663211','k_eliana@hotmail.com'),
(17,'Karla','Rodriguez','San Lucas 234','100232','534242422','karla_45@hotmail.com'),
(18,'Laura Fernanda','Del Rio Ayarbe','Sauces 24','PJQ423','530298870','lau_che@gmial.com'),
(19,'Laura Vanina','Duenias','Lisboa 132 2a° H','100232','536344333','vanina_duenias@gmail.com'),
(20,'Maria Celeste','Cervantes','Juncal 34 3a° B','100232','542388725','celeste_cer@hotmail.com'),
(21,'Pablo','Alvarez Castillo','Avenida Carcano 1233','5442','548435260','pablo_casti101@outlook.com'),
(22,'Rafael Alejandro','Borda','Isla Margatira 14','24242','554480723','borda_rafa@gmail.com'),
(23,'Sebastian','Ochoa','Lisando La Torre 12','10043','560526186','sebas_Ochoa08@gmail.com'),
(24,'Tobias','Tahoboada','Jaranda 1344','C24234','566066176','tobi_taho@hotmail.com'),
(25,'Uma ','Bostom','Posman 133 Street','100232','171198039','uma_bostom@gmail.com'),
(26,'Hoteles Colinas','Espania','Avenida Rocaferrera 2300','C10002','121001201','hoteles_colinas_esp@gmail.com'),
(27,'Hoteles Colinas','Brasil','Avenida Lula da Silva 300','C23442','533335356','hoteles_colinas_bra@gmail.com'),
(28,'Hoteles Colinas','Mexico','Avenida Frida Kalho 500','C30000','333442525','hoteles_colinas_mex@gmail.com'),
(29,'Hoteles Colinas','Argentina','Avenida Martin Fierro3900','C5152','541421312','hoteles_colinas_arg@gmail.com'),
(46,'Damian Hugo','Sierra','Los Lapachos 123','55672','60001220','dami_hu@gmail.com'),
(47,'Bruna','Stroch','Street 17','C1231','63121311','bruna_str@outlook');

-- ------------------
-- TABLA clientes
-- ------------------
INSERT INTO clientes VALUES 
(1,'2019-02-01',9,42,3,'AA0005676'),
(2,'2020-01-15',16,42,3,'ZBC100022'),
(3,'2022-11-08',8,28,3,'WFJ882990'),
(4,'2022-03-27',13,64,3,'KWI340023'),
(5,'2021-04-19',22,5,3,'ZTR341111'),
(6,'2019-05-04',12,62,3,'KJ2000112'),
(7,'2019-02-01',20,12,3,'IAE234240'),
(8,'2022-08-11',24,5,3,'QKA122200'),
(9,'2021-01-15',4,13,3,'JYZ678119'),
(10,'2019-07-07',19,1,3,'TRA233000'),
(11,'2022-09-05',11,6,2,'34532422');

-- ------------------
-- TABLA hoteles
-- ------------------
INSERT INTO hoteles VALUES
(1,'https://www.hotelescolinas.com',26,28),
(2,'https://www.hotelescolinas.com',27,12),
(3,'https://www.hotelescolinas.com',28,42),
(4,'https://www.hotelescolinas.com',29,5);

-- ------------------
-- TABLA promociones
-- ------------------
INSERT INTO promociones VALUES 
(1,'2019-01-01','2019-03-20',20),
(2,'2019-03-21','2019-06-20',45),
(3,'2019-06-21','2019-09-20',30),
(4,'2019-09-21','2019-12-20',25),
(5,'2019-12-21','2019-12-31',10),
(6,'2020-01-01','2020-03-20',5),
(7,'2020-03-21','2020-06-20',20),
(8,'2020-06-21','2020-09-20',10),
(9,'2020-09-21','2020-12-20',10),
(10,'2020-12-21','2020-12-31',20),
(11,'2021-01-01','2021-03-20',20),
(12,'2021-03-21','2021-06-20',45),
(13,'2021-06-21','2021-09-20',30),
(14,'2021-09-21','2021-12-20',25),
(15,'2021-12-21','2021-12-31',15),
(16,'2022-01-01','2022-03-20',10),
(17,'2022-03-21','2022-06-20',35),
(18,'2022-06-21','2022-09-20',20),
(19,'2022-09-21','2022-12-20',15),
(20,'2022-12-21','2022-12-31',5);

-- ----------------------------------
-- TABLA tipos_habitaciones
-- ----------------------------------
INSERT INTO tipos_habitaciones VALUES 
(1,'Individual',250.00,17),
(2,'Matrimonial',400.00,17),
(3,'Familiar',750.00,17),
(4,'Suit',1000.00,17);

-- ----------------------
-- TABLA habitaciones
-- ----------------------
INSERT INTO habitaciones VALUES
 (1,0,301,1,1,3,''),
 (2,0,201,1,1,2,''),
 (3,0,103,1,1,1,''),
 (4,0,202,2,2,2,''),
 (5,0,302,2,2,3,''),
 (6,0,106,2,2,1,''),
 (7,0,203,3,3,2,''),
 (8,0,108,3,3,1,''),
 (9,0,303,3,4,3,''),
 (10,0,304,3,4,3,''),
 (11,0,401,1,1,4,NULL),
 (12,0,402,2,2,4,NULL),
 (13,0,403,3,4,4,NULL);
 
-- ------------------
-- TABLA reservas
-- ------------------
INSERT INTO reservas VALUES 
(1,1,12,'2022-01-01 09:30:00','2022-01-20 08:30:00',19),
(2,2,6,'2022-03-12 10:00:00','2022-03-28 12:00:00',16),
(3,3,7,'2022-01-06 13:00:00','2022-01-16 12:00:00',10),
(4,5,10,'2022-02-14 20:00:00','2022-02-20 20:30:00',5),
(5,9,3,'2022-03-15 14:30:00','2022-04-15 13:00:00',31),
(6,8,4,'2022-03-26 14:30:00','2022-04-04 13:00:00',9),
(7,7,6,'2022-03-25 12:00:00','2022-04-01 13:00:00',7),
(8,1,7,'2022-03-13 14:30:00','2022-04-02 13:00:00',20),
(9,8,10,'2022-04-12 13:30:00','2022-05-01 12:30:00',19),
(10,5,3,'2022-03-06 17:00:00','2022-03-25 16:00:00',19),
(11,3,4,'2022-02-14 09:30:00','2022-02-25 08:30:00',11),
(12,1,13,'2022-04-15 12:30:00','2022-05-01 11:30:00',16),
(13,10,6,'2022-09-15 12:30:00','2022-10-01 11:30:00',16),
(14,7,12,'2022-05-20 10:00:00','2022-05-25 09:00:00',5);

-- ----------------------
-- TABLA tipos_pagos
-- ----------------------
INSERT INTO tipos_pagos VALUES 
(1,'Efectivo'),
(2,'Tarjeta Debito'),
(3,'Tarjeta Credito'),
(4,'Cheque'),
(5,'Transferencia');

-- ------------------
-- TABLA facturas
-- ------------------
INSERT INTO facturas VALUES 
(1,'2022-01-01',1,6840.00,'dolar',3),
(2,'2022-03-12',2,5760.00,'dolar',1),
(3,'2022-01-06',3,6750.00,'dolar',4),
(4,'2022-02-14',4,3250.00,'dolar',3),
(5,'2022-03-15',5,6975.00,'dolar',5),
(6,'2022-03-26',6,2340.00,'dolar',3),
(7,'2022-03-25',7,1820.00,'dolar',2),
(8,'2022-03-13',8,13500.00,'dolar',4),
(9,'2022-04-12',9,12350.00,'dolar',3),
(10,'2022-03-06',10,4275.00,'dolar',5),
(11,'2022-02-14',11,3960.00,'dolar',2),
(12,'2022-04-15',12,10400.00,'dolar',4),
(13,'2022-09-15',13,5120.00,'dolar',1),
(14,'2022-05-20',14,1300.00,'dolar',5);

-- ------------------
-- TABLA jornada
-- ------------------
INSERT INTO jornadas VALUES
(1,'0008-00-00','2014-00-00','Diurna A'),
(2,'2014-00-00','2020-00-00','Diurna B'),
(3,'2020-00-00','0002-00-00','Nocturna'),
(4,'0002-00-00','0008-00-00','Mixta');

-- ------------------
-- TABLA sectores
-- ------------------
INSERT INTO sectores VALUES
(1,'Conserjeria','Recibir al huesped y guiarle por dentro del establecimiento'),
(2,'Recepcion','Gestionar las reservas formalizar las entradas y salidas atender la seguridad de los clientes e informar'),
(3,'Limpieza','Mantener en perfecto estado de higiene y orden las habitaciones'),
(4,'Servicio de habitaciones','Llevar a las habitaciones lo mas rapidamente posible la comida solicitada al restaurante o cualquier otro recado prioritario para el huesped'),
(5,'Cocina','Realizar los disitintos menus del Hotel'),
(6,'Direccion general','Responsable  que todas las actividades del hotel funcionen como gestionar los sueldos de los empleados'),
(7,'Mantenimiento','Gestionar el corrector mantenimiento de los hoteles'),
(8,'Administracion','Gestionar todo los asutos sobre la administracion de los hoteles');

-- ------------------
-- TABLA empleados
-- ------------------
 INSERT INTO empleados VALUES
 (1,'2019-01-01',5,28,1,'34546578','1994-04-18',1,1,10500.00,1),
 (2,'2019-01-01',6,5,1,'32432223','1987-03-31',2,2,12500.00,4),
 (3,'2020-05-25',7,42,1,'34344234','1973-11-05',3,3,10500.00,3),
 (6,'2022-02-02',14,5,1,'35673442','1976-05-18',6,3,10500.00,4),
 (8,'2019-03-02',17,42,1,'31090901','1996-11-15',8,3,11500.00,3),
 (9,'2022-07-07',1,42,1,'33131215','1993-01-15',4,2,10650.00,2),
 (11,'2022-03-01',18,12,2,'JKE3333WW','1994-06-01',8,1,10500.00,2),
 (12,'2019-10-05',20,106,2,'SUN2E3WEY','1994-06-01',1,3,10500.00,1),
 (13,'2021-06-10',13,10,2,'CHI42E3CHU','1994-06-01',3,3,50000.00,4),
 (16,'2022-05-16',47,160,2,'JK3123111','2000-11-09',7,2,15000.00,3);

-- --------------------------------
-- TABLA log_empleados_eliminados
-- --------------------------------
 INSERT INTO log_empleados_eliminados VALUES (1,7,'2021-05-01',15,'2022-04-14 13:12:13','root@localhost');
 
 -- --------------------------------
-- TABLA pagos_empleados
-- --------------------------------
 INSERT INTO pagos_empleados VALUES 
 (1,1,1,1,1,10500.00),
 (2,4,2,2,2,12500.00),
 (3,3,3,3,3,10500.00),
 (4,4,6,3,6,10500.00),
 (5,3,8,3,8,11500.00),
 (6,2,4,2,9,10650.00),
 (7,2,8,1,11,10500.00),
 (8,1,1,3,12,10500.00),
 (9,4,3,3,13,50000.00),
 (10,3,7,2,16,15000.00);
 
 -- --------------------------------
-- TABLA pagos_reservas
-- --------------------------------
 INSERT INTO pagos_reservas VALUES  
(1,4,1,1,16,1,7600.00,6840.00),
(2,1,2,2,16,2,6400.00,5760.00),
(3,2,3,3,16,3,7500.00,6750.00),
(4,3,5,4,16,4,5000.00,3250.00),
(5,1,9,5,16,5,7750.00,6975.00),
(6,2,8,6,17,6,3600.00,2340.00),
(7,1,7,7,17,7,2800.00,1820.00),
(8,2,1,8,16,8,15000.00,13500.00),
(9,3,8,9,17,9,19000.00,12350.00),
(10,1,5,10,16,10,4750.00,4275.00),
(11,2,3,11,16,11,4400.00,3960.00),
(12,4,1,12,17,12,16000.00,10400.00),
(13,1,10,13,18,13,6400.00,5120.00),
(14,4,7,14,17,14,2000.00,1300.00);

-- --------------------------------------------------------------------
-- FUNCTIONS
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- CREACION DE FUNCIONES
-- --------------------------------------------------------------------
-- -------------------------------------------------
-- FUNCION fun_cantidad_dias
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************
Esta función realiza el cálculo entre fecha_desde y fecha_hasta para saber 
la cantidad de días que se va a hospedar un cliente.
Esta función es implementada en la tabla reservas y en la vista reservas_info
 en la columna de cantidad_dias.
**************************************************************************************/

DELIMITER $$
CREATE FUNCTION fun_cantidad_dias(fecha_desde DATE, fecha_hasta DATE) RETURNS INT
    READS SQL DATA
BEGIN
    DECLARE cant_dias INT;

    SET cant_dias = (SELECT timestampdiff(DAY, fecha_desde, fecha_hasta) FROM DUAL);
    
    RETURN cant_dias;
END$$
DELIMITER ;

-- -------------------------------------------------
-- FUNCION fun_cuantos_anios
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************
Esta función calcula la edad de cada empleado tomando como parámetro de entrada
 la fecha de nacimiento y la fecha actual devolviendo la edad del empleado.
Esta función es empleada en la vista empleados_info_personal
**************************************************************************************/
DELIMITER $$
CREATE FUNCTION fun_cuantos_anios(fecha_nacimiento DATE) RETURNS INT
    READS SQL DATA
BEGIN
   DECLARE edad INT;
   DECLARE fecha_actual DATE;
   SET fecha_actual = NOW();
   SET edad = (SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento, fecha_actual) FROM DUAL);
   RETURN edad;
   
END$$
DELIMITER ;
-- -------------------------------------------------
-- FUNCION fun_es_cumpleanios
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************
La función es_cumpleanios toma como parámentro de entrada la fecha de nacimiento, 
luego compara si la fecha ingresada coincide con la fecha actual para indicar 
mediante un booleano si es el cumpleanios devolviendo “1” o 
si no es el cumpleanios devolviendo “0”.
La función es implementada en la vista empleados_info_personal 
para saber si es el cumpleanios de un empleado.
**************************************************************************************/
DELIMITER $$
CREATE FUNCTION fun_es_cumpleanios(fecha_nacimiento DATE) RETURNS TINYINT(1)
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
END $$
DELIMITER ;

-- -------------------------------------------------
-- FUNCION fun_insert_nombre_cliente
-- --------------------------------------------------
-- DESCRIPCION 
/**********************************************************************************************************
Esta función toma como parámetro de entrada el ID de un cliente y 
luego devuelve el nombre y el apellido del mismo.
Esta función se utiliza en las vistas de empleado_info_personal, empleados_info y reservas_info.
Esta función fue creada como su nombre lo indica insertar el nombre y el apellido
 concatenados de los clientes ya que estos datos se encuentran en una tabla llamada
 contactos y no está en la misma tabla de clientes
***********************************************************************************************************/
DELIMITER $$
CREATE FUNCTION fun_insert_nombre_cliente(cliente_id INT) RETURNS VARCHAR(40) 
    READS SQL DATA
BEGIN
    DECLARE nombre_cliente VARCHAR(40);
    SET nombre_cliente= (SELECT CONCAT_WS(' ', co.nombre, co.apellido) AS NOMBRE_CLIENTE 
                         FROM clientes cl, contactos co
                         WHERE cl.contacto = co.contacto_id
                         AND cl.cliente_id = cliente_id);
                         
	RETURN nombre_cliente;
END $$
DELIMITER ;

-- -------------------------------------------------
-- FUNCION fun_insert_nombre_hotel
-- --------------------------------------------------
-- DESCRIPCION 
/**********************************************************************************************************
Esta función toma como parámetro de entrada el ID de un hotel y luego devuelve el completo del hotel.
Esta función se utiliza en las vistas de hotel_info_cantidad_empleados, habitaciones_precio_final,
 empleados_info, empleados_info_personal, reserva_info
Esta función fue creada como su nombre indica insertar el nombre completo de los hoteles.
***********************************************************************************************************/
DELIMITER $$
CREATE FUNCTION fun_insert_nombre_hotel(hotel_id INT) RETURNS VARCHAR(40) 
    READS SQL DATA
BEGIN
    DECLARE nombre_hotel VARCHAR(40);
    SET nombre_hotel = (SELECT CONCAT_WS(' ', co.nombre, co.apellido) AS HOTEL 
                         FROM hoteles h, contactos co
                         WHERE h.contacto = co.contacto_id
                         AND h.hotel_id = hotel_id);
                         
	RETURN nombre_hotel;
END $$
DELIMITER ;

-- -------------------------------------------------
-- FUNCION fun_pago_total
-- --------------------------------------------------
-- DESCRIPCION 
/**********************************************************************************************************
La función fun_pago_total toma como parámetros el ID de una reserva, el ID de una habitación y
 una fecha para luego retornar el precio total a pagar de una reserva ya realizada.
El descuento es aplicado a la tarifa estándar de cada tipo de habitación(Individual, Matrimonial,
 Familiar, Suit) la cual dependiendo la fecha ingresada (Ej: ‘2022-05-10’) la función toma el
 descuento vigente de esa fecha(Ej: 35%)  y calcula el total a pagar de la reserva.
Esta función es usada el trigget ins_factura insertar el pago 
correcto en la tabla facturas de una reserva ya realizada.
***********************************************************************************************************/
DELIMITER $$
CREATE FUNCTION fun_pago_total(p_reserva INT, p_habitacion INT, p_fecha DATE) RETURNS DECIMAL(18,2)
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
END$$
DELIMITER ;

-- -------------------------------------------------
-- FUNCION fun_precio_final_habitacion
-- --------------------------------------------------
-- DESCRIPCION 
/**********************************************************************************************************
Esta función toma como variables de entrada el precio estándar del hotel y 
el descuento que se le aplica en base a la promoción vigente. 
La función retorna el precio final de las habitaciones.
Esta función se utiliza en la vista info_habitaciones.
***********************************************************************************************************/
DELIMITER $$
CREATE FUNCTION fun_precio_final_habitacion(precio DECIMAL(18,2), descuento FLOAT) RETURNS decimal(18,2)
    NO SQL
BEGIN
    DECLARE resultado DECIMAL(18,2);
    SET resultado = (precio - (precio * (descuento / 100)));
    RETURN resultado;    
END $$
DELIMITER ;

-- --------------------------------------------------------------------
-- STORED SPROCEDURE
-- --------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- CREACION DE STORED PROCEDURES
-- -----------------------------------------------------------------------

-- -------------------------------------------------
-- STORED PROCEDURE get_reservas
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************************
El procedimiento almacenado get_reservas() no toma ningún parámetro. 
Devuelve el ID de la reserva, el ID del cliente junto con su nombre completo, 
el ID del hotel,  junto con el nombre del hotel, el número, piso y tipo de habitación,
 la fecha de ingreso, la fecha de egreso y la cantidad de días del hospedaje.
*************************************************************************************************/
DELIMITER $$
CREATE PROCEDURE get_reservas()
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
   
END$$
DELIMITER ;

-- -------------------------------------------------
-- STORED PROCEDURE get_reservas_cliente
-- --------------------------------------------------
-- DESCRIPCION 
/********************************************************************************************
El procedimiento almacenado get_reservas toma como parámetro el ID de cliente,
 la fecha y hora desde y fecha y v. Devuelve el ID de la reserva, el ID del cliente
 junto con su nombre completo, el ID del hotel,  junto con el nombre del hotel,
 el número, piso y tipo de habitación, la fecha de ingreso, la fecha de egreso 
 y la cantidad de días del hospedaje.
*********************************************************************************************/
DELIMITER $$
CREATE PROCEDURE get_reservas_cliente(IN cliente_id INT)
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
    
END$$
DELIMITER ;

-- -------------------------------------------------
-- STORED PROCEDURE get_reservas_hotel
-- --------------------------------------------------
-- DESCRIPCION 
/********************************************************************************************
El procedimiento almacenado get_reservas_hotel toma el ID de un hotel 
como variable de entrada y devuelve el listado de los siguientes 
atributos: el  ID de la reserva, el ID del cliente junto con su nombre completo,
 el ID del hotel,  junto con el nombre del hotel, el número, piso 
 y tipo de habitación, la fecha de ingreso, la fecha de egreso
 y la cantidad de días del hospedaje.
**********************************************************************************************/
DELIMITER $$
CREATE PROCEDURE get_reservas_hotel(IN hotel_id INT)
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
    
END$$
DELIMITER ;

-- -------------------------------------------------
-- STORED PROCEDURE set_reserva
-- --------------------------------------------------
-- DESCRIPCION 
/**********************************************************************************************
El procedimiento almacenado set_reservas toma como parámetro el ID de cliente, 
la fecha y hora desde y fecha y v. Devuelve el ID de la reserva, el ID del cliente
 junto con su nombre completo, el ID del hotel,  junto con el nombre del hotel,
 el número, piso y tipo de habitación, la fecha de ingreso, 
 la fecha de egreso y la cantidad de días del hospedaje.
***********************************************************************************************/
DELIMITER $$
CREATE PROCEDURE set_reserva(IN p_cliente INT, IN p_habitacion INT, IN p_fecha_desde DATETIME, IN p_fecha_hasta DATETIME)
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
END $$
DELIMITER ;

-- --------------------------------------------------------------------
-- VIEWS
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
-- CREACION DE VISTAS
-- --------------------------------------------------------------------

-- ----------------------------------    
-- VISTA info_empleados
-- ----------------------------------
-- DESCRIPCION 
/*************************************************************************************************
Se muestra la cantidad de empleados y el total a pagar de los sueldos por mes  de cada hotel.
*************************************************************************************************/
CREATE VIEW info_empleados AS
    SELECT 
        CONCAT_WS(' ', co.nombre, co.apellido) AS nombre_completo,
        td.nombre AS tipo_documento,
        e.num_documento AS num_documento,
        co.telefono AS telefono,
        co.email AS email,
        s.nombre AS sector,
        j.nombre AS jornada,
        e.salario AS salario,
        FUN_INSERT_NOMBRE_HOTEL(e.hotel) AS hotel
    FROM empleados e, contactos co, tipos_documentos td, sectores s, jornadas j
    WHERE co.contacto_id = e.contacto
	AND td.tipo_doc_id = e.tipo_documento
	AND s.sector_id = e.sector
	AND j.jornada_id = e.jornada
    ORDER BY CONCAT_WS(' ', co.nombre, co.apellido);
    
-- ----------------------------------
-- VISTA info_clientes
-- ----------------------------------
-- DESCRIPCION 
/*************************************************************************************************
Se muestra toda la información imprescindible  de los clientes de los hoteles.
*************************************************************************************************/
CREATE VIEW info_clientes AS
    SELECT 
        CONCAT_WS(' ', co.nombre, co.apellido) AS nombre_completo,
        t.nombre AS tipo_documento,
        cl.num_documento AS num_documento,
        co.telefono AS telefono,
        co.email AS email,
        co.direccion AS direccion,
        co.codigo_postal AS codigo_postal,
        p.nombre AS pais
    FROM clientes cl
	INNER JOIN contactos co ON cl.contacto = co.contacto_id
    INNER JOIN tipos_documentos t ON cl.tipo_documento = t.tipo_doc_id
	INNER JOIN paises p ON cl.pais = p.pais_id
    ORDER BY cl.cliente_id;
    
-- ----------------------------------    
-- VISTAS info_facturas
-- ----------------------------------
-- DESCRIPCION 
/*************************************************************************************************
En esta vista se muestra toda la información que requiere la impresión de una factura.
También se muestra el monto total del pago de cada reserva así como la promoción 
aplicada de acuerdo a la fecha que se realizó la reserva.

*************************************************************************************************/
CREATE VIEW info_facturas AS
    SELECT 
        FUN_INSERT_NOMBRE_CLIENTE(r.cliente) AS nombre_cliente,
        t_doc.nombre AS tipo_doc,
        cl.num_documento AS num_doc,
        co.telefono AS telefono_cliente,
        co.email AS email_cliente,
        f.fecha_emitida AS fecha_emitida,
        FUN_INSERT_NOMBRE_HOTEL(h.hotel) AS hotel,
        h.num_habitacion AS num_habitacion,
        th.nombre AS tipo_habitacion,
        th.tarifa_estandar AS tarifa_estandar,
        CONCAT('-', (SELECT p.descuento FROM promociones p WHERE r.fecha_desde  BETWEEN p.fecha_desde AND p.fecha_hasta), '%') AS descuento,
        FUN_PRECIO_FINAL_HABITACION(th.tarifa_estandar,(SELECT p.descuento FROM promociones p WHERE r.fecha_desde BETWEEN p.fecha_desde AND p.fecha_hasta)) AS precio_con_descuento,
        r.cantidad_dias AS cantidad_dias,
        FUN_PAGO_TOTAL(r.reserva_id, r.habitacion, r.fecha_desde) AS pago_total,
        tp.pago AS tipo_pago,
        f.moneda AS moneda
    FROM facturas f
	INNER JOIN reservas r ON r.reserva_id = f.reserva
	INNER JOIN clientes cl ON cl.cliente_id = r.cliente
	INNER JOIN tipos_documentos t_doc ON t_doc.tipo_doc_id = cl.tipo_documento
	INNER JOIN contactos co ON co.contacto_id = cl.contacto
	INNER JOIN habitaciones h ON h.habitacion_id = r.habitacion
	INNER JOIN tipos_habitaciones th ON th.tipo_habitacion_id = h.tipo_habitacion
	INNER JOIN promociones p ON p.promocion_id = th.promocion
	INNER JOIN tipos_pagos tp ON tp.tipo_pago_id = f.tipo_pago
    ORDER BY f.factura_id DESC;
    
-- ----------------------------------    
-- VISTAS info_habitaciones
-- ----------------------------------
-- DESCRIPCION 
/*************************************************************************************************
En esta vista se muestra la información para saber 
el precio de  las habitaciones de cada hotel junto con la vigencia de cada promoción.
*************************************************************************************************/
CREATE VIEW info_habitaciones AS SELECT 
        FUN_INSERT_NOMBRE_HOTEL(h.hotel) AS hotel,
        h.num_habitacion AS num_habitacion,
        t.nombre AS tipo_habitacion,
        t.tarifa_estandar AS precio_estandar,
        p.descuento AS descuento,
        ROUND(FUN_PRECIO_FINAL_HABITACION(t.tarifa_estandar, p.descuento),2) AS precio_final,
        p.fecha_desde AS inicio_promo,
        p.fecha_hasta AS fin_promo
    FROM habitaciones h, tipos_habitaciones t, promociones p
    WHERE h.tipo_habitacion = t.tipo_habitacion_id
	AND p.promocion_id = t.promocion
    ORDER BY h.num_habitacion;
-- ----------------------------------   
-- VISTAS info_hoteles
-- ----------------------------------
-- DESCRIPCION 
/*************************************************************************************************
Se muestra la cantidad de empleados y el total a pagar de los sueldos por mes  de cada hotel.
*************************************************************************************************/
CREATE  
VIEW info_hoteles AS
    SELECT 
        FUN_INSERT_NOMBRE_HOTEL(e.hotel) AS hotel,
        COUNT(1) AS cantidad_empleados,
        SUM(e.salario) AS pago_total_salarios
    FROM empleados e 
    GROUP BY e.hotel
    ORDER BY cantidad_empleados;

-- ------------------------------------------    
-- VISTA info_perosonal_de_empleado
-- -----------------------------------------
-- DESCRIPCION 
/*************************************************************************************************
En esta vista se muestra la información personal de los empleados como nombre completo, 
tipo de documento, número de documento, teléfono, email, dirección, nacionalidad, 
fecha de nacimiento, edad del empleado, también cuenta con una columna que muestra “0”
 si no es el cumpleaños ó ”1”  si es el cumpleaños junto al hotel que trabaja cada empleado.
*************************************************************************************************/
CREATE  VIEW info_personal_de_empleados AS
    SELECT 
        CONCAT_WS(' ', co.nombre, co.apellido) AS nombre_completo,
        td.nombre AS tipo_documento,
        e.num_documento AS num_documento,
        co.telefono AS telefono,
        co.email AS email,
        co.direccion AS direccion,
        p.nombre AS nacionalidad,
        e.fecha_nacimiento AS fecha_nacimiento,
        FUN_CUANTOS_ANIOS(e.fecha_nacimiento) AS edad,
        FUN_ES_CUMPLEANIOS(e.fecha_nacimiento) AS cumpleanios,
        FUN_INSERT_NOMBRE_HOTEL(e.hotel) AS hotel
    FROM empleados e, contactos co, tipos_documentos td, paises p
    WHERE e.contacto = co.contacto_id
	AND e.tipo_documento = td.tipo_doc_id
	AND e.pais = p.pais_id;
    
-- ----------------------------------    
-- VISTA info_reservas
-- ----------------------------------
-- DESCRIPCION 
/*************************************************************************************************
En esta vista se muestra toda la información de las reservas de cada cliente en cada hotel,
 mostrando el tipo de habitación, número de habitación, piso de habitación,
 la fecha de ingreso y de fecha de egreso, a su vez la cantidad de días de hospedaje.
*************************************************************************************************/
CREATE VIEW info_reservas AS
    SELECT 
        FUN_INSERT_NOMBRE_CLIENTE(r.cliente) AS nombre_completo,
        FUN_INSERT_NOMBRE_HOTEL(hns.hotel) AS hotel,
        th.nombre AS tipo_habitacion,
        hns.num_habitacion AS num_habitacion,
        hns.piso_habitacion AS piso_habitacion,
        r.fecha_desde AS fecha_desde,
        r.fecha_hasta AS fecha_hasta,
        r.cantidad_dias AS cantidad_dias
    FROM reservas r, clientes cl, habitaciones hns, tipos_habitaciones th 
    WHERE r.cliente = cl.cliente_id
    AND hns.habitacion_id = r.habitacion
    AND th.tipo_habitacion_id = hns.tipo_habitacion
    ORDER BY r.reserva_id;

-- ----------------------------------    
-- VISTA info_tipos_habitaciones
-- ----------------------------------
-- DESCRIPCION 
/*************************************************************************************************
En esta vista se muestra la información de los tipo de habitación como el precio estándar, 
el descuento que se le aplica, el precio final de cada tipo de habitación
 y junto a la vigencia de cada promoción.
*************************************************************************************************/
CREATE VIEW info_tipos_habitaciones AS
    SELECT 
        info_habitaciones.tipo_habitacion AS tipo_habitacion,
        GROUP_CONCAT(DISTINCT info_habitaciones.num_habitacion ORDER BY info_habitaciones.num_habitacion ASC SEPARATOR ' - ') AS num_habitaciones,
        info_habitaciones.precio_estandar AS precio_estandar,
        info_habitaciones.descuento AS descuento,
        info_habitaciones.precio_final AS precio_final,
        info_habitaciones.inicio_promo AS inicio_promo,
        info_habitaciones.fin_promo AS fin_promo
    FROM info_habitaciones
    GROUP BY info_habitaciones.tipo_habitacion;

-- --------------------------------------------------------------------
-- TRIGGERS
-- --------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- CREACION DE TRIGGERS
-- -----------------------------------------------------------------------

-- --------------------------------------------------
-- TABLA reservas
-- TRIGGERS ins_factura AFTER INSERT
-- --------------------------------------------------
DELIMITER $$
CREATE TRIGGER ins_factura AFTER INSERT ON reservas FOR EACH ROW BEGIN
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
    
END$$
DELIMITER ;
-- --------------------------------------------------
-- TABLA empleados
-- TRIGGERS ins_pagos_empleados AFTER INSERT
-- --------------------------------------------------
DELIMITER $$
CREATE TRIGGER ins_pagos_empleados AFTER INSERT ON empleados FOR EACH ROW BEGIN
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
END$$
DELIMITER ;
-- --------------------------------------------------
-- TABLA empleados
-- TRIGGERS upd_salario_empleados BEFORE UPDATE
-- --------------------------------------------------
DELIMITER $$
CREATE TRIGGER upd_salario_empleados BEFORE UPDATE ON empleados FOR EACH ROW BEGIN
    DECLARE max_salario DECIMAL(18,2);
    DECLARE salario_tope DECIMAL(18,2);
    SELECT MAX(salario) INTO max_salario FROM empleados;
    SET salario_tope = max_salario + (max_salario * 0.45);
	IF NEW.salario < OLD.salario THEN
		SET NEW.salario = OLD.salario;
	ELSEIF NEW.salario > salario_tope THEN
        SET NEW.salario = OLD.salario + (OLD.salario * 0.15);
	END IF;
END$$
DELIMITER ;
-- --------------------------------------------------
-- TABLA empleados
-- TRIGGERS  del_empleados BEFORE DELETE
-- --------------------------------------------------
DELIMITER $$
CREATE  TRIGGER del_empleados BEFORE DELETE ON empleados FOR EACH ROW BEGIN
  DECLARE t_fecha_hora DATETIME;
  DECLARE t_usuario VARCHAR(45);
  
  SET t_fecha_hora = (SELECT CURRENT_TIMESTAMP());
  SET t_usuario = (SELECT USER());
  
  INSERT INTO log_empleados_eliminados(empleado, fecha_alta,  contacto_empleado, fecha_hora, usuario)
  VALUES(OLD.empleado_id, OLD.fecha_alta, OLD.contacto , t_fecha_hora, t_usuario);
  
END$$
DELIMITER ;