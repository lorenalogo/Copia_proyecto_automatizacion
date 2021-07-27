<?php
// Colaboracion: JLLC-9112205');
ob_start();
session_start();
require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/Conexion.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');
$Id_objeto = 148;
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
                           window.location = "../vistas/menu_reunion_vista.php";
                            </script>';
} else {
    bitacora::evento_bitacora($Id_objeto, $_SESSION['id_usuario'], 'Ingreso', 'A Lista de Reuniones');
}
$sql2 = $mysqli->prepare("SELECT tbl_periodo.id_periodo AS id_periodo, tbl_periodo.num_periodo AS num_periodo, tbl_periodo.num_anno AS num_anno, tbl_periodo.fecha_adic_canc AS fecha_adic_canc, tbl_periodo.fecha_desbloqueo AS fecha_desbloqueo,
(SELECT tp.descripcion FROM tbl_tipo_periodo AS tp INNER JOIN tbl_periodo AS pdo ON tp.id_tipo_periodo=pdo.id_tipo_periodo
			WHERE tp.id_tipo_periodo= tbl_periodo.id_tipo_periodo LIMIT 1) AS tipo_periodo,
			(SELECT tp.horas_validas FROM tbl_tipo_periodo AS tp INNER JOIN tbl_periodo AS pdo ON tp.id_tipo_periodo=pdo.id_tipo_periodo
			WHERE tp.id_tipo_periodo= tbl_periodo.id_tipo_periodo LIMIT 1) AS horas_validas
FROM tbl_periodo
ORDER BY id_periodo DESC LIMIT 1;");
$sql2->execute();
$resultado2 = $sql2->get_result();
$row2 = $resultado2->fetch_array(MYSQLI_ASSOC);
ob_end_flush();
?>
<!DOCTYPE html>
<html>

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
                        <h1>Lista de Reuniones</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="../vistas/pagina_principal_vista.php">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="../vistas/menu_reunion_vista.php">Menu Gestión Reunión</a></li>
                        </ol>
                    </div>
                    <div class="RespuestaAjax"></div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!--Pantalla 2-->
        <div class="card card-default">
            <div class="card-header">
                <!--BOTON AGENDAR REUNIÓN-->
                <!-- <div class="px-1">
                    <a href="../vistas/agendar_reunion_vista.php" class="btn btn-warning"><i class="fas fa-arrow"></i>Agendar Nueva Reunión</a>
                </div>-->
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
                                    <table id="tabla28" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nombre Reunión</th>
                                                <th>Fecha</th>
                                                <th>Lugar</th>
                                                <th>Tipo</th>
                                                <th>Estado</th>
                                                <th>Memorandum</th>
                                                <!-- <th>Acta</th>-->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            try {
                                                $sql = "SELECT tbl_reunion.id_reunion AS id_reunion,
                                                                    tbl_reunion.nombre_reunion AS nombre,
                                                                    tbl_tipo_reunion_acta.tipo AS tipo, 
                                                                    tbl_estado_reunion.estado_reunion AS estado,
                                                                    tbl_reunion.lugar AS lugar, 
                                                                    tbl_reunion.fecha AS fecha, 
                                                                    tbl_reunion.hora_inicio AS hora_incio, 
                                                                    tbl_reunion.hora_final AS hora_final,
                                                                    tbl_reunion.asunto AS Asunto
                                                                    FROM tbl_reunion
                                                                    INNER JOIN tbl_tipo_reunion_acta ON tbl_reunion.id_Tipo = tbl_tipo_reunion_acta.id_tipo
                                                                    INNER JOIN tbl_estado_reunion ON tbl_reunion.id_estado = tbl_estado_reunion.id_estado_reunion";
                                                $resultado = $mysqli->query($sql);
                                            } catch (Exception $e) {
                                                $error = $e->getMessage();
                                                echo $error;
                                            }
                                            while ($reunion = $resultado->fetch_assoc()) { ?>
                                                <tr>
                                                    <td><?php echo $reunion['nombre']; ?></td>
                                                    <td><?php echo $reunion['fecha']; ?></td>
                                                    <td><?php echo $reunion['lugar']; ?></td>
                                                    <td><?php echo $reunion['tipo']; ?></td>
                                                    <td><?php echo $reunion['estado']; ?></td>
                                                    <td><a target="_blank" href="../pdf/reporte_memorandum.php?id=<?php echo $reunion['id_reunion'] ?>">VER MEMORANDUM</a></td>
                                                </tr>
                                            <?php
                                            }  ?>
                                        </tbody>
                                        <thead>
                                            <tr>
                                                <th>Nombre Reunión</th>
                                                <th>Fecha</th>
                                                <th>Lugar</th>
                                                <th>Tipo</th>
                                                <th>Estado</th>
                                                <th>Memorandum</th>
                                                <!-- <th>Acta</th>-->
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
            $('#tabla28').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true,
                "responsive": true,
            });
        });
    </script>
</body>

</html>
<script type="text/javascript" src="../js/funciones_registro_docentes.js"></script>
<script type="text/javascript" src="../js/validar_registrar_docentes.js"></script>

<script type="text/javascript" src="../js/pdf_mantenimientos.js"></script>
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