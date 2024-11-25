<html>
    <body>
        <?php
        echo $_POST['ssn'];
        $input = $_POST['ssn'];
        require_once('sql_connection.php');


        $query = "SELECT course.title, section.classroom, section.meeting_days, section.begin_time, section.end_time FROM course, section WHERE section.prof_ssn = '2341' and section.cnum=course.cnum;";

        $result = mysqli_query($link, $query);

        if (mysqli_num_rows($result) > 0) {
            // Loop through each row in the result set
            while ($row = mysqli_fetch_assoc($result)) {
                // Display
                echo "Course: " . $row["title"] . " - Classroom: " . $row["classroom"] . " Days: " .$row["meeting_days"] ." Time: " .$row["begin_time"] . "-" .$row["end_time"] ."<br>";
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
