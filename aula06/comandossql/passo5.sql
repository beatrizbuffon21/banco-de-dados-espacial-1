create table acesso(cod_acesso integer PRIMARY KEY, 
			cod_estac integer,			   			  
			geom geometry(linestring,4326),
			FOREIGN KEY (cod_estac) REFERENCES estacionamento (cod_estac));
