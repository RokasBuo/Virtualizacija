CREATE TABLE Numbers
(
 PersonID INTEGER,
 CompanyID INTEGER,
 CallNumber VARCHAR (32) NOT NULL,
 CallType VARCHAR (32) NOT NULL,
 CallCountry VARCHAR (128)
);

INSERT INTO Numbers VALUES (0, 0, '123456789', 'skype', 'Djibouti');
INSERT INTO Numbers VALUES (1, NULL, '123456780', 'phone', NULL);

CREATE TABLE Person
(
 ID INTEGER,
 FirstName VARCHAR(128) NOT NULL,
 LastName VARCHAR(128) NOT NULL,
 Description VARCHAR(255),
 PRIMARY KEY(ID)
);

INSERT INTO Person VALUES (0, 'Bryan', 'Damage', 'Is Damaged');
INSERT INTO Person VALUES (1, 'Mr.', 'Generic', NULL);

CREATE TABLE Company
(
 ID INTEGER,
 Name VARCHAR(128) NOT NULL,
 Address VARCHAR(128),
 Description VARCHAR(255),
 PRIMARY KEY(ID)
);

INSERT INTO Company VALUES (0, 'UAB Legendos', 'Konstitucijos pr. 1337', 'Legit company');

CREATE TABLE Product
(
 ID INTEGER,
 Name VARCHAR(128) NOT NULL,
 Description VARCHAR(255),
 Price DECIMAL(10, 2) NOT NULL,
 PRIMARY KEY(ID)
);

INSERT INTO Product VALUES (1, 'Phonebook', 'A book with pictures of phones', 12.34);
