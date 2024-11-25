CREATE DEFINER=`root`@`localhost` TRIGGER `insertar_recibo` AFTER INSERT ON `compra` FOR EACH ROW BEGIN
    -- Insertar un nuevo recibo al registrar una compra
    INSERT INTO recibo (tipoRecibo)
    VALUES ('Recibo Impreso');  -- Puedes ajustar el tipo de recibo según tus necesidades
END