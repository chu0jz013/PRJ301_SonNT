-- USE MASTER DROP DATABASE FPT_University_Management_System

CREATE DATABASE [FPT_University_Management_System]
GO

USE [FPT_University_Management_System]
GO

CREATE TABLE Users (
	[user_id] INT IDENTITY(1,1) PRIMARY KEY,
	[username] VARCHAR(50) UNIQUE NOT NULL,
	[password] VARCHAR(50) NOT NULL,
	[role] VARCHAR(20) NOT NULL
);

CREATE TABLE Majors (
  major_id INT IDENTITY(1,1) PRIMARY KEY,
  major_name VARCHAR(100) NOT NULL,
  major_code VARCHAR(20) UNIQUE NOT NULL,
  major_description TEXT
);

CREATE TABLE Departments (
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR(100) UNIQUE NOT NULL,
	department_description TEXT
);

CREATE TABLE Courses (
  course_id INT IDENTITY(1,1) PRIMARY KEY,
  course_code VARCHAR(20) UNIQUE NOT NULL,
  course_name VARCHAR(100) NOT NULL,
  department_id INT REFERENCES Departments(department_id),
  credits FLOAT NOT NULL,
  prereq_Course VARCHAR(200),
  description TEXT
);

CREATE TABLE Majors_Courses(
	major_id INT NOT NULL,
	course_id INT NOT NULL,
	PRIMARY KEY (major_id, course_id),
	FOREIGN KEY (course_id) REFERENCES Courses(course_id),
	FOREIGN KEY (major_id) REFERENCES Majors(major_id)
);

CREATE TABLE Professors (
  professor_id INT IDENTITY(1,1) PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  [user_id] INT REFERENCES [Users]([user_id]) UNIQUE
);

