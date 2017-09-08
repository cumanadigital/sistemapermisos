    console.log("javascript - root registrar planteles");

    //var API_URL_periodos =  "servicios/services.periodos.php?accion=consultar_periodos";
    var API_URL_periodos =  "servicios/services.admin.periodos.php?accion=consultar_periodos";
    var API_URL =  "servicios/services.admin.periodos.php";
    var $table = $('#table').bootstrapTable({url: API_URL_periodos});
    
    $modal = $('#modal_registros').modal({show: false});
    
    $alert = $('.alert').hide();
    
    var accion="";
 
    $(function () {
        // create event
        //Date range picker        
        $('#txt_rango_fecha').daterangepicker({
            locale: {
              autoClose: false,
              format: 'YYYY-MM-DD',
              longDateFormat:'L',
              language: 'auto',
              separator: ' - ',
              applyLabel: "Aplicar",
              cancelLabel: "Cancelar",
              fromLabel: "Desde",
              toLabel: "Hasta"
            }
        });

        $('#txt_fecha_recaudo').daterangepicker({
            locale: {
              autoClose: false,
              format: 'YYYY-MM-DD',
              longDateFormat:'L',
              language: 'auto',
              separator: ' - ',
              applyLabel: "Aplicar",
              cancelLabel: "Cancelar",
              fromLabel: "Desde",
              toLabel: "Hasta"
            }
        });

        

        //$modal.find('#btn_crear_periodo').click(function ()  {
        //
        //});
        $('#btn_crear_periodo').click(function () {
            accion ='agregar_periodos';
            console.log(accion)
            showModal('Nuevo Registro');
            $modal.modal('show');
            // marcamos el check de inactivo
            $("#txt_radio_estatus0" ).prop("checked" , true );
            // desabilitamos el check de activo
            $("#txt_radio_estatus1").prop('disabled', true);
            // cambiamos el texto del boton enviar
            $modal.find('button[name="btn_enviar_periodo"]').text("Agregar Plantel");
            
            
            $modal.find('input[name="txt_codigo_periodo"]').val('');
            $modal.find('input[name="txt_nombre_periodo"]').val('');
            $modal.find('input[name="txt_rango_fecha"]').val('');
            $modal.find('input[name="txt_fecha_inicio"]').val('');
            $modal.find('input[name="txt_fecha_cierre"]').val('');

            $modal.find('input[name="txt_fecha_recaudo"]').val('');
            $modal.find('input[name="txt_fecha_recaudo_inicio"]').val('');
            $modal.find('input[name="txt_fecha_recaudo_cierre"]').val('');

            //console.log(accion);
        });
        
        $modal.find('#btn_enviar_periodo').click(function () {
            //console.log($(this).attr('id') + " --> " +  $(this).text());    
            var row = {};
            var rowid = {}
            $modal.find('input[id]').each(function () {
              row[$(this).attr('name')] = $(this).val();
              rowid[$(this).attr('id')] = $(this).val();
            });
            
            row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
            row['accion'] ="agregar_periodos"
            
            // console.log(row);
            
            var nombre_periodo = $modal.find('input[name="txt_nombre_periodo"]').val();
            var rango_fecha = $modal.find('input[name="txt_rango_fecha"]').val();
            
            if (nombre_periodo!='' && rango_fecha!= '') {
              parametros = $("#form_modal_registros").serialize() + '&accion='+ accion;
              API_URL =  "servicios/services.admin.periodos.php";
              $.ajax({
                  url: API_URL + ($modal.data('id') || ''),
                  type: 'POST',
                  //contentType: 'application/json',
                  //data: JSON.stringify(row),
                  data: parametros + "&token1="+rand_code(),
                  success: function (response) {
                      $modal.modal('hide');
                      showAlert('Registro con éxito!', 'success');
                      $table.bootstrapTable('refresh');
                      // console.log(response);
                      //console.log(data);
                      //showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item successful!', 'success');
                      //var result = append(data).html();
                      //$('#showresults').html(result);
                  },
                  error: function () {
                      $modal.modal('hide');
                      showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item error!', 'danger');
                  }
              });
                
            }else{
              alert("Debe ingresar los datos");
            }
            
            //for (var name in row) {
              //console.log('input[name="' + name + '"]').val(row[name]);
            //  $modal.find('input[name="' + name + '"]').val(row[name]);
            //}
            
        });
      
    });
    //toolbar1

    function queryParams(params) {
        return {};
    }

