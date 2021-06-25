$(document).ready(function () {


    /********** guardarestado noti ***********/
    $('#guardar-estadoparticipante').on('submit', function (e) {
        e.preventDefault();
        var datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var resultado = data;
                if (resultado.respuesta == 'exito') {
                    swal({
                        title: "Correcto", text: "Se guardo correctamente!", type:
                            "success"
                    }).then(function () {
                        location.href = "../Vistas/mantenimiento_estadoparticipante_vista.php";
                    }
                    );
                } else {
                    swal(
                        'Error',
                        'Hubo un error!',
                        'error'
                    )
                }
            }
        })
    });

    /********** guardarestado noti ***********/
    $('#guardar-estadonoti').on('submit', function (e) {
        e.preventDefault();
        var datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var resultado = data;
                if (resultado.respuesta == 'exito') {
                    swal({
                        title: "Correcto", text: "Se guardo correctamente!", type:
                            "success"
                    }).then(function () {
                        location.href = "../Vistas/mantenimiento_estadonoti_vista.php";
                    }
                    );
                } else {
                    swal(
                        'Error',
                        'Hubo un error!',
                        'error'
                    )
                }
            }
        })
    });

    /********** guardar tipo reunion/acta ********** UNICO*/
    $('#guardar-tiporeu').on('submit', function (e) {
        e.preventDefault();
        var datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var resultado = data;
                if (resultado.respuesta == 'exito') {
                    swal({
                        title: "Correcto", text: "Se guardo correctamente!", type:
                            "success"
                    }).then(function () {
                        location.href = "../Vistas/mantenimiento_actareunion_vista.php";
                    }
                    );
                } else {
                    swal(
                        'Error',
                        'Hubo un error!',
                        'error'
                    )
                }
            }
        })
    });



    /********** guardar reunion ***********/
    $('#guardar-reunion').on('submit', function (e) {
        e.preventDefault();
        var datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var resultado = data;
                if (resultado.respuesta == 'exito') {
                    swal({
                        title: "Correcto", text: "Se guardo correctamente!",
                        type: "success",
                        confirmButtonText: "Ir a Reuniones Pendientes",
                        html: `<h3>La reunión se guardo con Exito!</h3>
                                <br>
                                ¿Ahora que desea hacer?
                                <br>
                                <b><a href="../Vistas/reuniones_reporte_vista.php">Ver Reporte</a></b>`,
                    }).then(function () {
                        location.href = "../Vistas/reuniones_pendientes_vista.php";
                    }
                    );
                } else {
                    swal(
                        'Error',
                        'Hubo un error el nombre de la reunión ya existe o falta un campo por llenar!',
                        'error'
                    )
                }
            }
        })
    });


    /********** guardarestado acta ***********/
    $('#guardar-estadoacta').on('submit', function (e) {
        e.preventDefault();
        var datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var resultado = data;
                if (resultado.respuesta == 'exito') {
                    swal({
                        title: "Correcto", text: "Se guardo correctamente!", type:
                            "success"
                    }).then(function () {
                        location.href = "../Vistas/mantenimiento_estadoacta_vista.php";
                    }
                    );
                } else {
                    swal(
                        'Error',
                        'Hubo un error!',
                        'error'
                    )
                }
            }
        })
    });

    /********** guardarestado reunion ***********/
    $('#guardar-estadoreunion').on('submit', function (e) {
        e.preventDefault();
        var datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var resultado = data;
                if (resultado.respuesta == 'exito') {
                    swal({
                        title: "Correcto", text: "Se guardo correctamente!", type:
                            "success"
                    }).then(function () {
                        location.href = "../Vistas/mantenimiento_estadoreunion_vista.php";
                    }
                    );
                } else {
                    swal(
                        'Error',
                        'Hubo un error!',
                        'error'
                    )
                }
            }
        })
    });

    /********** guardar estado acuerdo ***********/
    $('#guardar-estadoacuerdo').on('submit', function (e) {
        e.preventDefault();
        var datos = $(this).serializeArray();
        $.ajax({
            type: $(this).attr('method'),
            data: datos,
            url: $(this).attr('action'),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var resultado = data;
                if (resultado.respuesta == 'exito') {
                    swal({
                        title: "Correcto", text: "Se guardo correctamente!", type:
                            "success"
                    }).then(function () {
                        location.href = "../Vistas/mantenimiento_estadoacuerdo_vista.php";
                    }
                    );
                } else {
                    swal(
                        'Error',
                        'Hubo un error!',
                        'error'
                    )
                }
            }
        })
    });

    /********** borrar acta/reunion ***********/
    $('.borrar_registro').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        var tipo = $(this).attr('data-tipo');
        swal({
            title: '¿Está Seguro?',
            text: 'Si lo elimina no podra revertirlo!!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtontext: 'Si, Eliminarlo!',
            cancelButtontext: 'Cancelar'
        }).then(function () {
            $.ajax({
                type: 'post',
                data: {
                    'id': id,
                    'tipo-actareunion': 'eliminar'
                },
                url: '../Modelos/modelo_' + tipo + '.php',
                success: function (data) {
                    var resultado = JSON.parse(data);
                    if (resultado.respuesta == 'exito') {
                        swal(
                            'Eliminado!',
                            'Eliminado con Exito!',
                            'success'
                        )
                        jQuery('[data-id="' + resultado.id_eliminado + '"]').parents('tr').remove();
                    } else {
                        swal(
                            'Error!',
                            'No se pudo eliminar',
                            'error'
                        )
                    }
                }
            })
        });
    });

    /********** borrar estado acta ***********/
    $('.borrar_estadoacta').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        var estado = $(this).attr('data-tipo');
        swal({
            title: '¿Está Seguro?',
            text: 'Si lo elimina no podra revertirlo!!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtontext: 'Si, Eliminarlo!',
            cancelButtontext: 'Cancelar'
        }).then(function () {
            $.ajax({
                type: 'post',
                data: {
                    'id': id,
                    'estado-acta': 'eliminar'
                },
                url: '../Modelos/modelo_' + estado + '.php',
                success: function (data) {
                    var resultado = JSON.parse(data);
                    if (resultado.respuesta == 'exito') {
                        swal(
                            'Eliminado!',
                            'Eliminado con Exito!',
                            'success'
                        )
                        jQuery('[data-id="' + resultado.id_eliminado + '"]').parents('tr').remove();
                    } else {
                        swal(
                            'Error!',
                            'No se pudo eliminar',
                            'error'
                        )
                    }
                }
            })
        });
    });

    /********** borrar estado reunion ***********/
    $('.borrar_estadoreunion').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        var estado = $(this).attr('data-tipo');
        swal({
            title: '¿Está Seguro?',
            text: 'Si lo elimina no podra revertirlo!!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtontext: 'Si, Eliminarlo!',
            cancelButtontext: 'Cancelar'
        }).then(function () {
            $.ajax({
                type: 'post',
                data: {
                    'id': id,
                    'estado-reunion': 'eliminar'
                },
                url: '../Modelos/modelo_' + estado + '.php',
                success: function (data) {
                    var resultado = JSON.parse(data);
                    if (resultado.respuesta == 'exito') {
                        swal(
                            'Eliminado!',
                            'Eliminado con Exito!',
                            'success'
                        )
                        jQuery('[data-id="' + resultado.id_eliminado + '"]').parents('tr').remove();
                    } else {
                        swal(
                            'Error!',
                            'No se pudo eliminar',
                            'error'
                        )
                    }
                }
            })
        });
    });

    /********** borrar estado acuerdo ***********/
    $('.borrar_estadoacuerdo').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        var estado = $(this).attr('data-tipo');
        swal({
            title: '¿Está Seguro?',
            text: 'Si lo elimina no podra revertirlo!!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtontext: 'Si, Eliminarlo!',
            cancelButtontext: 'Cancelar'
        }).then(function () {
            $.ajax({
                type: 'post',
                data: {
                    'id': id,
                    'estado-acuerdo': 'eliminar'
                },
                url: '../Modelos/modelo_' + estado + '.php',
                success: function (data) {
                    var resultado = JSON.parse(data);
                    if (resultado.respuesta == 'exito') {
                        swal(
                            'Eliminado!',
                            'Eliminado con Exito!',
                            'success'
                        )
                        jQuery('[data-id="' + resultado.id_eliminado + '"]').parents('tr').remove();
                    } else {
                        swal(
                            'Error!',
                            'No se pudo eliminar',
                            'error'
                        )
                    }
                }
            })
        });
    });

    /********** borrar estado noti ***********/
    $('.borrar_estadonoti').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        var estado = $(this).attr('data-tipo');
        swal({
            title: '¿Está Seguro?',
            text: 'Si lo elimina no podra revertirlo!!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtontext: 'Si, Eliminarlo!',
            cancelButtontext: 'Cancelar'
        }).then(function () {
            $.ajax({
                type: 'post',
                data: {
                    'id': id,
                    'estado-noti': 'eliminar'
                },
                url: '../Modelos/modelo_' + estado + '.php',
                success: function (data) {
                    var resultado = JSON.parse(data);
                    if (resultado.respuesta == 'exito') {
                        swal(
                            'Eliminado!',
                            'Eliminado con Exito!',
                            'success'
                        )
                        jQuery('[data-id="' + resultado.id_eliminado + '"]').parents('tr').remove();
                    } else {
                        swal(
                            'Error!',
                            'No se pudo eliminar',
                            'error'
                        )
                    }
                }
            })
        });
    });

    $('.borrar_estadoparticipante').on('click', function (e) {
        e.preventDefault();
        var id = $(this).attr('data-id');
        var estado = $(this).attr('data-tipo');
        swal({
            title: '¿Está Seguro?',
            text: 'Si lo elimina no podra revertirlo!!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtontext: 'Si, Eliminarlo!',
            cancelButtontext: 'Cancelar'
        }).then(function () {
            $.ajax({
                type: 'post',
                data: {
                    'id': id,
                    'estado-participante': 'eliminar'
                },
                url: '../Modelos/modelo_' + estado + '.php',
                success: function (data) {
                    var resultado = JSON.parse(data);
                    if (resultado.respuesta == 'exito') {
                        swal(
                            'Eliminado!',
                            'Eliminado con Exito!',
                            'success'
                        )
                        jQuery('[data-id="' + resultado.id_eliminado + '"]').parents('tr').remove();
                    } else {
                        swal(
                            'Error!',
                            'No se pudo eliminar',
                            'error'
                        )
                    }
                }
            })
        });
    });














































});