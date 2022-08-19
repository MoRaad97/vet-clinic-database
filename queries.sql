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
  JOIN owners
  ON animals.owners_id = (SELECT owners_id FROM owners WHERE owners.full_name = 'Dean Winchester')
  WHERE escape_attempts = 0;

  --Who owns the most animals?MAX(animalsnum)
  SELECT owners.full_name, COUNT(animals.owners_id) AS number_of_animals
  FROM animals 
  JOIN owners ON animals.owners_id = owners.owners_id
  GROUP BY owners.full_name
  ORDER BY number_of_animals DESC 
  LIMIT 1;



  -- PART 4

-- Who was the last animal seen by William Tatcher?

  SELECT vets.name, animals.name As animal_name, visit_date FROM visits 
  JOIN vets ON visits.vets_id = vets.vets_id
  JOIN animals ON animals.id = visits.animals_id
  WHERE vets.name = 'William Tatcher' ORDER BY visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
  SELECT vets.name, COUNT(animals.name) As number_of_animals FROM visits 
  JOIN vets ON visits.vets_id = vets.vets_id
  JOIN animals ON animals.id = visits.animals_id
  WHERE vets.name = 'Stephanie Mendez' 
  GROUP BY vets.name;
  
-- List all vets and their specialties, including vets with no specialties.
  SELECT vets.name, species.name AS specialties FROM vets 
   LEFT JOIN specializations ON specializations.vets_id = vets.vets_id
   LEFT JOIN species ON species.species_id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
   SELECT vets.name, animals.name As animal_name, visits.visit_date FROM animals 
   JOIN visits ON visits.animals_id = animals.id
   JOIN vets ON vets.vets_id = visits.vets_id
   WHERE vets.name = 'Stephanie Mendez' 
   AND visits.visit_date 
   BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
  SELECT animals.name,  COUNT(visits.animals_id) AS num_of_visits FROM visits 
  JOIN animals ON animals.id = visits.animals_id
  GROUP BY animals.name
  ORDER BY num_of_visits DESC LIMIT 1
  ;
-- Who was Maisy Smith's first visit?
  SELECT vets.name, animals.name As animal_name, visits.visit_date FROM animals 
   JOIN visits ON visits.animals_id = animals.id
   JOIN vets ON vets.vets_id = visits.vets_id

SELECT vets.name, animals.name , visits.visit_date FROM visits
JOIN vets ON vets.vets_id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith' 
ORDER BY visits.visit_date LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
  SELECT animals.*, vets.*, visits.visit_date FROM visits
    JOIN vets ON vets.vets_id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
    ORDER BY visits.visit_date DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(species_id) FROM ( SELECT species.species_id, specialize_table.specialize
  FROM visits
  JOIN animals ON  visits.animals_id = animals.id
  JOIN species ON animals.species_id = species.species_id
  JOIN ( SELECT  vets.vets_id,specializations.species_id As specialize
  FROM vets LEFT JOIN specializations ON specializations.vets_id = vets.vets_id ) AS specialize_table
  ON specialize_table.vets_id = visits.vets_id
  WHERE visits.vets_id <> 3 ) AS main
  WHERE species_id <> specialize OR specialize IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name FROM species
 JOIN (SELECT MAX(species_id) FROM ( SELECT species.species_id, specialize_table.specialize
  FROM visits
  JOIN animals ON  visits.animals_id = animals.id
  JOIN species ON animals.species_id = species.species_id
  JOIN ( SELECT  vets.vets_id,specializations.species_id As specialize
  FROM vets LEFT JOIN specializations ON specializations.vets_id = vets.vets_id ) AS specialize_table
  ON specialize_table.vets_id = visits.vets_id
  WHERE visits.vets_id = 2 ) AS main) As species_id_table
  ON species.species_id = species_id_table.max;
