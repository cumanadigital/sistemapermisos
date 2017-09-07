    console.log("javascript - admin DIAS FERIADOS");
    var permite_eliminar = false;    
    // var username = $('#user_name').attr('oculto');
    // var userced = $('#user_name').attr('ocultoced');
    // var sesionencode = $('#user_name').attr('sesionencode');
    // var usernombre = $('#name_user').html();
    // var cargouser = $('#cargo_user').html();
    // var dptouser = $('#departamento_user').html();
    // var userestatus = $('#estatus_loading').attr('estatus');

    //var API_URL_diasferiados =  "servicios/services.diasferiados.php?accion=consultar_diasferiados";
    var API_URL_diasferiados =  "servicios/services.admin.diasferiados.php?accion=consultar_diasferiados";
    var API_URL =  "servicios/services.admin.diasferiados.php";
    var $table = $('#table').bootstrapTable({url: API_URL_diasferiados});
    
    $modal = $('#modal_diasferiados').modal({show: false});
    
    $alert = $('.alert').hide();


    
    var accion="";
    
    
        
    $(function () {
        // create event
        //Date range picker        
        $('#txt_fecha_diaferiado').daterangepicker({
            singleDatePicker: true,
            format: 'DD/MM/YYYY',
            locale: {
              autoClose: true,              
              language: 'auto'
            }
        });

        $('#btn_crear_registro').click(function () {
          
            // marcamos el check de inactivo
            $("#txt_radio_estatus0" ).prop("checked" , true );
            // desabilitamos el check de activo
            $("#txt_radio_estatus0").prop('disabled', false);
            $("#txt_radio_estatus1").prop('disabled', false);
            // cambiamos el texto del boton enviar
            $modal.find('button[name="btn_enviar_diaferiado"]').text("Agregar Días Feriados");
            accion ='agregar_diasferiados';
            
            $modal.find('input[name="txt_id_diaferiado"]').val('');
            $modal.find('input[name="txt_fecha_diaferiado"]').val('');
            $modal.find('input[name="txt_nombre_diaferiado"]').val('');
            $("#txt_tipo_diaferiado").val(''); //  LIMPIAR SELECT
            $("#txt_jornada").val(''); //  LIMPIAR SELECT 
            $("#txt_tipo_personal1").prop("checked", ""); //  DESACTIVAR CHECKBOX
            $("#txt_tipo_personal2").prop("checked", ""); //  DESACTIVAR CHECKBOX
            $("#txt_tipo_personal3").prop("checked", ""); //  DESACTIVAR CHECKBOX
            // $("#txt_tipo_personal3").prop("checked", "checked"); //  ACTIVAR CHECKBOX
            $('input:radio[name=txt_radio_estatus]:checked').val('0'); // SELECIONAR RADIO
 
            // console.log(accion);
            showModal('Nuevo Registro');
            $modal.modal('show');
          
        });
        
        $modal.find('#btn_enviar_diaferiado').click(function () {
          
            // console.log($(this).attr('id') + " --> " +  $(this).text());    
            var row = {};
            var rowid = {}
            $modal.find('input[id]').each(function () {
              row[$(this).attr('name')] = $(this).val();
              rowid[$(this).attr('id')] = $(this).val();
            });


            var id_diaferiado = $modal.find('input[name="txt_id_diaferiado"]').val();
            
            var fecha_diaferiado = $modal.find('input[name="txt_fecha_diaferiado"]').val();

            // console.log(fecha_diaferiado);

            if (fecha_diaferiado!='') {
              parametros = $("#form_modal_diasferiados").serialize() + '&id_diaferiado='+id_diaferiado+'&accion='+ accion;
              // console.log(parametros);
              // parametros 
              // txt_id_diaferiado=&
              // txt_fecha_diaferiado=04%2F18%2F2016&
              // txt_nombre_diaferiado=motivo&
              // txt_tipo_diaferiado=1&
              // txt_jornada=1&
              // txt_tipo_personal1=1&
              // txt_tipo_personal2=2&
              // txt_tipo_personal3=3&
              // txt_radio_estatus=0&
              // id_diaferiado=&
              // accion=agregar_diasferiados
              // 
              API_URL =  "servicios/services.admin.diasferiados.php";
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
        });
      
    });
    //toolbar1

    function queryParams(params) {
        return {};
    }

    function actionFormatter(value,row) {
        return [
            '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-warning glyphicon-edit"></i></a>  ',
            ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-error glyphicon-remove-circle"></i></a>',
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
        return icon;
    }    
    // update and delete events
    window.actionEvents = {
        'click .update': function (e, value, row) {
            accion='modificar_diasferiados'
            // console.log(row);
            showModal($(this).attr('title'), row);  
        },
        'click .remove': function (e, value, row) {
            console.log(row);
            accion='eliminar_diasferiados'
            if (row.estatus ==1) {
              var estatus ="Activo";
            }else{
              var estatus ="Inactivo";
            }  
            var id_diaferiado = row.id_diaferiado;
            if (confirm('Esta seguro de eleminar este item? \n ' + row.fecha + ' - ' +row.motivo + ' \n ' +row.tipo_fecha_txt + ' - ' + row.jornada_txt +  '\n ' + estatus)) {
                $.ajax({
                    url: API_URL + '?id_diaferiado=' +row.id_diaferiado + '&accion=' + accion ,
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
        if (accion=='agregar_diasferiados') {
          //code
          // habilitamos los check - activo
          $("#txt_radio_estatus0").prop("checked" , true ) 
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', false);
          // $('#txt_fecha_diaferiado').prop('readonly', false);
          $('#txt_fecha_diaferiado').prop('readonly', true);
          //$modal.find('button[name="btn_enviar_diaferiado"]').text("Modificar Día Feriado");
          $modal.find('button[name="btn_enviar_diaferiado"]').text("Agregar Día Feriado");
        }
      
        if (accion=='modificar_diasferiados') {

          // //code
          // // habilitamos los check - activo
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', false);
          
          $('#txt_fecha_diaferiado').prop('readonly', true);
          //
          //  CAMBIAMOS EL TITULO DE LA VENTANA MODAL  
          $modal.find('.modal-title').text(title);
          // CAMBIAMOS EL NOMBRE EL TEXTO BOTON DE ENVIAR
          $modal.find('button[name="btn_enviar_diaferiado"]').text("Modificar Día Feriado");
          // SE CORRIGE LA FECHA ADECUADA AL DATERANGEPICKER

          
          // Object { 
          //   id_diaferiado: "2", 
          //   fecha: "2016-04-19", 
          //   tipo_fecha: "1", 
          //   tipo_fecha_txt: "Feriado Nacional", 
          //   motivo: "Proclamación de la independencia de…", 
          //   estatus: "1", 
          //   jornada: "1", 
          //   jornada_txt: "No Laborable", 
          //   id_tipo_personal: "1-2-3", 
          //   id_tipo_personal_txt: "Administrativo - Docente - Obrero" 
          // }


          // // marcamos el check de inactivo
          // $("#txt_radio_estatus0" ).prop("checked" , true );
          // // desabilitamos el check de activo
          // $("#txt_radio_estatus1").prop('disabled', true);
          // cambiamos el texto del boton enviar
          $modal.find('button[name="btn_enviar_diaferiado"]').text("Modificar Día Feriado");
  
          var fechareg =  row['fecha'].split('-');
          var ani_reg = fechareg[0];
          var mes_reg = fechareg[1];
          var dia_reg = fechareg[2];
          var freg =   dia_reg + '/' + mes_reg + '/' + ani_reg;
          
          // LLENAMOS CADA INPUT CON LOS DATOS DE LA TABLA
          $modal.find('input[name="txt_nombre_diaferiado"]').val(row['motivo']);
          $("#txt_tipo_diaferiado").val(row['tipo_fecha']); //  LIMPIAR SELECT
          $("#txt_jornada").val(row['jornada']); //  LIMPIAR SELECT

      
          var tipo_personal =  row['id_tipo_personal'].split('-');
          // console.log (row.id_tipo_personal);
          // console.log (tipo_personal);
          // 
          for (var i = 0; i < tipo_personal.length; i++) {
             // console.log(tipo_personal[i])
             
             if (tipo_personal[i]=='1') {
                $("#txt_tipo_personal1").prop("checked", "checked");
             }
             if (tipo_personal[i]=='2') {
                $("#txt_tipo_personal2").prop("checked", "checked");
             }
             if (tipo_personal[i]=='3') {
                $("#txt_tipo_personal3").prop("checked", "checked");
             } 
           } 
          // 
          $modal.find('input[name="txt_id_diaferiado"]').val(row['id_diaferiado']);
          $("#txt_tipo_personal").val(row['id_tipo_personal']);
          $("#txt_jornada").val(row['jornada']);
          $modal.find('input[name="txt_fecha_diaferiado"]').val(freg);                 
          // CAMBIAMOS EL INPUT RADIO DE ESTATUS
          if (row['estatus']==0){
            $("#txt_radio_estatus0" ).prop("checked" , true )  
          }else{
            $("#txt_radio_estatus1" ).prop("checked" , true )
          }   
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