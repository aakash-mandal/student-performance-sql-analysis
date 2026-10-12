USE StudentManagement;

SHOW TABLES;

DESCRIBE Students;


USE StudentManagement;

INSERT INTO Students
(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Aakash', 'M', 16, 'A', 92, 88, 85),
('Riya', 'F', 17, 'B', 78, 82, 90),
('Rahul', 'M', 16, 'C', 65, 70, 68),
('Neha', 'F', 17, 'A', 95, 91, 94),
('Vikram', 'M', 16, 'B', 80, 76, 79),
('Ananya', 'F', 16, 'A', 89, 93, 91),
('Rohan', 'M', 17, 'C', 55, 62, 60),
('Vikas', 'F', 16, 'B', 74, 80, 77),
('Karan', 'M', 17, 'A', 88, 85, 90),
('Pooja', 'F', 16, 'B', 81, 84, 86);



USE StudentManagement;

SELECT
    AVG(MathScore) AS AverageMath,
    AVG(ScienceScore) AS AverageScience,
    AVG(EnglishScore) AS AverageEnglish
FROM Students;



USE StudentManagement;


SELECT * FROM Students;


SELECT
    AVG(MathScore) AS AverageMath,
    AVG(ScienceScore) AS AverageScience,
    AVG(EnglishScore) AS AverageEnglish
FROM Students;


SELECT Name,
       MathScore + ScienceScore + EnglishScore AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;


SELECT Grade, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Grade;


SELECT Gender,
       AVG((MathScore + ScienceScore + EnglishScore) / 3.0) AS AverageScore
FROM Students
GROUP BY Gender;


SELECT *
FROM Students
WHERE MathScore > 80;


UPDATE Students
SET Grade = 'A'
WHERE StudentID = 3;

