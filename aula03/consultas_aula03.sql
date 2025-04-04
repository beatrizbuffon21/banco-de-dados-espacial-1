-- importando extensão --------------------------------------------------------------------
CREATE EXTENSION postgis;

-- criando tabela lotes -------------------------------------------------------------------
CREATE TABLE lotes(
cod char(2) primary key, geom geometry(polygon,0));

-- inserindo dados na tabela lotes --------------------------------------------------------
INSERT INTO lotes(cod, geom)
SELECT 'L1', st_geomfromtext('polygon((3 5, 7 5, 7 3, 3 3, 3 5))');

INSERT INTO lotes(cod, geom)
SELECT 'L2', st_geomfromtext('polygon((7 7, 11 7, 11 4, 7 4, 7 7))');

INSERT INTO lotes(cod, geom)
SELECT 'L3', st_geomfromtext('polygon((17 9, 19 6, 15 6, 17 9))');

INSERT INTO lotes(cod, geom)
SELECT 'L4', st_geomfromtext('polygon((3 8, 8 8, 8 7, 3 7, 3 8))');

-- consulta mudando o geom para texto ------------------------------------------------------
SELECT 
	cod, st_astext(geom)
FROM 
	lotes;
	
-- consulta --------------------------------------------------------------------------------
SELECT
	*
FROM 
	lotes;

-- criando a tabela quadras -------------------------------------------------------------------

CREATE TABLE quadra(
cod char(2) primary key, geom geometry(polygon,0)
);

-- inserindo dados na tabela quadras --------------------------------------------------------
INSERT INTO quadra(cod, geom)
SELECT 'Q1', st_geomfromtext('polygon((2 9, 11 9, 11 2, 2 2, 2 9))');

INSERT INTO quadra(cod, geom)
SELECT 'Q2', st_geomfromtext('polygon((16 10, 18 10, 18 9, 19 9, 19 8,
										20 8, 20 6, 19 6, 19 5, 18 5, 18 4, 16 4,
										16 5, 15 5, 15 6, 14 6, 14 8, 15 8, 15 9,
										16 9, 16 10))');

-- consulta sem a funcao --------------------------------------------------------
SELECT 
	*
FROM 
	quadra;

-- consulta com a funcao --------------------------------------------------------

SELECT 
	cod, 
	st_astext(geom)
FROM 
	quadra;



