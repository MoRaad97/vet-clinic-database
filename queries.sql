/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon'; 
SELECT * FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-12';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu' ;
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/* #1 Transaction Action*/
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

/* #2 Transaction Action*/
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
SELECT * FROM animals;
COMMIT;

/* #3 Transaction Action*/
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* #4 Transaction Action*/
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = "weight_kg" * -1;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals SET weight_kg = "weight_kg" * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;


 Select COUNT(*) AS number_of_animals FROM animals;
 Select escape_attempts, COUNT(*) FROM animals GROUP BY escape_attempts HAVING escape_attempts = 0;
 SELECT AVG(weight_kg) AS average_weight FROM animals;
 Select neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
 SELECT MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals;
 SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';


 --Part 3
 -- What animals belong to Melody Pond?
  SELECT animals.name, owners.full_name As Owner
  FROM animals
  JOIN owners ON animals.owners_id = owners.owners_id 
  WHERE animals.owners_id = 4;

-- List of all animals that are pokemon (their type is Pokemon).
  SELECT animals.name, species.name As Species
  FROM animals
  JOIN species ON animals.species_id = species.species_id
  WHERE animals.species_id = 1;

-- List all owners and their animals, remember to include those that don't own any animal.
  SELECT owners.full_name, animals.name  
  FROM owners
  LEFT JOIN animals ON owners.owners_id = animals.owners_id;
 
--  How many animals are there per species?
  SELECT species.name, COUNT(animals.species_id)
  FROM animals 
  JOIN species ON animals.species_id = species.species_id
  GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
  SELECT owners.full_name, animals.name  
  FROM animals
  LEFT JOIN owners ON owners.owners_id = animals.owners_id
  WHERE owners.owners_id = 2 AND animals.species_id = 2;

  --List all animals owned by Dean Winchester that haven't tried to escape.
  SELECT owners.full_name As the_owner, animals.name  
  FROM animals
  JOIN owners ON animals.owners_id = (SELECT owners_id FROM owners WHERE owners.full_name = 'Dean Winchester')
  WHERE escape_attempts = 0;

  --Who owns the most animals?MAX(animalsnum)
  SELECT owners.full_name, COUNT(animals.owners_id) AS number_of_animals
  FROM animals 
  JOIN owners ON animals.owners_id = owners.owners_id
  GROUP BY owners.full_name
  ORDER BY number_of_animals DESC 
  LIMIT 1;
 