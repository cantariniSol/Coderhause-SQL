-- --------------------------------------------------------------------
-- SELECT
-- --------------------------------------------------------------------

-- USO DE LA BASE DE DATOS hoteles_colinas
USE hoteles_colinas;
-- -----------------------------------------------------------------------
-- CONSULTAS A LAS TABLAS
-- -----------------------------------------------------------------------

-- -------------------------------------------------
-- SELECT A LA TABLA empleados
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************************
Seleccionamos los empleados el nombre y apellido de los empleados que trabajan 
en el sector de conserjería, recepción y limpieza
*************************************************************************************************/
SELECT e.empleado_id, concat_ws(' ', c.nombre, c.apellido) AS nombre_completo, s.nombre AS sector 
FROM empleados e, contactos c, sectores s
WHERE e.contacto = c.contacto_id
AND s.sector_id = e.sector
AND sector IN (1,2,3);

-- -------------------------------------------------
-- SUBCONSULTA A LA TABLA empleados
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************************
En la siguiente tabla se muestra los emepleados junto al  sector donde trabajan que tiene 
el salario mayor o igual  al promedio de los salarios en el sector de
Conserjeria, Recepcion, Servicio de habitaciones.
*************************************************************************************************/
SELECT concat_ws(' ', c.nombre, c.apellido) AS nombre,  s.nombre as sector, e.salario
FROM empleados e
INNER JOIN contactos c ON e.contacto = c.contacto_id
INNER JOIN sectores s ON e.sector = s.sector_id
WHERE salario >= (SELECT AVG(e.salario) FROM empleados e  WHERE e.sector IN(1,2,4));

-- -------------------------------------------------
-- SELECT A LA VISTA info_empleados
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************************
La siguiente vista nos muestra la cantidad de empleados por sector junto al listado de los nombres
y apellidos de los empleados que trabajan en cada sector.
*************************************************************************************************/
SELECT sector, count(*) AS cantidad , group_concat(nombre_completo SEPARATOR ' - ') as nombres 
FROM info_empleados
GROUP BY sector; 

-- DESCRIPCION 
/*************************************************************************************************
La siguiente vista nos muestra la cantidad de empleados por sector junto al listado de los nombres
y apellidos de los empleados que trabajan en cada sector y la suma total de los salarios por sector.
*************************************************************************************************/
SELECT sector, count(*) AS cantidad , group_concat(nombre_completo SEPARATOR ' || ') as nombres,
SUM(salario) as pago_total_salarios
FROM info_empleados GROUP BY sector;

-- -------------------------------------------------
-- SELECT A LA TABLA clientes
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************************
Clientes que no realizaron niguna reserva
*************************************************************************************************/
SELECT cl.cliente_id, concat_ws(' ', c.nombre, c.apellido) as nombre, r.reserva_id
FROM clientes cl
INNER JOIN contactos c ON cl.contacto = c.contacto_id
LEFT JOIN reservas r ON r.cliente = cl.cliente_id ORDER BY cl.cliente_id ASC;
-- CON SUBCONSULTA
SELECT cl.cliente_id, concat_ws(' ', c.nombre, c.apellido) as nombre
FROM clientes cl 
INNER JOIN contactos c ON cl.contacto = c.contacto_id	
WHERE cliente_id NOT IN (SELECT cliente FROM reservas);

-- -------------------------------------------------
-- SELECT A LA TABLA contactos
-- --------------------------------------------------
-- DESCRIPCION 
/*************************************************************************************************
Contactos que no son ni empleados ni clientes.
*************************************************************************************************/
SELECT co.contacto_id, concat_ws(' ', co.nombre, co.apellido) as nombre, cl.cliente_id, e.empleado_id
FROM contactos co 
LEFT JOIN clientes cl ON cl.contacto = co.contacto_id
LEFT JOIN empleados e ON e.contacto = co.contacto_id
WHERE cl.cliente_id IS NOT NULL OR e.empleado_id IS NOT NULL;

-- DESCRIPCION 
/*************************************************************************************************
Contactos que son clientes y empleados
*************************************************************************************************/
SELECT co.contacto_id, concat_ws(' ', co.nombre, co.apellido) as nombre, cl.cliente_id, e.empleado_id
FROM contactos co 
LEFT JOIN clientes cl ON cl.contacto = co.contacto_id
LEFT JOIN empleados e ON e.contacto = co.contacto_id
WHERE cl.cliente_id IS NOT NULL AND e.empleado_id IS NOT NULL;







