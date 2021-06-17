<?php
$conn = new mysqli('localhost', 'root','root', 'automatizacion');
mysqli_set_charset($conn, 'utf8');
if($conn->connection_error){
    echo $error -> $conn->connect_error;
}
?>