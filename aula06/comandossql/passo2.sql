create table colegio (cod_col character varying(10) PRIMARY KEY, 
			telefone numeric(10),
			nome character varying(50),
			endereco character varying(50),
			cep numeric(8),
			bairro character varying(50),
			estado character(2),
			numero integer,				   			  
			geom geometry(point,4326));
