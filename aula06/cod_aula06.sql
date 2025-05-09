-- Extensao para tornar o banco espacial
CREATE EXTENSION postgis;

-- Criando a tabela colegio
create table colegio (cod_col character varying(10) PRIMARY KEY, 
			telefone numeric(10),
			nome character varying(50),
			endereco character varying(50),
			cep numeric(8),
			bairro character varying(50),
			estado character(2),
			numero integer,				   			  
			geom geometry(point,4326));

-- Inserindo dados na tabela colegio
insert into colegio (cod_col, telefone, nome, endereco, cep,bairro, estado, numero, geom) values('081.CPSM',
						32208273, 'Colégio Politécnico', 'Av. Roraima', 9700000, 'Camobi', 'RS',  1000, 
						   st_geomfromtext('point(-53.71819830653170 -29.72297182406500)', 4326));

-- Criando a tabela estacionamento
create table estacionamento (cod_estac integer PRIMARY KEY, 
			qtd_vagas integer,
			qtd_vagas_defic integer,
			cod_col character varying(10),			   			  
			geom geometry(polygon,4326),
			FOREIGN KEY (cod_col) REFERENCES colegio (cod_col));

-- Criando a tabela acesso
create table acesso(cod_acesso integer PRIMARY KEY, 
			cod_estac integer,			   			  
			geom geometry(linestring,4326),
			FOREIGN KEY (cod_estac) REFERENCES estacionamento (cod_estac));

-- Criando a tabela predio
create table predio(cod_pred character varying(15) PRIMARY KEY, 
			num_sala_aula integer,
			num_sala_adm integer,
			num_lab integer,
			num_sala_prof integer,
			num_banheiro_f integer,
			num_banheiro_m integer,
			num_andares integer,
			cod_col	character varying(10),		   			  
			geom geometry(point,4326),
			FOREIGN KEY (cod_col) REFERENCES colegio (cod_col));

-- Criando a tabela vegetacao
create table vegetacao(cod_tipo integer PRIMARY KEY, 
			descricao character varying(50));

-- Criando a tabela veg_estac
create table veg_estac(id_veg_estac integer PRIMARY KEY, 
			cod_tipo integer,
			cod_estac integer,
			FOREIGN KEY (cod_tipo) REFERENCES vegetacao (cod_tipo),
			FOREIGN KEY (cod_estac) REFERENCES estacionamento (cod_estac));

-- Criando a tabela veg_pred
create table veg_pred(id_veg_pred integer PRIMARY KEY, 
			cod_pred character varying(15),		  
			cod_tipo integer,
			FOREIGN KEY (cod_pred) REFERENCES predio (cod_pred),
			FOREIGN KEY (cod_tipo) REFERENCES vegetacao (cod_tipo));

-- Inserindo dados na tabela estacionamento
insert into estacionamento (cod_estac, qtd_vagas, qtd_vagas_defic, cod_col, geom) values (1, 12, 1, '081.CPSM',st_geomfromtext
												('polygon((-53.71821769855436 -29.72220503332537,
												  -53.71789134424697 -29.72217721262336, 
												  -53.71791470547362 -29.7220875171064,
												  -53.718241132146 -29.72212104208211, 
												  -53.71821769855436 -29.72220503332537))', 4326));

-- Inserindo dados na tabela estacionamento
insert into estacionamento (cod_estac, qtd_vagas, qtd_vagas_defic, cod_col, geom) values (2, 30, 1, '081.CPSM',st_geomfromtext
												('polygon((-53.71883860093007 -29.72213908817443,
												 -53.7185202596953 -29.72209924774615,
												 -53.71840918171161 -29.72269987978804, 
												 -53.71871294788691 -29.72274849045155, 
												 -53.71883860093007 -29.72213908817443))', 4326));

-- Inserindo dados na tabela estacionamento												 
insert into estacionamento (cod_estac, qtd_vagas, qtd_vagas_defic, cod_col, geom) values (3, 15, 0, '081.CPSM',st_geomfromtext
												('polygon((-53.71808905462358 -29.72290965886154,
												 -53.71817635522708 -29.72290985213692,
											 	-53.71812920999373 -29.72322521285633, 
												 -53.71802065709018 -29.72321820922949, 
												 -53.71808905462358 -29.72290965886154))', 4326));

