<?php
    // Get connection
    require_once('sql_connection.php');
    // If ssn is set, run the query a of professor 
    if (isset($_POST['ssn'])) {
        $input = $_POST['ssn'];

        $query = "SELECT course.title, section.classroom, section.meeting_days, section.begin_time, section.end_time 
                    FROM course, section 
                    WHERE section.prof_ssn = '$input' and section.cnum=course.cnum;";

        $result = $link->query($query);

        if ($result->num_rows > 0) {
            // Loop through each row in the result set
            while ($row = $result->fetch_assoc()) {
                // Display
                echo "Course: " . $row["title"] . " - Classroom: " . $row["classroom"] . 
                " - Days: " .$row["meeting_days"] ." - Time: " .$row["begin_time"] . "-" .$row["end_time"] ."<br>";
            }
        } else {
            echo "No results found.";
        }
    }
    // if cnum is set run query b of professor
    if (isset($_POST['cnum'])) {
        // since cnum is set we assume that snum will also be set
        $input = $_POST['cnum'];
        $input2 = $_POST['snum'];

        $query = "SELECT enrollment.grade, COUNT(*) as studnets
                    FROM enrollment
                    WHERE enrollment.cnum = '$input' AND enrollment.snum = '$input2'
                    GROUP BY enrollment.grade";

        $result = $link->query($query);

        if ($result->num_rows > 0) {
            // Loop through each row in the result set
            while ($row = $result->fetch_assoc()) {
                // Display
                echo "Grade (" .$row["grade"] ."): " . "Count: " .$row["studnets"] ."<br>";
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
