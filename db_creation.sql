USE student_performance;

CREATE TABLE IF NOT EXISTS student_perform (
    id_student INT AUTO_INCREMENT PRIMARY KEY,
    gender VARCHAR(20),
    ethnicity VARCHAR(50),
    parental_education VARCHAR(100),
    lunch VARCHAR(20),
    test_prep VARCHAR(50),
    math_score INT,
    reading_score INT,
    writing_score INT
);