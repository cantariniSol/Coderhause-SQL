-- --------------------------------------------------------------------
-- STORED SPROCEDURE
-- --------------------------------------------------------------------

-- USO DE LA BASE DE DATOS hoteles_colinas
USE hoteles_colinas;
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
