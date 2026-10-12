create database student_placement_db;
use student_placement_db;

CREATE TABLE student_placements (
    student_id VARCHAR(20),
    branch VARCHAR(50),
    cgpa DOUBLE NULL,
    internship_count INT,
    skills_count INT,
    primary_skill VARCHAR(100),
    placement_status VARCHAR(20),
    company VARCHAR(100) NULL,
    package_lpa DOUBLE NULL,
    location VARCHAR(100) NULL,
    graduation_year INT
);

SELECT COUNT(*) AS total_students
FROM student_placements;


SELECT *
FROM student_placements
LIMIT 10;




SELECT 
    placement_status,
    COUNT(*) AS number_of_students
FROM student_placements
GROUP BY placement_status;


SELECT 
    placement_status,
    COUNT(*) AS number_of_students,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM student_placements), 2) AS percentage
FROM student_placements
GROUP BY placement_status;


SELECT 
    placement_status,
    ROUND(AVG(cgpa), 2) AS average_cgpa
FROM student_placements
GROUP BY placement_status;


SELECT 
    internship_count,
    placement_status,
    COUNT(*) AS number_of_students
FROM student_placements
GROUP BY internship_count, placement_status
ORDER BY internship_count, placement_status;


SELECT 
    placement_status,
    ROUND(AVG(internship_count), 2) AS average_internships
FROM student_placements
GROUP BY placement_status;

SELECT 
    internship_count,
    COUNT(*) AS total_students,
    SUM(CASE 
            WHEN placement_status = 'Placed' THEN 1 
            ELSE 0 
        END) AS placed_students,
    ROUND(
        SUM(CASE 
                WHEN placement_status = 'Placed' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*), 
        2
    ) AS placement_rate
FROM student_placements
GROUP BY internship_count
ORDER BY internship_count;


SELECT 
    placement_status,
    ROUND(AVG(skills_count), 2) AS average_skills
FROM student_placements
GROUP BY placement_status;


SELECT 
    skills_count,
    COUNT(*) AS total_students,
    SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS placement_rate
FROM student_placements
GROUP BY skills_count
ORDER BY skills_count;



SELECT 
    branch,
    COUNT(*) AS total_students,
    SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS placement_rate
FROM student_placements
GROUP BY branch
ORDER BY placement_rate DESC;



SELECT 
    primary_skill,
    COUNT(*) AS total_students,
    SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS placement_rate
FROM student_placements
GROUP BY primary_skill
ORDER BY placement_rate DESC;



SELECT 
    COUNT(package_lpa) AS students_with_package,
    ROUND(AVG(package_lpa), 2) AS average_package,
    ROUND(MIN(package_lpa), 2) AS minimum_package,
    ROUND(MAX(package_lpa), 2) AS maximum_package
FROM student_placements
WHERE placement_status = 'Placed';




SELECT 
    primary_skill,
    COUNT(*) AS placed_students,
    ROUND(AVG(package_lpa), 2) AS average_package
FROM student_placements
WHERE placement_status = 'Placed'
GROUP BY primary_skill
ORDER BY average_package DESC;



SELECT 
    location,
    COUNT(*) AS placed_students
FROM student_placements
WHERE placement_status = 'Placed'
GROUP BY location
ORDER BY placed_students DESC;



SELECT 
    location,
    COUNT(*) AS placed_students,
    ROUND(AVG(package_lpa), 2) AS average_package
FROM student_placements
WHERE placement_status = 'Placed'
GROUP BY location
ORDER BY average_package DESC;


SELECT 
    student_id,
    branch,
    primary_skill,
    company,
    package_lpa,
    location
FROM student_placements
WHERE placement_status = 'Placed'
ORDER BY package_lpa DESC
LIMIT 10;




SELECT 
    student_id,
    branch,
    cgpa,
    internship_count,
    skills_count,
    placement_status
FROM student_placements
WHERE cgpa >= 8.5
ORDER BY cgpa DESC;



SELECT 
    placement_status,
    COUNT(*) AS number_of_students
FROM student_placements
WHERE internship_count = 0
GROUP BY placement_status;



SELECT 
    placement_status,
    COUNT(*) AS number_of_students
FROM student_placements
WHERE skills_count >= 3
GROUP BY placement_status;



SELECT 
    branch,
    primary_skill,
    COUNT(*) AS total_students,
    SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS placement_rate
FROM student_placements
GROUP BY branch, primary_skill
HAVING COUNT(*) >= 5
ORDER BY placement_rate DESC;



SELECT 
    COUNT(*) AS total_students,
    SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    SUM(CASE WHEN placement_status = 'Not Placed' THEN 1 ELSE 0 END) AS not_placed_students,
    ROUND(
        SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS placement_rate,
    ROUND(AVG(cgpa), 2) AS average_cgpa,
    ROUND(AVG(CASE WHEN placement_status = 'Placed' THEN cgpa END), 2) AS average_cgpa_placed,
    ROUND(AVG(CASE WHEN placement_status = 'Not Placed' THEN cgpa END), 2) AS average_cgpa_not_placed,
    ROUND(AVG(CASE WHEN placement_status = 'Placed' THEN package_lpa END), 2) AS average_package_placed
FROM student_placements;