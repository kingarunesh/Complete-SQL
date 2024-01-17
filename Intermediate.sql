------------------------------------------------------------------------------------------------------
--					Create Table
------------------------------------------------------------------------------------------------------
-- CREATE TABLE account(
-- 	user_id SERIAL PRIMARY KEY,
-- 	username VARCHAR(50) UNIQUE NOT NULL,
-- 	password VARCHAR(50) NOT NULL,
-- 	email VARCHAR(100) UNIQUE NOT NULL,
-- 	created_on TIMESTAMP NOT NULL,
-- 	last_login TIMESTAMP
-- );


-- CREATE TABLE job(
-- 	job_id SERIAL PRIMARY KEY,
-- 	job_name VARCHAR(200) UNIQUE NOT NULL
-- )


-- CREATE TABLE account_job (
-- 	user_id INTEGER REFERENCES account(user_id),
-- 	job_id INTEGER REFERENCES job(job_id),
-- 	hire_date TIMESTAMP
-- )





------------------------------------------------------------------------------------------------------
--					Insert Data into Table
------------------------------------------------------------------------------------------------------


-- INSERT INTO account(username, password, email, created_on)
-- VALUES ('gohan', 'password', 'gohan@gmail.com', CURRENT_TIMESTAMP);


-- INSERT INTO job(job_name) VALUES('Full Stack Developer');


-- INSERT INTO account_job(user_id, job_id, hire_date)
-- VALUES(6, 40, CURRENT_TIMESTAMP);






------------------------------------------------------------------------------------------------------
--					Update Table Data
------------------------------------------------------------------------------------------------------

-- UPDATE account
-- SET last_login = CURRENT_TIMESTAMP;


-- UPDATE account
-- SET last_login = created_on


-- UPDATE account_job
-- SET hire_date = account.created_on
-- FROM account
-- WHERE account_job.user_id = account.user_id;


-- UPDATE account
-- SET last_login = CURRENT_TIMESTAMP
-- RETURNING username, email, created_on, last_login;



-- UPDATE account
-- SET last_login = CURRENT_TIMESTAMP
-- WHERE username = 'fohan';



------------------------------------------------------------------------------------------------------
--					Delete Table Data
------------------------------------------------------------------------------------------------------

-- DELETE FROM job
-- WHERE job_name = 'hello'
-- RETURNING job_name



------------------------------------------------------------------------------------------------------
--					Alter Table
------------------------------------------------------------------------------------------------------

-- ALTER TABLE information RENAME TO new_info


-- ALTER TABLE new_info RENAME COLUMN person TO people;


-- ALTER TABLE new_info ALTER COLUMN people SET NOT NULL;

-- ALTER TABLE new_info ALTER COLUMN people DROP NOT NULL;


-- INSERT INTO new_info(title) VALUES('this is title')




------------------------------------------------------------------------------------------------------
--					Drop Table
------------------------------------------------------------------------------------------------------

-- ALTER TABLE new_info
-- DROP COLUMN people;


-- ALTER TABLE new_info
-- DROP COLUMN IF EXISTS people;





------------------------------------------------------------------------------------------------------
--					Check Constraint
------------------------------------------------------------------------------------------------------

-- CREATE TABLE employees(
-- 	emp_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(100) NOT NULL,
-- 	last_name VARCHAR(100) NOT NULL,
-- 	birthdate DATE CHECK(birthdate > '1995-01-01'),
-- 	hire_date DATE CHECK(hire_date > birthdate),
-- 	salary INTEGER CHECK(salary > 0)
-- )


-- INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
-- VALUES('Bohan', 'Kapoor', '1995-07-15', '1996-01-01', 100);

-- SELECT * FROM employees;
































































