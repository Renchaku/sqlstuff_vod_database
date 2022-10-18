DROP TABLE vod_role;
DROP TABLE vod_actor;
DROP TABLE vod_film;
DROP TABLE vod_classification;
-- Dros them tables :) --

PURGE RECYCLEBIN;
-- I thnk it deletes the dropped tables

CREATE TABLE vod_classification (
dbClassId CHAR(3) NOT NULL,
dbDescription VARCHAR2(100) NOT NULL,
CONSTRAINT vod_classification_PK PRIMARY KEY (dbClassId)
);
-- Creates this table --
-- Primary key assigned ove ther --

CREATE TABLE vod_film (
dbFilmId NUMBER(4) NOT NULL,
dbTitle VARCHAR2(100) NOT NULL,
dbDirectorFirstname VARCHAR2(50) NOT NULL,
dbDirectorLastname VARCHAR2(50) NOT NULL,
dbGenre VARCHAR2(20),
dbUKReleaseDate DATE,
dbFilename VARCHAR2(50),
dbRuntime NUMBER(4),
dbClass CHAR(3),
CONSTRAINT vod_film_PK PRIMARY KEY (dbFilmId),
CONSTRAINT vod_film_class_FK FOREIGN KEY (dbClass) REFERENCES vod_classification (dbClassId)
ON DELETE SET NULL
);
-- Creates 'nother table --
-- Primary key + a foreign (like me) key --


INSERT INTO vod_classification (dbClassId, dbDescription) 
		VALUES ('U', 'Universal: Suitable for all');

INSERT INTO vod_classification (dbClassId, dbDescription)
 VALUES('PG','Parental Guidance: General viewing but some scenes may be unsuitable for young children');

INSERT INTO vod_classification (dbClassId, dbDescription)
		VALUES ('12', 'Suitable only for persons of 12 years or over');

INSERT INTO vod_classification (dbClassId, dbDescription)
		VALUES ('15', 'Suitable only for persons of 15 years or over');

INSERT INTO vod_classification (dbClassId, dbDescription)
		VALUES ('18', 'Suitable only for persons of 18 years or over');
-- *inserts data* --
INSERT INTO vod_film (dbFilmId, dbTitle, dbDirectorFirstname, dbDirectorLastname,
 dbGenre, dbUKReleaseDate, dbFilename, dbRuntime, dbClass)
VALUES (1, 'Toy Story 3', 'lee', 'unkrich', 'Comedy', '19-JUL-2010', 'ToyStory3.mpg', 103, 'U');

INSERT INTO vod_film (dbFilmId, dbTitle, dbDirectorFirstname, dbDirectorLastname,
 dbGenre, dbUKReleaseDate, dbFilename, dbRuntime, dbClass)
VALUES (2, 'Lord of the Rings: Fellowship of the Ring', 'peter', 'jackson', 'Fantasy', '19-DEC-2001', 'Fellowship.mpg', 178, '12');

INSERT INTO vod_film (dbFilmId, dbTitle, dbDirectorFirstname, dbDirectorLastname,
 dbGenre, dbUKReleaseDate, dbFilename, dbRuntime, dbClass)
VALUES (3, 'Lord of the Rings: Two Towers', 'peter', 'jackson', 'Fantasy', '18-DEC-2002', 'Towers.mpg', 179, '12');

INSERT INTO vod_film (dbFilmId, dbTitle, dbDirectorFirstname, dbDirectorLastname,
 dbGenre, dbUKReleaseDate, dbFilename, dbRuntime, dbClass)
VALUES (4, 'Lord of the Rings: Return of the King', 'peter', 'jackson', 'Fantasy', '17-DEC-2003', 'KingReturns.mpg', 201, '12');

INSERT INTO vod_film (dbFilmId, dbTitle, dbDirectorFirstname, dbDirectorLastname,
 dbGenre, dbUKReleaseDate, dbFilename, dbRuntime, dbClass)
VALUES (5, 'Face/Off', 'john', 'woo', 'Action', '7-NOV-1997', 'FaceOff.mpg', 138, '18');

INSERT INTO vod_film (dbFilmId, dbTitle, dbDirectorFirstname, dbDirectorLastname,
 dbGenre, dbUKReleaseDate, dbFilename, dbRuntime, dbClass)
VALUES (6, 'The Nutty Professor', 'tom', 'shadyac', 'Comedy', '4-OCT-1996', 'NuttyProf.mpg', 95, '12');
-- *inserts even more data* --
COMMIT;
-- Acts as a save function (?)

CREATE TABLE vod_actor (
dbActorId CHAR(4) NOT NULL,
dbFirstname VARCHAR2(50) NOT NULL,
dbLastname VARCHAR2(50) NOT NULL,
dbDateOfBirth DATE,
dbNationality VARCHAR2(30),
dbBiography CLOB,
CONSTRAINT vod_actor_PK PRIMARY KEY (dbActorId)
);
-- hello table --

