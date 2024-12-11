<?php
// Gets a connection to the database
const username = '';
const password = '';
const hostname = '';
const database_name = '';

$link = mysqli_connect(hostname, username, password, database_name);
if (!$link) {
    die("Unable to connect to database: " . mysqli_connect_error());
}
echo 'Connected successfully<p>';

?>