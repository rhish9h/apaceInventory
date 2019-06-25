<?php
    //one script to delete particular row form particular table
    //inputs: table name & serial number
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true ");
    header("Access-Control-Allow-Methods: OPTIONS, GET, POST");
    header("Access-Control-Allow-Headers: Content-Type, Depth, User-Agent, X-File-Size, X-Requested-With, If-Modified-Since, X-File-Name, Cache-Control");
    
    if ($_SERVER['REQUEST_METHOD'] === 'GET') { //post not working, so used get
        include 'config.php';

        $delField = $_GET['delField'] ?? 'serial number';
        $srno = $_GET['srno'] ?? ''; // empty if get doesn't have the variable
        $tbNam = $_GET['tbNam'] ?? '';

        $query = "DELETE FROM `$tbNam` WHERE `$tbNam`.`$delField` = $srno";

        $userData = mysqli_query($conn, $query);
        
        if(!$userData) {
            die (mysqli_errors);
        }
    }
    