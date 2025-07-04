CREATE TABLE sm_mancha_urbana AS
SELECT st_intersection(r.geom, m.geom) AS
	intersection_geom, r.*
FROM rs_manchas_urbanas AS r, rs AS m
WHERE r.geom && m.geom				-- && retoran TRUE se a caixa delimitadora A
AND st_intersects(r.geom, m.geom)	-- intersecta a caixa delimitadora de B
AND m.nome = 'Santa Maria';

-- visualizando tabela sm_mancha_urbana
SELECT *
FROM sm_mancha_urbana;

-- O intersection nao coloca o srid 4326 entao temos que alterar
ALTER TABLE sm_mancha_urbana
ALTER COLUMN intersection_geom
TYPE geometry(MULTIPOLYGON, 4326)
USING st_setsrid(intersection_geom, 4326);

-- criacao da tabela sm_hidrografia
CREATE TABLE sm_hidrografia AS
SELECT st_intersection(r.geom, m.geom) AS
	intersection_geom,
ST_length(r.geom) AS rs_orig_length, r.*
FROM rs_hidrografia AS r, rs AS m
WHERE r.geom && m.geom
AND ST_intersects(r.geom, m.geom)
AND m.nome = 'Santa Maria';

-- visualizando a tabela sm_hidrografia
SELECT *
FROM sm_hidrografia;

-- alterando o srid agora para hidrografia(mesma coisa)
ALTER TABLE sm_hidrografia
ALTER COLUMN intersection_geom
TYPE geometry(MULTILINESTRING, 4326)
USING ST_SETSRID(intersection_geom, 4326);

-- criacao da tabela sm_curvas
CREATE TABLE sm_curvas AS
SELECT ST_Intersection(r.geom, m.geom) AS
	intersection_geom,
ST_length(r.geom) AS rd_orig_length, r.*
FROM rs_curvas AS r, rs AS m
WHERE r.geom && m.geom
AND ST_intersects(r.geom, m.geom)
AND m.nome = 'Santa Maria';

-- alterando o srid tambem das curvas
ALTER TABLE sm_curvas 
ALTER COLUMN intersection_geom
TYPE geometry(MULTILINESTRING, 4326)
USING ST_SETSRID(intersection_geom, 4326);

-- criacao da tabela sm_sistema_viario
CREATE TABLE sm_sistema_viario AS
SELECT ST_Intersection(r.geom, m.geom) AS
	intersection_geom,
ST_length(r.geom) AS rd_orig_length, r.*
FROM rs_viario AS r, rs AS m
WHERE r.geom && m.geom
AND ST_intersects(r.geom, m.geom)
AND m.nome = 'Santa Maria';

-- alterando o srid tambem do sm_sistema_viario
ALTER TABLE sm_sistema_viario 
ALTER COLUMN intersection_geom
TYPE geometry(MULTILINESTRING, 4326)
USING ST_SETSRID(intersection_geom, 4326);
























