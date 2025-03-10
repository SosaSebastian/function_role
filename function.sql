use GAIT;

DELIMITER //

CREATE FUNCTION rol_usuario (id_usuario INT) 
RETURNS VARCHAR(500) 
DETERMINISTIC 
BEGIN
    DECLARE rol INT;
    DECLARE nombre_rol VARCHAR(45);
    DECLARE permisos TEXT;

    SELECT id_role INTO rol 
    FROM users 
    WHERE id = id_usuario;

    SELECT name INTO nombre_rol 
    FROM roles 
    WHERE id = rol;

    IF nombre_rol = 'Admin' THEN
        SET permisos = 'Crear usuario, crear pedido, generar pago, ver historial de pago, ver historial de pedidos, ver estado del pedido';
    ELSEIF nombre_rol = 'Moderador' THEN
        SET permisos = 'Crear pedido, generar pago, ver historial de pago, ver historial de pedidos, ver estado del pedido';
    ELSEIF nombre_rol = 'Viewer' THEN
        SET permisos = 'Ver historial de pago, ver historial de pedidos, ver estado del pedido';
    END IF;

    RETURN CONCAT('Rol: ', nombre_rol, ' - Permisos: ', permisos);
END //

DELIMITER ;

select gait.rol_usuario();

