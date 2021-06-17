<?php
include_once '../clases/conexionacta.php';
$tipo = $_POST['tipo'];
$id_tipo = $_POST['id_tipo'];
if ($_POST['tipo-actareunion'] == 'nuevo') {
    try {
        $stmt = $conn->prepare("INSERT INTO tbl_tipo_reunion_acta (Tipo) VALUES (?)");
        $stmt->bind_param("s", $tipo);
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
        $conn->close();
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
    die(json_encode($respuesta));
}

if ($_POST['tipo-actareunion'] == 'actualizar') {
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



if ($_POST['tipo-actareunion'] == 'eliminar') {
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
