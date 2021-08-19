SELECT * FROM sakila.actor
WHERE first_name = 'PENELOPE'
OR first_name = 'NICK'
OR first_name = 'ED'
OR first_name = 'JENNIFER';

-- IS THE SAME OF:

SELECT * FROM sakila.actor
WHERE first_name IN ('PENELOPE','NICK','ED','JENNIFER');

-- Como você faria, então, para encontrar, usando o IN , todos os detalhes sobre o aluguel dos clientes com os seguintes ids: 269, 239, 126, 399, 142?
SELECT * FROM sakila.customer
WHERE customer_id IN(269, 239, 126, 399, 142);

-- Como encontraria todas as informações sobre os endereços que estão registrados nos distritos de QLD, Nagasaki, California, Attika, Mandalay, Nantou e Texas?
SELECT * FROM sakila.address
WHERE district IN('QLD', 'Nagasaki', 'California', 'Attika', 'Mandalay', 'Nantou', 'Texas')

-- Note que o MySQL inclui o valor inicial e o final nos resultados
SELECT title, length FROM sakila.film
WHERE length BETWEEN 50 AND 120;

-- Usando o BETWEEN com strings
SELECT * FROM sakila.language
WHERE name BETWEEN 'Italian' AND 'Mandarin'
ORDER BY name;

-- Usando o BETWEEN com datas
-- Para usar o BETWEEN com datas, basta que você digite o valor no formato padrão da data, que é YYYY-MM-DD HH:MM:SS , sendo os valores de horas, minutos e segundos opcionais. No exemplo abaixo, estamos filtrando os resultados para exibir o rental_id e rental_date apenas entre o mês 05 e o mês 07
SELECT rental_id, rental_date FROM sakila.rental
WHERE rental_date
BETWEEN '2005-05-27' AND '2005-07-17';