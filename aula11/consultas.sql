-- tamanho do municipio de santa maria em km2 --------------------------------
SELECT 
	st_area(st_transform(geom, 31982))/1000000 AS area_total_km2 

FROM rs

WHERE nome = 'Santa Maria';

-- OU

SELECT 
	st_area(st_transform(geom, 31982))/1000000 AS area_total_km2 

FROM santa_maria;

-- comprimento total das estradas do RS por municipio ----------------------
SELECT m.nome,
	   SUM(st_length(st_transform(r.geom,31982)))/1000 AS estradas_km

FROM rs_viario AS r,
	 rs AS m

WHERE r.geom && m.geom AND -- otimização
	  st_contains(m.geom, r.geom)

GROUP BY m.nome

ORDER BY estradas_km;

-- comprimento total das estradas do RS que sejam estradas estaduais ---------------------
-- ou federais pavimentadas
SELECT SUM(st_length(st_transform(geom, 31982)))/1000 AS km

FROM rs_viario

WHERE codigo = 1 OR codigo = 2;

-- rodovias que cruzam por santa maria --------------------------------
SELECT m.nome

FROM 
	 rs r, rs_viario m

WHERE st_crosses(r.geom, m.geom) = 't'

AND r.nome = 'Santa Maria'
AND m.nome IS NOT NULL;

-- OU

SELECT m.nome

FROM 
	 santa_maria s, rs_viario m

WHERE st_crosses(s.geom, m.geom) = 't'
AND m.nome IS NOT NULL;

-- comprimento da BR 392 --------------------------------------------------
SELECT SUM(st_length(st_transform(geom, 31982)))/1000 AS km

FROM rs_viario

WHERE nome = 'BR 392';

-- comprimento da BR 392 que passa por santa maria ---------------------------
SELECT SUM(st_length(st_transform(r.geom, 31982)))/1000 AS qtd_km

FROM rs_viario r, 
	 rs m

WHERE r.geom && m.geom
AND r.nome = 'BR 392'
AND m.nome = 'Santa Maria';

-- municipios vizinhos a santa maria ------------------------------------
SELECT m.nome

FROM 
	 rs r, rs m

WHERE st_touches(r.geom, m.geom) = 't'
AND r.nome = 'Santa Maria'

ORDER BY m.nome;

-- municipios nao vizinhos a santa maria ---------------------
SELECT m.nome

FROM 
	 rs r, rs m

WHERE st_disjoint(r.geom, m.geom) = 't'
AND r.nome = 'Santa Maria'

ORDER BY m.nome;


-- maior municipios do rs
SELECT nome,
	   st_area(st_transform(geom, 31982))/1000000 AS area_total_km2

FROM rs

ORDER BY area_total_km2 DESC
LIMIT 1;










































