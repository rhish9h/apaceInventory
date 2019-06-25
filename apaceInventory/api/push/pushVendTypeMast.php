<?php
    //push data into the orders tables
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true ");
    header("Access-Control-Allow-Methods: OPTIONS, GET, POST");
    header("Access-Control-Allow-Headers: Content-Type, Depth, User-Agent, X-File-Size, X-Requested-With, If-Modified-Since, X-File-Name, Cache-Control");
    
    if ($_SERVER['REQUEST_METHOD'] === 'GET') { //post not working, so used get
        include '../config.php';

        $vendType = $_GET['vendType'] ?? '';
        $active = $_GET['active'] ?? '';

        $query = "INSERT INTO `vendor type master` (`vendor type`, `active`) VALUES ('$vendType', '$active')";

        $userData = mysqli_query($conn, $query);
        
        if(!$userData) {
            die (mysqli_errors);
        }
    }
    