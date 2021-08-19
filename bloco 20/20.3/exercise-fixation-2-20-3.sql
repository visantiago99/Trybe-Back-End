-- Mostre todos os detalhes dos filmes que contêm a palavra ace no nome.
SELECT * FROM sakila.film
WHERE title LIKE '%ace%';
-- Mostre todos os detalhes dos filmes cujas descrições finalizam com china .
SELECT * FROM sakila.film
WHERE description LIKE '%china';
-- Mostre todos os detalhes dos dois filmes cujas descrições contêm a palavra girl e o título finaliza com a palavra lord .
-- Mostre os dois casos em que, a partir do 4° caractere no título do filme, tem-se a palavra gon .
-- Mostre o único caso em que, a partir do 4° caractere no título do filme, tem-se a palavra gon e a descrição contém a palavra Documentary .
-- Mostre os dois filmes cujos títulos ou finalizam com academy ou iniciam com mosquito .
-- Mostre os seis filmes que contêm as palavras monkey e sumo em suas descrições.