CREATE TABLE vod_role (
dbFilmId NUMBER(4) NOT NULL,
dbActorId CHAR(4) NOT NULL,
dbCharacterName VARCHAR2(25) NOT NULL,
dbFirstAppearance NUMBER(6),
dbDescription CLOB,
CONSTRAINT vod_role_PK PRIMARY KEY (dbFilmId, dbActorId, dbCharacterName),
CONSTRAINT vod_role_film_FK FOREIGN KEY (dbFilmId) REFERENCES vod_film (dbFilmId)
ON DELETE CASCADE,
CONSTRAINT vod_role_actor_FK FOREIGN KEY (dbActorId) REFERENCES vod_actor (dbActorId)
ON DELETE CASCADE
); 
-- a table with goofy ahh foreign and a primary key --

COMMIT;

INSERT INTO vod_actor (dbActorId, dbFirstname, dbLastname, dbDateOfBirth, dbNationality, dbBiography)
VALUES ('1', 'Cate', 'Blanchett', '14-MAY-1969', 'Australian', 
'. . . she graduated from Australia''s National Institute of Dramatic Art in 1992 and in a little over a year had won both critical and popular acclaim . . .');

INSERT INTO vod_actor (dbActorId, dbFirstname, dbLastname, dbDateOfBirth, dbNationality, dbBiography)
VALUES ('2', 'Orlando', 'Bloom', '13-JAN-1977', 'English',
 '. . . at school he struggled in many courses because of dyslexia . . .');

INSERT INTO vod_actor (dbActorId, dbFirstname, dbLastname, dbDateOfBirth, dbNationality, dbBiography)
VALUES ('3', 'John', 'Travolta', '18-FEB-1954', 'American', '. . .  a singer, dancer and actor who holds licenses to fly jet aircrafts . . .');

INSERT INTO vod_actor (dbActorId, dbFirstname, dbLastname, dbDateOfBirth, dbNationality, dbBiography)
VALUES ('4', 'Nicolas', 'Cage', '7-JAN-1964', 'American', '. . . he is of Italian (father) and German, English, Scottish and Polish (mother) descent . . .');

INSERT INTO vod_actor (dbActorId, dbFirstname, dbLastname, dbDateOfBirth, dbNationality, dbBiography)
VALUES ('5', 'Eddie', 'Murphy', '3-APR-1961', 'American', '. . . his comic talent was evident from an early age and by 15 he was writing and performing his own routines at youth centers and local bars . . .');

INSERT INTO vod_actor (dbActorId, dbFirstname, dbLastname, dbDateOfBirth, dbNationality, dbBiography)
VALUES ('6', 'Daniel', 'Craig', '2-MAR-1968', 'English', '. . . as a struggling actor with the National Youth Theatre, he was toiling in restaurant kitchens and as a waiter . . .');

-- :) --

INSERT INTO vod_role (dbFilmId, dbActorId, dbCharacterName, dbFirstAppearance, dbDescription)
VALUES (2, '1', 'Galadriel', 76, '... The tall silver-golden haired elf queen uses telepathic powers to talk to Frodo and Boromir. She refuses the one ring and gifts Frodo the vial of reflected star light ...');

INSERT INTO vod_role (dbFilmId, dbActorId, dbCharacterName, dbFirstAppearance, dbDescription)
VALUES(3, '1', 'Galadriel', 6189, '... The soft commanding voice of Cate Blanchett talks telepathically to Elrond, the Elf Lord of Rivendell, to encourage him not to let others standalone against the dark forces of Sauron ...');

INSERT INTO vod_role (dbFilmId, dbActorId, dbCharacterName, dbFirstAppearance, dbDescription)
VALUES (5, '3', 'Sean Archer', 40, '... The FBI agent has a personal vendetta against terrorist Castor Troy after Troy kills Sean''s son ...');

INSERT INTO vod_role (dbFilmId, dbActorId, dbCharacterName, dbFirstAppearance, dbDescription)
VALUES (5, '4', 'Sean Archer', 2094, '... The FBI agent undergoes transplant surgery to assume the identity, physical appearance and voice of terrorist Caster Troy ...');

INSERT INTO vod_role (dbFilmId, dbActorId, dbCharacterName, dbFirstAppearance, dbDescription)
VALUES ( 6, '5', 'Professor Sherman Klump', 161, '... The obese nutty professor creates a fantastic genetic formula to make him slimmer in order to impress a female admirer, Carla Purty ...');

INSERT INTO vod_role (dbFilmId, dbActorId, dbCharacterName, dbFirstAppearance, dbDescription)
VALUES ( 6, '5', 'Buddy Love', 2079, '... The nutty professor''s alter ego is a lively testosterone-driven party animal made with Eddie Murphy''s characteristic higher pitched voice ...');

-- Basically done --

COMMIT;

-- I have no idea how this format here works, but does --

set linesize 256;
set wrap off;
set colsep " | "

column dbClassId format a10;
column dbDescription format a25;

column dbFilmId format 999;

-- I have no idea how this format here works, but does --

!\clear
-- Clears logs --

-- All tables output --
SELECT * FROM vod_classification;
SELECT * FROM vod_film;
SELECT * FROM vod_actor;
SELECT * FROM vod_role;

