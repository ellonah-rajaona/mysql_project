USE stage_db;

-- Requetes simples
SELECT * FROM etudiants;
SELECT Nom_etudiant,Prenom_etudiant FROM  etudiants;
SELECT * FROM etudiants WHERE niveau='L3';
SELECT et.* 
FROM etudiants et
INNER JOIN formation f ON et.ID_formation = f.ID_formation
WHERE Nom_formation LIKE '%ge%';

SELECT et.Prenom_etudiant, s.Sujet_stage, en.Nom_entreprise
FROM etudiants et
INNER JOIN stage s ON s.Num_CE = et.Num_CE 
INNER JOIN entreprise en ON  s.ID_entreprise = en.ID_entreprise;

-- requetes moyennes

SELECT * FROM etudiants ORDER BY niveau;

SELECT t.Nom_tuteur,t.poste_tuteur,en.Nom_entreprise
FROM tuteur t
INNER JOIN entreprise en ON t.ID_entreprise = en.ID_entreprise
WHERE poste_tuteur LIKE '%eau%' OR poste_tuteur LIKE '%logic%';

SELECT 
    et.Nom_etudiant,
    et.parcours,
    et.niveau,
    t.Nom_tuteur AS encadreur,
    t.Poste_tuteur,
    en.Nom_entreprise
FROM etudiants et
INNER JOIN stage s ON et.Num_CE = s.Num_CE
INNER JOIN tuteur t ON s.Tuteur_ID = t.Tuteur_ID
INNER JOIN entreprise en ON s.ID_entreprise = en.ID_entreprise
ORDER BY Nom_etudiant;

 SELECT COUNT(DISTINCT parcours) FROM etudiants;
 
 SELECT COUNT(et.Nom_etudiant)
FROM etudiants et
INNER JOIN stage s ON et.Num_CE = s.Num_CE
INNER JOIN entreprise en ON s.ID_entreprise = en.ID_entreprise
WHERE en.ID_entreprise = 2;

SELECT Nom_etudiant,Prenom_etudiant,
             CASE
					WHEN niveau IN( 'L1','L2','L3') THEN 'Niveau Licence'
					ELSE 'Niveau Master'
			 END AS Classification_Niveau
FROM etudiants;


SELECT 
    niveau,
    CASE 
        WHEN niveau IN ('L1', 'L2', 'L3') THEN 'NIVEAU LICENCE'
        ELSE 'NIVEAU MASTER'
    END AS categorie,
    COUNT(*) AS total
FROM etudiants
GROUP BY niveau;