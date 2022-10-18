SELECT DISTINCT dbFirstname AS "First Name", dbLastname AS "Last Name", dbCharacterName AS "Character Name"
FROM vod_actor a, vod_role r
WHERE a.dbActorId = r.dbActorId;
-- Merges actor and role tables

SELECT dbFirstname AS "First Name", dbLastname AS "Last Name", dbTitle AS "Title", dbCharacterName AS "Character Name"
FROM vod_actor a, vod_role r, vod_film f
WHERE a.dbActorId = r.dbActorId AND f.dbFilmId = r.dbFilmId;
-- Merges Actor, Role and Film table to display actor names and character names from the film

SELECT DISTINCT dbFirstname AS "First Name", dbLastname AS "Last Name", dbCharacterName AS "Character Name"
FROM vod_actor a
INNER JOIN  vod_role r ON a.dbActorId = r.dbActorId;
-- First one but uses INNER JOIN

SELECT dbFirstname AS "First Name", dbLastname AS "Last Name", dbTitle AS "Title", dbCharacterName AS "Character Name"
FROM (vod_actor a INNER JOIN vod_role r ON a.dbActorId = r.dbActorId)
INNER JOIN vod_film f ON f.dbFilmId = r.dbFilmId;
-- Second one but it's INNER JOIN hell