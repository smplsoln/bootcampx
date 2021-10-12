SELECT cohorts.name as cohort_name,
  COUNT(students.id) as student_count
FROM students
JOIN cohorts
ON students.cohort_id = cohorts.id
GROUP BY cohort_name
HAVING COUNT(students.id) >= 18
ORDER BY student_count;

