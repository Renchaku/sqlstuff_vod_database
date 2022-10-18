SELECT dbFirstname || ', ' || dbLastname AS "Full Name", ROUND((SYSDATE - dbDateOfBirth)/365, 1) AS "Age" from vod_actor
ORDER BY dbDateOfBirth ASC;
-- Calculates age of actors
