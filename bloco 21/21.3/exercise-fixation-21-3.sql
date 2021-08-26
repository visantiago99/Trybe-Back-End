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
-- Monte uma procedure que receba o email de um cliente como parâmetro de entrada e diga se o cliente está ou não ativo, através de um parâmetro de saída.