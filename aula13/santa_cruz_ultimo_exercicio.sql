-- importar extensao
CREATE EXTENSION postgis;

-- importando os dados shapefiles via PostGIS

-- visualizando dados
SELECT *
FROM bairro_santa_cruz;

SELECT *
FROM municipio_santa_cruz;

SELECT *
FROM farmacia_santa_cruz;

-- alterando as tabelas (removendo e renomeando colunas via interface gráfica)

-- consultas do exercicio:

-- 1. O nome do bairro e das farmácias existentes em cada
-- bairro. Utilize a função ST_CONTAINS.

SELECT f.nome,
	   b.nome

FROM farmacia_santa_cruz as f,
	 bairro_santa_cruz as b

WHERE f.geom && b.geom AND
	  st_contains(b.geom, f.geom);

-- 2. Calcule a área dos bairros e ordene o resultado em ordem
-- decrescente pela área.

SELECT nome, 
	   st_area(st_transform(geom, 31982))/1000000 AS area_total_km2

FROM bairro_santa_cruz

ORDER BY area_total_km2 DESC;

-- 3. Calcule a distância entre as farmácias. A consulta deverá
-- mostrar o código, o nome de cada farmácia com a
-- respectiva distância.

SELECT f1.cod,
	   f2.cod,
	   f1.nome,
	   f2.nome,
	   st_distance(st_transform(f1.geom,31982), st_transform(f2.geom,31982)) AS distancia

FROM farmacia_santa_cruz f1,
	 farmacia_santa_cruz f2

WHERE f1.cod <> f2.cod;

-- 4. Calcule a área em hectares do município.

SELECT st_area(st_transform(geom, 31982))/10000 AS area
	
FROM municipio_santa_cruz;
















