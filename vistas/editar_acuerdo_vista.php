<?php
ob_start();
session_start();

require_once('../clases/Conexion.php');
require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');
require_once('../clases/conexion_mantenimientos.php');

$dtz = new DateTimeZone("America/Tegucigalpa");
$dt = new DateTime("now", $dtz);
$hoy = $dt->format("Y-m-d");

$Id_objeto = 151;

bitacora::evento_bitacora($Id_objeto, $_SESSION['id_usuario'], 'Ingreso', 'A crear Acuerdo');

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
    // header('location:  ../vistas/menu_usuarios_vista.php');
} else {


    if (permisos::permiso_insertar($Id_objeto) == '1') {
        $_SESSION['btn_crear'] = "";
    } else {
        $_SESSION['btn_crear'] = "disabled='disabled'";
    }
}

ob_end_flush();

?>


<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="../plugins/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel=" stylesheet" type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="../js/tipoacta-ajax.js"></script>

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
                        <h1>Editar Acuerdo</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="../vistas/menu_acuerdo_vista.php">Inicio</a></li>
                            <li class="breadcrumb-item active">Editar Acuerdo</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <form role="form" name="guardar-acuerdo" id="guardar-acuerdo" method="post" action="../Modelos/modelo_acuerdos.php">
                    <div class="card card-danger">
                        <div class="card-header">
                            <h3 class="card-title">Acuerdos</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label>Seleccione el acta:</label>
                                <select class="form-control " style="width: 35%;" name="acta" id="acta">
                                    <option value="0">-- Seleccione --</option>
                                    <?php
                                    try {
                                        $sql = "SELECT * FROM tbl_acta WHERE id_estado = 3";
                                        $resultado = $mysqli->query($sql);
                                        while ($acta = $resultado->fetch_assoc()) { ?>
                                            <option value="<?php echo $acta['id_acta']; ?>">
                                                <?php echo $acta['num_acta']; ?>
                                            </option>
                                    <?php }
                                    } catch (Exception $e) {
                                        echo "Error: " . $e->getMessage();
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Responsable:</label>
                                <select class="form-control" style="width: 50%;"  name="responsable" id="responsable">
                                    <option value="0">-- Seleccione --</option>
                                    <?php
                                    try {
                                        $sql = "SELECT 
                                                t1.id_persona,concat_ws(' ', t1.nombres, t1.apellidos) as nombres
                                                FROM tbl_personas t1 
                                                INNER JOIN tbl_horario_docentes t2 ON t2.id_persona = t1.id_persona 
                                                INNER JOIN tbl_jornadas t3 ON t2.id_jornada = t3.id_jornada 
                                                ORDER BY nombres ASC";
                                        $resultado = $mysqli->query($sql);
                                        while ($responsable = $resultado->fetch_assoc()) { ?>
                                            <option value="<?php echo $responsable['id_persona']; ?>">
                                                <?php echo $responsable['nombres']; ?>
                                            </option>
                                    <?php }
                                    } catch (Exception $e) {
                                        echo "Error: " . $e->getMessage();
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Nombre del Acuerdo:</label>
                                <input style="width: 35%;" type="text" class="form-control" id="nombre_acuerdo" name="nombre_acuerdo" placeholder="Ingrese nombre del acuerdo">
                            </div>
                            <div class="form-group">
                                <label>Descripción:</label>
                                <textarea class="form-control" placeholder="Ingrese la descripción del Acuerdo" rows="5" id="descripcion" name="descripcion"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Fecha Expiración:</label>
                                <div style="width: 20%;" class="input-group date">
                                    <input type="date" class="form-control " id="fecha_exp" name="fecha_exp" min="<?php echo $hoy; ?>" />
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- /.row -->
            <div style="padding: 0px 0 25px 0;">
                <input type="hidden" name="estado" value="1">
                <input type="hidden" name="acuerdo" value="nuevo">
                <button style="color: white !important;" type="submit" class="btn btn-primary" <?php echo $_SESSION['btn_crear']; ?>>Guardar</button>
                <a style="color: white !important;" class="btn btn-danger" data-toggle="modal" data-target="#modal-default" href="#">Cancelar</a>
            </div>
            </form>
        </section>
        <!-- /.card-body -->
    </div>
    <div class="modal fade justify-content-center" id="modal-default">

        <div class="modal-dialog modal-dialog-centered modal-sm justify-content-center">
            <div class="modal-content lg-secondary">
                <div class="modal-header">
                    <h4 style="padding-left: 19%;" class="modal-title"><b>Desea cancelar?</b></h4>
                </div>
                <div class="modal-body justify-content-center">
                    <p style="padding-left: 6%;">Lo que haya escrito no se guardará!</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <a style="color: white ;" type="button" class="btn btn-primary" href="../vistas/acuerdo_pendientes_vista.php">Sí, deseo cancelar</a>
                    <a style="color: white ;" type="button" class="btn btn-danger" data-dismiss="modal">No</a>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</body>
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

    jQuery(document).ready(function($){
    $(document).ready(function() {
        $('#responsable').select2();
    });
});
</script>

</html>
<script type="text/javascript" src="../js/funciones_registro_docentes.js"></script>
<script type="text/javascript" src="../js/validar_registrar_docentes.js"></script>

<script type="text/javascript" src="../js/pdf_mantenimientos.js"></script>
<script src="../plugins/select2/js/select2.min.js"></script>
<!-- Select2 -->
<script src="../plugins/select2/js/select2.full.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- datatables JS -->
<script type="text/javascript" src="../plugins/datatables/datatables.min.js"></script>
<!-- para usar botones en datatables JS -->
<script src="../plugins/datatables/Buttons-1.5.6/js/dataTables.buttons.min.js"></script>
<script src="../plugins/datatables/JSZip-2.5.0/jszip.min.js"></script>
<script src="../plugins/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script src="../plugins/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script src="../plugins/datatables/Buttons-1.5.6/js/buttons.html5.min.js"></script>