    console.log("javascript - root informacion laboral");

    //var API_URL_periodos =  "servicios/services.periodos.php?accion=consultar_periodos";
    // var API_URL_periodos =  "servicios/services.admin.periodos.php?accion=consultar_periodos";
    // var API_URL_info_laboral =  "servicios/services.informacion.laboral.php?accion=consultar_informacion";
    // var API_URL =  "servicios/services.admin.periodos.php";
    // var $table = $('#table').bootstrapTable({url: API_URL_periodos});
    // var $table = $('#table').bootstrapTable({url: API_URL_info_laboral});

    
    // $modal = $('#modal_registros').modal({show: false});
    
    $alert = $('.alert').hide();
    
    var accion="";
 
    $(function () {
        // create event
        // 
        $('#btn_descarga_planilla').click(function () {
            accion ='btn_descarga_planilla';
            // archivo =     
            console.log(accion);
            document.location = "files/NOMBRE_DEPENDENCIA_PLANILLA_CONSOLIDADO_FINAL_SOLICITUD_INTEGRAL_DE_INFORMACIÓN_LABORAL.ods";
        });

    });



    //toolbar1
    //
    //

  
    // function UnirFormatter(value, row) {
    //     // console.log(row);
    //     return ['Habitación: ' + row.telf_hab, '<br />Célular: ' + row.telf_movil].join(' ');
    // }
    // function UnirFormatter2(value, row) {
    //     // console.log(row); 
    //     return ['Email: ' + row.email, '<br />Twitter: ' + row.twitter].join(' ');
    // }

    // function UnirFormatter3(value, row) {
    //     // console.log(row); 
    //     return ('Nóminal:<br /><b>' + row.cod_dependencia_cobro + '</b><br />' + 'Laboral:<br /><b>' + row.cod_dependencia_labora + '</b><br />' + 'Horas: <b>' + row.horas) + '</b>';
    // }
    // function UnirFormatter4(value, row) {
    //     // console.log(row);
    //     return ('Alergias: ' + row.alergias + '<br />Cirugias: ' + row.cirugias + '\n G. Sang: ' + row.grupo_sanguineo);
    // }

  
    // function showAlert(title, type) {
    //     $alert.attr('class', 'alert alert-' + type || 'success')
    //           .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
    //     setTimeout(function () {
    //         $alert.hide();
    //     }, 3000);
    // }