-- Inserindo dados na tabela acesso
insert into acesso (cod_acesso, cod_estac, geom) 
values (1, 1,st_geomfromtext('LINESTRING(-53.71821624690131 -29.72203274495037, -53.71819746711388 -29.72213456573542)', 4326));

-- Inserindo dados na tabela acesso
insert into acesso (cod_acesso, cod_estac, geom) 
values (2, 2,st_geomfromtext('LINESTRING(-53.71862509317749 -29.72209047817038,-53.7185889545379 -29.72223878535221)', 4326));

-- Inserindo dados na tabela acesso
insert into acesso (cod_acesso, cod_estac, geom) 
values (3, 3,st_geomfromtext('LINESTRING(-53.71805413395862 -29.72350021269656, -53.71808077589144 -29.72335672475585,
							  -53.7181032337885 -29.72322351317983)', 4326));

-- Inserindo dados na tabela predio
insert into predio(cod_pred,num_sala_aula,num_sala_adm,num_lab,num_sala_prof,num_banheiro_f,num_banheiro_m,num_andares,cod_col,geom) values
('A',1,7,0,5,1,1,1,'081.CPSM', st_geomfromtext('point(-53.71809591084416 -29.72244255431186)',4326));

-- Inserindo dados na tabela predio
insert into predio(cod_pred,num_sala_aula,num_sala_adm,num_lab,num_sala_prof,num_banheiro_f,num_banheiro_m,num_andares,cod_col,geom) values
('B',0,3,0,0,0,0,1,'081.CPSM',st_geomfromtext('point(-53.71840477785435 -29.7224001289419)',4326));

-- Inserindo dados na tabela predio
insert into predio(cod_pred,num_sala_aula,num_sala_adm,num_lab,num_sala_prof,num_banheiro_f,num_banheiro_m,num_andares,cod_col,geom) values 
('BAR',0,0,0,0,0,0,1,'081.CPSM',st_geomfromtext('point(-53.71790963571067 -29.7228310758635)',4326));

-- Inserindo dados na tabela predio
insert into predio(cod_pred,num_sala_aula,num_sala_adm,num_lab,num_sala_prof,num_banheiro_f,num_banheiro_m,num_andares,cod_col,geom) values
('C',2,2,1,2,0,0,1,'081.CPSM',st_geomfromtext('point(-53.71780283793987 -29.72230425862643)',4326));

-- Inserindo dados na tabela predio
insert into predio(cod_pred,num_sala_aula,num_sala_adm,num_lab,num_sala_prof,num_banheiro_f,num_banheiro_m,num_andares,cod_col,geom) values 
('D',3,2,2,0,0,0,1,'081.CPSM',st_geomfromtext('point(-53.71772726320468 -29.72256738519089)',4326));

-- Inserindo dados na tabela predio
insert into predio(cod_pred,num_sala_aula,num_sala_adm,num_lab,num_sala_prof,num_banheiro_f,num_banheiro_m,num_andares,cod_col,geom) values
('E',5,1,1,9,1,1,2,'081.CPSM',st_geomfromtext('point(-53.71771219786168 -29.72277514993818)',4326));

-- Inserindo dados na tabela predio
insert into predio(cod_pred,num_sala_aula,num_sala_adm,num_lab,num_sala_prof,num_banheiro_f,num_banheiro_m,num_andares,cod_col,geom) values 
('F',9,5,4,10,3,3,3,'081.CPSM',st_geomfromtext('point(-53.71777113037162 -29.72304453309505)',4326));

-- Visualizando a tabela vegetacao
SELECT * FROM vegetacao; -- Os dados foram importados sem comando

-- So vai funcionar se importar os dados na tabela vegetacao
-- Inserindo dados na tabela veg_estac
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (1,1,1);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (2,1,2);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (3,1,3);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (4,2,1);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (5,2,2);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (6,2,3);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (7,3,1);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (8,3,2);
insert into veg_estac (id_veg_estac,cod_tipo,cod_estac) values (9,3,3);

-- Visualizando a tabela veg_pred
SELECT * FROM veg_pred -- Os dados foram importados sem comando
