<?php
// Colaboracion: JLLC-9112205');
ob_start();
session_start();
require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/Conexion.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');

$Id_objeto = 155;
$visualizacion = permiso_ver($Id_objeto);
if ($visualizacion == 0) {
    echo '<script type="text/javascript">
                              swal({
                                   title:"",
                                   text:"Lo sentimos no tiene permiso de visualizar la pantalla",
                                   type: "error",
                                   showConfirmButton: false,
                                   timer: 3000
                                });
                           window.location = "../vistas/menu_asistencia_vista.php";
                            </script>';
} else {
    bitacora::evento_bitacora($Id_objeto, $_SESSION['id_usuario'], 'Ingreso', 'A Asistencia por Persona');
}

ob_end_flush();
?>
<!DOCTYPE html>
<html>
<!--<style>
.text-center{
    text-align: text-center;    
}-->

</style>

<head>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../plugins/datatables/datatables.min.css" />
    <link rel="stylesheet" type="text/css" href="../plugins/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel=" stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Asistencia por persona</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="../vistas/pagina_principal_vista.php">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="../vistas/menu_asistencia_vista.php">Menu Asistencia</a></li>
                            <li class="breadcrumb-item active">Lista de Actas</li>
                        </ol>
                    </div>
                    <div class="RespuestaAjax"></div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!--Pantalla 2-->


        <div class="card card-default">
            <div class="card-header">
                <h3 class="card-title">Lista Asistencia por persona</h3>

                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                </div>
            </div>
            <!-- /.card-header -->
            <!-- /.card-header -->
            <div class="card-body">
                <div class="card card-primary card-outline card-outline-tabs">
                    <div class="card-header p-0 border-bottom-0">
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="custom-tabs-four-tabContent">
                            <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                                <form role="form" name="guardar-tiporeu" id="guardar-tiporeu" method="post" action="../Modelos/modelo_manactareunion.php">

                                    <table id="asistencia_persona" class="table table-bordered table-striped">
                                        <thead class="text-center">
                                            <tr>
                                                <th>Nombre Persona</th>
                                                <th>No. reuniones</th>
                                                <th>Asistencia</th>
                                                <th>Inasistencia</th>
                                                <th>Excusados</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $dtz = new DateTimeZone("America/Tegucigalpa");
                                            $dt = new DateTime("now", $dtz);
                                            $hoy = $dt->format("Y");
                                            try {
                                                $sql = "SELECT
                                                pe.id_persona,
                                                CONCAT_WS(' ', pe.nombres, pe.apellidos) nombres,
                                                COUNT(pa.id_estado_participante) reuniones,
                                                ROUND(
                                                    (
                                                        SUM(pa.id_estado_participante = 1) / COUNT(pa.id_estado_participante)
                                                    ) * 100
                                                ) asistencia,
                                                ROUND(
                                                    (
                                                        SUM(pa.id_estado_participante = 2) / COUNT(pa.id_estado_participante)
                                                    ) * 100
                                                ) inasistencia,
                                                ROUND(
                                                    (
                                                        SUM(pa.id_estado_participante = 3) / COUNT(pa.id_estado_participante)
                                                    ) * 100
                                                ) excusa
                                            FROM
                                                tbl_personas pe
                                            LEFT JOIN tbl_participantes pa ON
                                                pa.id_persona = pe.id_persona
                                            LEFT JOIN tbl_horario_docentes hrd ON
                                                hrd.id_persona = pe.id_persona
                                            LEFT JOIN tbl_jornadas j ON
                                                j.id_jornada = hrd.id_jornada
                                             LEFT JOIN tbl_reunion t1 ON
                                                t1.id_reunion = pa.id_reunion
                                            WHERE
                                                pe.Estado = 'ACTIVO' AND t1.fecha LIKE '%$hoy%' AND pe.id_tipo_persona != 2
                                            GROUP BY
                                                pe.id_persona
                                            ORDER BY
                                                `nombres` ASC";
                                                $resultado = $mysqli->query($sql);

                                                while ($asistencia = $resultado->fetch_assoc()) { ?>
                                                    <tr>
                                                        <td><strong><?php echo $asistencia['nombres']; ?></strong></td>
                                                        <td><?php echo $asistencia['reuniones']; ?></td>
                                                        <td class="text-center" style="color:rgb(0, 193, 3 );"><?php echo $asistencia['asistencia']; ?>%</td>
                                                        <td class="text-center" style="color:red;"><?php echo $asistencia['inasistencia']; ?>%</td>
                                                        <td class="text-center" style="color:rgb(255, 135, 0);"><?php echo $asistencia['excusa']; ?>%</td>
                                                    </tr>
                                            <?php
                                                }
                                            } catch (Exception $e) {
                                                $error = $e->getMessage();
                                                echo $error;
                                            }  ?>
                                        </tbody>
                                        <thead class="text-center">
                                            <tr>
                                                <th>Nombre Persona</th>
                                                <th>No. reuniones</th>
                                                <th>Asistencia</th>
                                                <th>Inasistencia</th>
                                                <th>Excusados</th>

                                            </tr>
                                        </thead>
                                    </table>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="custom-tabs-four-messages" role="tabpanel" aria-labelledby="custom-tabs-four-messages-tab">
                                <div class="card card-primary">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </section>
    </div>
    <!-- /.content-wrapper -->
    </div>
    <script type="text/javascript">
        $(function() {
            $('#asistencia_persona').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true,
                "responsive": true
            });
        });
    </script>
</body>

</html>
<script src="../plugins/select2/js/select2.min.js"></script>
<!-- datatables JS -->
<script type="text/javascript" src="../plugins/datatables/datatables.min.js"></script>
<!-- para usar botones en datatables JS -->
<script src="../plugins/datatables/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>
<script src="../plugins/datatables/JSZip-2.5.0/jszip.min.js"></script>
<script src="../plugins/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script src="../plugins/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script src="../plugins/datatables/Buttons-1.5.6/js/buttons.html5.min.js"></script>
<script src="../js/tipoacta-ajax.js"></script>
<script type="text/javascript" src="../js/funciones_registro_docentes.js"></script>
<script type="text/javascript" src="../js/validar_registrar_docentes.js"></script>

<script type="text/javascript" src="../js/pdf_mantenimientos.js"></script>