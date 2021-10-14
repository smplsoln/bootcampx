const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2] || "_";
const limit = process.argv[3] || 1;


const studentInfoQuery = `
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '%'||$1||'%'
LIMIT $2;
`;
// console.log({studentInfoQuery});
pool.query(studentInfoQuery, [cohort, limit])
  .then(res => {
    // console.log(res.rows);
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack))
  .finally(() => pool.end());

