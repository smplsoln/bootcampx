SELECT name, id, cohorts_id
FROM students
WHERE email IS NULL OR phone IS NULL;

