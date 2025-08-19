--Após criar o banco de dados

--Habilitar a extensão PostGis
CREATE EXTENSION POSTGIS;

--Cria quadra
create table quadra(cod_quadra integer primary key,
geom geometry(polygon, 4326));

--Cria rua
create table rua(cod_rua integer primary key,
	nome varchar(50),
    geom geometry(linestring, 4326));

--Cria escola
create table escola(cod_escola integer primary key,
nome varchar(50),
numero integer,
cep integer,
cod_rua integer,
CONSTRAINT fk_cod_rua FOREIGN KEY (cod_rua) references rua(cod_rua),
geom geometry(point, 4326));

INSERT INTO rua (cod_rua, nome, geom) VALUES

(1, 'Rua Quatro, Parque Santa Lúcia',ST_GeometryFromText('LINESTRING
(-53.73585980782426 -29.7008498269125,-53.73584152377974 -29.70127315279436,
-53.73584141074755 -29.70157336124674,-53.73581689881851 -29.70200070383379,
-53.73582104881483 -29.70233264460561,-53.73581826915656 -29.70261306605569,
-53.73579260011248 -29.70290766956824,-53.73579206012224 -29.70329671808109)',
4326));

INSERT INTO rua (cod_rua, nome, geom) VALUES

(2, 'Rua João da Fontoura e Souza',ST_GeometryFromText('LINESTRING
(-53.71894863317573 -29.7042418052019, -53.71899216520114 -29.70438816951214,
-53.71903417395695 -29.70455795086416, -53.71909482980129 -29.70471358107579,
-53.71914006303044 -29.70487478882778, -53.71919955853218 -29.70502662757483,
-53.71921991399604 -29.70511870651924,-53.71923062393875 -29.70516466676772)',
4326));	

INSERT INTO rua (cod_rua, nome, geom) VALUES

(3, 'Rua Clemente Pinto',ST_GeometryFromText('LINESTRING
(-53.70847674232257 -29.70720148859608,-53.70819799091104 -29.70721594654637,
-53.70791925739614 -29.70723845316438,-53.70775368332281 -29.70725000938949,
-53.70758822411862 -29.70726531511538)',
4326));	

INSERT INTO quadra(cod_quadra, geom)

VALUES(1, ST_GeometryFromText('POLYGON
((-53.73665022412946 -29.70330849570607,-53.73584219276034 -29.70330009476082,
-53.73589252288123 -29.70085864735392,-53.73680587825153 -29.70088512502616,
-53.73665022412946 -29.70330849570607))',4326));


INSERT INTO quadra(cod_quadra, geom)

VALUES(2, ST_GeometryFromText('POLYGON
((-53.71991749887005 -29.70514232893199,-53.71926825558193 -29.70514221768197,
-53.71897827508383 -29.70423852835657, -53.71965527905966 -29.70409614941259, 
-53.71991749887005 -29.70514232893199))',4326));

INSERT INTO quadra(cod_quadra, geom)

VALUES(3, ST_GeometryFromText('POLYGON
((-53.70843610372415 -29.70714399553755,-53.70763648334808 -29.70722791258901,
-53.70754441678348 -29.70627976590647,-53.70828716348326 -29.70607224150718,
-53.70843610372415 -29.70714399553755))',4326));

INSERT INTO escola (cod_escola, nome, numero, cep, cod_rua, geom) VALUES
(1, 'EMEF Antônio Gonçalves do Amaral', 45, 97110772, 1, ST_GeometryFromText('POINT
(-53.73604829017921 -29.70176447843822)',
4326));

INSERT INTO escola (cod_escola, nome, numero, cep, cod_rua, geom) VALUES
(2, 'EMEF Vicente Farencena', 335, 97105210, 2, ST_GeometryFromText('POINT
(-53.71914478261637 -29.70452754949322)',
4326));

INSERT INTO escola (cod_escola, nome, numero, cep, cod_rua, geom) VALUES
(3, 'EMEF Santa Helena', 591, 97105400, 3, ST_GeometryFromText('POINT
(-53.70789379537688 -29.7070988008661)',
4326));

--CONSULTAS
--1) Mostre o código e calcule a área de cada quadra
select cod_quadra, st_area(st_transform(geom, 31982)) from quadra

--2) Mostre o nome e calcule o comprimento de cada rua
select nome, st_length(st_transform(geom, 31982)) from rua

--3) Mostre o nome das escolas e calcule a distância entre elas
select e1.nome, e2.nome,st_distance(st_transform(e1.geom, 31982), st_transform(e2.geom, 31982)) 
from escola e1, escola e2
where e1.cod_escola <> e2.cod_escola

--4) Mostre o nome das escolas e encontre a distância entre a escola Antônio do Amaral e a escola Santa Helena
select e1.nome, e2.nome,st_distance(st_transform(e1.geom, 31982), st_transform(e2.geom, 31982)) 
from escola e1, escola e2
where e1.cod_escola = 1 and  e2.cod_escola = 3




