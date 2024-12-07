
<?php
    require_once('sql_connection.php');
    if (isset($_POST['cnum'])) {

        $input = $_POST['cnum'];
        $query = "SELECT section.cnum, section.snum,section.classroom, section.meeting_days, section.begin_time, section.end_time, COUNT(*) AS student_count 
                    FROM section, enrollment 
                    WHERE section.cnum = '$input' AND enrollment.snum = section.snum 
                    GROUP BY section.snum, section.classroom, section.meeting_days, section.begin_time, section.end_time";

        $result = $link->query($query);
        
        if ($result->num_rows > 0) {
            // Loop through each row in the result set
            while ($row = $result->fetch_assoc()) {
                // Display 
                echo "Section Number: " . $row["snum"] . " - Classroom: " . $row["classroom"] .  " - Meeting Days: " . 
                                        $row["meeting_days"] . " - Time: " . $row["begin_time"] . "-" .
                                        $row["end_time"] . " - Enrolled: " . $row["student_count"] ."<br>";
            }
        } else {
            echo "No results found.";
        }
    }

    // Second query
    if (isset($_POST['cwid'])) { 

        $input = $_POST['cwid'];
        $query = "SELECT course.title, enrollment.grade 
                    FROM student_record, course, enrollment 
                    WHERE student_record.cwid = '$input' and student_record.cwid = enrollment.cwid and enrollment.cnum = course.cnum";

        $result = $link->query($query);

        if ($row = $result->fetch_assoc()) {
            // Loop through each row in the result set
            echo "Courses Taken:<br>";
            while ($row = mysqli_fetch_assoc($result)) {
                // Display 
                echo "Course: " . $row["title"] . " - Grade: " . $row["grade"] . "<br>";
            }
        } else {
            echo "No results found.";
        }
    }
    $result->free_result();
    $link->close();
?>

<html>
    <body>
  
    <nav>
        <a href="index.html">Back to Home</a>
    </nav>

    </body>
</html>
