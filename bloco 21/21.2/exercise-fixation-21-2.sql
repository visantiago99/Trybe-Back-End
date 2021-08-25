-- Monte uma query que exiba o id do ator , nome do ator e id do filme em que ele já atuou usando as tabelas actor e film_actor .
SELECT A.actor_id, A.first_name, B.film_id
FROM sakila.actor AS A
INNER JOIN sakila.film_actor AS B
ON A.actor_id = B.actor_id;
-- Use o JOIN para exibir o nome , sobrenome e endereço de cada um dos funcionários do banco. Use as tabelas staff e address .
SELECT A.first_name, A.last_name, B.address
FROM sakila.staff AS A
INNER JOIN sakila.address AS B
ON A.address_id = B.address_id;
-- Exiba o id do cliente , nome e email dos primeiros 100 clientes, ordenados pelo nome em ordem decrescente, juntamente com o id do endereço e o nome da rua onde o cliente mora. Essas informações podem ser encontradas nas tabelas customer e address .
SELECT B.customer_id, B.first_name, B.email, B.address_id, A.address
FROM sakila.address AS A
INNER JOIN sakila.customer AS B
ON A.address_id = B.address_id
ORDER BY B.first_name DESC
LIMIT 100;
-- Exiba o nome , email , id do endereço , endereço e distrito dos clientes que moram no distrito da California e que contêm "rene" em seus nomes. As informações podem ser encontradas nas tabelas address e customer .
SELECT A.first_name, A.last_name, A.address_id, B.address, B.district
FROM sakila.customer AS A
INNER JOIN sakila.address AS B
ON A.address_id = B.address_id
WHERE B.district = 'California'
AND A.first_name LIKE '%rene%';
-- Exiba o nome e a quantidade de endereços dos clientes cadastrados. Ordene seus resultados por nomes de forma decrescente. Exiba somente os clientes ativos. As informações podem ser encontradas na tabela address e customer .
SELECT A.first_name, COUNT(B.address)
FROM sakila.customer AS A
INNER JOIN sakila.address AS B
ON A.address_id = B.address_id
WHERE A.active = 1
GROUP BY A.first_name
ORDER BY A.first_name DESC;
-- Monte uma query que exiba o nome , sobrenome e a média de valor ( amount ) paga aos funcionários no ano de 2006. Use as tabelas payment e staff . Os resultados devem estar agrupados pelo nome e sobrenome do funcionário.
SELECT A.first_name, A.last_name, AVG(B.amount)
FROM sakila.staff AS A
INNER JOIN sakila.payment AS B
ON A.staff_id = B.staff_id
WHERE B.payment_date LIKE '%2006%'
GROUP BY A.first_name;
-- Monte uma query que exiba o id do ator , nome , id do filme e título do filme , usando as tabelas actor , film_actor e film . Dica: você precisará fazer mais de um JOIN na mesma query
SELECT A.actor_id, A.first_name, B.film_id, C.title
FROM sakila.actor AS A
INNER JOIN sakila.film_actor AS B
ON A.actor_id = B.actor_id
INNER JOIN sakila.film AS C
ON B.film_id = C.film_id;