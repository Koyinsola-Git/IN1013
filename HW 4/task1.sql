DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet
(
  petname VARCHAR(20) NOT NULL PRIMARY KEY,
  owner VARCHAR(45) NOT NULL,
  species VARCHAR(45) NOT NULL,
  gender ENUM('M','F'),
  birth DATE NOT NULL,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(15),
  eventdate DATE,
  eventtype VARCHAR(255),
  remark VARCHAR(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE,
  PRIMARY KEY (petname,eventdate)
);
