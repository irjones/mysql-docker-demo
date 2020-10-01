/* Tells which database to target for the INSERTs */
USE dogs;

/* Inserting breeds first since dog has a foreign key to breed */
INSERT INTO breed (name) 
VALUES ("Mix"), ("Doodle"), ("Not Specified");

/* Insert the dogs assuming that Mix has ID 1 and Doodle has ID 2 based on their creation order */
INSERT INTO dog (breedId, name) 
VALUES (1, "Indie"), (1, "Arya"), (2, "Cooper");