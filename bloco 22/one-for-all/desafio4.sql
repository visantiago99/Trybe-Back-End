CREATE VIEW top_3_artistas AS 
SELECT A.artista AS 'artista', COUNT(S.usuario_id) AS 'seguidores'
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.seguidores AS S
ON S.artista_id = A.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
