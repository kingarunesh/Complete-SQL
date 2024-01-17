CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	homeroom_number VARCHAR(50),
	phone VARCHAR(20) UNIQUE NOT NULL,
	email VARCHAR(200) UNIQUE,
	pass_year VARCHAR(4)
)



CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	phone VARCHAR(20) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	homeroom_number VARCHAR(50),
	department VARCHAR(100)
)




INSERT INTO students(first_name, last_name, phone, email, homeroom_number, pass_year)
VALUES('Arunesh', 'kumar', '8971818410', 'aruneshkumar.king@gmail.com', '5', '2035')


INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone)
VALUES('Jonas', 'Salk', '5', 'Biology', 'jsalk@school.org', '777-555-4321')








