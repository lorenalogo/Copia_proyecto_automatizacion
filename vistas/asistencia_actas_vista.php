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
                        <h1>Porcentaje Asistencia por acta</h1>
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
            <h3 class="card-title">listado de Asistencia por acta</h3>

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
                                                <th>Asistencia</th>
                                                <th>Inasistencia</th>
                                                <th>Excusados</th>
                                                <th>Detalle</th>
                                                <!-- <th>Acta</th>-->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            try {
                                                $sql = "SELECT
                                                t1.id_reunion,
                                                t1.num_acta,
                                                t3.nombre_reunion,
                                                ROUND(
                                                    SUM(t2.id_estado_participante = 1) / COUNT(t2.id_persona) * 100
                                                ) AS asistio,
                                                ROUND(
                                                    SUM(t2.id_estado_participante = 2) / COUNT(t2.id_persona) * 100
                                                ) AS inasistencia,
                                                ROUND(
                                                    SUM(t2.id_estado_participante = 3) / COUNT(t2.id_persona) * 100
                                                ) AS excusa
                                            FROM
                                                tbl_acta t1
                                            INNER JOIN tbl_participantes t2 ON
                                                t2.id_reunion = t1.id_reunion
                                            INNER JOIN tbl_reunion t3 ON
                                                t3.id_reunion = t1.id_reunion
                                            WHERE
                                                t1.id_estado = 3
                                            GROUP BY
                                                t1.id_acta";
                                                $resultado = $mysqli->query($sql);
                                            } catch (Exception $e) {
                                                $error = $e->getMessage();
                                                echo $error;
                                            }
                                            while ($reunion = $resultado->fetch_assoc()) { ?>
                                                <tr>
                                                    <td><?php echo $reunion['num_acta']; ?></td>
                                                    <td><?php echo $reunion['nombre_reunion']; ?></td>
                                                    <td style="color: green;"><?php echo $reunion['asistio']; ?>%</td>
                                                    <td style="color: red;"><?php echo $reunion['inasistencia']; ?>%</td>
                                                    <td style="color:rgb(129, 129, 40);"><?php echo $reunion['excusa']; ?>%</td>
                                                    <td><a target="_blank" href="../vistas/reporte_asistenciaxacta_vista.php?id=<?php echo $reunion['id_reunion'] ?>">VER REPORTE</a></td>
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
           function ventana() {
            window.open("../Controlador/reporte_controlador.php", "REPORTE");
        }
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







