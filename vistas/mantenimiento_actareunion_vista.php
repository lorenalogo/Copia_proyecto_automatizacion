<?php
ob_start();
session_start();
require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/Conexion.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');


$Id_objeto = 156;

bitacora::evento_bitacora($Id_objeto, $_SESSION['id_usuario'], 'Ingreso', 'A Mantenimiento Estado Acta');

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
                           window.location = "../vistas/menu_mantenimientoacta_vista.php";

                            </script>';
    // header('location:  ../vistas/menu_usuarios_vista.php');
} else {


    if (permisos::permiso_insertar($Id_objeto) == '1') {
        $_SESSION['btn_nuevo_tipo'] = "";
    } else {
        $_SESSION['btn_nuevo_tipo'] = "disabled";
    }

    if (permisos::permiso_modificar($Id_objeto) == '1') {
        $_SESSION['btn_editar'] = "";
    } else {
        $_SESSION['btn_editar'] = "disabled";
    }

    if (permisos::permiso_eliminar($Id_objeto) == '1') {
        $_SESSION['btn_borrar'] = "";
    } else {
        $_SESSION['btn_borrar'] = "disabled";
    }
}

ob_end_flush();





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
                        <h1>Tipo de Reunión (Modalidad)</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                            <li class="breadcrumb-item active">Tipo de Reunión</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="modal fade " id="modal-crear">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content lg-secondary ">
                        <div class="modal-header">
                            <h4 class="modal-title">Nuevo Tipo</h4>
                        </div>
                        <form role="form" name="guardar-tiporeu" id="guardar-tiporeu" method="post" action="../Modelos/modelo_manactareunion.php">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="tipo">Nombre Tipo: </label>
                                    <input type="text" class="form-control" class="form-control col-md-6" id="tipo" name="tipo" placeholder="Ingrese un tipo nuevo" required title="Solo se permiten MAYÚSCULAS o MINÚSCULAS y no se Aceptan caracteres especiales" minlength="3" maxlength="15" pattern="[A-Za-z]{1,15}">
                                </div>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <input type="hidden" name="tipo-actareunion" value="nuevo">
                                <button type="submit" class="btn btn-primary float-right" id="crear_registro">Añadir</button>
                            </div>
                        </form>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <!-- /.card -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Listado de Modalidades</h3>
                                    <a data-toggle="modal" data-target="#modal-crear" type="button" class="btn btn-app bg-warning float-right derecha <?php echo $_SESSION['btn_nuevo_tipo']; ?>">
                                        <i class="fas fa-plus-circle"><br></i>Nuevo
                                    </a>
                                </div>
                                <style>
                                    .ocultar {
                                        display: none;
                                    }
                                </style>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <form role="form" name="guardar-tiporeu" id="guardar-tiporeu" method="post" action="../Modelos/modelo_manactareunion.php">
                                        <table id="tabla1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th class="ocultar">No.</th>
                                                    <th>Tipo</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                try {
                                                    $sql = "SELECT * FROM tbl_tipo_reunion_acta";
                                                    $resultado = $mysqli->query($sql);
                                                } catch (Exception $e) {
                                                    $error = $e->getMessage();
                                                    echo $error;
                                                }
                                                while ($tipoacta = $resultado->fetch_assoc()) { ?>
                                                    <tr>
                                                        <td class="ocultar"><?php echo $tipoacta['id_tipo']; ?></td>
                                                        <td><?php echo $tipoacta['tipo']; ?></td>
                                                        <td>
                                                            <a href="../vistas/editar_tiporeunion_vista.php?id=<?php echo $tipoacta['id_tipo'] ?>" class="btn btn-success <?php echo $_SESSION['btn_editar']; ?>" style="color: while;">
                                                                Editar
                                                            </a>
                                                            <a href="#" data-id="<?php echo $tipoacta['id_tipo']; ?>" data-tipo="manactareunion" class="borrar_registro btn btn-danger <?php echo $_SESSION['btn_borrar']; ?>">
                                                                Borrar
                                                            </a>
                                                        </td>
                                                    </tr>
                                                <?php  }  ?>
                                            </tbody>
                                        </table>
                                    </form>
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

    </script>
    <script type="text/javascript">
        $(function() {
            $('#tabla1').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true,
                "responsive": true,
                "language": {
                    "processing": "Procesando...",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "zeroRecords": "No se encontraron resultados",
                    "emptyTable": "Ningún dato disponible en esta tabla",
                    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "search": "Buscar:",
                    "infoThousands": ",",
                    "loadingRecords": "Cargando...",
                    "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                },
            });
        });
    </script>


</body>

</html>
<script type="text/javascript" src="../js/funciones_registro_docentes.js"></script>
<script type="text/javascript" src="../js/validar_registrar_docentes.js"></script>

<script type="text/javascript" src="../js/pdf_reportes_actas.js"></script>
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