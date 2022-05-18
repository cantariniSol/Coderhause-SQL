-- --------------------------------------------------------------------
-- TRIGGERS
-- --------------------------------------------------------------------
-- USO DE LA BASE DE DATOS hoteles_colinas
USE hoteles_colinas;
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