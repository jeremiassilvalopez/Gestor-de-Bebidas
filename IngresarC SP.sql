CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresarC`(
    IN p_idCliente INT,
    IN p_idBebida INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE stock_actual INT;
    
    -- Verificar stock de la bebida
    SET stock_actual = verificar_stock(p_idBebida);
    
    -- Verificar si hay suficiente stock
    IF stock_actual >= p_cantidad THEN
        -- Insertar la compra en la tabla compra
        INSERT INTO compra (idCliente, idBebida, fecha, cantidad)
        VALUES (p_idCliente, p_idBebida, NOW(), p_cantidad);
        
        -- Actualizar el stock de la bebida
        UPDATE bebidas
        SET cantBebidas = cantBebidas - p_cantidad
        WHERE idBebidas = p_idBebida;
        
        SELECT 'Compra realizada con éxito.' AS mensaje;
    ELSE
        SELECT 'No hay suficiente stock disponible.' AS mensaje;
    END IF;
END