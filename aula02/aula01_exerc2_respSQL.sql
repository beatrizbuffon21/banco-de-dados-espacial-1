--1
select * from paciente;

--2
select * from medico where especialidade = 'Cardiologia';

--3
select * from paciente where nome like '%Azevedo%';
select * from paciente where nome ilike '%azevedo%';

--4
select * from consulta where cod_med = 1;

select * from consulta 
where paciente.cod_pac = consulta.cod_pac and cod_med = 1;

--5
select nome, especialidade from medico 
where cod_med = 3;

--6
select cod_pac, data from consulta;


--7
select * from consulta 
order by data asc;
