SELECT 
	st_distance(st_transform(c.geom, 31982), st_transform(v.geom, 31982)) AS distancia
FROM
	caminhos as c, vegetacao as v
WHERE c.cod = 1 AND v.cod = 1;

--------------------------------------------------------------------------------------------------

SELECT
	st_area(st_transform(geom, 31982)) AS metros
FROM
	restaurante 
WHERE cod = 1;

--------------------------------------------------------------------------------------------------

SELECT 
	st_length(st_transform(geom, 31982)) 
FROM 
	caminhos 
WHERE cod = 1;

--------------------------------------------------------------------------------------------------














