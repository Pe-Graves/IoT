-- 2)
DROP TABLE IF EXISTS mesure;
DROP TABLE IF EXISTS ref_capteur;
DROP TABLE IF EXISTS capteur;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS piece;
DROP TABLE IF EXISTS logement;
DROP TABLE IF EXISTS facture;
DROP TABLE IF EXISTS adresse;
 
CREATE TABLE adresse
(
  -- Clé primaire
  id INT NOT NULL PRIMARY KEY,
  typeVoie INT NOT NULL,
  nom TEXT NOT NULL,
  numero INT NOT NULL,
  logementId INTEGER NOT NULL,
  FOREIGN KEY (logementId) references logement(id)
);
CREATE TABLE facture
(
  -- Clé primaire
  id INTEGER PRIMARY KEY NOT NULL,
  type_facture TEXT NOT NULL,
  montant MONEY NOT NULL,
  valeur_consommee REAL NOT NULL,
  unit TEXT NOT NULL,
  numero INT NOT NULL,
  logement_id INTEGER NOT NULL,
  FOREIGN KEY (logement_id) references logement(id)
);
CREATE TABLE logement
(
  -- Clé primaire
  id INTEGER PRIMARY KEY NOT NULL,
  telephone INTEGER,
  ip INTEGER,
  date_insertion TIMESTAMP NOT NULL
 
);
CREATE TABLE piece
(
  -- Clé primaire
  id INTEGER PRIMARY KEY NOT NULL,
  z INTEGER NOT NULL,
  logement_id INTEGER NOT NULL,
  FOREIGN KEY (logement_id) references logement(id)
);
CREATE TABLE position
(
-- Clé primaire
  id INTEGER PRIMARY KEY NOT NULL,
  position_id INT NOT NULL,
  x  INTEGER NOT NULL,
  y  INTEGER NOT NULL,
  FOREIGN KEY (position_id) references piece(id)
);
CREATE TABLE capteur
(
  -- Clé primaire
  id INTEGER PRIMARY KEY NOT NULL,
  port INTEGER NOT NULL,
  date_cap INTEGER,--NOT NULL,
  ref_id INTEGER NOT NULL, --capteur
  FOREIGN KEY (ref_id) references ref_capteur(id)
);

CREATE TABLE ref_capteur(
  -- Clé primaire
  id INTEGER PRIMARY KEY NOT NULL,
  type TEXT,
  ref_commerciale TEXT
);

CREATE TABLE mesure(
  id INTEGER PRIMARY KEY NOT NULL,
  date INTEGER NOT NULL,
  capteur_id INTEGER NOT NULL,
  FOREIGN KEY (capteur_id) references capteur(id)
);
--3)
INSERT INTO logement VALUES(0,06113737,180000000,1);
INSERT INTO logement VALUES(1,06113737,180000000,1);
 
--5)
 
INSERT INTO ref_capteur VALUES(0,'actionneur1','tres bon actionneur1');
INSERT INTO ref_capteur VALUES(1,'actionneur2','tres bon actionneur2');
INSERT INTO ref_capteur VALUES(2,'actionneur','moyen actionneur');
INSERT INTO ref_capteur VALUES(3,'capteur','capteur moyen');
 
--6)
 
INSERT INTO capteur VALUES(1,1812,10,0);
INSERT INTO capteur VALUES(2,1813,11,1);
 
--7)
 
INSERT INTO mesure VALUES(0,17680,0);
INSERT INTO mesure VALUES(1,1212,1);
 
-- --8)
 
INSERT INTO facture VALUES(0,'electricite',23.5,3.5,’kW’,1,0);
INSERT INTO facture VALUES(1,'electricite',25,3.5,’kW’,1,1);
INSERT INTO facture VALUES(2,'eau',23.5,3.5,’m2’,01,1);
INSERT INTO facture VALUES(3,'eau',23.5,3.5,’m2’,01,0);
 
 
 
SELECT * FROM logement;
SELECT * FROM ref_capteur;
SELECT * FROM capteur;
SELECT * FROM mesure;
SELECT * FROM facture;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
-- https://www.sqlite.org/datatype3.html
-- sql_file = open("logement.sql")
-- sql_as_string = sql_file. read()
-- c.executescript(sql_as_string)
 
 
 
 


