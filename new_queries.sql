-- SELECT * FROM student_perform;

-- les lignes de code ci-dessous permet de voir les 5 premiers lignes de notre données
SELECT * FROM student_perform 
LIMIT 5;
-- ----------------------

-- les lignes des codes suivant permet de voir les 101e jusqu'au 300e données 
SELECT * FROM student_perform
LIMIT 200 OFFSET 100;

-- le code suivant nous renvoie le nombre total des étudiants
SELECT COUNT(*)  AS total_student
FROM student_perform;

-- on a beaucoup de groupe d' ethnicity dans nos données, avec DISTINCT(ethnicity) on a les ethnis sans redondance
SELECT DISTINCT(ethnicity) FROM student_perform;

-- le code ci-dessous nous renvoie la moyenne des notes en Math
SELECT AVG(math_score) AS Math_score_avg
FROM student_perform;
-- les codes suivant nous renvoient les notes minimum dans les trois matières
SELECT
	MIN(math_score) AS lower_score_inMath, 
	MIN(reading_score) AS lower_score_inReading,
	MIN(Writing_score) AS lower_score_inWriting
FROM student_perform;
-- les codes ci-apres nous renvoient des notes maximum dans les trois matieres
SELECT
	MAX(math_score) AS high_score_inMath, 
	MAX(reading_score) AS high_score_inReading,
	MAX(Writing_score) AS high_score_inWriting
FROM student_perform;

USE student_performance;
-- les codes suivant nous renvoient l'id de l'etudiant,qui a eu la note minimum en Math et en reading et en writing,  ainsi que son genre et ces notes dans les trois matieres, 
SELECT id_student,gender,math_score,reading_score,writing_score FROM student_perform
WHERE math_score = (SELECT MIN(math_score) FROM student_perform)
AND reading_score = (SELECT MIN(reading_score) FROM student_perform)
AND writing_score = (SELECT MIN(writing_score) FROM student_perform);

SELECT id_student,gender,math_score,reading_score,writing_score FROM student_perform
WHERE math_score = (SELECT MAX(math_score) FROM student_perform)
AND reading_score = (SELECT MAX(reading_score) FROM student_perform)
AND writing_score = (SELECT MAX(writing_score) FROM student_perform);

-- les codes ci-apres nous donne,t le nombre total des hommes et des femmes dans nos donnnées
SELECT gender, COUNT(*) AS Total
FROM student_perform
GROUP BY gender; 

-- les codes suivant nous renvoient la moyenne de note en reading selon le test preparation, environ 66% pour ceux qui ne sont pas fait la preparation et environ 77 pour ce qui l'ont fait
SELECT AVG(reading_score),test_prep FROM student_perform
GROUP BY test_prep;

-- les listes et nombres total des etudiants qui a completé le test_preparation course avec au moins une note est inferieure à 50
SELECT id_student, math_score, reading_score,writing_score FROM student_perform
WHERE test_prep = 'completed' AND (math_score<50 OR reading_score<50 OR writing_score<50);

-- ce ceci renvoie le nombre total des etudiants qui ont fait le test preparation mais ont eu au moins une note<50 dans les trois matieres
SELECT COUNT(*) FROM student_perform
WHERE test_prep = 'completed' AND (math_score<50 OR reading_score<50 OR writing_score<50);

-- les listes et nombres total des etudiants qui a completé le test_preparation course au moins une  note superieure à 50
SELECT id_student, math_score, reading_score,writing_score FROM student_perform
WHERE test_prep = 'completed' AND (math_score>=50 OR reading_score>=50 OR writing_score>=50);

SELECT COUNT(*) FROM student_perform
WHERE test_prep = 'completed' AND (math_score>=50 OR reading_score>=50 OR writing_score>=50);

-- --------------------------------------------------------------------------------------------
SELECT id_student, math_score, reading_score,writing_score FROM student_perform
WHERE test_prep = 'completed' AND (math_score>50 AND reading_score>50 AND writing_score>50);

SELECT COUNT(*) FROM student_perform
WHERE test_prep = 'completed' AND (math_score>50 AND  reading_score>50 AND writing_score>50);

SELECT id_student, math_score, reading_score,writing_score FROM student_perform
WHERE test_prep = 'completed' AND (math_score<50 AND reading_score<50 AND writing_score<50);

SELECT COUNT(*) FROM student_perform
WHERE test_prep = 'completed' AND (math_score<50 AND reading_score<50 AND writing_score<50);


SELECT id_student, math_score, reading_score,writing_score FROM student_perform
WHERE test_prep = 'none' AND (math_score>=50 AND reading_score>=50 AND writing_score>=50);

SELECT COUNT(*) FROM student_perform
WHERE test_prep = 'none' AND (math_score>=50 AND reading_score>=50 AND writing_score>=50);

-- Les étudiants dont les parents ont un niveau d'études plus élevé obtiennent généralement des moyennes plus élevées dans les trois matières.
SELECT 
	AVG(reading_score),
    AVG(math_score),
    AVG(writing_score),
    parental_education
    FROM student_perform 
GROUP BY parental_education;

SELECT id_student, math_score, reading_score,writing_score FROM student_perform
WHERE test_prep = 'none' AND (math_score<50 AND reading_score<50 AND writing_score<50);

SELECT COUNT(*) FROM student_perform
WHERE test_prep = 'none' AND (math_score<50 AND reading_score<50 AND writing_score<50);

-- ceci renvoie le nombre total des etudiants,qui ont fait et non le test prepa,qui ont eu dans les trois matières une note<50
SELECT COUNT(*), test_prep FROM student_perform
WHERE math_score<50 AND reading_score<50 AND writing_score<50
GROUP BY test_prep;

SELECT COUNT(*), test_prep FROM student_perform
WHERE math_score>=50 AND reading_score>=50 AND writing_score>=50
GROUP BY test_prep;

