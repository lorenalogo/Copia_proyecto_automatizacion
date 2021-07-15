<?php
// Colaboracion: JLLC-9112205');
ob_start();
session_start();
require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/Conexion.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');
$Id_objeto = 103;
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
                           window.location = "../vistas/menu_roles_vista.php";
                            </script>';
} else {
    bitacora::evento_bitacora($Id_objeto, $_SESSION['id_usuario'], 'Ingreso', 'A Lista de Reuniones');
}

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
                        <h1>Lista de Actas</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="../vistas/pagina_principal_vista.php">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="../vistas/menu_acta_vista.php">Menu Gestión actas</a></li>
                            <li class="breadcrumb-item"><a href="#">Lista de Actas</a></li>
                        </ol>
                    </div>
                    <div class="RespuestaAjax"></div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!--Pantalla 2-->

        
        <div class="card card-default">
            <div class="card-header">
            <h3 class="card-title">Listado de todas las Actas</h3>
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
                                    <table id="tabla11" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>No. Acta</th>
                                                <th>Nombre Reunión</th>
                                                <th>Estado</th>
                                                <th>Fecha</th>
                                                <th>Hora Inicio</th>
                                                <th>Hora Final</th>
                                                <th>Archivos</th>
                                                <th>Acciones</th>
                                                <!-- <th>Acta</th>-->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            try {
                                                $sql = "SELECT t1.id_acta,t1.num_acta,t2.nombre_reunion,t4.tipo, t3.estado,t2.lugar,t1.fecha,t1.hora_inicial,t1.hora_final, GROUP_CONCAT(t5.url) AS url
                                                from tbl_acta t1
                                                LEFT JOIN tbl_reunion t2 ON t2.id_reunion = t1.id_reunion
                                                LEFT JOIN tbl_estado_acta t3 ON t3.id_estado = t1.id_estado
                                                LEFT JOIN tbl_tipo_reunion_acta t4 ON t4.id_tipo = t1.id_tipo
                                                LEFT JOIN tbl_acta_recursos t5 on t5.id_acta = t1.id_acta
                                                GROUP BY T1.id_acta";
                                                $resultado = $mysqli->query($sql);
                                            } catch (Exception $e) {
                                                $error = $e->getMessage();
                                                echo $error;
                                            }
                                            while ($reunion = $resultado->fetch_assoc()) { ?>
                                                <tr>
                                                    <td><?php echo $reunion['num_acta']; ?></td>
                                                    <td><?php echo $reunion['nombre_reunion']; ?></td>
                                                    <td><?php echo $reunion['estado']; ?></td>
                                                    <td><?php echo $reunion['fecha']; ?></td>
                                                    <td><?php echo $reunion['hora_inicial']; ?></td>
                                                    <td><?php echo $reunion['hora_final']; ?></td>
                                                    <td>
                                                    <a target="_blank" href="<?php echo $reunion['url']; ?>">archivos</a></td>
                                                    <td><a target="_blank" href="../vistas/reporte_acta.php?id=<?php echo $reunion['id_acta'] ?>">VER ACTA</a></td>
                                                </tr>
                                            <?php
                                            }  ?>
                                        </tbody>
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
            $('#tabla11').DataTable({
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
<script type="text/javascript" src="../js/pdf_lista_reuniones.js"></script>
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