<?php
ob_start();
session_start();
include_once '../clases/Conexion.php';
require '../plugins/phpmailer/Exception.php';
require '../plugins/phpmailer/PHPMailer.php';
require '../plugins/phpmailer/SMTP.php';
$enlace = $_POST['NULL'];
$nacta = $_POST['NULL'];
$id_estado = $_POST['id_recursos'];
$desarrollo = $_POST['NULL'];
$fecha = $_POST['fecha'];
$nacta = $_POST['nacta'];
$desarrollo = $_POST['desarrollo'];
$participante = $_POST['participante'];
$asistencia = $_POST['asistencia'];
$id_reunion = $_POST['id_reunion'];
$fecha_formateada = date('Y-m-d', strtotime($fecha));
$horafinal = $_POST['horafinal'];
$horainicio = $_POST['horainicio'];
$horainiciof = date('H:i;s', strtotime($horainicio));
$id_registro = $_POST['id_registro'];
$redactor = $_SESSION['id_usuario'];
$dtz = new DateTimeZone("America/Tegucigalpa");
$dt = new DateTime("now", $dtz);
$hoy = $dt->format("Y-m-d H:i:s");

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if ($_POST['acta'] == 'actualizar') {
    /*
    $respuesta = array(
        'post' => $_POST,
        'file' => $_FILES
    );
    die(json_encode($respuesta));
*/

    try {
        $stmt = $mysqli->prepare('UPDATE tbl_acta SET num_acta =?,hora_inicial=?,hora_final=?,desarrollo=?,redactor=?,fecha_edicion=? WHERE id_acta=?');
        $stmt->bind_param("ssssisi", $nacta, $horainicio, $horafinal, $desarrollo, $redactor, $hoy, $id_registro);
        $stmt->execute();
        foreach ($_REQUEST['asistencia'] as $id_persona => $id_estado_participante) {
            $stmt = $mysqli->prepare(
                "UPDATE tbl_participantes  SET id_estado_participante=? WHERE id_reunion=? AND id_persona=?"
            );
            $stmt->bind_param("iii", $id_estado_participante, $id_reunion, $id_persona);
            $stmt->execute();
        }
        $directorio = "../archivos/archivoactas/$id_registro/";
        if (!is_dir($directorio)) {
            mkdir($directorio, 0755, true);
        }
        if (move_uploaded_file($_FILES['archivo_acta']['tmp_name'], $directorio . $_FILES['archivo_acta']['name'])) {
            $url = $directorio;
            $nombrearchivo =$_FILES['archivo_acta']['name'];
            $formato = pathinfo($nombrearchivo, PATHINFO_EXTENSION);  
            $url_resultado = "se subio correctamente";
        } else {
            $respuesta = array(
                'respuesta' => error_get_last()
            );
        }
        $stmt = $mysqli->prepare('INSERT INTO tbl_acta_recursos(id_acta, url, fecha_carga, redactor,nombre,formato) VALUES (?,?,?,?,?,?)');
        $stmt->bind_param("ississ", $id_registro,$url,$hoy,$redactor,$nombrearchivo,$formato);
        $stmt->execute();
        if ($stmt->affected_rows) {
            $respuesta = array(
                'respuesta' => 'exito',
                'id_actualizado' => $id_registro,
                'resultado_archivo' => $url_resultado
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

if ($_POST['recurso'] == 'borrar') {
    $id_borrar = $_POST['id'];
    try {
        $stmt = $mysqli->prepare(' DELETE FROM tbl_acta_recursos WHERE id_recursos = ?');
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
        $mysqli->close();
    } catch (Exception $e) {
        $respuesta = array(
            'respuesta' => $e->getMessage()
        );
    }
    die(json_encode($respuesta));
}
