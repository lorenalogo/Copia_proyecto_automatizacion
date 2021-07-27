<?php

ob_start();

session_start();

require_once('../vistas/pagina_inicio_vista.php');
require_once('../clases/Conexion.php');
require_once('../clases/funcion_bitacora.php');
require_once('../clases/funcion_visualizar.php');
require_once('../clases/funcion_permisos.php');


$Id_objeto = 149;
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
                window.location = "../vistas/menu_acta_vista.php";
        </script>';
} else {

    if (permisos::permiso_modificar($Id_objeto) == '1') {
        $_SESSION['btn_editar'] = "";
    } else {
        $_SESSION['btn_editar'] = "disabled";
    }

    bitacora::evento_bitacora($Id_objeto, $_SESSION['id_usuario'], 'Ingreso', 'A Actas Pendientes');








    /* Manda a llamar todos las datos de la tabla para llenar el gridview  */
    $sqltabla_parametro = "SELECT Parametro, Descripcion , Valor         
FROM tbl_parametros";
    $resultadotabla_parametro = $mysqli->query($sqltabla_parametro);



    /* Esta condicion sirve para  verificar el valor que se esta enviando al momento de dar click en el icono modicar */
    if (isset($_GET['Parametro'])) {
        $sqltabla_parametro = "SELECT Parametro, Descripcion , Valor         
FROM tbl_parametros";
        $resultadotabla_parametro = $mysqli->query($sqltabla_parametro);

        $Parametro = $_GET['Parametro'];

        /* Iniciar la variable de sesion y la crea */


        /* Hace un select para mandar a traer todos los datos de la 
 tabla donde rol sea igual al que se ingreso e el input */
        $sql = "SELECT * FROM tbl_parametros WHERE Parametro = '$Parametro'";
        $resultado = $mysqli->query($sql);
        /* Manda a llamar la fila */
        $row = $resultado->fetch_array(MYSQLI_ASSOC);

        $Id_parametro = $row['Id_parametro'];
        $_SESSION['TxtParametro'] = $row['Parametro'];
        $_SESSION['TxtParametro_descripcion'] = $row['Descripcion'];
        $_SESSION['TxtParametro_valor'] = $row['Valor'];

        if (isset($_SESSION['TxtParametro'])) {


?>
            <script>
                $(function() {
                    $('#modal_modificar_parametro').modal('toggle')

                })
            </script>;
            <?php
            ?>

<?php


        }
    }
}






if (isset($_REQUEST['msj'])) {
    $msj = $_REQUEST['msj'];

    if ($msj == 1) {
        echo '<script type="text/javascript">
                    swal({
                       title:"",
                       text:"Lo sentimos el Parametro ya existe",
                       type: "info",
                       showConfirmButton: false,
                       timer: 3000
                    });
                    
                </script>';
    }

    if ($msj == 2) {


        echo '<script type="text/javascript">
                    swal({
                       title:"",
                       text:"Los datos  se almacenaron correctamente",
                       type: "success",
                       showConfirmButton: false,
                       timer: 3000
                    });
                    
                </script>';
        $sqltabla_parametro = "SELECT Parametro, Descripcion , Valor         
FROM tbl_parametros";
        $resultadotabla_parametro = $mysqli->query($sqltabla_parametro);
    }
    if ($msj == 3) {


        echo '<script type="text/javascript">
                    swal({
                       title:"",
                       text:"Lo sentimos tiene campos por rellenar.",
                       type: "error",
                       showConfirmButton: false,
                       timer: 3000
                    });
                    
                </script>';
    }
}
ob_end_flush();


?>


<!DOCTYPE html>
<html>

