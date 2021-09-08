CREATE VIEW estatisticas_musicais AS
SELECT 
(
SELECT COUNT(musica_id) FROM SpotifyClone.musicas
) AS cancoes,
(
SELECT COUNT(DISTINCT artista_id) FROM SpotifyClone.artistas
) AS artistas,
(
SELECT COUNT(*) FROM SpotifyClone.albuns
) AS albuns;
