CREATE DATABASE IMDB_analysis;
USE IMDB_analysis;

SELECT *
FROM messy_imdb_dataset;

#change the column names to be better
ALTER TABLE messy_imdb_dataset
RENAME COLUMN `IMBD title ID` TO ID;

ALTER TABLE messy_imdb_dataset
RENAME COLUMN `Original titlÊ` TO Title;

ALTER TABLE messy_imdb_dataset
RENAME COLUMN `Release year` TO ReleaseDate;

ALTER TABLE messy_imdb_dataset
RENAME COLUMN `Genrë¨` TO Genre;

ALTER TABLE messy_imdb_dataset
RENAME COLUMN `Content Rating` TO ContentRating;

#remove empty columns
ALTER TABLE messy_imdb_dataset
DROP COLUMN MyUnknownColumn;

#change id names to only numbers
UPDATE messy_imdb_dataset
SET ID = SUBSTRING(ID, LOCATE('tt', ID) + 2);

#check for duplicates
SELECT ID, COUNT(*)
FROM messy_imdb_dataset
GROUP BY ID
HAVING COUNT(*) >1;

SELECT Title, COUNT(*)
FROM messy_imdb_dataset
GROUP BY Title
HAVING COUNT(*) >1;

#remove empty rows
SELECT *
FROM messy_imdb_dataset
WHERE ID ="";

DELETE FROM messy_imdb_dataset
WHERE ID = "";

#fix year format
SELECT ReleaseDate
FROM messy_imdb_dataset;

SELECT ReleaseDate
FROM messy_imdb_dataset
WHERE ReleaseDate LIKE '__/__/____';

UPDATE messy_imdb_dataset
SET ReleaseDate = STR_TO_DATE(ReleaseDate, '%d/%m/%Y')
WHERE ReleaseDate LIKE '__/__/____';

UPDATE messy_imdb_dataset
SET ReleaseDate = STR_TO_DATE(ReleaseDate, '%d-%m-%Y')
WHERE ReleaseDate LIKE '%__-__-____%';

UPDATE messy_imdb_dataset
SET ReleaseDate = STR_TO_DATE(ReleaseDate, '%m %d %Y')
WHERE ReleaseDate LIKE '__ __ ____';

SELECT ReleaseDate
FROM messy_imdb_dataset
WHERE ReleaseDate REGEXP '[^0-9-]';

UPDATE messy_imdb_dataset
SET ReleaseDate = '2004-02-22'
WHERE ReleaseDate = '22 Feb 04';

UPDATE messy_imdb_dataset
SET ReleaseDate = '1996-12-23'
WHERE ReleaseDate = '23rd December of 1966 ';

UPDATE messy_imdb_dataset
SET ReleaseDate = '2003-1-16'
WHERE ReleaseDate = '01/16-03';

UPDATE messy_imdb_dataset
SET ReleaseDate = '1951-3-6'
WHERE ReleaseDate = 'The 6th of marzo, year 1951';

SELECT ReleaseDate
FROM messy_imdb_dataset
WHERE ReleaseDate NOT LIKE '____-__-__';

UPDATE messy_imdb_dataset
SET ReleaseDate = '1999-10-29'
WHERE ReleaseDate = '10-29-99';

UPDATE messy_imdb_dataset
SET ReleaseDate = '2003-01-16'
WHERE ReleaseDate = '2003-1-16';

UPDATE messy_imdb_dataset
SET ReleaseDate = '1946-11-21'
WHERE ReleaseDate = '21-11-46';

UPDATE messy_imdb_dataset
SET ReleaseDate = '1951-03-06'
WHERE ReleaseDate = '1951-3-6';

#search duration for missing values
SELECT Duration, Title
FROM messy_imdb_dataset
WHERE DURATION = "" OR Duration IS NULL
OR Duration REGEXP '[^0-9]'; 

UPDATE messy_imdb_dataset
SET Duration = 178
WHERE Duration = "178c";

UPDATE messy_imdb_dataset
SET Duration = 'Unknown'
WHERE DURATION = "" OR Duration IS NULL
OR Duration REGEXP '[^0-9]'; 

UPDATE messy_imdb_dataset
SET Duration = NULL
WHERE DURATION = "Unknown";

#fix country name format
SELECT Country
FROM messy_imdb_dataset;

SELECT Country
FROM messy_imdb_dataset
WHERE Country LIKE "%US%";

UPDATE messy_imdb_dataset
SET Country = "United States of America"
WHERE Country LIKE "%US%";

UPDATE messy_imdb_dataset
SET Country = "United Kingdom"
WHERE Country LIKE "%UK%";

UPDATE messy_imdb_dataset
SET Country = REGEXP_REPLACE(Country, '[0-9]', '');

UPDATE messy_imdb_dataset
SET Country = TRIM(Country);

#fix content rating
SELECT DISTINCT ContentRating, COUNT(*)
FROM messy_imdb_dataset
GROUP BY ContentRating;

UPDATE messy_imdb_dataset
SET ContentRating = "PG-13"
WHERE ContentRating LIKE "%PG%";

UPDATE messy_imdb_dataset
SET ContentRating = "Unknown"
WHERE ContentRating = "Unrated" OR ContentRating = "#N/A" OR ContentRating = "Not Rated";

SELECT DISTINCT ContentRating, Title
FROM messy_imdb_dataset
WHERE ContentRating = "Approved";

UPDATE messy_imdb_dataset
SET ContentRating = "R"
WHERE ContentRating = "Approved";

#check income, votes, and score
SELECT DISTINCT Income
FROM messy_imdb_dataset;

SELECT DISTINCT Income
FROM messy_imdb_dataset
WHERE Income REGEXP '[^0-9]';

UPDATE messy_imdb_dataset
SET Income =TRIM(Income);

UPDATE messy_imdb_dataset
SET Income = 408035783
WHERE Income = '4o8,035,783';

UPDATE messy_imdb_dataset
SET Income = 576000
WHERE Income = 576;

UPDATE messy_imdb_dataset
SET Income = REPLACE(Income, '$', '');

SELECT DISTINCT Votes
FROM messy_imdb_dataset
WHERE Votes REGEXP '[^0-9]';

UPDATE messy_imdb_dataset
SET Votes = REPLACE(votes, '.', '');

SELECT DISTINCT Votes
FROM messy_imdb_dataset;

SELECT DISTINCT Score
FROM messy_imdb_dataset;

SELECT DISTINCT Score
FROM messy_imdb_dataset
WHERE Score REGEXP '[^0-9.]';

UPDATE messy_imdb_dataset
SET Score =TRIM(Score);

UPDATE messy_imdb_dataset
SET Score = REPLACE(Score, "+", "");

UPDATE messy_imdb_dataset
SET Score = REPLACE(Score, ":", ".");

UPDATE messy_imdb_dataset
SET Score = REPLACE(Score, ",", ".");

UPDATE messy_imdb_dataset
SET Score = REPLACE(Score, "..", ".");

UPDATE messy_imdb_dataset
SET Score = 8.9
WHERE Score = "8.9f";

UPDATE messy_imdb_dataset
SET Score = 8.9
WHERE Score = '8.7e-0';

UPDATE messy_imdb_dataset
SET Score = 9.0
WHERE Score = '9.';

UPDATE messy_imdb_dataset
SET Score = 8.9
WHERE Score = '08.9';

UPDATE messy_imdb_dataset
SET Score = 8.1
WHERE Score = 81;

CREATE TABLE Cleaned_IMDB_Data 
SELECT *
FROM messy_imdb_dataset;

SELECT *
FROM Cleaned_IMDB_Data;