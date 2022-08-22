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

CREATE TABLE vets (
	vets_id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
	species_id BIGINT REFERENCES  species(species_id),
	vets_id BIGINT REFERENCES vets(vets_id),
	PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits (
	animals_id BIGINT REFERENCES  animals(id),
	vets_id BIGINT REFERENCES vets(vets_id),
    visit_date DATE NOT NULL,
	PRIMARY KEY (animals_id, vets_id, visit_date)
);

ALTER TABLE visits 
RENAME COLUMN animals_id TO animal_id;
ALTER TABLE visits 
RENAME COLUMN visit_date TO date_of_visit;
ALTER TABLE visits 
RENAME COLUMN vets_id TO vet_id;


ALTER TABLE owners 
ALTER COLUMN age 
DROP NOT NULL;

ALTER TABLE visits
  DROP CONSTRAINT visits_pkey;

INSERT INTO visits (animal_id, vet_id, date_of_visit)
 SELECT * FROM (SELECT id FROM animals) animal_ids, 
 (SELECT vets_id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') 
 visit_timestamp;

 insert into owners (full_name, email)
  select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


CREATE INDEX animal_id ON visits (animal_id);

CREATE INDEX vet_id ON visits (vet_id);

CREATE INDEX owner_email ON owners (email);
