SELECT id, name
FROM students
WHERE cohort_id = 2
ORDER BY name ACS;

SELECT COUNT(id)
FROM students
WHERE cohort_id <= 3;

SELECT name, id, cohorts_id
FROM students
WHERE email IS NULL OR phone IS NULL;

SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
AND phone IS NULL;

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL;

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NOT NULL
AND github IS NULL;