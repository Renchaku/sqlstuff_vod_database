SELECT dbActorId AS "ID", dbFirstname AS "First Name", dbLastname AS "Last Name"
FROM vod_actor
WHERE vod_actor.dbActorId = '2';
-- Selects the actor that has his ID assigned as 2

SELECT dbFirstname AS "Actor First Name", dbLastname AS "Actor Last Name", dbNationality AS "Actor Nationality"
FROM vod_actor a WHERE a.dbNationality = 'English';
-- Selects all English actors

SELECT dbTitle AS "Title", dbClass AS "Class", dbGenre AS "Genre"
FROM vod_film f WHERE f.dbClass = 'U' OR f.dbGenre = 'Comedy';
-- Selects U rated or le funny films

SELECT dbTitle AS "Title", dbUKReleaseDate AS "Release Date", dbClass AS "Class" 
FROM vod_film WHERE dbUKReleaseDate < '01-01-2000' AND dbClass >= '15';
-- Selects all films before the 2000 for boomers and rated 15 or 18

SELECT dbTitle AS "Title", dbRuntime AS "Runtime"
FROM vod_film WHERE dbRuntime BETWEEN 100 AND 200;
-- selects movies that are between 100 and 200 minutes long

SELECT dbTitle AS "Title", dbUKReleaseDate AS "Release Date"
FROM vod_film WHERE dbUKReleaseDate BETWEEN '01-01-2000' AND '31-12-2005';
-- Movies between 2000 and 2005

SELECT dbDirectorFirstname AS "Dir. First Name", dbDirectorLastname AS "Dir. Last Name"
FROM vod_film WHERE dbDirectorFirstname LIKE 'j%';
-- Selects actors with J initial in their first name

SELECT dbTitle AS "Title" FROM vod_film
WHERE dbTitle LIKE 'Lord of the Rings:%';
-- Selects all Lord OF The Rings films

SELECT * FROM vod_actor 
WHERE dbNationality <> 'English' AND dbNationality <> 'Welsh' AND dbNationality <> 'Scottish';
-- Selects non-English actors

UPDATE vod_film
SET dbTitle = 'Toy Story Three', dbFilename = 'ToyStoryThree.mpg'
WHERE dbFilmId = 1;
-- Updates Toy Story 3 to Toy Story Three (idk y would someone do that) 

DELETE FROM vod_actor WHERE dbFirstname = 'Nicolas';
-- Deletes Nicolas data

DELETE FROM vod_classification WHERE dbClassId = '12';
-- Deletes data of ID 12