<head>
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
                        <h1>Actas Pendientes</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="../vistas/pagina_principal_vista.php">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="../vistas/menu_acta_vista.php">Gestion Actas</a></li>
                            <li class="breadcrumb-item active">Actas Pendientes</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content ">
            <div class="container-fluid ">
                <div class="row">
                    <div class="col-12">
                        <div class="card ">
                            <div class="card-header ">
                                <h3 class="card-title ">Listado de las Actas que faltan por completar
                                </h3>
                            </div>

                            <!-- /.card-header -->
                            <div class="card-body ">
                                <form role="form" name="guardar-tiporeu" id="guardar-tiporeu" method="post" action="../Modelos/modelo_acta.php">
                                    <table id="tabla7" class="table table-bordered table-striped ">
                                        <thead>
                                            <tr>
                                                <th>No. Acta</th>
                                                <th>Nombre Reunión</th>
                                                <th>Modalidad</th>
                                                <th>Fecha</th>
                                                <th>Hora Inicio</th>
                                                <th>Hora Final</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            try {
                                                $sql = "SELECT
                                            a.id_acta,
                                            a.num_acta,
                                            ta.tipo,
                                            r.lugar,
                                            a.fecha,
                                            r.nombre_reunion,
                                            a.hora_inicial,
                                            r.hora_final,
                                            r.id_reunion
                                        FROM
                                            tbl_acta a
                                        INNER JOIN tbl_reunion r ON
                                            r.id_reunion = a.id_reunion
                                        INNER JOIN tbl_tipo_reunion_acta ta ON
                                            ta.id_tipo = a.id_tipo
                                        WHERE
                                            a.id_estado = 2";
                                                $resultado = $mysqli->query($sql);
                                                while ($actap = $resultado->fetch_assoc()) {
                                            ?>
                                                    <tr>
                                                        <td><?php echo $actap['num_acta']; ?></td>
                                                        <td><?php echo $actap['nombre_reunion']; ?></td>
                                                        <td><?php echo $actap['tipo']; ?></td>
                                                        <td><?php echo $actap['fecha']; ?></td>
                                                        <td><?php echo $actap['hora_inicial']; ?></td>
                                                        <td><?php echo $actap['hora_final']; ?></td>
                                                        <td>

                                                            <a style="min-width: 10px; max-width: 190px; max-height: 300px; margin: 0 0 8px 0;" href="editar_acta_vista.php?id=<?php echo $actap['id_acta'] ?>" type="button" class="btn btn-block btn-success btn-sm  <?php echo $_SESSION['btn_editar'];?>"><i class="fas fa-edit"></i> Continuar Editando
                                                            </a>
                                                            <a style="height: 35px; width: 190px;" href="#" data-id="<?php echo $actap['id_acta'] ?>" data-tipo="acta" class="finalizar_registroacta btn btn-primary <?php echo $_SESSION['btn_editar'];?>"><i class="fas fa-check-circle "></i> FINALIZAR
                                                            </a>
                                                        </td>
                                                    </tr>
                                            <?php
                                                }
                                            } catch (Exception $e) {
                                                $error = $e->getMessage();
                                                echo $error;
                                            } ?>
                                            <thead>
                                            <tr>
                                                <th>No. Acta</th>
                                                <th>Nombre Reunión</th>
                                                <th>Modalidad</th>
                                                <th>Fecha</th>
                                                <th>Hora Inicio</th>
                                                <th>Hora Final</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
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

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
    </div>

    <!-- ./wrapper -->







</body>
<script type="text/javascript" src="../js/funciones_registro_docentes.js"></script>
<script type="text/javascript" src="../js/validar_registrar_docentes.js"></script>

<script type="text/javascript">
    /********** finalizar acta ***********/
    $('.finalizar_registroacta').on('click', function(e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        var tipo = $(this).attr('data-tipo');
        swal({
            title: '¿Está Seguro en finalizar el acta?',
            text: 'Por favor asegurese de llenar el acta, de lo contrario no podra revertirlo!!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtontext: 'Si, Finalizarla!',
            cancelButtontext: 'Cancelar'
        }).then(function() {
            $.ajax({
                type: 'post',
                data: {
                    'id': id,
                    'actas': 'finalizar'
                },
                url: '../Modelos/modelo_' + tipo + '.php',
                success: function(data) {
                    var resultado = JSON.parse(data);
                    if (resultado.respuesta == 'exito') {
                        swal({
                            title: "Correcto",
                            text: "Se Finalizo con Exito!",
                            type: "success"
                        }).then(function() {
                            location.href = "../Vistas/actas_pendientes_vista.php";
                        });
                    } else {
                        swal(
                            'Error!',
                            'No se pudo Finalizar faltan campos Importantes',
                            'error'
                        )
                    }
                }
            })
        });
    });
    $(function() {

        $('#tabla7').DataTable({
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

</html>