#Display the name of the animal, type of animal and breed (if available) for all of the animals who live with owners in our zip code (10012).
SELECT name, type, breed, zip FROM pets INNER JOIN addresses ON pets.address_id = addresses.address_id WHERE addresses.zip =10012;

#How many female cats are in the practice combined?
SELECT type, COUNT(type) FROM pets WHERE type = "cat" and sex = 'female';

#How many poodles are in the practice? (A poodle is a dog.)
SELECT type, breed, COUNT(breed) FROM pets WHERE type = "dog" and breed = 'poodle';

#List every dog and its owner on file by name in alphabetical order by the owners last name along with every immunization and the date.
# I assumed for this query he wanted all dogs, owners of the dogs ordered by last name and every immunization that each dog had. 
#for this query i was unable to join the results of the two queries because the results were in two separate tables. I tried creating a view for each of the results and then joining the two views but this did not produce the desired results
(SELECT pets.name, pets.type, owners.last_name FROM pets INNER JOIN owners ON owners.owner_id = pets.owner_id WHERE pets.type = "dog" ORDER BY owners.last_name DESC)
(SELECT immunizations.name,  immunizations.date FROM immunizations INNER JOIN pets ON immunizations.pet_id = pets.pet_id);
#HOWEVER the folowing query works, but in the prompt the professor said that we can use auto increment as the primary key which i did, if i used last name as the primary key assuming every owner has a unique name,
#this query would work with ower_id as the last name
SELECT pets.owner_id, pets.name, pets.type, immunizations.name, immunizations.date FROM pets INNER JOIN immunizations ON pets.pet_id = immunizations.pet_id WHERE pets.type = "dog" ORDER BY pets.owner_id ASC



#How much money has this veterinary practiced charged for immunizations for dogs during the current year?
SELECT SUM(cost) FROM immunizations INNER JOIN pets ON immunizations.pet_id = pets.pet_id WHERE date >= "2016-01-01" and pets.type = "dog";

SELECT owners.last_name, pets.name, pets.type, immunizations.name FROM owners, pets, immunizations WHERE pets.owner_id = owners.owner_id and pets.pet_id = immunizations.pet_id and pets.type = "dog" ORDER BY pets.owner_id ASC;
