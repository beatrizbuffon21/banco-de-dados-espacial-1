-- a) Quais os lotes vizinhos ao lote L2?
SELECT t1.cod 
FROM
	lotes t1,
	lotes t2
WHERE
	ST_TOUCHES(t1.geom, t2.geom) AND
	t2.cod = 'L2' AND t1.cod <> 'L2';

--b) Quais os lotes estão dentro da quadra Q1?
SELECT t1.cod
FROM
	lotes t1, 
	quadra t2
WHERE 
	t2.cod = 'Q1' AND
	t2.geom ~ t1.geom;

/*c) Uma pessoa resolveu comprar todos os lotes da quadra Q1.
Criar uma nova geometria L4 que represente toda a área dos
lotes originais.
*/

SELECT 
	SUM(ST_AREA(t1.geom)) 
FROM
	lotes t1, 
	quadra t2
WHERE
	t2.cod = 'Q1' AND
	t2.geom ~ t1.geom;

-- União entre geometrias
UPDATE lotes SET geom = (SELECT ST_UNION(t1.geom)
						 FROM lotes t1,
						 	   quadra t2
						 WHERE t2.cod = 'Q1' AND
						 	   t2.geom ~ t1.geom)
						 WHERE cod = 'L4';

-- Area de todos os lotes
SELECT 
	cod,
	st_area(geom)
FROM
	lotes


