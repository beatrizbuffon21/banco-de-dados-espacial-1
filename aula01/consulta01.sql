--1. Recuperar o código, nome e a idade dos marinheiros;
SELECT
	m.mnome,
	m.idade
FROM
	marin m

--2. Recuperar todos os barcos que tenham o nome Amazonas. Renomear a tabela para “b”; 
SELECT
	b.bid,
	b.bnome
FROM
	barcos b
WHERE b.bnome = 'Amazonas'

--3. Recuperar o nome e a idade dos marinheiros que iniciem com a letra S; 
SELECT
	m.mnome,
	m.idade
FROM
	marin m
WHERE m.mnome LIKE 'S%'

--4. Recuperar todos os marinheiros com a idade entre 20 e 35 anos; 
SELECT
	m.mid,
	m.mnome,
	m.idade
FROM
	marin m
WHERE m.idade BETWEEN 20 AND 30

--5. Ordenar a tabela Marin em ordem ascendente pelo nome; 
SELECT
	*
FROM 
	marin
ORDER BY mnome ASC 	 

--6. Encontrar a média de idade dos marinheiros; 
SELECT
	AVG(m.idade) AS media_idade
FROM
	marin m

--7. Encontrar a menor idade;
SELECT
	*
FROM
	marin m
ORDER BY m.idade ASC
LIMIT 1

--8. Encontrar maior idade; 
SELECT
	*
FROM
	marin m
ORDER BY m.idade DESC
LIMIT 1

--9. Encontre o marinheiro que tenha seu nome iniciado com a letra S e idade menor que 30;
SELECT 
	*
FROM
	marin m
WHERE m.mnome LIKE 'S%' 
	AND m.idade < 30

--10. Encontre o marinheiro que tenha seu nome iniciado com a letra F ou a idade menor que 20. 
SELECT
	*
FROM
	marin m
WHERE m.mnome LIKE 'F%'
	OR m.idade < 20
