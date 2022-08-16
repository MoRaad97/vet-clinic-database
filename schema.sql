/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempts INT NOT NULL,
	neutered BOOLEAN NOT NULL,
	weight_kg DECIMAL(5,2) NOT NULL,
);

ALTER TABLE animals ADD species varchar(50);

CREATE TABLE owners (
	owners_id BIGSERIAL NOT NULL PRIMARY KEY,
	full_name VARCHAR(255) NOT NULL,
	age INT NOT NULL
);

CREATE TABLE species (
	species_id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

BEGIN;
ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id BIGINT;
ALTER TABLE animals ADD owners_id BIGINT;
COMMIT;

ALTER TABLE animals 
ADD CONSTRAINT fk_species
FOREIGN KEY(species_id) 
REFERENCES species(species_id);

ALTER TABLE animals 
ADD CONSTRAINT fk_owners
FOREIGN KEY(owners_id) 
REFERENCES owners(owners_id);
