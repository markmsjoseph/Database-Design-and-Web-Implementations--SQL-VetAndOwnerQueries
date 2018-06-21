

CREATE TABLE vets (
	 vet_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 first_name VARCHAR(50) NOT NULL,
	 last_name VARCHAR(50) NOT NULL,
	 mobile INT(12) NOT NULL,
	 email VARCHAR(50) NOT NULL,
	 PRIMARY KEY (vet_id)
);

LOAD DATA LOCAL INFILE 'vet.csv' 
INTO TABLE vets
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(first_name, last_name, mobile, email);







CREATE TABLE addresses (
	 address_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 street VARCHAR(50) NOT NULL,
	 city VARCHAR(50) NOT NULL,
	 zip INT(12) NOT NULL,
	 PRIMARY KEY (address_id)
);

LOAD DATA LOCAL INFILE 'owner_address.csv' 
INTO TABLE addresses 
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(street, city, zip);








CREATE TABLE immunizations (
	 immunization_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 cost INT(12) NOT NULL,
	 name VARCHAR(50) NOT NULL,
	 date DATE NOT NULL,
	 pet_id INT(11) NOT NULL,
	 PRIMARY KEY (immunization_id)
);

LOAD DATA LOCAL INFILE 'immunization.csv' 
INTO TABLE immunizations 
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(cost, name, date, pet_id);








CREATE TABLE owners (
	 owner_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 first_name VARCHAR(50) NOT NULL,
	 last_name VARCHAR(50) NOT NULL,
	 mobile INT(12) NOT NULL,
	 email VARCHAR(50) NOT NULL,
	 address_id INT(11) NOT NULL,
	 PRIMARY KEY (owner_id)
);

LOAD DATA LOCAL INFILE 'owner.csv' 
INTO TABLE owners 
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(first_name, last_name, mobile, email, address_id);








CREATE TABLE pets (
	 pet_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	 name VARCHAR(50) NOT NULL,
	 type VARCHAR(25) NOT NULL,
	 breed VARCHAR(25) NULL DEFAULT NULL,
	 sex VARCHAR(7) NOT NULL,
	 date_of_birth DATE DEFAULT NULL,
	 vet_id INT(12) NOT NULL,
	 owner_id INT(12) NOT NULL,
	 address_id INT(12) NOT NULL,
	 PRIMARY KEY (pet_id)
);

LOAD DATA LOCAL INFILE 'pet.csv' 
INTO TABLE pets 
FIELDS TERMINATED BY ',' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name, type, breed, sex, date_of_birth, vet_id, owner_id, address_id);





