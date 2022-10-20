SELECT * FROM vod_actor;
-- Very basic select all

SELECT dbTitle || ',	' || dbFilename AS Film FROM vod_film;
-- Displays filename next to the film name

SELECT DISTINCT dbGenre AS MovieGenre FROM vod_film;
-- Displays all genre from the movies without dupes

SELECT DISTINCT dbNationality FROM vod_actor;
-- Here all the nationalites of all actors, no idea why would they recycle previous task 

SELECT dbClassId || ' - ' || dbDescription AS Full_classification FROM vod_classification;
-- Displays all the film age rating under table named Full_classification, the _ ugly af

SELECT dbFirstname || ' ' || dbLastname AS "Actors Full Name" FROM vod_actor;
-- Displays full name of actos with an actual good looking table title

SELECT dbUKReleaseDate FROM vod_film;
-- Selects the Date from da table

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY';
SELECT dbUKReleaseDate FROM vod_film;
-- Alters the date format output (beta solution)

SELECT dbTitle AS "Title", EXTRACT(YEAR FROM dbUKReleaseDate) AS "Release Year" FROM vod_film;
-- Selects the YEAR from date + title and custom table name (absolute gigachad solution)

SELECT dbTitle AS "Title", dbFilename AS "File name", dbUKReleaseDate AS "UK Date" FROM vod_film
ORDER BY dbUKReleaseDate;
-- Lists the films by release date (Ascending)

SELECT * FROM vod_actor
ORDER BY dbLastname , dbFirstname;
-- All actor details ordered by last name and first name alphabetical order

SELECT * FROM vod_actor
ORDER BY dbLastname DESC, dbFirstname DESC;
-- Like before but in descending order

SELECT INITCAP(dbDirectorLastname) || ' : ' || dbTitle AS "Directed Films"
FROM vod_film
ORDER BY dbDirectorLastname, dbTitle;
-- Does something, too complex to care

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YY';
-- Alters date back to normal

SELECT dbFirstname AS "Actor first name", dbLastname AS "Actor last name" FROM vod_actor
WHERE dbActorId = 2;
-- Finds detail of actor w/ ID 2

SELECT dbFirstname AS "Actor first name", dbLastname AS "Actor last name" FROM vod_actor WHERE dbNationality = 'English';
-- Selects english actors

SELECT dbTitle FROM vod_film
WHERE dbClass = 'U' OR dbGenre = 'comedy';
-- Selects funny or U rated
