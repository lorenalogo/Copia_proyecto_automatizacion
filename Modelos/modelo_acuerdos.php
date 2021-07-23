<?php

include_once '../clases/Conexion.php';
$acta = $_POST['acta'];
$responsable = $_POST['responsable'];
$estado = $_POST['estado'];
$nombre_acuerdo = $_POST['nombre_acuerdo'];
$descripcion = $_POST['descripcion'];
$fecha_res = 'PENDIENTE';
$fecha_exp = $_POST['fecha_exp'];
$fecha_formato = date('Y-m-d', strtotime($fecha_exp));
$id_registro = $_POST['id_registro'];

if ($_POST['acuerdo'] == 'nuevo') {
    $estado = 1;
    try {
        $stmt = $mysqli->prepare("INSERT INTO tbl_acuerdos (id_acta, id_participante, id_estado, nombre_acuerdo, descripcion, resolucion, fecha_expiracion) VALUES (?,?,?,?,?,?,?)");
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


if ($_POST['acuerdo'] == 'actualizar') {
    $estado = 1;
    try {
        $stmt = $mysqli->prepare('UPDATE tbl_acuerdos SET id_acta=?,id_participante=?,id_estado=?,nombre_acuerdo=?,descripcion=?,resolucion=?,fecha_expiracion=? WHERE id_acuerdo=?');
        $stmt->bind_param("iiissssi", $acta, $responsable, $estado, $nombre_acuerdo, $descripcion, $fecha_res, $fecha_exp, $id_registro);
        $stmt->execute();
        if ($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'exito',
                'id_actualizado' => $id_registro
            );
        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $mysqli->close();
    } catch (Exception $e) {
        $respuesta = array(
            'respuesta' => 'error'
        );
    }
    die(json_encode($respuesta));
}

if ($_POST['acuerdos'] == 'finalizar') {
    $estadofinalizar = 2;
    $fecha_res = 'FINALIZADO';
    $id_registrof = $_POST['id'];
    try {
        $stmt = $mysqli->prepare('UPDATE tbl_acuerdos SET id_estado = ?, resolucion = ? WHERE id_acuerdo = ?');
        $stmt->bind_param("isi", $estadofinalizar, $fecha_res, $id_registrof);
        $stmt->execute();
        if ($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'exito',
                'id_actualizado' => $id_registro
            );
        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $mysqli->close();
    } catch (Exception $e) {
        $respuesta = array(
            'respuesta' => 'error'
        );
    }
    die(json_encode($respuesta));
}

if ($_POST['acuerdo'] == 'cancelar') {
    $id_registroc = $_POST['id'];
    $estadocancelar = 3;
    $fecha_res = 'CANCELADO';
    try {
        $stmt = $mysqli->prepare('UPDATE tbl_acuerdos SET id_estado = ?, resolucion = ? WHERE id_acuerdo = ?');
        $stmt->bind_param("isi", $estadocancelar, $fecha_res, $id_registroc);
        $stmt->execute();
        if ($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'exito',
                'id_actualizado' => $id_registro
            );
        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $mysqli->close();
    } catch (Exception $e) {
        $respuesta = array(
            'respuesta' => 'error'
        );
    }
    die(json_encode($respuesta));
}
