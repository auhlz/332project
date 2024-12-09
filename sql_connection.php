<?php
// Gets a connection to the database
const DB_USER = 'root';
const DB_PASSWORD = '';
const DB_HOST = 'localhost';
const DB_NAME = 'mydb';

$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
if (!$link) {
    die("Unable to connect to database: " . mysqli_connect_error());
}
echo 'Connected successfully<p>';

?>