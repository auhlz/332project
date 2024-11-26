<html>
    <body>
        <?php
        require_once('sql_connection.php');

        echo $_POST['cnum'];
        $input = $_POST['cnum'];
        $query = "SELECT section.cnum, section.classroom, section.meeting_days, section.begin_time, section.end_time, COUNT(*) AS student_count 
                    FROM section, enrollment WHERE section.cnum = '$input' AND enrollment.snum = section.snum 
                    GROUP BY section.cnum, section.classroom, section.meeting_days, section.begin_time, section.end_time";


        $result = mysqli_query($link, $query);
        
        if (mysqli_num_rows($result) > 0) {
            // Loop through each row in the result set
            while ($row = mysqli_fetch_assoc($result)) {
                // Display 
                echo "Course Number: " . $row["cnum"] . " - classroom: " . $row["classroom"] .  " - meeting_days: " . $row["meeting_days"] . " - Time: " . $row["begin_time"] . "-" . $row["end_time"] . " - Enrolled: " . $row["student_count"] ."<br>";
            }
        } else {
            echo "No results found.";
        }
        echo $_POST['cwid'];
        $input = $_POST['cwid'];
        $query = "SELECT course.title, enrollment.grade 
                    FROM student_record, course, enrollment 
                    WHERE student_record.cwid = '$input' and student_record.cwid = enrollment.cwid and enrollment.cnum = course.cnum";

        $result = mysqli_query($link, $query);

        if (mysqli_num_rows($result) > 0) {
            // Loop through each row in the result set
            while ($row = mysqli_fetch_assoc($result)) {
                // Display 
                echo "Course: " . $row["title"] . " - Grade: " . $row["grade"] . "<br>";
            }
        } else {
            echo "No results found.";
        }


        ?>
        
    <nav>
        <a href="index.html">Back to Home</a>
    </nav>
    </body>
</html>
