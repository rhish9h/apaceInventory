<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true ");
    header("Access-Control-Allow-Methods: OPTIONS, GET, POST");
    header("Access-Control-Allow-Headers: Content-Type, Depth, User-Agent, X-File-Size, X-Requested-With, If-Modified-Since, X-File-Name, Cache-Control");
    
    if ($_SERVER['REQUEST_METHOD'] === 'GET') { //post not working, so used get
        include 'config.php';

        $subid = $_GET['subid'] ?? '';
        $size = $_GET['size']  ?? '';
        $quant = $_GET['quant']  ?? '';

        $query = "INSERT INTO `order details` (`serial number`, `suborder id`, `size`, `quantity`) VALUES (NULL, '$subid', '$size', '$quant')";

        $userData = mysqli_query($conn, $query);
        
        if(!$userData) {
            die (mysqli_errors);
        }
    }
    