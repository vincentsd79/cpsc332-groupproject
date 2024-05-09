<!DOCTYPE html>
<html>
<head>
    <title>Student Queries</title>
</head>
<body>
    <h1>Student Queries</h1>

    <?php
    // Database connection details
    $servername = "mariadb";
    $username = "cs332e20";
    $password = "MKC6Ah0w";
    $dbname = "cs332e20";

    // Create a connection to the database
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Query a: Given a course number, list the sections of the course, including the classrooms, the meeting days and time, and the number of students enrolled in each section
    if (isset($_GET['course_number'])) {
        $course_number = $_GET['course_number'];

        $sql_query_a = "SELECT s.SectionNumber,s.Classroom, s.MeetingDays, s.BeginningTime, s.EndingTime, COUNT(*) AS enrolled_students
                        FROM Section s
                        LEFT JOIN Enrollment e ON s.SectionID = e.SectionID
                        WHERE s.CourseNumber = '$course_number'
                        GROUP BY s.SectionID";    

        $result_a = $conn->query($sql_query_a);
        
        if ($result_a->num_rows > 0) {
            echo "<h3>Sections for Course: $course_number</h3>";
            echo "<table>
                    <tr>
                        <th>Section Number</th>
                        <th>Classroom</th>
                        <th>Meeting Days</th>
                        <th>Beginning Time</th>
                        <th>Ending Time</th>
                        <th>Enrolled Students</th>
                    </tr>";
            while ($row = $result_a->fetch_assoc()) {
                echo "<tr>
                        <td>".$row['SectionNumber']."</td>
                        <td>".$row['Classroom']."</td>
                        <td>".$row['MeetingDays']."</td>
                        <td>".$row['BeginningTime']."</td>
                        <td>".$row['EndingTime']."</td>
                        <td>".$row['enrolled_students']."</td>
                      </tr>";
            }
            echo "</table>";
        } else {
            echo "No sections found for the given course.";
        }
    }

    // Query b: Given the campus wide ID of a student, list all courses the student took and the grades
    if (isset($_GET['student_id'])) {
        $student_id = $_GET['student_id'];
        
        $sql_query_b = "SELECT s.FirstName, s.LastName, c.CourseNumber, c.Title, e.Grade
                        FROM Enrollment e
                        JOIN Section sc ON e.SectionID = sc.SectionID
                        JOIN Course c ON sc.CourseNumber = c.CourseNumber
                        JOIN Student s ON e.StudentCWID = s.StudentCWID
                        WHERE e.StudentCWID = $student_id";
        
        $result_b = $conn->query($sql_query_b);
        
        if ($result_b->num_rows > 0) {
            $row = $result_b->fetch_assoc();
            $full_name = $row['FirstName']." ".$row['LastName'];
            echo "<h3>Courses and Grades for Student ID: $student_id ($full_name)</h3>";
            echo "<table>
                    <tr>
                        <th>Course Number</th>
                        <th>Course Title</th>
                        <th>Grade</th>
                    </tr>";
            while ($row = $result_b->fetch_assoc()) {
                echo "<tr>
                        <td>".$row['CourseNumber']."</td>
                        <td>".$row['Title']."</td>
                        <td>".$row['Grade']."</td>
                      </tr>";
            }
            echo "</table>";
        } else {
            echo "No courses found for the given student ID.";
        }
    }

    $conn->close();
    ?>
    
    <br>
    <a href="index.html"><button>Back to Main Page</button></a>
</body>
</html>