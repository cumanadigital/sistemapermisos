  console.log("javascript - admin tipos de permisos");
  
    // var permite_eliminar = false;    
    // var username = $('#user_name').attr('oculto');
    // var userced = $('#user_name').attr('ocultoced');
    // var sesionencode = $('#user_name').attr('sesionencode');
    // var usernombre = $('#name_user').html();
    // var cargouser = $('#cargo_user').html();
    // var dptouser = $('#departamento_user').html();
    // var userestatus = $('#estatus_loading').attr('estatus');

    // var API_URL_director_permisos =  "servicios/services.director.permisos.php?accion=consultar_permisos";
    // var $table = $('#table').bootstrapTable({url: API_URL_director_permisos});
  /*  
    $modal = $('#ventana_modal').modal({show: false});
    
    $alert = $('.alert').hide();

    var accion="";
    console.log(fecha_actual());
    console.log(sumaFecha(3,fecha_actual()));
    $(function () {
        // create event
        //Date range picker        
        $('#txt_periodo_registro').daterangepicker({
            "startDate": "21/04/2016",
            "endDate": "24/04/2016",
            // singleDatePicker: true,
            format: 'DD/MM/YYYY',
            // showDropdowns: true,
            opens: 'left',
            drops: 'up',
            locale: {
              autoClose: true,              
              language: 'auto',
              "separator": " - ",
              "applyLabel": "Aplicar",
              "cancelLabel": "Cancelar",
              "fromLabel": "Desde",
              "toLabel": "Hasta"
            }
        });

        $('#txt_fecha_registro').daterangepicker({
            singleDatePicker: true,
            format: 'DD/MM/YYYY',
            opens: 'left',
            drops: 'up',
            locale: {
              autoClose: true,              
              language: 'auto'
            }
        });

        $('#btn_crear_registro').click(function () {
            showModal('Nuevo Registro');
            $modal.modal('show');
            // marcamos el check de inactivo
            // $("#txt_radio_estatus0" ).prop("checked" , true );
            // desabilitamos el check de activo
            // $("#txt_radio_estatus1").prop('disabled', true);
            // cambiamos el texto del boton enviar
            $modal.find('button[name="btn_enviar_modal"]').text("Agregar Permiso");
            accion ='agregar_permisos';
            
            // txt_tipo_personal
            // txt_tipo_permiso
            // txt_nombre_permiso
            // txt_reglas_legal
            // txt_fecha_registro
            // txt_radio_estatus
            // 
            
            
            $("#txt_id_jefeinmediato").val(userced);
            $("#txt_id_permiso").val('');

            $("#txt_id_personal").val('');
            $("#txt_cedula_personal").val('');
            $("#txt_nombre_funcionario").val('');
            $("#txt_tipo_personal").val('');
            $("#txt_id_cargo_funcional").val('');
            $("#txt_cargo_funcional").val('');
            $("#txt_municipio").val('');
            $("#txt_id_lugar_trabajo").val('');
            $("#txt_lugar_trabajo").val('');
            
            $("#txt_tipo_permiso").val('');
            $("#txt_motivo_permiso").val('');
            $("#txt_cantidad_dias").val('');
            $("#txt_periodo_registro").val('');
            $("#txt_cantidad_dias").val('');
            $("#txt_fecha_registro").val('');
            $("#id_tipopermiso").val('');


            $("#txt_id_personal").val('1');
            $("#txt_cedula_personal").val('11829328');
            $("#txt_nombre_funcionario").val('OSWALDO HERNÁNDEZ');
            $("#txt_tipo_personal").val('ADMINISTRATIVO');
            $("#txt_id_cargo_funcional").val('333');
            $("#txt_cargo_funcional").val('COORDINADOR DE SISTEMAS Y BASE DE DATOS');
            $("#txt_municipio").val('SUCRE');
            $("#txt_id_lugar_trabajo").val('123');
            $("#txt_lugar_trabajo").val('DIV. DE INFORMATICA Y SISTEMAS');

            
            // $("#accion=agregar_permisos

            
            // $('input:radio[name=txt_tipo_personal]:checked').val(1);
            // console.log($modal.find('input:radio[name=txt_tipo_personal]:checked').val());
            // $('input:radio[name=txt_tipo_permiso]:checked').val('');
            // $("#txt_tipo_personal").val('');
            // $("#txt_tipo_permiso").val('');
             // 
            // $modal.find('input[name="txt_id_tipopermiso"]').val('');
            // $modal.find('input[name="txt_nombre_permiso"]').val('');
            // $modal.find('input[name="txt_dias_permiso"]').val('');
            // $modal.find('input[name="txt_reglas_legal"]').val('');
            // $modal.find('input[name="txt_recaudos"]').val('');
            // $modal.find('input[name="txt_fecha_registro"]').val('');           
            // $('input:radio[name=txt_radio_estatus]:checked').val('0');

            //console.log(accion);
        });
        
        $modal.find('#btn_enviar_modal').click(function () {
            //console.log($(this).attr('id') + " --> " +  $(this).text());    
            // var row = {};
            // var rowid = {}
            // $modal.find('input[id]').each(function () {
            //   row[$(this).attr('name')] = $(this).val();
            //   rowid[$(this).attr('id')] = $(this).val();
            // });
            // $modal.find('input[id]').each(function () {
            //   row[$(this).attr('name')] = $(this).val();
            //   rowid[$(this).attr('id')] = $(this).val();
            // });
            var id_permiso = $("#txt_id_permiso").val();
            var tipo_permiso = $("#txt_id_permiso").val();
            // row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
            // row['accion'] ="agregar_permisos"
            // console.log(row);
            
            // Object { 
            //           txt_nombre_permiso: "bre", 
            //           txt_dias_permiso: "dias", 
            //           txt_reglas_legal: "base", 
            //           txt_fecha_registro: "04/14/2016", 
            //           txt_radio_estatus: "", 
            //           accion: "agregar_permisos" 
            //         }

            var cedula = $("#txt_cedula_personal").val();
            if (cedula!='') {
              parametros = $("#form_ventana_modal").serialize() + '&id_permiso='+id_permiso+'&accion='+ accion  + '&'+sesionencode;
              console.log(parametros);
              
              API_URL =  "servicios/services.director.permisos.php";
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
                      console.log(response);
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

    function actionFormatter(value,row) {
      
      var icono1 = '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-edit"></i></a>  '
      var icono2 = ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-remove-circle"></i></a>'
      // console.log(icono)
        return [ icono1 ].join('');
        // '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-edit"></i></a>  ',
        //     ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-remove-circle"></i></a>',
    }
    
    function StatusFormatter(value, row) {
        var icon = "";
        //console.log(row.estatus);
        if (row.estatus == 1 ) {
          icon = '<span class="pull-center badge bg-green">Aprob</span>';
        }else{
          icon ='<span class="pull-center badge bg-red">Rech.</span>';
        }
        return icon;
    }    
    // update and delete events
    window.actionEvents = {
        'click .update': function (e, value, row) {
            accion='modificar_permisos'
            // console.log(row);
            showModal($(this).attr('title'), row);  
        },
        'click .remove': function (e, value, row) {
            // console.log(row);
            accion='eliminar_permisos'
            if (row.estatus ==1) {
              var estatus ="Activo";
            }else{
              var estatus ="Inactivo";
            }  
            var id_permiso = row.id_permiso;
            if (confirm('Esta seguro de eleminar este item? \n ' + row.nombre_tipo + ' - ' +row.numero_dias + ' \n ' +row.id_tipo_personal_txt + ' - ' +row.tipo_permiso_txt +  '\n ' + estatus)) {
                $.ajax({
                    url: API_URL + '?id_permiso=' +row.id_tipopermiso + '&accion=' + accion ,
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
    // 
    function showModal(title, row) {
        // console.log(title, row);
        $('#txt_fecha_registro').prop('readonly', true);
        if (accion=='agregar_permisos') {
          //code
          // habilitamos los check - activo
          $("#txt_radio_estatus0").prop("checked" , true ) 
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', true);
          $('#txt_fecha_registro').prop('readonly', true);
          //$modal.find('button[name="btn_enviar_modal"]').text("Modificar Permiso");
          $modal.find('button[name="btn_enviar_modal"]').text("Agregar Permiso");
        }
        if (accion=='modificar_permisos') {
          // //code
          // // habilitamos los check - activo
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', false);

          // Object { 
          //       id_permiso: "6",
          //       tipo_permiso: "1", 
          //       tipo_permiso_txt: "Obligatorio", 
          //       nombre_tipo: "mmm", 
          //       numero_dias: "nnnn", 
          //       reglas_legal: "bbbb", 
          //       recaudos: "rrrr", 
          //       id_tipo_personal: "2", 
          //       id_tipo_personal_txt: "Docente", 
          //       fecha_registro: "2016-04-03", 
          //       estatus:"0"
          //  } 
          //
          //  CAMBIAMOS EL TITULO DE LA VENTANA MODAL  
          $modal.find('.modal-title').text(title);
          // CAMBIAMOS EL NOMBRE EL TEXTO BOTON DE ENVIAR
          $modal.find('button[name="btn_enviar_modal"]').text("Modificar Permiso");
          // SE CORRIGE LA FECHA ADECUADA AL DATERANGEPICKER
          var fechareg =  row['fecha_registro'].split('-');
          var ani_reg = fechareg[0];
          var mes_reg = fechareg[1];
          var dia_reg = fechareg[2];
          var freg = dia_reg + '/' + mes_reg + '/' + ani_reg;
          // LLENAMOS CADA INPUT CON LOS DATOS DE LA TABLA
          $modal.find('input[name="txt_id_permiso"]').val(row['id_tipopermiso']);
          $("#txt_tipo_personal").val(row['id_tipo_personal']);
          $("#txt_tipo_permiso").val(row['tipo_permiso']);
          $modal.find('input[name="txt_nombre_permiso"]').val(row['nombre_tipo']);
          $modal.find('input[name="txt_dias_permiso"]').val(row['numero_dias']);
          $modal.find('input[name="txt_reglas_legal"]').val(row['reglas_legal']);
          $modal.find('input[name="txt_recaudos"]').val(row['recaudos']);
          $modal.find('input[name="txt_fecha_registro"]').val(freg);           
          
          // // CAMBIAMOS EL INPUT RADIO DE ESTATUS
          // if (row['estatus']==0){
          //   $("#txt_radio_estatus0" ).prop("checked" , true )  
          // }else{
          //   $("#txt_radio_estatus1" ).prop("checked" , true )
          // }
        }
        // MOSTRAMOS LA VENTANA MODAL
        $modal.modal('show');
    }
    // 
    function showAlert(title, type) {
        $alert.attr('class', 'alert alert-' + type || 'success')
              .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
        setTimeout(function () {
            $alert.hide();
        }, 3000);
    }