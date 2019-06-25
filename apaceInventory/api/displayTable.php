<?php
    //display any table
    //inputs: table name
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true ");
    header("Access-Control-Allow-Methods: OPTIONS, GET, POST");
    header("Access-Control-Allow-Headers: Content-Type, Depth, User-Agent, X-File-Size, X-Requested-With, If-Modified-Since, X-File-Name, Cache-Control");
    
    include 'config.php';

    $query = "select * from `".$_GET['tableName']."` WHERE 1";
    // $query = "select * from `order details` WHERE 1";

    $userData = mysqli_query($conn, $query);
    $response = array();

    while($row = mysqli_fetch_assoc($userData)){
        $response[] = $row;
    }

    echo json_encode($response);
