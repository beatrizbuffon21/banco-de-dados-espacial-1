-- 1. Selecionar todos os pacientes;

SELECT *
FROM paciente

-- 2. Selecionar todos os médicos com especialidade Cardiologia;

SELECT *
FROM medico
WHERE especialidade = 'Cardiologia'

-- 3. Encontrar paciente que tenha o sobrenome Azevedo;

SELECT *
FROM paciente
WHERE nome LIKE '%Azevedo'

-- 4. Encontrar os pacientes que tenham sido atendidos pelo médico com código 1;

SELECT 
	c.cod_med,
	p.nome,
	c.cod_pac
FROM 
	paciente p INNER JOIN consulta c ON (p.cod_pac = c.cod_pac)
WHERE c.cod_med = 1

-- 5. Encontrar o nome e a especialidade do médico com código 3;

SELECT *
FROM medico
WHERE cod_med = 3

-- 6. Recuperar o código do paciente e a data que foi atendido;

SELECT
	p.cod_pac,
	c."data"
FROM consulta c INNER JOIN paciente p ON (c.cod_pac = p.cod_pac)

-- 7. Ordenar a tabela consulta pela data de consulta.

SELECT *
FROM consulta 
ORDER BY "data" ASC












	






