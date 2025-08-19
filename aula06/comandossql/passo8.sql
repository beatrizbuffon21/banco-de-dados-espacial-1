create table veg_estac(id_veg_estac integer PRIMARY KEY, 
			cod_tipo integer,
			cod_estac integer,
			FOREIGN KEY (cod_tipo) REFERENCES vegetacao (cod_tipo),
			FOREIGN KEY (cod_estac) REFERENCES estacionamento (cod_estac));
