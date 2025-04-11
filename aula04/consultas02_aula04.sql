-- extensão para criar o banco espacial
CREATE EXTENSION postgis;

-- criar tabela vegetacao
CREATE TABLE vegetacao (cod int PRIMARY KEY, 
						geom geometry(point,4326));

-- criar tabela caminhos
CREATE TABLE caminhos (cod int PRIMARY KEY, 
						geom geometry(linestring,4326));

-- criar tabela restaurante
CREATE TABLE restaurante (cod int PRIMARY KEY, 
						geom geometry(polygon,4326));