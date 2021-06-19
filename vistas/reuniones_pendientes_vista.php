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
    <script src="../js/jquery.min.js"></script>
    <script src="../js/moment.min.js"></script>
    <!-- full calendar-->
    <link rel="stylesheet" type="text/css" href="../css/fullcalendar.min.css">
    <script src="../js/fullcalendar.min.js"></script>
    <script src="../js/es.js"></script>
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
                        <h1>Reuniones Pendientes</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                            <li class="breadcrumb-item active">Reuniones Pendientes</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.modal -->
        <div class="modal fade" id="modal-default">

            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content lg-secondary">
                    <div class="modal-header">
                        <h4 class="modal-title">Lista de Participantes</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <?php
                        try {
                            $sql = "SELECT `id_persona` FROM `tbl_participantes` WHERE id_reunion = 1";
                            $resultado = $mysqli->query($sql);
                        } catch (Exception $e) {
                            $error = $e->getMessage();
                            echo $error;
                        }
                        while ($reunion = $resultado->fetch_assoc()) { ?>
                            <p><?php echo $reunion['id_persona']; ?></p>
                        <?php  }  ?>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <!-- /.card -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Listado de reuniones que se desarrollaran pronto</h3>
                                    <a href="crear_reunion_vista.php" type="button" class="btn btn-app bg-warning float-right derecha ">
                                        <i class="fas fa-plus-circle"><br></i>Agendar Nueva Reunión
                                    </a>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="card card-primary card-outline card-outline-tabs">
                                        <div class="card-header p-0 border-bottom-0">
                                            <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">Vista General Detallada</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="custom-tabs-four-messages-tab" data-toggle="pill" href="#custom-tabs-four-messages" role="tab" aria-controls="custom-tabs-four-messages" aria-selected="false">Vista Calendario</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <div class="tab-content" id="custom-tabs-four-tabContent">
                                                <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                                                    <form role="form" name="guardar-tiporeu" id="guardar-tiporeu" method="post" action="../Modelos/modelo_manactareunion.php">
                                                        <table id="tabla11" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Nombre Reunión</th>
                                                                    <th>Tipo</th>
                                                                    <th>Lugar</th>
                                                                    <th>Fecha</th>
                                                                    <th>Hora Inicio</th>
                                                                    <th>Hora Final</th>
                                                                    <th>Participantes</th>
                                                                    <th>Acciones</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <?php
                                                                try {
                                                                    $sql = "SELECT * FROM `tbl_reunion` WHERE id_estado = 1 AND 3";
                                                                    $resultado = $mysqli->query($sql);
                                                                } catch (Exception $e) {
                                                                    $error = $e->getMessage();
                                                                    echo $error;
                                                                }
                                                                while ($reunion = $resultado->fetch_assoc()) { ?>
                                                                    <tr>
                                                                        <td><?php echo $reunion['nombre_reunion']; ?></td>
                                                                        <td><?php echo $reunion['id_tipo']; ?></td>
                                                                        <td><?php echo $reunion['lugar']; ?></td>
                                                                        <td><?php echo $reunion['fecha']; ?></td>
                                                                        <td><?php echo $reunion['hora_inicio']; ?></td>
                                                                        <td><?php echo $reunion['hora_final']; ?></td>
                                                                        <td><a data-id="<?php echo $reunion['id_reunion']; ?>" data-toggle="modal" data-target="#modal-default" href="#">Ver Participantes</a></td>
                                                                        <td>
                                                                            <a href="../vistas/editar_tiporeunion_vista.php?id=<?php echo $reunion['id_tipo'] ?>" class="btn btn-success" style="color: while;">
                                                                                <i class="far fa-edit"></i><br>Editar
                                                                            </a>
                                                                            <a href="#" data-id="<?php echo $reunion['id_tipo']; ?>" data-tipo="manactareunion" class="borrar_registro btn btn-danger ">
                                                                                <i class="far fa-window-close"></i><br>Borrar
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                <?php  }  ?>
                                                            </tbody>
                                                        </table>
                                                    </form>
                                                </div>
                                                <div class="tab-pane fade" id="custom-tabs-four-messages" role="tabpanel" aria-labelledby="custom-tabs-four-messages-tab">
                                                    <div class="card card-primary">
                                                        <!-- THE CALENDAR -->
                                                        <div id="calendarioweb"></div>
                                                        <script>
                                                            $(document).ready(function() {
                                                                $('#calendarioweb').fullCalendar({
                                                                    header: {
                                                                        left: 'today,prev,next',
                                                                        center: 'title',
                                                                        right: 'month,agendaWeek,agendaDay',
                                                                    },
                                                                    events: 'http://localhost/Copia_proyecto_automatizacion/modelos/modelo_reuniones_calendario.php',
                                                                    eventAfterRender: function(event, element, view) {
                                                                        var hoy = new Date();
                                                                        
                                                                        if (event.start > hoy && event.end < hoy) {
                                                                            element.css('background-color', '#AA1313');
                                                                            element.css('color', 'white');
                                                                        } else if (event.start < hoy && event.end < hoy) {
                                                                            element.css('background-color', '#125591');
                                                                            element.css('color', 'white');
                                                                        } else if (event.start > hoy && event.end > hoy) {
                                                                            element.css('background-color', '#1BA253');
                                                                            element.css('color', 'white');
                                                                        }
                                                                    },
                                                                });
                                                            });
                                                        </script>
                                                        <!-- /.card-body -->
                                                    </div>
                                                    <!-- /.card -->
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.card -->
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    </div>
    <script type="text/javascript" language="javascript">
        function ventana() {
            window.open("../Controlador/reporte_mantenimiento_estadoactareunion_controlador.php", "REPORTE");
        }
    </script>
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