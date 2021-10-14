const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2] || "";
const limit = process.argv[3] || 1;

const studentInfoQuery = `
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
// WHERE cohorts.name LIKE '%${process.argv[2] || "-"}%'
LIMIT ${process.argv[3] || 1};
`;

const teachersQuery = `
SELECT DISTINCT teachers.name AS teacher,
  cohorts.name AS cohort
FROM teachers
JOIN assistance_requests
  ON teachers.id = assistance_requests.teacher_id
JOIN students
  ON assistance_requests.student_id = students.id
JOIN cohorts
  ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${process.argv[2] || "_"}%'
ORDER BY teacher ASC
LIMIT ${process.argv[3] || 1};
`;
// console.log(teachersQuery);
pool.query(teachersQuery)
  .then(res => {
    // console.log(res.rows);
    res.rows.forEach(row => {
      console.log(`${row.teacher} assisted during ${row.cohort} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack))
  .finally(() => pool.end());

