/* Crear vista para mostrar el precio medio de Productos por Categoria
Nombre: Ivonne Mendoza
mail: ivonne@imendoza.io
*/


USE COMPRAS;

-- DROP VIEW SI YA EXISTE
DROP VIEW IF EXISTS VW_PRECIO_CATEGORIAS;

-- CREA LA VISTA
CREATE VIEW VW_PRECIO_CATEGORIAS AS 
SELECT
	c.idCategoria
	, c.nombre as nombre_categoria
	, c.descripcion
	, COUNT(p.idProducto) as cantidad_productos
	, AVG(p.precioUnitario) as precio_medio
	, MIN(p.precioUnitario) as precio_minimo
	, MAX(p.precioUnitario) as precio_maximo
	, SUM(p.precioUnitario) as precio_total
FROM
	CATEGORIA c 
	LEFT JOIN PRODUCTO p ON c.idCategoria = p.idCategoria
GROUP BY
	c.idCategoria, c.nombre, c.descripcion
ORDER BY 
	precio_medio DESC;
	

	
-- COMPROBACION
	
SELECT * FROM VW_PRECIO_CATEGORIAS;

