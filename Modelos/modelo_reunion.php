<?php

include_once '../clases/conexionacta.php';
$agenda = $_POST['agenda'];
$asunto = $_POST['asunto'];
$enlace = $_POST['enlace'];
$estado = $_POST['estado'];
$fecha = $_POST['fecha'];
$fecha_formateada = date('Y-m-d', strtotime($fecha));
$horafinal = $_POST['horafinal'];
$horainicio = $_POST['horainicio'];
$lugar = $_POST['lugar'];
$nombre = $_POST['nombre'];
$tipo = $_POST['tipo'];
$participante = $_POST['chk'];


if ($_POST['reunion'] == 'nuevo') {
    try {
        $stmt = $conn->prepare("INSERT INTO tbl_reunion (Id_Tipo, Id_Estado, Fecha, Nombre_Reunion, Lugar, Enlace, Hora_Inicio, Hora_Final, Asunto, Agenda_Propuesta) VALUES (?,?,?,?,?,?,?,?,?,?)");
        $stmt->bind_param("iissssssss", $tipo, $estado, $fecha_formateada, $nombre, $lugar, $enlace, $horainicio, $horafinal, $asunto, $agenda);
        $stmt->execute();
        $id_registro = $stmt->insert_id;
        $id_reunion = $id_registro;
        foreach($participante as $par){
            $stmt = $conn->prepare("INSERT INTO tbl_participantes (Id_Reunion, Id_Persona) VALUES (?,?)");
            $stmt->bind_param("ii", $id_reunion,$par);
            $stmt->execute();
        }
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
        $conn->close();
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
    die(json_encode($respuesta));

}

if ($_POST['reunion'] == 'actualizar') {
    try {
        $stmt = $conn->prepare('UPDATE tbl_tipo_reunion_acta SET Tipo = ? WHERE Id_Tipo = ?');
        $stmt->bind_param("si", $tipo, $id_tipo);
        $stmt->execute();
        if ($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'exito',
                'id_actualizado' => $stmt->insert_id
            );
        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $conn->close();
    } catch (Exception $e) {
        $respuesta = array(
            'respuesta' => 'error'
        );
    }
    die(json_encode($respuesta));
}

if ($_POST['reunion'] == 'eliminar') {
    $id_borrar = $_POST['id'];

    try {
        $stmt = $conn->prepare('DELETE FROM tbl_tipo_reunion_acta WHERE Id_Tipo = ? ');
        $stmt->bind_param('i', $id_borrar);
        $stmt->execute();
        if ($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'exito',
                'id_eliminado' => $id_borrar
            );
        } else {
            $respuesta = array(
                'respuesta' => 'error'
            );
        }
        $stmt->close();
        $conn->close();
    } catch (Exception $e) {
        $respuesta = array(
            'respuesta' => $e->getMessage()
        );
    }
    die(json_encode($respuesta));
}