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
  ('Ditto', date '2022-5-14',22,true,4)
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