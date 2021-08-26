-- Monte uma procedure que exiba os 10 atores mais populares, baseado em sua quantidade de filmes. Essa procedure não deve receber parâmetros de entrada ou saída e, quando chamada, deve exibir o id do ator ou atriz e a quantidade de filmes em que atuaram.
USE sakila;
DELIMITER $$
CREATE PROCEDURE ShowBestActors()
BEGIN 
SELECT actor_id, COUNT(*) AS movie_quant
FROM sakila.film_actor
GROUP BY actor_id
ORDER BY COUNT(*) DESC
LIMIT 10;
END $$
DELIMITER ;

CALL ShowBestActors();
-- Monte uma procedure que receba como parâmetro de entrada o nome da categoria desejada em uma string e que exiba o id do filme , seu titulo , o id de sua categoria e o nome da categoria selecionada. Use as tabelas film , film_category e category para montar essa procedure.
USE sakila;
DELIMITER $$
CREATE PROCEDURE ShowMovies(IN categoria VARCHAR(50))
BEGIN 
SELECT A.film_id, A.title, B.category_id, C.name FROM sakila.film AS A
INNER JOIN sakila.film_category AS B
ON A.film_id = B.film_id
INNER JOIN sakila.category AS C
ON B.category_id = C.category_id;
END $$
DELIMITER ;

CALL ShowMovies('action');
-- Monte uma procedure que receba o email de um cliente como parâmetro de entrada e diga se o cliente está ou não ativo, através de um parâmetro de saída.
USE sakila;
DELIMITER $$
CREATE PROCEDURE ShowActives(
	IN emailClient VARCHAR(300),
    OUT activeEmails VARCHAR(300)
)
BEGIN 
SELECT IF(active = 1, 'Email ativo', 'Email inativo')
INTO activeEmails FROM sakila.customer
WHERE email = emailClient;
END $$
DELIMITER ;

SELECT @activeEmails;
CALL ShowActives('MARY.SMITH@sakilacustomer.org', @activeEmails);
SELECT @activeEmails;
-- Utilizando a tabela sakila.payment , monte uma function que retorna a quantidade total de pagamentos feitos até o momento por um determinado customer_id .
USE sakila;
DELIMITER $$
CREATE FUNCTION RetornaQuantidadePagamentosPorId(customerID VARCHAR(100))
RETURNS DOUBLE READS SQL DATA
BEGIN
DECLARE quantity DOUBLE;
SELECT COUNT(amount) FROM payment
WHERE customerID = customer_id
INTO quantity;
RETURN quantity;
END $$
DELIMITER ;
-- Crie uma function que, dado o parâmetro de entrada inventory_id , retorna o nome do filme vinculado ao registro de inventário com esse id.
USE sakila;
DELIMITER $$

CREATE FUNCTION GetCorrespondingFilm(id INT)
RETURNS VARCHAR(500) READS SQL DATA
BEGIN
    DECLARE movie_title VARCHAR(500);
    SELECT distinct F.title
    FROM sakila.inventory I
    INNER JOIN sakila.film F
    ON F.film_id = I.film_id
    WHERE I.inventory_id = id INTO movie_title;
    RETURN movie_title;
END $$

DELIMITER ;

-- Como usar:

SELECT GetCorrespondingFilm(2);
-- Crie uma function que receba uma determinada categoria de filme em formato de texto (ex: 'Action' , 'Horror' ) e retorna a quantidade total de filmes registrados nessa categoria.
USE sakila;
DELIMITER $$
CREATE FUNCTION ReturnMovieQuant(categoria VARCHAR(50))
RETURNS VARCHAR(50) READS SQL DATA
BEGIN
DECLARE quantity INT;
SELECT COUNT(A.film_id) FROM sakila.film_category AS A
INNER JOIN sakila.category AS B
ON A.category_id = B.category_id
WHERE B.name = categoria
INTO quantity;
RETURN quantity;
END $$
DELIMITER ;

SELECT ReturnMovieQuant('Documentary');