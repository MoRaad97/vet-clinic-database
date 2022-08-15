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
  ('Angemon', date '2005-06-07',20.4,true,7),
  ('Blossom', date '1998-10-13',17,true,3),
  ('Ditto', date '2022-5-14',22,true,4)
;