CREATE VIEW historico_reproducao_usuarios AS
SELECT U.usuario AS 'usuario', M.musica_nome AS 'nome'
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.usuarios AS U
ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.musicas AS M
ON M.musica_id = H.musica_id
ORDER BY U.usuario, M.musica_nome;
