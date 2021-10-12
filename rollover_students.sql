 SELECT students.name AS student_name,
  students.start_date AS student_start_date,
  cohorts.name AS cohort_name,
  cohorts.start_date AS cohort_start_date
FROM students
JOIN cohorts
ON cohorts.id = cohort_id
  AND students.start_date <> cohorts.start_date;


/*
   student_name   | student_start_date | cohort_name | cohort_start_date
------------------+--------------------+-------------+-------------------
 Okey Jaskolski   | 2018-03-12         | APR09       | 2018-04-09
 Elise Carter     | 2018-05-07         | JUN04       | 2018-06-04
 Peggie Batz      | 2018-05-07         | JUN04       | 2018-06-04
 Lurline Franecki | 2018-06-04         | JUL02       | 2018-07-02
 Johnathon Kohler | 2018-06-04         | JUL02       | 2018-07-02
 Felipe Kessler   | 2018-06-04         | JUL02       | 2018-07-02
 Jaime Shanahan   | 2018-08-27         | SEP24       | 2018-09-24
 Deon Hahn        | 2018-10-22         | NOV19       | 2018-11-19
(8 rows)
*/