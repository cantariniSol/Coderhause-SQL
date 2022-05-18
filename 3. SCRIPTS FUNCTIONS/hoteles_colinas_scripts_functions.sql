-- --------------------------------------------------------------------
-- FUNCTIONS
-- --------------------------------------------------------------------

-- USO DE LA BASE DE DATOS hoteles_colinas
USE hoteles_colinas;
-- -----------------------------------------------------------------------
-- CREACION DE FUNCIONES
-- -----------------------------------------------------------------------

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