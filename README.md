# student-performance-sql-analysis
A MySQL-based data analysis project demonstrating relational schema creation, data insertion, and analytical queries to evaluate student academic performance across subjects, grades, and genders.


# Student Performance & Academic Records Analysis (SQL)

## Project Overview
This project focuses on creating a relational database to store student information and executing SQL queries to evaluate academic performance across multiple subjects, grades, and genders. It covers relational schema creation, data manipulation, aggregation, and analytical filtering.

---

## Database Schema
The database uses a single table named `Students` with the following attributes:
* **StudentID**: `INT` (Primary Key, Auto-Increment)
* **Name**: `VARCHAR(50)`
* **Gender**: `CHAR(1)` (`M` / `F`)
* **Age**: `INT`
* **Grade**: `VARCHAR(2)`
* **MathScore**: `INT`
* **ScienceScore**: `INT`
* **EnglishScore**: `INT`

---

## Complete SQL Script
```sql
-- 1. Database & Table Setup
CREATE DATABASE IF NOT EXISTS StudentManagement;
USE StudentManagement;

CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Grade VARCHAR(2),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

-- 2. Insert Sample Records
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
    ('Aarav', 'M', 16, 'A', 92, 88, 85),
    ('Priya', 'F', 17, 'B', 78, 82, 90),
    ('Rahul', 'M', 16, 'C', 65, 70, 68),
    ('Sneha', 'F', 17, 'A', 95, 91, 94),
    ('Vikram', 'M', 16, 'B', 80, 76, 79),
    ('Ananya', 'F', 16, 'A', 89, 93, 91),
    ('Rohan', 'M', 17, 'C', 55, 62, 60),
    ('Neha', 'F', 16, 'B', 74, 80, 77),
    ('Karan', 'M', 17, 'A', 88, 85, 90),
    ('Pooja', 'F', 16, 'B', 81, 84, 86);

-- 3. Data Analysis Queries

-- Query 1: Calculate Average Marks in Each Subject
SELECT
    AVG(MathScore) AS AverageMath,
    AVG(ScienceScore) AS AverageScience,
    AVG(EnglishScore) AS AverageEnglish
FROM Students;

-- Query 2: Find Top Performer (Highest Combined Score)
SELECT Name,
       MathScore + ScienceScore + EnglishScore AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- Query 3: Count Students per Grade
SELECT Grade, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Grade;

-- Query 4: Average Subject Score by Gender
SELECT Gender,
       AVG((MathScore + ScienceScore + EnglishScore) / 3.0) AS AverageScore
FROM Students
GROUP BY Gender;

-- Query 5: Students Scoring Above 80 in Mathematics
SELECT *
FROM Students
WHERE MathScore > 80;

-- Query 6: Update a Student's Grade (Example)
UPDATE Students
SET Grade = 'A'
WHERE StudentID = 3;
