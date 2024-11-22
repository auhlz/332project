<html>
    <body>
        <?php
        echo $_POST['cwid'];
        $input = $_POST['cwid'];
        require_once('sql_connection.php');


        //$query = "SELECT dname FROM department, minor, student_record as S WHERE S.cwid = '$input' AND S.cwid =  minor.cwid AND department.dnum = minor.dnum";
        $query = "SELECT course.title, enrollment.grade FROM student_record, course, enrollment WHERE student_record.cwid = '$input' and student_record.cwid = enrollment.cwid and enrollment.cnum = course.cnum";

        $result = mysqli_query($link, $query);

        //$result = $link->query($query);
        if (mysqli_num_rows($result) > 0) {
            // Loop through each row in the result set
            while ($row = mysqli_fetch_assoc($result)) {
                // Display the dname value for each minor
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
