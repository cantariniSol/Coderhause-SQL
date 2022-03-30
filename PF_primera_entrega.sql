CREATE DATABASE hoteles_colinas;
USE hoteles_colinas;

-- ### 1. CONTINENTES
CREATE TABLE continentes(
continente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL);

 -- ### 2. PAÍSES
CREATE TABLE paises(
pais_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
continente INT NOT NULL,
FOREIGN KEY(continente) REFERENCES continentes(continente_id));

-- ### 3. TIPOS DE DOCUMENTOS
CREATE TABLE tipos_documentos(
tipo_doc_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(40));

-- ### 4. CONTACTOS
CREATE TABLE contactos(
contacto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30),
direccion VARCHAR(40),
codigo_postal VARCHAR(10),
telefono VARCHAR(15) NOT NULL,
email VARCHAR(40) NOT NULL);

-- ### 5. TIPOS DE PAGOS
CREATE TABLE tipos_pagos(
tipo_pago_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pago VARCHAR(20) NOT NULL);

-- ### 6. FACTURAS
CREATE TABLE facturas(
factura_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATETIME,
tipo_pago INT NOT NULL,
importe DECIMAL(18,2) NOT NULL,
detalle VARCHAR(150),
moneda VARCHAR(15),
nombre_banco VARCHAR(30),
num_tarjeta VARCHAR(16), 
nom_prop_tarjeta VARCHAR(60), 
FOREIGN KEY(tipo_pago) REFERENCES tipos_pagos(tipo_pago_id));

-- ### 7. CLIENTES
CREATE TABLE clientes(
cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_alta DATE NOT NULL,
contacto INT NOT NULL,
pais INT NOT NULL,
tipo_documento INT NOT NULL,
num_documento VARCHAR(15) NOT NULL,
factura INT NOT NULL,
FOREIGN KEY(pais) REFERENCES paises(pais_id),
FOREIGN KEY(contacto) REFERENCES contactos(contacto_id),
FOREIGN KEY(tipo_documento) REFERENCES tipos_documentos(tipo_doc_id),
FOREIGN KEY(factura) REFERENCES facturas(factura_id));

-- ### 8. HOTELES
CREATE TABLE hoteles(
hotel_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
url VARCHAR(50) NOT NULL,
contacto INT NOT NULL,
pais INT NOT NULL,
FOREIGN KEY(contacto) REFERENCES contactos(contacto_id),
FOREIGN KEY(pais) REFERENCES paises(pais_id));

-- ### 9. PROMOCIONES
CREATE TABLE promociones(
promocion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_desde DATE,
fecha_hasta DATE,
descuento FLOAT NOT NULL );

-- ### 10. TIPOS DE HABITACIONES
CREATE TABLE tipos_habitaciones(
tipo_habitacion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
tarifa_estandar DECIMAL(18,2) NOT NULL,
promocion INT NOT NULL,
FOREIGN KEY(promocion) REFERENCES promociones(promocion_id));

-- ### 11. HABITACIONES
CREATE TABLE habitaciones(
habitacion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
estado TINYINT(1) NOT NULL DEFAULT '0',
tipo_habitacion INT NOT NULL,
num_habitacion INT NOT NULL,
piso_habitacion INT NOT NULL,
descripcion VARCHAR(150),
FOREIGN KEY(tipo_habitacion) REFERENCES tipos_habitaciones(tipo_habitacion_id));

-- ### 12. RESERVAS
CREATE TABLE reservas(
reserva_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cliente INT NOT NULL,
habitacion INT NOT NULL,
fecha_desde DATETIME NOT NULL,
fecha_hasta DATETIME NOT NULL,
hotel INT NOT NULL,
FOREIGN KEY(cliente) REFERENCES clientes(cliente_id),
FOREIGN KEY(habitacion) REFERENCES habitaciones(habitacion_id),
FOREIGN KEY(hotel) REFERENCES hoteles(hotel_id));

-- ### 13. SECTORES
CREATE TABLE sectores(
sector_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(170));

-- ### 14. JORNADAS
CREATE TABLE jornadas(
jornada_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
horario_inicio DATE NOT NULL,
horario_fin DATE NOT NULL,
nombre VARCHAR(15) NOT NULL);
 
-- ### 15. EMPLEADOS
CREATE TABLE empleados(
empleado_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_alta DATE NOT NULL,
contacto INT NOT NULL, 
pais INT NOT NULL, 
tipo_documento INT NOT NULL, 
num_documento VARCHAR(15) NOT NULL,
fecha_nacimiento DATE,
sector INT NOT NULL, 
jornada INT NOT NULL, 
salario DECIMAL(18,2) NOT NULL,
hotel INT NOT NULL, 
FOREIGN KEY(contacto) REFERENCES contactos(contacto_id),
FOREIGN KEY(pais) REFERENCES paises(pais_id),
FOREIGN KEY(tipo_documento) REFERENCES tipos_documentos(tipo_doc_id),
FOREIGN KEY(sector) REFERENCES sectores(sector_id),
FOREIGN KEY(hotel) REFERENCES hoteles(hotel_id));

