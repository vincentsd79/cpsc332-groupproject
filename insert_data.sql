-- Insert data into Professor table
INSERT INTO Professor (SSN, Name, StreetAddress, City, State, ZipCode, AreaCode, PhoneNumber, Sex, Title, Salary, Degrees)
VALUES
(122039736, 'Jillian Lee', '725 W Arthur', 'Santa Ana', 'CA', '92831', '657', '2784822', 'Female', 'Dr.', 110000, 'Ph.D.'),
(123034739, 'Trevor Alex', '19856 N Harbor', 'Garden Grove', 'CA', '92683', '714', '2787258', 'Male', 'Dr.', 100000, 'Ph.D.'),
(124033735, 'Julian Harman', '800 N State College Blvd', 'Fullerton', 'CA', '92831', '657', '2787021', 'Male', 'Mr.', 90000, 'M.S.');

-- Insert data into Department table
INSERT INTO Department (DepartmentID, Name, Phone, OfficeLocation, ChairpersonSSN)
VALUES
(1111, 'Computer Science', '657-278-3700', 'CS-522', 122039736),
(2222, 'Mathematics', '657-278-3631', 'MH-154', 123034739),
(3333, 'Physics', '657-278-3366', 'MH-611', 124033735);

-- Insert data into Course table
INSERT INTO Course (CourseNumber, Title, Textbook, Units, DepartmentID)
VALUES
('CPSC101', 'Introduction to Programming', 'Programming in C++', 3, 1111),
('CPSC111', 'Object-Oriented Programming', 'Object-Oriented Programming in Java', 3, 1111),
('CPSC131', 'Data Structures', 'Data Structures and Algorithms', 3, 1111),
('MATH250A', 'Calculus I', 'Calculus: Early Transcendentals', 4, 2222),
('MATH250B', 'Calculus II', 'Calculus: Early Transcendentals', 4, 2222),
('PHYS325', 'Fundamental Physics I', 'University Physics', 3, 3333);

-- Insert data into Prerequisite table
INSERT INTO Prerequisite (CourseNumber, PrerequisiteCourseNumber)
VALUES
('CPSC111', 'CPSC101'),
('CPSC131', 'CPSC111'),
('MATH250B', 'MATH250A');

-- Insert data into Section table
INSERT INTO Section (SectionID, CourseNumber, SectionNumber, Classroom, Seats, MeetingDays, BeginningTime, EndingTime, ProfessorSSN)
VALUES
(1, 'CPSC101', '01', 'CS-101', 50, 'MW', '09:00:00', '10:15:00', 122039736),
(2, 'CPSC111', '01', 'CS-201', 40, 'TTh', '13:30:00', '14:45:00', 122039736),
(3, 'MATH250A', '01', 'MH-301', 60, 'Fr', '11:30:00', '13:30:00', 123034739),
(4, 'MATH250A', '02', 'MH-302', 60, 'MW', '13:30:00', '14:20:00', 123034739),
(5, 'MATH250B', '01', 'MH-401', 50, 'TTh', '09:30:00', '10:45:00', 124033735),
(6, 'PHYS325', '01', 'MH-501', 40, 'MW', '15:00:00', '16:15:00', 124033735);

-- Insert data into Student table
INSERT INTO Student (StudentCWID, FirstName, LastName, StreetAddress, City, State, ZipCode, AreaCode, PhoneNumber, MajorDepartmentID)
VALUES
(1001, 'John', 'Doe', '123 Main St', 'Santa Ana', 'CA', '12345', '123', '4567890', 1111),
(1002, 'Jane', 'Smith', '456 Elm St', 'Newport Beach', 'CA', '67890', '987', '6543210', 2222),
(1003, 'David', 'Johnson', '789 Oak Ave', 'Tustin', 'CA', '54321', '456', '7890123', 1111),
(1004, 'Sarah', 'Williams', '321 Pine Rd', 'Costa Mesa', 'CA', '13579', '789', '1234567', 2222),
(1005, 'Michael', 'Brown', '159 Cedar Ln', 'Westminster', 'CA', '24680', '321', '9876543', 1111),
(1006, 'Emily', 'Davis', '753 Maple Dr', 'Garden Grove', 'CA', '97531', '654', '2109876', 2222),
(1007, 'Daniel', 'Wilson', '951 Birch St', 'Anaheim', 'CA', '86420', '147', '3692581', 1111),
(1008, 'Olivia', 'Taylor', '357 Walnut Blvd', 'Yorba Linda', 'CA', '75319', '258', '1478520', 2222);

-- Insert data into Minor table
INSERT INTO Minor (StudentCWID, DepartmentID)
VALUES
(1001, 2222),
(1002, 3333),
(1003, 2222),
(1004, 3333),
(1005, 2222),
(1006, 3333),
(1007, 2222),
(1008, 3333);

-- Insert data into Enrollment table
INSERT INTO Enrollment (StudentCWID, SectionID, Grade)
VALUES
(1001, 1, 'A'),
(1001, 2, 'B+'),
(1001, 3, 'A-'),
(1002, 3, 'B'),
(1002, 4, 'A'),
(1002, 5, 'B+'),
(1003, 1, 'A-'),
(1003, 2, 'B'),
(1003, 4, 'A'),
(1004, 3, 'B+'),
(1004, 5, 'A-'),
(1004, 6, 'A'),
(1005, 1, 'A'),
(1005, 3, 'B'),
(1005, 6, 'A-'),
(1006, 2, 'B+'),
(1006, 4, 'A'),
(1006, 5, 'B'),
(1007, 1, 'A-'),
(1007, 3, 'B+'),
(1007, 6, 'A'),
(1008, 2, 'A'),
(1008, 4, 'B'),
(1008, 5, 'A-');