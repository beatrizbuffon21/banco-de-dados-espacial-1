create table veg_pred(id_veg_pred integer PRIMARY KEY, 
			cod_pred character varying(15),		  
			cod_tipo integer,
			FOREIGN KEY (cod_pred) REFERENCES predio (cod_pred),
			FOREIGN KEY (cod_tipo) REFERENCES vegetacao (cod_tipo));
