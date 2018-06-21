mysql> select * from vets;
+--------+------------+-----------+------------+-------------------------------+
| vet_id | first_name | last_name | mobile     | email                         |
+--------+------------+-----------+------------+-------------------------------+
        || tom        | cruise    | 1239483029 | tomcruise@hotmail.com
 |     2 | maria      | carey     | 2147483647 | webelongTogether@hotmail.com
|      3 | halley     | berry     | 2147483647 | hallyBerry@hotmail.com        |
+--------+------------+-----------+------------+-------------------------------+
3 rows in set (0.01 sec)

mysql> select * from owners;
+----------+------------+-------------+------------+------------------------+------------+
| owner_id | first_name | last_name   | mobile     | email                  | address_id | 
+----------+------------+-------------+------------+------------------------+------------+
|        1 | mark       | thomas      | 2147483647 | mt@yahoo.com           |          1 |      
|        2 | patrick    | star        | 2147483647 | 3454543@hotmail.com    |          2 |      
|        3 | spongebob  | squarepants | 2147483647 | bikinibottom@gmail.com |          3 |      
|        4 | garry      | snailster   | 2147483647 | meow@yahoo.com         |          4 |      
|        5 | amanda     | thomas      | 2147483647 | sdfdsf@aol.com         |          5 |      
+----------+------------+-------------+------------+------------------------+------------+
5 rows in set (0.00 sec)

mysql> select * from addresses;
+------------+--------------+-------------+-------+
| address_id | street       | city        | zip   |
+------------+--------------+-------------+-------+
|          1 | west 4th     | new york    | 10012 |
|          2 | 9th street   | new york    | 10012 |
|          3 | meyer street | new york    | 10012 |
|          4 | mercer       | jersey city |  7306 |
|          5 | baldwin      | hoboken     |  3241 |
+------------+--------------+-------------+-------+
5 rows in set (0.00 sec)

mysql> select * from immunizations;
+-----------------+------+---------------+------------+--------+
| immunization_id | cost | name          | date       | pet_id |
+-----------------+------+---------------+------------+--------+
|               1 |  400 | ebola         | 2013-05-21 |      2 |
|               2 |  100 | chicken pocks | 2015-10-04 |      1 |
|               3 |  125 | birdflu       | 2005-04-13 |      4 |
|               4 |  600 | ebola         | 2007-12-11 |      5 |
|               5 |  123 | swine flu     | 2004-03-06 |      3 |
|               6 |  125 | ebola         | 2005-05-03 |      4 |
|               7 |  100 | mad cow       | 2007-05-10 |      1 |
+-----------------+------+---------------+------------+--------+
7 rows in set (0.00 sec)

mysql> select * from pets;
+--------+-------+------+-----------------+--------+---------------+--------+----------+------------+
| pet_id | name  | type | breed           | sex    | date_of_birth | vet_id | owner_id | address_id |
+--------+-------+------+-----------------+--------+---------------+--------+----------+------------+
|      1 | tom   | dog  | poodle          | male   | 2013-05-11    |      1 |        1 |          1 |
|      2 | garry | dog  | poodle          | female | 2011-06-21    |      3 |        2 |          2 |
|      3 | bil   | cat  |                 | female | 2005-03-10    |      2 |        3 |          3 |
|      4 | spike | dog  | pitbull         | male   | 2007-09-12    |      1 |        4 |          4 |
|      5 | super | dog  | german sheppard | female | 2015-02-02    |      3 |        5 |          5 |
+--------+-------+------+-----------------+--------+---------------+--------+----------+------------+
5 rows in set (0.01 sec)

mysql> 


mysql> SELECT name, type, breed, zip FROM pets INNER JOIN addresses ON pets.address_id = addresses.address_id WHERE addresses.zip =10012;
+-------+------+--------+-------+
| name  | type | breed  | zip   |
+-------+------+--------+-------+
| tom   | dog  | poodle | 10012 |
| garry | dog  | poodle | 10012 |
| bil   | cat  |        | 10012 |
+-------+------+--------+-------+
3 rows in set (0.01 sec)

mysql> SELECT type, COUNT(type) FROM pets WHERE type = "cat" and sex = 'female';
+------+-------------+
| type | COUNT(type) |
+------+-------------+
| cat  |           1 |
+------+-------------+
1 row in set (0.01 sec)

mysql> SELECT type, breed, COUNT(breed) FROM pets WHERE type = "dog" and breed = 'poodle';
+------+--------+--------------+
| type | breed  | COUNT(breed) |
+------+--------+--------------+
| dog  | poodle |            2 |
+------+--------+--------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(cost) FROM immunizations INNER JOIN pets ON immunizations.pet_id = pets.pet_id WHERE date >= "2016-01-01" and pets.type = "dog";
+-----------+
| SUM(cost) |
+-----------+
|      NULL |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT pets.name, pets.type, owners.last_name FROM pets INNER JOIN owners ON owners.owner_id = pets.owner_id WHERE pets.type = "dog" ORDER BY owners.last_name DESC;
+-------+------+-----------+
| name  | type | last_name |
+-------+------+-----------+
| super | dog  | thomas    |
| tom   | dog  | thomas    |
| garry | dog  | star      |
| spike | dog  | snailster |
+-------+------+-----------+
4 rows in set (0.01 sec)

mysql> SELECT immunizations.name,  immunizations.date FROM immunizations INNER JOIN pets ON immunizations.pet_id = pets.pet_id;
+---------------+------------+
| name          | date       |
+---------------+------------+
| chicken pocks | 2015-10-04 |
| mad cow       | 2007-05-10 |
| ebola         | 2013-05-21 |
| swine flu     | 2004-03-06 |
| birdflu       | 2005-04-13 |
| ebola         | 2005-05-03 |
| ebola         | 2007-12-11 |
+---------------+------------+
7 rows in set (0.00 sec)

