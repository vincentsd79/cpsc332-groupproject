CREATE TABLE Professor (
    SSN INT PRIMARY KEY,
    Name VARCHAR(100),
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    AreaCode VARCHAR(3),
    PhoneNumber VARCHAR(7),
    Sex VARCHAR(10),
    Title VARCHAR(50),
    Salary DECIMAL(10, 2),
    Degrees VARCHAR(100)
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(20),
    OfficeLocation VARCHAR(100),
    ChairpersonSSN INT,
    FOREIGN KEY (ChairpersonSSN) REFERENCES Professor(SSN)
);

CREATE TABLE Course (
    CourseNumber VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100),
    Textbook VARCHAR(100),
    Units INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Prerequisite (
    CourseNumber VARCHAR(10),
    PrerequisiteCourseNumber VARCHAR(10),
    PRIMARY KEY (CourseNumber, PrerequisiteCourseNumber),
    FOREIGN KEY (CourseNumber) REFERENCES Course(CourseNumber),
    FOREIGN KEY (PrerequisiteCourseNumber) REFERENCES Course(CourseNumber)
);

CREATE TABLE Section (
    SectionID INT PRIMARY KEY,
    CourseNumber VARCHAR(10),
    SectionNumber VARCHAR(10),
    Classroom VARCHAR(50),
    Seats INT,
    MeetingDays VARCHAR(20),
    BeginningTime TIME,
    EndingTime TIME,
    ProfessorSSN INT,
    FOREIGN KEY (CourseNumber) REFERENCES Course(CourseNumber),
    FOREIGN KEY (ProfessorSSN) REFERENCES Professor(SSN)
);

CREATE TABLE Student (
    StudentCWID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    AreaCode VARCHAR(3),
    PhoneNumber VARCHAR(7),
    MajorDepartmentID INT,
    FOREIGN KEY (MajorDepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Minor (
    StudentCWID INT,
    DepartmentID INT,
    PRIMARY KEY (StudentCWID, DepartmentID),
    FOREIGN KEY (StudentCWID) REFERENCES Student(StudentCWID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Enrollment (
    StudentCWID INT,
    SectionID INT,
    Grade VARCHAR(2),
    PRIMARY KEY (StudentCWID, SectionID),
    FOREIGN KEY (StudentCWID) REFERENCES Student(StudentCWID),
    FOREIGN KEY (SectionID) REFERENCES Section(SectionID)
);