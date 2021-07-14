<?php

include_once '../clases/Conexion.php';
require '../plugins/phpmailer/Exception.php';
require '../plugins/phpmailer/PHPMailer.php';
require '../plugins/phpmailer/SMTP.php';
$enlace = $_POST['NULL'];
$agenda = $_POST['agenda'];
$asunto = $_POST['asunto'];
$enlace = $_POST['enlace'];
$estado = $_POST['estado'];
$fecha = $_POST['fecha'];
$fecha_formateada = date('Y-m-d', strtotime($fecha));
$horafinal = $_POST['horafinal'];
$horainicio = $_POST['horainicio'];
$horainiciof = date('H:i;s', strtotime($horainicio));
$lugar = $_POST['lugar'];
$nombre = $_POST['nombre'];
$tipo = $_POST['tipo'];
$participante = $_POST['chk'];
$id_registro = $_POST['id_registro'];

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;





if ($_POST['reunion'] == 'nuevo') {
    $mail = new PHPMailer(true);
    try {
        $stmt = $mysqli->prepare("INSERT INTO tbl_reunion (id_tipo, id_estado, fecha, nombre_reunion, lugar, enlace, hora_inicio, hora_final, asunto, agenda_propuesta) VALUES (?,?,?,?,?,?,?,?,?,?)");
        $stmt->bind_param("iissssssss", $tipo, $estado, $fecha_formateada, $nombre, $lugar, $enlace, $horainicio, $horafinal, $asunto, $agenda);
        $stmt->execute();
        $id_registro = $stmt->insert_id;
        $id_reunion = $id_registro;
        foreach ($participante as $par) {
            $stmt = $mysqli->prepare("INSERT INTO tbl_participantes (id_reunion, id_persona) VALUES (?,?)");
            $stmt->bind_param("ii", $id_reunion, $par);
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
        //Server settings
        $mail->SMTPDebug = 0;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'informaticaunah21@gmail.com';                     //SMTP username
        $mail->Password   = 'informaticaunah2021';                               //SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;
        //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
        //Recipients

        $stmt->close();
        $mail->setFrom('informaticaunah21@gmail.com', 'Depto. Informatica Administrativa');
        $sql = "SELECT t1.valor AS participantes FROM tbl_contactos t1 INNER JOIN tbl_personas t2 ON t2.id_persona = t1.id_persona INNER JOIN tbl_participantes t3 ON t3.id_persona = t2.id_persona WHERE t1.id_tipo_contacto = 4 and t3.id_reunion = $id_reunion";
        $res = $mysqli->query($sql);
        while ($destino = $res->fetch_assoc()) {
            $email = $destino['participantes'];
            $mail->addAddress($email);
        }
        //Content
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = 'Invitación a una NUEVA reunión';
        $body  = "Nombre de la Reunión: <strong>$nombre</strong><br>";
        $body .= "Lugar: <strong>$lugar</strong><br>";
        $body .= "Fecha: <strong>$fecha</strong><br>";
        $body .= "Hora de Inicio: <strong>$horainicio</strong><br>";
        $body .= "Hora Final: <strong>$horafinal</strong><br>";
        $body .= "Enlace: <strong>$enlace</strong><br>";
        $body .= "<br>";
        $body .= "Por medio de la presente se notifica que el <strong>$fecha</strong>";
        $body .= " se realizará la reunión con asunto <strong>$asunto</strong>,";
        $body .= " lugar: <strong>$lugar</strong><br>";
        $body .= " en el horario de <strong>$horainicio</strong>";
        $body .= " a <strong>$horafinal</strong> con los siguientes puntos a tratar: <br><br>";
        $body .= "<strong>$agenda</strong><br>";
        $body .= "<br>";
        $body .= "Saludos, <strong>Depto. IA</strong><br>";
        $mail->Body = $body;
        $mail->CharSet = 'UTF-8';
        $mail->send();
        $mysqli->close();
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
    die(json_encode($respuesta));
}

if ($_POST['reunion'] == 'actualizar') {
    try {
        $stmt = $mysqli->prepare('UPDATE tbl_reunion SET nombre_reunion=?,lugar=?,hora_inicio=?,hora_final=?,fecha=?,asunto=?,agenda_propuesta=?,enlace=?,id_tipo =? WHERE id_reunion=?');
        $stmt->bind_param("ssssssssii", $nombre, $lugar, $horainicio, $horafinal, $fecha_formateada, $asunto, $agenda, $enlace, $tipo, $id_registro);
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

if ($_POST['reunion'] == 'cancelar') {
    $estadocancelar = 2;
    $id_cancelar = $_POST['id'];
    $mail = new PHPMailer(true);
    try {
        $stmt = $mysqli->prepare('UPDATE tbl_reunion SET id_estado = ? WHERE id_reunion = ?');
        $stmt->bind_param('ii', $estadocancelar, $id_cancelar);
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
        //Server settings
        $mail->SMTPDebug = 0;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'informaticaunah21@gmail.com';                     //SMTP username
        $mail->Password   = 'informaticaunah2021';                               //SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;
        //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
        //Recipients
        $mail->setFrom('informaticaunah21@gmail.com', 'Depto. Informatica Administrativa');
        $sql = "SELECT t1.valor AS participantes FROM tbl_contactos t1 INNER JOIN tbl_personas t2 ON t2.id_persona = t1.id_persona INNER JOIN tbl_participantes t3 ON t3.id_persona = t2.id_persona WHERE t1.id_tipo_contacto = 4 and t3.id_reunion = $id_cancelar";
        $res = $mysqli->query($sql);
        while ($destino = $res->fetch_assoc()) {
            $email = $destino['participantes'];
            $mail->addAddress($email);
        }


        $sql = "SELECT nombre_reunion,lugar,hora_inicio,hora_final FROM tbl_reunion where id_reunion = $id_cancelar";
        $datosreunion = $mysqli->query($sql);
        while ($datos = $datosreunion->fetch_assoc()) {
            $nom = $datos['nombre_reunion'];
            $lugar = $datos['lugar'];
            $inicio = $datos['hora_inicio'];
            $final = $datos['hora_final'];
        }
        //Content
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = 'CANCELACION reunión';
        $body .= "<br>";
        $body .= "Por medio de la presente se notifica que la Reunion: <strong>$nom</strong>";
        $body .= " lugar en que se iba a realizar: <strong>$lugar</strong><br>";
        $body .= " en el horario de <strong>$inicio</strong>";
        $body .= " a <strong>$final</strong>";
        $body .= " HA SIDO <strong>CANCELADA</strong>.<br><br>";
        $body .= "Este es un correo automático favor no responder a esta dirección<br> si quiere contactarse con nosotros por algún motivo escribanos a:<br>";
        $body .= "iaunah@unah.edu.hn";
        $body .= "<br>";
        $body .= "<br>";
        $body .= "Saludos, <strong>Depto. IA</strong><br>";
        $mail->Body = $body;
        $mail->CharSet = 'UTF-8';
        $mail->send();
        $stmt->close();
        $mysqli->close();
    } catch (Exception $e) {
        $respuesta = array(
            'respuesta' => $e->getMessage()
        );
    }
    die(json_encode($respuesta));
}
