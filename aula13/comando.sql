--Alterar um campo de uma tabela
alter table bairros_santa_cruz 
rename column name to nome

--Excluir um campo de uma tabela
alter table bairros_santa_cruz 
drop column osm_id

--1) O nome do bairro e das farmácias existentes em cada
bairro. Utilize a função ST_CONTAINS
select b.name, f.name
from bairros_santa_cruz b, farmacia f
where st_contains(b.geom, f.geom)

--2) Calcule a área dos bairros e ordene o resultado em ordem decrescente pela área
Select name, st_area(st_transform(geom, 31982)) as area
from bairros_santa_cruz
order by area desc

--3) Calcule a distância entre as farmácias. A consulta deverá mostrar o código, o nome de cada farmácia com a respectiva distância
select f1.gid, f1.name, f2.gid, f2.name, st_distance(st_transform(f1.geom, 31982), st_transform(f2.geom, 31982))
from farmacia f1, farmacia f2
where f1.gid <> f2.gid

--4) Calcule a área em hectares do município
select st_area(st_transform(geom, 31982))/10000 as area
from santa_cruz
