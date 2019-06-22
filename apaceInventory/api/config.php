<?php
$host = "localhost";
    $user = "root";
    $password = "";
    $dbname = "apace";

    $conn = mysqli_connect($host, $user, $password, $dbname);

    if (!$conn) {
        die (mysqli_connect_error());
    }