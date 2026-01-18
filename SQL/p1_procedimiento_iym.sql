/* Crear procedimiento ALMACENADO para mostrar el precio medio de Productos por Categoria
Nombre: Ivonne Mendoza
mail: ivonne@imendoza.io
*/




USE COMPRAS;

DELIMITER //

DROP PROCEDURE IF EXISTS PA_VERIFICAR_PRODUCTOS //

CREATE PROCEDURE PA_VERIFICAR_PRODUCTOS (IN p_idFactura INT)
BEGIN
	DECLARE total_productos INT DEFAULT 0;
	DECLARE resultado VARCHAR(50);
	
	-- Calcular el total de productos vendidos en la factura
	SELECT SUM(cantidad) INTO total_productos
	FROM DETALLE_FACTURA
	WHERE idFactura = p_idFactura;
	
	-- Verificar si la factura existe
	IF total_productos IS NULL THEN
		SET resultado = 'La factura no existe o no tiene productos';
	ELSE
		-- Determinar si es 3, más de 3 o menos de 3
		IF total_productos = 3 THEN
			SET resultado = 'Se vendieron exactamente 3 productos';
		ELSEIF total_productos > 3 THEN
			SET resultado = CONCAT('Se vendieron más de 3 productos (Total: ', total_productos, ')');
		ELSE
			SET resultado = CONCAT('Se vendieron menos de 3 productos (Total: ', total_productos, ')');
		END IF;
	END IF;
	
	-- Mostrar el resultado
	SELECT 
		p_idFactura AS idFactura,
		COALESCE(total_productos, 0) AS total_productos,
		Resultado AS resultado;
END //

DELIMITER ;


CALL PA_VERIFICAR_PRODUCTOS(1);