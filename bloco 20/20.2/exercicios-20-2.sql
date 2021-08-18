-- Escreva uma query para exibir a string "This is SQL Exercise, Practice and Solution".
SELECT 'This is SQL Exercise, Practice and Solution' AS 'Exercicio 1';
-- Escreva uma query para exibir três números em três colunas.
SELECT 1 AS A, 2 AS B, 3 AS C;
-- Escreva uma query para exibir a soma dos números 10 e 15.
SELECT 10 + 15;
-- Escreva uma query para exibir o resultado de uma expressão aritmética qualquer.
SELECT ((10 * 5) + 100) / 2;
-- Escreva uma query para exibir todas as informações de todos os cientistas.
SELECT * FROM scientists.scientists;
-- Escreva uma query para exibir o nome como "Nome do Projeto" e as horas como "Tempo de Trabalho" de cada projeto.
SELECT Name AS 'Nome do Projeto', Hours AS 'Tempo de Trabalho' FROM projects;
-- Escreva uma query para exibir o nome dos cientistas em ordem alfabética.
SELECT * FROM scientists.scientists
ORDER BY Name;
-- Escreva uma query para exibir o nome dos Projetos em ordem alfabética descendente.
SELECT * FROM scientists.projects
ORDER BY Name DESC;
-- Escreva uma query que exiba a string "O projeto Name precisou de Hours horas para ser concluído." para cada projeto.
SELECT CONCAT('O projeto ', Name, ' precisou de ', Hours, ' horas para ser concluído.') as 'Exercicio 9' from scientists.projects;
-- Escreva uma query para exibir o nome e as horas dos três projetos com a maior quantidade de horas.
SELECT Name, Hours FROM projects
ORDER BY Hours DESC LIMIT 3;
-- Escreva uma query para exibir o código de todos os projetos da tabela AssignedTo sem que haja repetições.
SELECT DISTINCT Project FROM assignedto;
-- Escreva uma query para exibir o nome do projeto com maior quantidade de horas.
SELECT Name FROM projects
ORDER BY Hours DESC LIMIT 1;
-- Escreva uma query para exibir o nome do segundo projeto com menor quantidade de horas.
SELECT Name FROM projects
ORDER BY Hours LIMIT 1 OFFSET 1;
-- Escreva uma query para exibir todas as informações dos cinco projetos com a menor quantidade de horas.
SELECT * FROM projects
ORDER BY Hours LIMIT 5;
-- Escreva uma query que exiba a string "Existem Number cientistas na tabela Scientists.", em que Number se refira a quantidade de cientistas.
SELECT CONCAT('Existem ', COUNT(Name), ' cientistas na tabela Scientists.') AS 'Exercicio 15' FROM scientists.scientists;
