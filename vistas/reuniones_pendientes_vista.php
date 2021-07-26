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
    <link href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/1.6.4/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/1.6.4/fullcalendar.print.css " rel="stylesheet" type="text/css" media="print" />

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
                                                    <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">Vista General</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" id="custom-tabs-four-messages-tab" data-toggle="pill" href="#custom-tabs-four-messages" role="tab" aria-controls="custom-tabs-four-messages" aria-selected="false">Vista Calendario</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <div class="tab-content" id="custom-tabs-four-tabContent">
                                                <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                                                    <form role="form" name="guardar-tiporeu" id="guardar-tiporeu" method="post" action="../Modelos/modelo_reunion.php">
                                                        <table id="tabla27" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Nombre Reunión</th>
                                                                    <th>Tipo</th>
                                                                    <th>Lugar</th>
                                                                    <th>Fecha</th>
                                                                    <th>Hora Inicio</th>
                                                                    <th>Hora Final</th>
                                                                    <th>Acciones</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <?php
                                                                try {
                                                                    $sql = "SELECT t1.id_reunion,t1.nombre_reunion,t2.tipo,t1.lugar,t1.fecha,t1.hora_inicio,t1.hora_final 
                                                                    FROM tbl_reunion t1 
                                                                    INNER JOIN tbl_tipo_reunion_acta t2 on t2.id_tipo = t1.id_tipo
                                                                    WHERE id_estado = 1 OR id_estado = 3";
                                                                    $resultado = $mysqli->query($sql);
                                                                } catch (Exception $e) {
                                                                    $error = $e->getMessage();
                                                                    echo $error;
                                                                }
                                                                while ($reunion = $resultado->fetch_assoc()) { ?>
                                                                    <tr>
                                                                        <td><?php echo $reunion['nombre_reunion']; ?></td>
                                                                        <td><?php echo $reunion['tipo']; ?></td>
                                                                        <td><?php echo $reunion['lugar']; ?></td>
                                                                        <td><?php echo $reunion['fecha']; ?></td>
                                                                        <td><?php echo $reunion['hora_inicio']; ?></td>
                                                                        <td><?php echo $reunion['hora_final']; ?></td>
                                                                        <td>
                                                                            <a href="../vistas/editar_reunion_vista.php?id=<?php echo $reunion['id_reunion'] ?>" style="min-width:80px;" class="btn btn-success" style="color: while;">
                                                                                <i class="far fa-edit"></i><br>Editar
                                                                            </a>
                                                                            <a href="#" data-id="<?php echo $reunion['id_reunion']; ?>" data-tipo="reunion" style="max-width: 80px;" style="ma" class="cancelar_registro btn btn-danger ">
                                                                                <i class="far fa-window-close"></i><br>Cancelar
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
                                                        <div id="calendarioweb" class="updateSize"></div>
                                                        <div style="margin: 15px 0;" class="container  align-center">
                                                            <div class="row justify-content-start">
                                                                <div style="background:#ff0000; color:white;font-weight:bold; margin: 10px; margin-left: 10%; text-align: center;" class="col-3">Reuniones del día</div>
                                                                <div style="background:#1c4299; color:white; font-weight:bold; margin: 10px; text-align: center;" class="col-3">Reuniones más cercanas</div>
                                                                <div style="background:#1d964f; color:white; font-weight:bold; margin: 10px; text-align: center;" class="col-3">Reuniones Próximas</div>
                                                            </div>
                                                        </div>
                                                        <script>
                                                            function sumarDias(fecha, dias) {
                                                                fecha.setDate(fecha.getDate() + dias);
                                                                return fecha;
                                                            }

                                                            $(document).ready(function() {
                                                                var undia = (sumarDias(hoy, +1));
                                                                console.log(undia);
                                                                $('#calendarioweb').fullCalendar({
                                                                    header: {
                                                                        left: 'today,prev,next',
                                                                        center: 'title',
                                                                        right: 'month,agendaWeek,agendaDay',
                                                                    },
                                                                    events: '../Modelos/modelo_reuniones_calendario.php',
                                                                    eventAfterRender: function(event, element, view) {

                                                                        var hoy = new Date();

                                                                        if (event.start < hoy) {
                                                                            element.css('background-color', '#ff0000');
                                                                            element.css('color', 'white');
                                                                            element.css('border', 0);
                                                                        } else if (event.start > hoy && event.end > hoy && event.end > undia) {
                                                                            element.css('background-color', '#1d964f');
                                                                            element.css('color', 'white');
                                                                            element.css('border', 0);
                                                                        } else {
                                                                            element.css('background-color', '#1c4299');
                                                                            element.css('color', 'white');
                                                                            element.css('border', 0);
                                                                        }
                                                                    },
                                                                    eventClick: function(calEvent, jsEvent, view) {
                                                                        $('#tituloReunion').html(calEvent.title);
                                                                        $('#tipo').html(calEvent.tipo);
                                                                        $('#estado').html(calEvent.estado_reunion);
                                                                        $('#participantes').html(calEvent.participantes);
                                                                        $('#enlace').html(calEvent.enlace);
                                                                        $('#asunto').html(calEvent.asunto);
                                                                        $('#agenda_propuesta').html(calEvent.agenda_propuesta);
                                                                        $('#fecha').html(calEvent.fecha);
                                                                        $('#hora_inicio').html(calEvent.hora_inicio);
                                                                        $('#hora_final').html(calEvent.hora_final);
                                                                        $('#lugar').html(calEvent.lugar);
                                                                        $("#exampleModalLong").modal();
                                                                    }
                                                                    
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

        <script type="text/javascript" language="javascript">

        </script>
        <script type="text/javascript">
            $(function() {

                $('#tabla27').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                    "responsive": true,
                })

            });
        </script>

        <!-- Modal -->
        <div class="modal fade bd-example-modal-xl" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
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