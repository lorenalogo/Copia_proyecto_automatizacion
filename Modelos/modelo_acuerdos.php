<?php

include_once '../clases/Conexion.php';
$acta = $_POST['acta'];
$responsable = $_POST['responsable'];
$estado = $_POST['estado'];
$nombre_acuerdo = $_POST['nombre_acuerdo'];
$descripcion = $_POST['descripcion'];
$fecha_res = $_POST['NULL'];
$fecha_exp = $_POST['fecha_exp'];
$fecha_formato = date('Y-m-d', strtotime($fecha_exp));

if ($_POST['acuerdo'] == 'nuevo') {
    try {
        $stmt = $mysqli->prepare("INSERT INTO tbl_acuerdos (id_acta, id_participante, id_estado, nombre_acuerdo, descripcion, fecha_resolucion, fecha_expiracion) VALUES (?,?,?,?,?,?,?)");
        $stmt->bind_param("iiissss", $acta, $responsable, $estado, $nombre_acuerdo, $descripcion, $fecha_res, $fecha_exp);
        $stmt->execute();
        $id_registro = $stmt->insert_id;
    
        if ($id_registro > 0) {
            $respuesta = array(
                'respuesta' => 'exito',
                'id_registro' => $id_registro
            );
        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $mysqli->close();
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
    die(json_encode($respuesta));

}
