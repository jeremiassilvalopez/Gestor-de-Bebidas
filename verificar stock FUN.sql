CREATE DEFINER=`root`@`localhost` FUNCTION `verificar_stock`(id_bebida INT) 
RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE stock INT;
    
    -- Obtener el stock actual de la bebida
    SELECT cantBebidas INTO stock
    FROM bebidas
    WHERE idBebidas = id_bebida;
    
    RETURN stock;
    END