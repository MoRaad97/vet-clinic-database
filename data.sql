/* Populate database with sample data. */

INSERT INTO
  animals (
    name,
    date_of_birth,
    weight_kg,
    neutered,
    escape_attempts
  )
VALUES ('Agumon', date '2020-02-03',10.23,true,0),
  ('Gabumon', date '2018-11-15',8,true,2),
  ('Pikachu', date '2021-01-07',15.04,false,1),
  ('Devimon', date '2017-05-12',11,true,5),
  ('Charmander', date '2020-02-08',-11,false,0),
  ('Plantmon', date '2021-11-15',-5.7,true,2),
  ('Squirtle', date '1993-04-02',-12.13,false,3),
  ('Angemon', date '2005-06-12',-45,true,1),
  ('Boarmon', date '2005-06-07',20.4,true,7),
  ('Blossom', date '1998-10-13',17,true,3),
  ('Ditto', date '2022-05-14',22,true,4)
;

INSERT INTO
  owners (
    full_name,
    age
  )
VALUES ('Sam Smith',34),
('Jennifer Orwell ',19),
('Bob ',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38)
;

INSERT INTO
  species (name)
VALUES ('Pokemon'),
('Digimon')
;


UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS null;

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name In ('Gabumon','Pikachu');
UPDATE animals SET owners_id = 3 WHERE name In ('Devimon','Plantmon');
UPDATE animals SET owners_id = 4 WHERE name In ('Charmander','Blossom','Squirtle');
UPDATE animals SET owners_id = 5 WHERE name In ('Boarmon','Angemon');




-- insert data 

-- vets table data
INSERT INTO
  vets (
    name,
    age,
    date_of_graduation
  )
VALUES ('William Tatcher',45, date '2000-04-23'),
('Maisy Smith',26 , date '2019-01-17'),
('Stephanie Mendez',64 , date '1981-05-04'),
('Jack Harkness',38 , date '2008-07-08')
;


-- specialties table data
INSERT INTO
  specializations (
    species_id,
    vets_id
  )
VALUES (1,1),(1,3),(2,3),(2,4);


-- visits table data
INSERT INTO
  visits (
    animals_id,
    vets_id,
    visit_date
  )
VALUES (1,1, date '2020-05-24'),
(1,3, date '2020-07-22'),
(2,4, date '2021-02-02'),
(3,2, date '2020-01-05'),
(3,2, date '2020-03-08'),
(3,2, date '2020-05-14'),
(4,3, date '2021-05-04'),
(5,4, date '2021-02-24'),
(6,2, date '2019-12-21'),
(6,1, date '2020-08-10'),
(6,2, date '2021-04-07'),
(7,3, date '2019-09-29'),
(8,4, date '2020-10-03'),
(8,4, date '2020-11-04'),
(9,2, date '2019-01-24'),
(9,2, date '2019-05-15'),
(9,2, date '2020-02-27'),
(9,2, date '2020-08-03'),
(10,3, date '2020-05-24'),
(10,1, date '2021-01-11')
;


DELETE FROM animals;
DELETE FROM visits;
DELETE FROM owners;