CREATE TABLE Professors_Departments(
	professor_id INT NOT NULL,
	department_id INT NOT NULL,
	PRIMARY KEY (professor_id, department_id),
	FOREIGN KEY (department_id) REFERENCES Departments(department_id),
	FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

CREATE TABLE Semesters (
  semester_id INT IDENTITY(1,1) PRIMARY KEY,
  semester_name VARCHAR(50) NOT NULL,
  [start_date] DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE Students (
	student_id INT IDENTITY(1,1) PRIMARY KEY,
	student_code VARCHAR(10) UNIQUE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(20),
	[address] VARCHAR(200),
	major_id INT REFERENCES Majors(major_id),
	[user_id] INT REFERENCES [Users]([user_id]) UNIQUE
);

CREATE TABLE [Groups] (
  group_id INT IDENTITY(1,1) PRIMARY KEY,
  
  course_id INT REFERENCES Courses(course_id),
  days_of_week VARCHAR(20) NOT NULL,
  capacity INT NOT NULL,
  semester_id INT REFERENCES Semesters(semester_id)
);

CREATE TABLE Enrollments (
  enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
  student_id INT REFERENCES Students(student_id),
  group_id INT REFERENCES [groups](group_id),
  absent_percentage FLOAT NOT NULL,
  comments TEXT
);

CREATE TABLE Classrooms (
  classroom_id INT IDENTITY(1,1) PRIMARY KEY,
  building_name VARCHAR(100) NOT NULL,
  room_code VARCHAR(10) UNIQUE NOT NULL,
  capacity INT,
  equipment TEXT
);





CREATE TABLE Attendance (
	attendance_id INT IDENTITY(1,1) PRIMARY KEY,
	enrollment_id INT REFERENCES Enrollments(enrollment_id),
	professor_id INT REFERENCES Professors(professor_id),
	[date] DATE,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL,
	classroom_id INT REFERENCES Classrooms(classroom_id),
	[status] VARCHAR(20), -- persent/absent/not yet
	slot INT,
	notes TEXT
);

-- Users
INSERT INTO Users (username, [password], [role]) 
VALUES ('admin', '10diemprj301', 'admin'),
('sonnt5@fpt.edu.vn', '10diemprj301', 'professor'),
('bantq@fpt.edu.vn', '10diemprj301', 'professor'),
('tuanvm2@fpt.edu.vn', '10diemprj301', 'professor'),
('haiknhe171578@fpt.edu.vn', '10diemprj301', 'student'),
('loinqhe1705331@fpt.edu.vn', '10diemprj301', 'student'),
('haunthe170842@fpt.edu.vn', '10diemprj301', 'student'),
('huyenntkhe170863@fpt.edu.vn', '10diemprj301', 'student'),
('phuonghmhe171073@fpt.edu.vn', '10diemprj301', 'student'),
('tuntche176697@fpt.edu.vn', '10diemprj301', 'student');


-- Majors
INSERT INTO Majors
VALUES ('Software Engineering K17B', 'BIT_SE_17B',''),
('Artificial Intelligence K17A', 'BIT_AI_17A', ''),
('International Bussines K16C', 'BBA_IB_K16C','');

-- Departments
INSERT INTO Departments (department_name, department_description)
VALUES ('Computing Fundamental', ''),
('Artificial Intelligence', ''),
('Mathematics', ''),
('Business Administration', '');

-- Courses
INSERT INTO Courses (course_code, course_name, department_id, credits, prereq_Course, [description])
VALUES ('CSI104', 'Introduction to Computer Science', 1, 3.0, NULL, 'This course covers the basics of computer programming and software development.'),
('DBI202', 'Introduction to Database', 1, 3.0, NULL, 'Basic SQL with MS SQL Server.'),
('PRJ301', 'Java Web Application', 1, 3.0, 'DBI202', 'Develop Java Web with Servlet and JSP.'),
('PFP191', 'Python Fundamental', 1, 3.0, NULL, 'Basic Python.'),
('MAE101', 'Mathematics for Engineering', 3, 3.0, NULL, 'Linear Algebra'),
('AIL303m', 'Machine Learning', 2, 3.0, NULL, 'Machine Learning'),
('DPL301m', 'Deep Learing ', 2, 3.0, NULL, 'Deep Learning'),
('MKT101', 'Marketing Principles', 4, 3.0, NULL, ''),
('MAS202', 'Applied Statistics for Business', 3, 3.0, NULL, '');

-- Majors_Courses
INSERT INTO Majors_Courses (major_id, course_id)
VALUES	(1,1),
		(1,2),
		(1,3),
		(1,5),
		(2,2),
		(2,4),
		(2,5),
		(2,6),
		(2,7),
		(3,8),
		(3,9);

--Students
insert into Students(student_code, first_name, last_name, email, phone, [address], major_id, [user_id])
values	('HE171578','Hai', 'Kieu Nam', 'haiknhe171578@fpt.edu.vn','0961513848','Ha Noi', 1 ,5),
		('HE170533','Loi','Nguyen Quang','loinqhe1705331@fpt.edu.vn','','Thai Binh',1, 6),
		('HE170842','Hau','Nguyen Thanh','haunthe170842@fpt.edu.vn','','Nhat Ban',1, 7),
		('HE170863','Huyen','Nguyen Thi Khanh','huyenntkhe170863@fpt.edu.vn','','Han Quoc',1, 8),
		('HE171073','Phuong','Hoang Mai','phuonghmhe171073@fpt.edu.vn','','Trung Quoc',1, 9),
		('HE176697','Tu','Nguyen Thi Cam','tuntche176697@fpt.edu.vn','','Dai Loan', 1, 10);


-- Professors
INSERT INTO Professors (first_name, last_name, email, phone, [user_id])
VALUES	('Son', 'Ngo Tung', 'sonnt5@fpt.edu.vn', '1010101010', 2),
		('Ban', 'Tran Quy', 'bantq@fpt.edu.vn', '1010101011', 3),
		('Tuan', 'Vuong Minh', 'tuanvm2@fpt.edu.vn', '1010101011', 4);

-- Professors_Departments
INSERT INTO Professors_Departments (professor_id, department_id)
VALUES	(1, 1),
		(1,2),
		(2,3),
		(3,4);

-- Semesters
INSERT INTO Semesters (semester_name, [start_date], end_date)
VALUES ('Spring 2023', '2023-01-02', '2023-05-04');

-- Groups
INSERT INTO [Groups] (course_id, days_of_week, capacity, semester_id)
VALUES (3, 'P36', 30, 1);


-- Enrollments
INSERT INTO Enrollments (student_id, group_id, absent_percentage, comments)
VALUES	(1, 1, 0, ''),
		(2, 1, 0, ''),
		(3, 1, 0, ''),
		(4, 1, 0, ''),
		(5, 1, 0, ''),
		(6, 1, 0, '');

-- Classrooms
INSERT INTO Classrooms (building_name, room_code, capacity, equipment)
VALUES ('Delta', 'DE-201', 30, ''),
('Delta', 'DE-202', 30, ''),
('Delta', 'DE-203', 30, ''),
('Delta', 'DE-204', 30, ''),
('Delta', 'DE-205', 30, ''),
('Beta', 'BE-201', 30, ''),
('Beta', 'BE-202', 30, ''),
('Beta', 'BE-203', 30, ''),
('Beta', 'BE-204', 30, ''),
('Beta', 'BE-205', 30, ''),
('Beta', 'BE-303', 30, '');

-- Attendance
INSERT INTO Attendance (enrollment_id, professor_id, [date], start_time, end_time, classroom_id, [status], slot, notes)
VALUES	(1, 1, '2023-03-07', '12:50:00', '15:10:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(1, 1, '2023-03-10', '15:20:00', '17:40:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(1, 1, '2023-03-14', '12:50:00', '15:10:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),
		(1, 1, '2023-03-17', '15:20:00', '17:40:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),

		(2, 1, '2023-03-07', '12:50:00', '15:10:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(2, 1, '2023-03-10', '15:20:00', '17:40:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(2, 1, '2023-03-14', '12:50:00', '15:10:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),
		(2, 1, '2023-03-17', '15:20:00', '17:40:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),

		(3, 1, '2023-03-07', '12:50:00', '15:10:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(3, 1, '2023-03-10', '15:20:00', '17:40:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(3, 1, '2023-03-14', '12:50:00', '15:10:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),
		(3, 1, '2023-03-17', '15:20:00', '17:40:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),

		(4, 1, '2023-03-07', '12:50:00', '15:10:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(4, 1, '2023-03-10', '15:20:00', '17:40:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(4, 1, '2023-03-14', '12:50:00', '15:10:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),
		(4, 1, '2023-03-17', '15:20:00', '17:40:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),

		(5, 1, '2023-03-07', '12:50:00', '15:10:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(5, 1, '2023-03-10', '15:20:00', '17:40:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(5, 1, '2023-03-14', '12:50:00', '15:10:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),
		(5, 1, '2023-03-17', '15:20:00', '17:40:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),

		(6, 1, '2023-03-07', '12:50:00', '15:10:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(6, 1, '2023-03-10', '15:20:00', '17:40:00', 11, 'present', 3,'Hai se duoc 10 diem PRJ'),
		(6, 1, '2023-03-14', '12:50:00', '15:10:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ'),
		(6, 1, '2023-03-17', '15:20:00', '17:40:00', 11, 'not yet', 3,'Hai se duoc 10 diem PRJ');