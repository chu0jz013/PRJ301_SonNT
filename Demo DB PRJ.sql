USE MASTER 

DROP DATABASE [DEMO DB]

CREATE DATABASE [DEMO DB]

USE [DEMO DB]

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Code VARCHAR(20) UNIQUE,
    First_Name VARCHAR(50) NOT NULL,
	Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50) NOT NULL,
    Gender BIT NOT NULL,
    Date_of_Birth DATE ,
    Email VARCHAR(100) UNIQUE,
    Phone_Number VARCHAR(20) UNIQUE,
	Department VARCHAR(100)
);

CREATE TABLE Staffs (
    Staff_ID INT PRIMARY KEY,
    Staff_Code VARCHAR(20) NOT NULL UNIQUE,
    First_Name VARCHAR(50) NOT NULL,
	Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50) NOT NULL,
    Gender BIT NOT NULL,
    Date_of_Birth DATE ,
    Email VARCHAR(100) UNIQUE,
    Phone_Number VARCHAR(20) UNIQUE,
	Job_Title VARCHAR(50),
    Department VARCHAR(100)
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Code VARCHAR(20) NOT NULL UNIQUE,
    Course_Name VARCHAR(100) NOT NULL,
);

CREATE TABLE Rooms (
    Room_ID INT PRIMARY KEY,
    Room_Code VARCHAR(20) NOT NULL UNIQUE,
    Room_Name VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
);

CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Staff_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Room_ID INT NOT NULL,
    Date_Time DATETIME NOT NULL,
    FOREIGN KEY (Staff_ID) REFERENCES Staffs(Staff_ID),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);

CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    User_Type VARCHAR(20) NOT NULL,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Staff_ID INT,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY (Staff_ID) REFERENCES Staffs(Staff_ID),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Students (Student_ID, Student_Code, First_Name, Middle_Name, Last_Name, Gender, Date_of_Birth, Email, Phone_Number, Department)
VALUES (2, 'ST002', 'Emma', 'Lee', 'Johnson', 0, '2001-05-25', 'emma.johnson@email.com', '123-456-7891', 'Computer Science'),
       (3, 'ST003', 'William', 'Taylor', 'Smith', 1, '2002-02-14', 'william.smith@email.com', '123-456-7892','Software Engineer'),
       (4, 'ST004', 'Olivia', 'Grace', 'Wilson', 0, '2003-09-10', 'olivia.wilson@email.com', '123-456-7893','');

-- Demo data for Staff table
INSERT INTO Staffs (Staff_ID, Staff_Code, First_Name, Middle_Name, Last_Name, Gender, Date_of_Birth, Email, Phone_Number, Job_Title, Department)
VALUES (3, 'SF003', 'Daniel', 'Matthew', 'Brown', 1, '1975-12-18', 'daniel.brown@email.com', '123-456-7894', 'Associate Professor', 'Physics'),
       (4, 'SF004', 'Sarah', 'Elizabeth', 'Davis', 0, '1980-06-23', 'sarah.davis@email.com', '123-456-7895', 'Assistant Professor', 'Chemistry'),
       (5, 'SF005', 'Jacob', 'Michael', 'Thomas', 1, '1990-03-08', 'jacob.thomas@email.com', '123-456-7896', 'Professor', 'Computer Science');

-- Demo data for Courses table
INSERT INTO Courses (Course_ID, Course_Code, Course_Name)
VALUES (1, 'C001', 'Introduction to Computer Science'),
       (2, 'C002', 'Chemistry 101'),
       (3, 'C003', 'Physics 101');

-- Demo data for Rooms table
INSERT INTO Rooms (Room_ID, Room_Code, Room_Name, Capacity)
VALUES (1, 'R001', 'Computer Lab 1', 30),
       (2, 'R002', 'Chemistry Lab 1', 20),
       (3, 'R003', 'Physics Lab 1', 25);

-- Demo data for Attendance table
INSERT INTO Attendance (Attendance_ID, Staff_ID, Student_ID, Course_ID, Room_ID, Date_Time)
VALUES (1, 3, 2, 1, 1, '2022-10-01 09:00:00'),
       (2, 4, 3, 2, 2, '2022-10-02 10:30:00'),
       (3, 5, 4, 3, 3, '2022-10-03 13:00:00');

-- Demo data for Users table
INSERT INTO Users (User_ID, User_Type, Username, Password, Staff_ID, Student_ID, Course_ID)
VALUES (1, 'admin', 'admin', 'admin', NULL, NULL, NULL),
       (2, 'staff', 'daniel', 'password', 3, NULL, NULL),
       (3, 'staff', 'sarah', 'password', 4, NULL, NULL),
       (4, 'staff', 'jacob', 'password', 5, NULL, NULL),
       (5, 'student', 'emma', 'password', NULL, 2, 1),
       (6, 'student', 'william', 'password', NULL, 3, 2),
       (7, 'student', 'olivia', 'password', NULL, 4, 3);
