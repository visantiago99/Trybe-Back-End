CREATE VIEW top_2_hits_do_momento AS 
SELECT M.musica_nome AS 'cancao', COUNT(H.usuario_id) AS 'reproducoes'
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico AS H
ON M.musica_id = H.musica_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
