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
DROP TABLE IF EXISTS continentes;
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
  num_habitacion INT DEFAULT NULL,
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