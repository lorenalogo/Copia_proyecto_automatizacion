<?php
ob_start();
session_start();
require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/Conexion.php');
require_once('../clases/conexionacta.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');
$dtz = new DateTimeZone("America/Tegucigalpa");
$dt = new DateTime("now", $dtz);
$hoy = $dt->format("Y-m-d");
?>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="../plugins/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel=" stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js">
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
                        <h1>Agendar una Reunion</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                            <li class="breadcrumb-item active">Crear Reunion</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Datos Generales</h3>
                            </div>
                            <form role="form" name="guardar-reunion" id="guardar-reunion" method="post" action="../Modelos/modelo_reunion.php">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="nombre">Nombre:</label>
                                        <input required type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese nombre de la Reunion">
                                    </div>
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Reunión</label>
                                        <select class="form-control" style="width: 60%;" id="tipo" name="tipo">
                                            <option value="0">-- Selecione un Tipo de Reunión --</option>
                                            <?php
                                            try {
                                                $sql = "SELECT * FROM tbl_tipo_reunion_acta ";
                                                $resultado = $conn->query($sql);
                                                while ($tipo_reunion = $resultado->fetch_assoc()) { ?>
                                                    <option value="<?php echo $tipo_reunion['Id_Tipo']; ?>">
                                                        <?php echo $tipo_reunion['Tipo']; ?>
                                                    </option>
                                            <?php }
                                            } catch (Exception $e) {
                                                echo "Error: " . $e->getMessage();
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="lugar">Lugar:</label>
                                        <input required style="width: 90%;" type="text" class="form-control" id="lugar" name="lugar" placeholder="Lugar donde se dearrollara la Reunion">
                                    </div>
                                    <div class="form-group">
                                        <label for="fecha">Fecha:</label>
                                        <div style="width: 40%;" class="input-group date">
                                            <input required type="date" class="form-control datetimepicker-input" id="fecha" name="fecha" min="<?php echo $hoy; ?>" />
                                            <div class="input-group-append">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="horainicio">Hora Inicio: </label>
                                        <input required style="width: 30%;" type="time" class="form-control" id="horainicio" name="horainicio">
                                    </div>
                                    <div class="form-group">
                                        <label for="horafinal">Hora Final: </label>
                                        <input required style="width: 30%;" type="time" class="form-control" id="horafinal" name="horafinal">
                                    </div>
                                    <div class="form-group">
                                        <label for="enlace">Enlace de la Reunión:</label>
                                        <input required type="text" class="form-control" id="enlace" name="enlace" placeholder="Ingrese el Link de la Reunion">
                                    </div>
                                </div>
                                <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-md-6">
                        <!-- Form Element sizes -->
                        <div class="card card-success">
                            <div class="card-header">
                                <h3 class="card-title">Datos de la Reunión</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="asunto">Asunto:</label>
                                    <textarea required class="form-control" id="asunto" name="asunto" rows="3" placeholder="Ingrese el asunto de la Reunión"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="agenda">Agenda Propuesta</label>
                                    <textarea required class="form-control" id="agenda" name="agenda" rows="16" placeholder="Ingrese Agenda Propuesta"></textarea>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
                <div class="card card-warning">
                    <div class="card-header">
                        <h3 class="card-title">Participantes</h3>
                    </div>
                    <div class="card-body">
                        <div class="col-12">
                            <!-- /.card -->

                            <div class="card">
                                <div class="icheck-danger d-inline" style="padding: 15px 0px 0px 15px;">
                                    <input type="checkbox" id="checkboxPrimary10" name="selectall" onclick="marcar(this);">
                                    <label for="checkboxPrimary10">
                                        Seleccionar/Deseleccionar Todo
                                    </label>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nombre Participante</th>
                                                <th>Tipo Contrado</th>
                                            </tr>
                                        </thead>
                                        <?php
                                        try {
                                            $sql = "SELECT * FROM tbl_personas";
                                            $resultado = $conn->query($sql);
                                        } catch (Exception $e) {
                                            $error = $e->getMessage();
                                            echo $error;
                                        }
                                        while ($estadoacta = $resultado->fetch_assoc()) { ?>
                                            <tr>
                                                <td>
                                                    <div class="icheck-danger d-inline">
                                                        <input type="checkbox" id="<?php echo $estadoacta['Id_Persona']; ?>" name="chk[]" value="<?php echo $estadoacta['Id_Persona']; ?>">
                                                        <label for="<?php echo $estadoacta['Id_Persona']; ?>">
                                                            <?php echo $estadoacta['Nombres']; ?>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td><?php echo $estadoacta['Id_Tipo_Persona']; ?></td>
                                            </tr>
                                        <?php  }  ?>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <div style="padding: 0px 0 25px 0;">
                    <input type="hidden" name="estado" value="1">
                    <input type="hidden" name="reunion" value="nuevo">
                    <button style="padding-right: 15px;" type="submit" class="btn btn-success float-left">Crear</button>
                    <a style="color: white !important; margin: 0px 0px 0px 10px;" class="cancelar-reunion btn btn-danger" href="reuniones_pendientes_vista.php">Cancelar</a>
                </div>
            </div>
            <!-- /.container-fluid -->
            </form>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    </div>
    <script type="text/javascript">
        $(function() {
            $('#example1').DataTable({
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


    <script type="text/javascript">
        function marcar(source) {
            checkboxes = document.getElementsByTagName('input'); //obtenemos todos los controles del tipo Input
            for (i = 0; i < checkboxes.length; i++) //recoremos todos los controles
            {
                if (checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].checked = source.checked; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
        }
    </script>

</body>

</html>
<script type="text/javascript" src="../js/funciones_registro_docentes.js"></script>
<script type="text/javascript" src="../js/validar_registrar_docentes.js"></script>

<script type="text/javascript" src="../js/pdf_mantenimientos.js"></script>
<script src="../plugins/select2/js/select2.min.js"></script>
<!-- Select2 -->
<script src="../plugins/select2/js/select2.full.min.js"></script>
<!-- datatables JS -->
<script type="text/javascript" src="../plugins/datatables/datatables.min.js"></script>
<!-- para usar botones en datatables JS -->
<script src="../plugins/datatables/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>
<script src="../plugins/datatables/JSZip-2.5.0/jszip.min.js"></script>
<script src="../plugins/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script src="../plugins/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script src="../plugins/datatables/Buttons-1.5.6/js/buttons.html5.min.js"></script>
<script src="../js/tipoacta-ajax.js"></script>