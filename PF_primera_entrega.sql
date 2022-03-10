CREATE DATABASE hoteles_colinas;
USE hoteles_colinas;

CREATE TABLE contactos(
contacto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45),
direccion VARCHAR(60),
codigo_posta VARCHAR(25),
telefono TINYINT(30) NOT NULL,
email VARCHAR(60) NOT NULL);

CREATE TABLE continentes(
continente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(15));

CREATE TABLE paises(
pais_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30),
continente INT NOT NULL,
FOREIGN KEY(continente) REFERENCES continentes(continente_id));

CREATE TABLE tipos_documentos(
tipo_doc_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- tipo documento id
nombre VARCHAR(30),
descripcion VARCHAR(50));

CREATE TABLE tipos_pagos(
tipo_pago_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pago ENUM("Efectivo", "Tarjeta Debito", "Tarjeta Credito", "Cheque", "Transferencia"));

CREATE TABLE facturas(
factura_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATETIME,
tipo_pago INT NOT NULL,
importe DECIMAL(18,2) NOT NULL,
detalle VARCHAR(300),
moneda VARCHAR(30),
nombre_banco VARCHAR(60),
num_tarjeta TINYINT, -- número de la tarjeta
nom_prop_tarjeta VARCHAR(60), -- nombre propietario de tarjeta
FOREIGN KEY(tipo_pago) REFERENCES tipos_pagos(tipo_pago_id));

CREATE TABLE clientes(
cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_alta DATE NOT NULL,
contacto INT NOT NULL,
pais INT NOT NULL,
tipo_documento INT NOT NULL,
num_documento TINYINT NOT NULL,
factura INT NOT NULL,
FOREIGN KEY(pais) REFERENCES paises(pais_id),
FOREIGN KEY(contacto) REFERENCES contactos(contacto_id),
FOREIGN KEY(tipo_documento) REFERENCES tipos_documentos(tipo_doc_id),
FOREIGN KEY(factura) REFERENCES facturas(factura_id));

CREATE TABLE promociones(
promocion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_desde DATETIME NOT NULL,
fecha_hasta DATETIME NOT NULL,
descuento FLOAT,
hotel INT NOT NULL);
ALTER TABLE promociones ADD FOREIGN KEY(hotel) REFERENCES hoteles(hotel_id);

CREATE TABLE tipos_habitaciones(
tipo_habitacion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tipo ENUM("Individual", "Matrimonial", "Familiar", "Suit") NOT NULL,
tarifa_estandar DECIMAL(18,2)  NOT NULL,
promocion INT NOT NULL,
FOREIGN KEY(promocion) REFERENCES promociones(promocion_id));

CREATE TABLE habitaciones(
habitacion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
estado BIT NOT NULL,
tipo_habitacion INT NOT NULL,
num_habitacion TINYINT NOT NULL,
piso_habitacion TINYINT NOT NULL,
descripcion VARCHAR(150),
FOREIGN KEY(tipo_habitacion) REFERENCES tipos_habitaciones(tipo_habitacion_id));

CREATE TABLE reservas(
reserva_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cliente INT NOT NULL,
habitacion INT NOT NULL,
fecha_desde DATETIME NOT NULL,
fecha_hasta DATETIME NOT NULL,
FOREIGN KEY(cliente) REFERENCES clientes(cliente_id),
FOREIGN KEY(habitacion) REFERENCES habitaciones(habitacion_id));

CREATE TABLE hoteles(
hotel_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
url VARCHAR(100) NOT NULL,
contacto INT NOT NULL,
pais INT NOT NULL,
reserva INT NOT NULL,
FOREIGN KEY(contacto) REFERENCES contactos(contacto_id),
FOREIGN KEY(pais) REFERENCES paises(pais_id),
FOREIGN KEY(reserva) REFERENCES reservas(reserva_id));

CREATE TABLE jornadas(
jornada_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
turno ENUM("Mañana", "Tarde", "Noche") NOT NULL,
horario_inicio DATETIME NOT NULL,
horario_fin DATETIME NOT NULL);

CREATE TABLE puestos(
puesto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(150));

CREATE TABLE empleados(
empleado_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_alta DATE NOT NULL,
contacto INT NOT NULL, 
pais INT NOT NULL, 
tipo_documento INT NOT NULL, 
num_documento TINYINT NOT NULL,
fecha_nacimiento DATE,
puesto INT NOT NULL, 
jornada INT NOT NULL, 
salario DECIMAL(18,2) NOT NULL,
hotel INT NOT NULL, 
FOREIGN KEY(contacto) REFERENCES contactos(contacto_id),
FOREIGN KEY(pais) REFERENCES paises(pais_id),
FOREIGN KEY(tipo_documento) REFERENCES tipos_documentos(tipo_doc_id),
FOREIGN KEY(puesto) REFERENCES puestos(puesto_id),
FOREIGN KEY(hotel) REFERENCES hoteles(hotel_id));

