-- Insira um novo funcionário na tabela sakila.staff .
-- Para saber quais campos são obrigatórios, clique com o botão direito na tabela sakila.staff e selecione "Table Inspector". Clique na aba "columns" e verifique quais campos aceitam nulos para te guiar. Lembre-se de que valores que são gerados automaticamente não precisam ser inseridos manualmente. Boa explorada!
INSERT INTO sakila.staff
(first_name, last_name, address_id, email, store_id, active, username, password)
VALUES
('xablau', 'xablozo', 5, 'xablz@gmail.com', 1, 1, 'xau', 'senhaxau'),
-- Feito o exercício anterior, vamos agora para o nível 2. Insira dois funcionários novos em apenas uma query .
INSERT INTO sakila.staff
(first_name, last_name, address_id, email, store_id, active, username, password)
VALUES
('xablau', 'xablozo', 5, 'xablz@gmail.com', 1, 1, 'xau', 'senhaxau'),
('senior', 'sessoro', 6, 'saudozo@gmail.com', 1, 5, 'seseirei', 'senhasenso');
-- Selecione os cinco primeiros nomes e sobrenomes da tabela sakila.customer e cadastre essas pessoas como atores na tabela sakila.actor .
INSERT INTO sakila.actor (first_name, last_name)
    SELECT first_name, last_name FROM sakila.customer LIMIT 5;
-- Cadastre três categorias de uma vez só na tabela sakila.category .
INSERT INTO sakila.category(name)
VALUES('XABLAU'), ('VICTOR'), ('SANTIAGO')
-- Cadastre uma nova loja na tabela sakila.store .
