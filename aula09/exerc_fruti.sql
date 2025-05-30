-- Extensão
CREATE EXTENSION postgis;

-- 1) A área de oliveiras
SELECT st_area(geom) AS area

FROM oliveiras;

-- 2) A área de edificação
SELECT st_area(geom) AS area

FROM edificacoes;

-- 3) O comprimento da via em metros
SELECT st_length(geom) AS comprimento

FROM vias

-- 4) Distância entre os postes com valores 4 e 8 no campo id
SELECT p1.id,
	   p2.id,
	   st_distance(p1.geom, p2.geom) AS distancia
FROM 
	 poste p1,
	 poste p2
WHERE 
	 p1.id = 4 AND
	 p2.id = 8;

-- 5) Distância dos postes em relação ao poste com id igual 8
SELECT p1.id,
	   p2.id,
	   st_distance(p1.geom, p2.geom) AS distancia
FROM 
	poste p1,
	poste p2
WHERE 
	p2.id = 8;

-- 6) Distância entre edificações e oliveiras
SELECT o.id,
	   e.id,
	   st_distance(e.geom, o.geom)
FROM
	oliveiras o,
	edificacoes e

--7) A partir da tabela pontos_fruti crie a tabela portao com os pontos que
-- possuem os valores 18 e 19 no campo gid.
CREATE TABLE portao AS 
SELECT *
FROM pontos_fruti
WHERE gid = 18 OR 
	  gid = 19;

-- Visualizando a tabela
SELECT *
FROM portao;


