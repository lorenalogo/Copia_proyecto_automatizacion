<?php
header('Content-type: application/json');
$pdo=new PDO("mysql:dbname=automatizacion;host=localhost","root","root");
$sentenciaSQL = $pdo->prepare("SELECT `id_reunion` AS id, `nombre_reunion` AS title, CONCAT(`fecha`, ' ', `hora_inicio`) AS start, CONCAT(`fecha`, ' ' , `hora_final`) AS end 
FROM `tbl_reunion` WHERE id_tipo = 1");
$sentenciaSQL->execute();

$resul= $sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($resul);
?>