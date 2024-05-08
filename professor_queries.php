<!DOCTYPE html>
<html>
<head>
    <title>Professor Queries</title>
</head>
<body>
    <h1>Professor Queries</h1>

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

    // Query a: Given the social security number of a professor, list the titles, classrooms, meeting days and time of his/her classes
    if (isset($_GET['ssn'])) {
        $ssn = $_GET['ssn'];
        
        $sql_query_a = "SELECT p.Name AS ProfessorName, c.Title, s.Classroom, s.MeetingDays, s.BeginningTime, s.EndingTime 
                        FROM Professor p
                        JOIN Section s ON p.SSN = s.ProfessorSSN
                        JOIN Course c ON s.CourseNumber = c.CourseNumber
                        WHERE p.SSN = $ssn";
        
        $result_a = $conn->query($sql_query_a);
        
        $professorName = ""; // Variable to store the professor's name
        
        if ($result_a->num_rows > 0) {
            $row = $result_a->fetch_assoc();
            $professorName = $row['ProfessorName'];
            
            echo "<h3>Classes for Professor: $professorName</h3>";
            echo "<table>
                    <tr>
                        <th>Title</th>
                        <th>Classroom</th>
                        <th>Meeting Days</th>
                        <th>Beginning Time</th>
                        <th>Ending Time</th>
                    </tr>";
            
            $result_a->data_seek(0); // Reset the result pointer to the beginning
            
            while ($row = $result_a->fetch_assoc()) {
                echo "<tr>
                        <td>".$row['Title']."</td>
                        <td>".$row['Classroom']."</td>
                        <td>".$row['MeetingDays']."</td>
                        <td>".$row['BeginningTime']."</td>
                        <td>".$row['EndingTime']."</td>
                    </tr>";
            }
            echo "</table>";
        } else {
            echo "No classes found for the given professor.";
        }
    }

    // Query b: Given a course number and a section number, count how many students get each distinct grade
    if (isset($_GET['course_number']) && isset($_GET['section_number'])) {
        $course_number = $_GET['course_number'];
        $section_number = $_GET['section_number'];
        
        $sql_query_b = "SELECT e.Grade, COUNT(*) AS count
                        FROM Enrollment e
                        JOIN Section s ON e.SectionID = s.SectionID
                        WHERE s.CourseNumber = '$course_number' AND s.SectionNumber = '$section_number'
                        GROUP BY e.Grade";
        
        $result_b = $conn->query($sql_query_b);
        
        if ($result_b->num_rows > 0) {
            echo "<h3>Grade Distribution for Course: $course_number, Section: $section_number</h3>";
            echo "<table>
                    <tr>
                        <th>Grade</th>
                        <th>Count</th>
                    </tr>";
            while ($row = $result_b->fetch_assoc()) {
                echo "<tr>
                        <td>".$row['Grade']."</td>
                        <td>".$row['count']."</td>
                      </tr>";
            }
            echo "</table>";
        } else {
            echo "No grade distribution found for the given course and section.";
        }
    }

    $conn->close();
    ?>

    <br>
    <a href="index.html"><button>Back to Main Page</button></a>
</body>
</html>