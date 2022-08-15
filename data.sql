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
  ('Devimon', date '2017-05-12',11,true,5)
;