-- Creation de la base de donnees "stage_db"
CREATE DATABASE stage_db;
USE stage_db;
-- Creation des tables
CREATE TABLE entreprise(
ID_entreprise INT PRIMARY KEY,
Nom_entreprise varchar(50),
adresse_entreprise varchar(50)
);

CREATE TABLE formation(
ID_formation INT PRIMARY KEY,
Nom_formation varchar(50),
Duree_formation VARCHAR(10));

CREATE TABLE tuteur(
Tuteur_ID INT PRIMARY KEY,
ID_entreprise INT,
Nom_tuteur varchar(50),
Poste_tuteur varchar(50),
FOREIGN KEY(ID_entreprise) REFERENCES entreprise(ID_entreprise)
);

CREATE TABLE etudiants(
Num_CE INT PRIMARY KEY,
ID_formation INT,
Nom_etudiant varchar(50),
Prenom_etudiant varchar(50),
parcours varchar(100),
niveau char(5),
FOREIGN KEY(ID_formation) REFERENCES formation(ID_formation)
);

CREATE TABLE stage(
Stage_ID INT PRIMARY KEY,
Num_CE INT,
Tuteur_ID INT ,
ID_entreprise INT,
Date_stage date,
Sujet_stage varchar(50),
FOREIGN KEY(Num_CE) REFERENCES etudiants(Num_CE),
FOREIGN KEY(Tuteur_ID) REFERENCES tuteur(Tuteur_ID),
FOREIGN KEY(ID_entreprise) REFERENCES entreprise(ID_entreprise)
);

