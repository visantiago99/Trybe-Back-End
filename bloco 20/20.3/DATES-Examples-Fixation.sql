-- Encontra todos os pagamentos deste dia, ignorando horas, minutos e segundos
SELECT * FROM sakila.payment
WHERE DATE(payment_date) = '2005-07-31';
-- Encontra todos pagamentos deste dia, ignorando horas, minutos e segundos
SELECT * FROM sakila.payment
WHERE payment_date LIKE '2005-07-31%';
-- Encontra um pagamento com dia e hora exatos
SELECT * FROM sakila.payment
WHERE payment_date LIKE '2005-08-20 00:30:52';
-- Encontra pagamentos especificando um valor mínimo e um valor máximo para a data
SELECT *
FROM sakila.payment
WHERE payment_date BETWEEN '2005-05-26 00:00:00' AND '2005-05-27 23:59:59';
-- Selecionando apenas partes de uma data
SELECT DATE(payment_date) FROM sakila.payment; -- YYYY-MM-DD
SELECT YEAR(payment_date) FROM sakila.payment; -- Ano
SELECT MONTH(payment_date) FROM sakila.payment; -- Mês
SELECT DAY(payment_date) FROM sakila.payment; -- Dia
SELECT HOUR(payment_date) FROM sakila.payment; -- Hora
SELECT MINUTE(payment_date) FROM sakila.payment; -- Minuto
SELECT SECOND(payment_date) FROM sakila.payment; -- Segundo

-- Exercícios Fixação
-- Quantos pagamentos temos com a data de retorno 2005-05-25 ? Há múltiplas maneiras possíveis de encontrar a resposta.
SELECT COUNT(*) FROM sakila.payment
WHERE DATE(payment_date) = '2005/05/25';
-- Quantos pagamentos foram feitos entre 01/07/2005 e 22/08/2005 ?
SELECT COUNT(*) FROM sakila.payment
WHERE payment_date BETWEEN '2005/07/01' AND '2005/08/22';
-- Usando a tabela rental , extraia data, ano, mês, dia, hora, minuto e segundo dos registros com rental_id = 10330. Utilize a coluna rental_date para extrair as informações.
SELECT DATE(rental_date) AS Data,
YEAR(rental_date),
MONTH(rental_date),
DAY(rental_date),
HOUR(rental_date),
MINUTE(rental_date),
SECOND(rental_date)
FROM sakila.rental
WHERE rental_id = 10330