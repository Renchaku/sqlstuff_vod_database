SELECT COUNT(*)
FROM vod_film;
-- Counts everything ig

SELECT COUNT(DISTINCT dbFirstname) AS "Actors count"
FROM vod_actor;
-- Counts how many actors

SELECT COUNT(DISTINCT dbFilmId) AS "Films directed by Peter Jackson" FROM vod_film 
WHERE dbDirectorFirstname = 'peter' AND dbDirectorlastname = 'jackson';
-- Counts how many films were directed by Peter (hello peter)

SELECT COUNT(DISTINCT dbActorId) AS "Actors active in listed films" FROM vod_role;
-- Counts how many actors were actually assigned to the listed films

SELECT MIN(dbRuntime) AS "Shortest Runtime",
MAX(dbRuntime) AS "Longest Runtime",
AVG(dbRuntime) AS "Average Runtime"
FROM vod_film;
-- Displays Min, Max and average runtime of all films

SELECT SUM(dbRuntime) AS "Lord of the Rings trilogy runtime" FROM vod_film
WHERE dbTitle LIKE 'Lord of the Rings%';
-- Display the total time wasted watching all the Lord of the Rings

SELECT dbGenre AS "Genre", COUNT(dbFilmId) "Count"
FROM vod_film GROUP BY dbGenre;
-- Lists the amount of films in each genre

SELECT dbNationality AS "Nationality", COUNT(dbActorId) AS "Count" 
FROM vod_actor GROUP BY dbNationality;
-- Lists the count of actors' nationality

SELECT dbGenre AS "Genre", SUM(dbRuntime) AS "Total runtime"
FROM vod_film GROUP BY dbGenre;
-- Total runtime for each genre

SELECT dbNationality AS "Nationality (>1 actors)", COUNT(dbActorId) AS "Count"
FROM vod_actor GROUP BY dbNationality HAVING COUNT(dbActorId)>1;
-- Like 2 commands ago, but only displays the nationality with more than 1 actor
 
SELECT dbGenre AS "Genre (>6 hours total runtime)", SUM(dbRuntime) AS "Total runtime"
FROM vod_film GROUP BY dbGenre
HAVING SUM(dbRuntime) >=360;
-- Lists only the genre with more than 6 hours of runtime and the amount of total runtime



