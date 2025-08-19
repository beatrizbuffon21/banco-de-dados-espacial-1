create table estacionamento (cod_estac integer PRIMARY KEY, 
			qtd_vagas integer,
			qtd_vagas_defic integer,
			cod_col character varying(10),			   			  
			geom geometry(polygon,4326),
			FOREIGN KEY (cod_col) REFERENCES colegio (cod_col));
