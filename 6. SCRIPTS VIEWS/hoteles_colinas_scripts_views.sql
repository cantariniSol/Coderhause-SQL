-- --------------------------------------------------------------------
-- VIEWS
-- --------------------------------------------------------------------

-- USO DE LA BASE DE DATOS hoteles_colinas
USE hoteles_colinas;

-- -----------------------------------------------------------------------
-- CREACION DE VISTAS
-- -----------------------------------------------------------------------

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