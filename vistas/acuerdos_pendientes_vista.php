<?php
ob_start();
session_start();
require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/Conexion.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');

?>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="../plugins/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel=" stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="../js/jquery.min.js"></script>

    <script src="../js/moment.min.js"></script>
    <!-- full calendar-->
    <link rel="stylesheet" type="text/css" href="../css/fullcalendar.min.css">
    <script src="../js/fullcalendar.min.js"></script>
    <script src="../js/es.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <title></title>
</head>

<body>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Acuerdos Pendientes</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                            <li class="breadcrumb-item active">Acuerdos Pendientes</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <!-- /.card -->
                            <div class="card-header">
                                <h3 class="card-title">Listado de Acuerdos pendientes</h3>
                                <a href="crear_acuerdo_vista.php" type="button" class="btn btn-app bg-warning float-right derecha ">
                                    <i class="fas fa-plus-circle"><br></i>Crear Nueva Acuerdo
                                </a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="card card-primary card-outline card-outline-tabs">
                                    <div class="card-body">
                                        <form role="form" name="guardar-tiporeu" id="guardar-tiporeu" method="post" action="../Modelos/modelo_acuerdos.php">
                                            <table id="tabla29" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>No. Acta</th>
                                                        <th>Responsable</th>
                                                        <th>Nombre del Acuerdo</th>
                                                        <th>Descripción</th>
                                                        <th>Fecha de Vencimiento</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    try {
                                                        $sql = "SELECT
                                                        t1.id_acuerdo,
                                                        t1.id_estado,
                                                        t2.num_acta,
                                                        CONCAT_WS(' ', t3.nombres, t3.apellidos) AS persona,
                                                        t1.nombre_acuerdo,
                                                        t1.descripcion,
                                                        t1.fecha_expiracion,
                                                        t1.resolucion
                                                    FROM
                                                        tbl_acuerdos t1
                                                    INNER JOIN tbl_acta t2 ON
                                                        t2.id_acta = t1.id_acta
                                                    INNER JOIN tbl_personas t3 ON
                                                        t3.id_persona = t1.id_participante
                                                        WHERE t1.id_estado = 1";
                                                        $resultado = $mysqli->query($sql);
                                                    } catch (Exception $e) {
                                                        $error = $e->getMessage();
                                                        echo $error;
                                                    }
                                                    while ($reunion = $resultado->fetch_assoc()) { ?>
                                                        <tr>
                                                            <td><?php echo $reunion['num_acta']; ?></td>
                                                            <td><?php echo $reunion['persona']; ?></td>
                                                            <td><?php echo $reunion['nombre_acuerdo']; ?></td>
                                                            <td><?php echo $reunion['descripcion']; ?></td>
                                                            <td><?php echo $reunion['fecha_expiracion']; ?></td>
                                                            <td>
                                                                <a href="../vistas/editar_acuerdo_vista.php?id=<?php echo $reunion['id_acuerdo'] ?>" style="min-width:86px; margin-bottom: 5px;" class="btn btn-primary" style="color: while;">
                                                                    <i class="far fa-edit"></i><br>Editar
                                                                </a>
                                                                <a href="#" data-id="<?php echo $reunion['id_acuerdo']; ?>" data-tipo="acuerdos"   style="min-width:86px; margin-bottom: 5px;" class="finalizar_registroacuerdo btn btn-success ">
                                                                <i class="far fa-check-square"></i><br>Finalizar
                                                                </a>
                                                                <a href="#" data-id="<?php echo $reunion['id_acuerdo']; ?>" data-tipo="acuerdos"   class="cancelar_registroacuerdo btn btn-danger ">
                                                                    <i class="far fa-window-close"></i><br>Cancelar
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    <?php  }  ?>
                                                </tbody>
                                                <thead>
                                                    <tr>
                                                        <th>No. Acta</th>
                                                        <th>Responsable</th>
                                                        <th>Nombre del Acuerdo</th>
                                                        <th>Descripción</th>
                                                        <th>Fecha de Vencimiento</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </form>
                                    </div>

                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col 12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->

        <script type="text/javascript" language="javascript">
            function ventana() {
                window.open("../Controlador/reporte_mantenimiento_estadoactareunion_controlador.php", "REPORTE");
            }
        </script>
        <script type="text/javascript">
            $(function() {
                $('#tabla29').DataTable({
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

        <!-- Modal -->
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="tituloReunion"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div><b>Tipo: </b><a id="tipo"></a></div>
                        <div><b>Estado: </b><a id="estado"></a></div>
                        <div><b>Lugar: </b><a id="lugar"></a></div>
                        <div><b>Fecha: </b><a id="fecha"></a></div>
                        <div><b>Hora Inicio: </b><a id="hora_inicio"></a></div>
                        <div><b>Hora Final: </b><a id="hora_final"></a></div>
                        <div><b>Enlace: </b><a id="enlace"></a></div>
                        <div><b> Lista Participantes: </b>
                            <div id="participantes"></div>
                        </div>
                        <h6><b> Asunto: </b></h6>
                        <div id="asunto"></div>
                        <div><b> Agenda Propuesta: </b></div>
                        <a id="agenda_propuesta"></a>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
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