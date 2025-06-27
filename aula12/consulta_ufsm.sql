-- Criando extensao
CREATE EXTENSION postgis;

-- Visualizando a tabela ufsm
SELECT *
FROM ufsm;

-- Criando a tabela quadra
CREATE TABLE quadra(cod_quadra numeric(10) PRIMARY KEY,
					nome character varying(50),
					geom geometry(polygon,4326));

-- Inserindo valores na tabela quadra
INSERT INTO quadra(cod_quadra, nome, geom) VALUES(1, 'ceu', st_geomfromtext
													('polygon((-53.71465755506892 -29.71887216911713, 
													-53.71160468472013 -29.71850617273101,
													-53.71201502715646 -29.71717566490337, 
													-53.71491942255467 -29.7176029244968, 
													-53.71465755506892 -29.71887216911713))', 4326))

INSERT INTO quadra(cod_quadra, nome, geom) VALUES(2, 'planetario', st_geomfromtext
													('polygon((-53.71756091777581 -29.72034526893925,
													-53.71704684135018 -29.72023553890963,
													-53.71717125267975 -29.71975240262719,
													-53.71765454284986 -29.71980883438162,
													-53.71756091777581 -29.72034526893925))', 4326))
-- Visualizando a tabela quadra
SELECT *
FROM quadra;


-- Criando a tabela predio
CREATE TABLE predio(num_predio numeric(10) PRIMARY KEY,
					nome character varying(50),
					cod_quadra numeric(10),
					geom geometry(polygon,4326),
					FOREIGN KEY (cod_quadra) REFERENCES quadra (cod_quadra));


-- Inserindo valores na tabela predio
INSERT INTO predio(num_predio, nome, cod_quadra, geom) VALUES(1, 'bloco_60', 1, st_geomfromtext
													('polygon((-53.71204702152969 -29.71858014292472,
													-53.71149728820514 -29.71852291262227, 
													-53.71160119304881 -29.71816671496157,
													-53.71213298537513 -29.71822631320212, 
													-53.71204702152969 -29.71858014292472))', 4326));


													