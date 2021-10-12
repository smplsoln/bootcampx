SELECT cohorts.name as cohort,
  COUNT(assignment_submissions.id) as total_submissions
FROM assignment_submissions
JOIN students
  ON students.id = assignment_submissions.student_id
JOIN cohorts
  ON cohorts.id = students.cohort_id
GROUP BY cohort
ORDER BY total_submissions DESC;

