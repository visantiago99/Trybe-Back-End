CREATE VIEW perfil_artistas AS 
SELECT A.artista AS 'artista', AL.album AS 'album', COUNT(*) AS 'seguidores'
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.seguidores AS S
ON S.artista_id = A.artista_id
INNER JOIN SpotifyClone.albuns AS AL
ON AL.artista_id = S.artista_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
