<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true ");
    header("Access-Control-Allow-Methods: OPTIONS, GET, POST");
    header("Access-Control-Allow-Headers: Content-Type, Depth, User-Agent, X-File-Size, X-Requested-With, If-Modified-Since, X-File-Name, Cache-Control");
    
    $host = "localhost";
    $user = "root";
    $password = "";
    $dbname = "apace";

    $conn = mysqli_connect($host, $user, $password, $dbname);

    if (!$conn) {
        die (mysqli_connect_error());
    }

    $userData = mysqli_query($conn, "select * from `order details` WHERE 1");
    $response = array();

    while($row = mysqli_fetch_assoc($userData)){
        $response[] = $row;
    }

    echo json_encode($response);