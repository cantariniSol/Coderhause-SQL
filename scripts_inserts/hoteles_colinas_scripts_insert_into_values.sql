-- --------------------------------------------------------------------
-- INSERTS INTO
-- --------------------------------------------------------------------

-- USO DE LA BASE DE DATOS hoteles_colinas
USE hoteles_colinas;
-- -----------------------------------------------------------------------
-- INSERCION DE DATOS EN LAS TABLAS DE LA BASE DE DATOS hoteles_colinas
-- -----------------------------------------------------------------------

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