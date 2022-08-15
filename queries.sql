/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon'; 
SELECT * FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-12';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu' ;
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

--part 2
 Select COUNT(*) AS number_of_animals FROM animals;
 Select escape_attempts, COUNT(*) FROM animals GROUP BY escape_attempts HAVING escape_attempts = 0;
 SELECT AVG(weight_kg) AS average_weight FROM animals;
 Select neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
 SELECT MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals;
 SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';