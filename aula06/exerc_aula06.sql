-- Exercicios
 
-- 1) Fazer a conexão com o banco de dados “poli” e adicionar as suas tabelas em um projeto no QGIS;
--feito no QGIS

-- 2) Qual a distância entre o estacionamento 1 e 3?
SELECT 
	st_distance(st_transform(e.geom, 31982), st_transform(est.geom, 31982)) AS distancia

FROM
	estacionamento e,
	estacionamento est

WHERE 
	e.cod_estac = 1 AND est.cod_estac = 3;

-- 3) Qual a área de cada estacionamento cadastrado?
SELECT 
	cod_estac,
	st_area(st_transform(geom, 31982)) AS metros

FROM
	estacionamento;

-- 4) Qual o somatório das áreas de todos os estacionamentos?
SELECT
	SUM(st_area(st_transform(geom, 31982))) AS total_area

FROM 
	estacionamento;

-- 5) Qual o comprimento de cada acesso dos estacionamentos?
SELECT
	cod_acesso,
	st_length(st_transform(geom, 31982)) AS comprimento

FROM
	acesso;

-- 6) Qual a distância entre a coordenada do ponto que localiza o Politécnico e os predios que compõem o colégio?
SELECT 
	p.cod_pred,
	c.cod_col,
	st_distance(st_transform(p.geom, 31982), st_transform(c.geom, 31982)) AS distancia

FROM
	predio p,
	colegio c


	