<<<<<<< HEAD
=======
    // function actionFormatter(value,row) {
    //   // console.info(row); 
    //     return [
    //         '<a class="view" href="javascript:" title="Ver Registro"><i class="glyphicon glyphicon-view glyphicon-eye-open"></i></a>  ',
    //         '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-warning glyphicon-edit"></i></a>  ',
    //         '<a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-error glyphicon-remove-circle"></i></a>',
    //     ].join('');
    // }

            // '  <button type="button" class="btn btn-default">Seleccione</button>',

    function actionFormatter(value,row) {
      // console.info(row); 
        return [
            '<div class="btn-group">',
            '  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">',
            '    Seleccione <span class="caret"></span>',
            '  </button>',
            '  <ul class="dropdown-menu pull-right" role="menu">',
            '    <li><a class="view" href="javascript:" title="Ver Registro"><i class="glyphicon glyphicon-view glyphicon-eye-open"></i>Ver Registro</a></li>',
            '    <li><a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-warning glyphicon-edit"></i>Modificar Registro</a></li>',
            '    <li><a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-error glyphicon-remove-circle"></i>Eliminar Registro</a></li>',
            '  </ul>',
            '</div>'
        ].join('');
    }

    function StatusFormatter(value, row) {
        var icon = "";
        //console.log(row.estatus);
        if (row.estatus == 1 ) {
          icon = '<span class="pull-center badge bg-green">Activo</span>';
        }else{
          icon ='<span class="pull-center badge bg-red">Inactivo</span>';
        }
        //return '<i class="glyphicon ' + icon + '"></i> ' + row.estatus;
        //return row.estatus;
        return icon;
    }
    
    // update and delete events
    window.actionEvents = {
        'click .view': function (e, value, row) {
            accion='ver_periodos'
            // console.log(row);
            // console.log($(this).attr('title'));
            showModal($(this).attr('title'), row);  
        },
        'click .update': function (e, value, row) {
            accion='modificar_periodos'
            //console.log(row);
            // console.log($(this).attr('title'));
            showModal($(this).attr('title'), row);  
        },
        'click .remove': function (e, value, row) {
            // console.log($(this).attr('title'));
            accion='eliminar_periodos'
            if (row.estatus ==1) {
              var estatus ="Activo";
            }else{
              var estatus ="Inactivo";
            }  
            if (confirm('Esta seguro de eleminar este item? \n ' + row.nombre_periodo + ' \n ' +row.fecha_inicio + ' - ' +row.fecha_cierre + '\n ' + estatus)) {
                $.ajax({
                    url: API_URL + '?id_periodo=' +row.id_periodo + '&accion=' + accion ,
                    //type: 'POST',
                    success: function () {
                        $table.bootstrapTable('refresh');
                        showAlert('Registro borrado con exito!', 'success');
                    },
                    error: function () {
                        showAlert('Delete item error!', 'danger');
                    }
                })
            }
        }
    };


    function showModal(title, row) {
        row = row || {
            id_periodo: '',
            nombre_periodo: '',
            //rango_fecha: '',
            fecha_inicio:'',
            fecha_cierre:'',
            estatus: 0
        }; // default row value
        // console.log(title, row);
        console.log("row. " + row.id_periodo, accion);
        
        if (accion=='agregar_periodos') {
          //code
          // habilitamos los check - activo
          $modal.find('.modal-title').text(title);
          $("#txt_radio_estatus0").prop("checked" , true ) 
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', true);
          //$modal.find('button[name="btn_enviar_periodo"]').text("Modificar Plantel");
          $modal.find('button[name="btn_enviar_periodo"]').text("Agregar Plantel");
        }

        if (accion=='ver_periodos') {
          //code
          // habilitamos los check - activo
          $("#txt_radio_estatus0").prop('disabled', true);
          $("#txt_radio_estatus1").prop('disabled', true);

          $("#txt_nombre_periodo").attr('disabled', true);
          $("#txt_fecha_recaudo").attr('disabled', true);
          $("#txt_rango_fecha").attr('disabled', true);
          
          $("#btn_enviar_periodo").attr('disabled', true);
          $("#btn_enviar_periodo").hide();


          // fecha periodo
          var fechaini =  row['fecha_inicio'].split('-');
          var fechafin =  row['fecha_cierre'].split('-');
          
          var ani_ini = fechaini[0];
          var mes_ini = fechaini[1];
          var dia_ini = fechaini[2];
          
          var ani_fin = fechafin[0];
          var mes_fin = fechafin[1];
          var dia_fin = fechafin[2];
          
          var fini = mes_ini + '/' + dia_ini + '/' + ani_ini;
          var ffin = mes_fin + '/' + dia_fin + '/' + ani_fin;
          var rango =  fini + ' - ' + ffin;

          // fecha recaudos
          var fechaini_reca =  row['fecha_recaudo_ini'].split('-');
          var fechafin_reca =  row['fecha_recaudo_fin'].split('-');
          
          var ani_ini_reca = fechaini_reca[0];
          var mes_ini_reca = fechaini_reca[1];
          var dia_ini_reca = fechaini_reca[2];
          
          var ani_fin_reca = fechafin_reca[0];
          var mes_fin_reca = fechafin_reca[1];
          var dia_fin_reca = fechafin_reca[2];
          
          var fini_reca  = mes_ini_reca + '/' + dia_ini_reca + '/' + ani_ini_reca;
          var ffin_reca  = mes_fin_reca + '/' + dia_fin_reca + '/' + ani_fin_reca;
          var rango_reca = fini_reca    +' - '+ ffin_reca;

          // console.log(rango);
          // console.log(rango_reca);

          $modal.find('.modal-title').text(title);
          $modal.find('input[name="txt_codigo_periodo"]').val(row['id_periodo']);
          $modal.find('input[name="txt_nombre_periodo"]').val(row['nombre_periodo']);
          
          $modal.find('input[name="txt_rango_fecha"]').val(rango );
          $modal.find('input[name="txt_fecha_inicio"]').val(ani_ini + '/' + mes_ini + '/' + dia_ini );
          $modal.find('input[name="txt_fecha_cierre"]').val(ani_fin + '/' + mes_fin + '/' + dia_fin );

          $modal.find('input[name="txt_fecha_recaudo"]').val(rango_reca);
          $modal.find('input[name="txt_fecha_recaudo_inicio"]').val(ani_ini_reca + '/' + mes_ini_reca + '/' + dia_ini_reca );
          $modal.find('input[name="txt_fecha_recaudo_cierre"]').val(ani_fin_reca + '/' + mes_fin_reca + '/' + dia_fin_reca );
          if (row['estatus']==0){
            $("#txt_radio_estatus0" ).prop("checked" , true )  
          }else{
            $("#txt_radio_estatus1" ).prop("checked" , true )
          }

          $modal.find('button[name="btn_enviar_periodo"]').text("Ver Plantel");
          
        }

        if (accion=='modificar_periodos' ) {
          //code
          // habilitamos los check - activo
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', false);

          $("#txt_nombre_periodo").attr('disabled', false);
          $("#txt_fecha_recaudo").attr('disabled', false);
          $("#txt_rango_fecha").attr('disabled', false);
          
          $("#btn_enviar_periodo").attr('disabled', false);
          $("#btn_enviar_periodo").show();

          
          // fecha periodo
          var fechaini =  row['fecha_inicio'].split('-');
          var fechafin =  row['fecha_cierre'].split('-');
          
          var ani_ini = fechaini[0];
          var mes_ini = fechaini[1];
          var dia_ini = fechaini[2];
          
          var ani_fin = fechafin[0];
          var mes_fin = fechafin[1];
          var dia_fin = fechafin[2];
          
          var fini = mes_ini + '/' + dia_ini + '/' + ani_ini;
          var ffin = mes_fin + '/' + dia_fin + '/' + ani_fin;
          var rango =  fini + ' - ' + ffin;

          // fecha recaudos
          var fechaini_reca =  row['fecha_recaudo_ini'].split('-');
          var fechafin_reca =  row['fecha_recaudo_fin'].split('-');
          
          var ani_ini_reca = fechaini_reca[0];
          var mes_ini_reca = fechaini_reca[1];
          var dia_ini_reca = fechaini_reca[2];
          
          var ani_fin_reca = fechafin_reca[0];
          var mes_fin_reca = fechafin_reca[1];
          var dia_fin_reca = fechafin_reca[2];
          
          var fini_reca  = mes_ini_reca + '/' + dia_ini_reca + '/' + ani_ini_reca;
          var ffin_reca  = mes_fin_reca + '/' + dia_fin_reca + '/' + ani_fin_reca;
          var rango_reca = fini_reca    +' - '+ ffin_reca;

          // console.log(rango);
          // console.log(rango_reca);

          $modal.find('.modal-title').text(title);
          $modal.find('input[name="txt_codigo_periodo"]').val(row['id_periodo']);
          $modal.find('input[name="txt_nombre_periodo"]').val(row['nombre_periodo']);
          
          $modal.find('input[name="txt_rango_fecha"]').val(rango );
          $modal.find('input[name="txt_fecha_inicio"]').val(ani_ini + '/' + mes_ini + '/' + dia_ini );
          $modal.find('input[name="txt_fecha_cierre"]').val(ani_fin + '/' + mes_fin + '/' + dia_fin );

          $modal.find('input[name="txt_fecha_recaudo"]').val(rango_reca);
          $modal.find('input[name="txt_fecha_recaudo_inicio"]').val(ani_ini_reca + '/' + mes_ini_reca + '/' + dia_ini_reca );
          $modal.find('input[name="txt_fecha_recaudo_cierre"]').val(ani_fin_reca + '/' + mes_fin_reca + '/' + dia_fin_reca );
          if (row['estatus']==0){
            $("#txt_radio_estatus0" ).prop("checked" , true )  
          }else{
            $("#txt_radio_estatus1" ).prop("checked" , true )
          }
          
          $modal.find('button[name="btn_enviar_periodo"]').text("Modificar Plantel");
          
        }
        
        $modal.modal('show');
    }

    function showAlert(title, type) {
        $alert.attr('class', 'alert alert-' + type || 'success')
              .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
        setTimeout(function () {
            $alert.hide();
        }, 3000);
    }