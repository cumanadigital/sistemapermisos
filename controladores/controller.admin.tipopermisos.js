    console.log("javascript - admin tipos de permisos");
    var permite_eliminar = false;    
    var username = $('#user_name').attr('oculto');
    var userced = $('#user_name').attr('ocultoced');
    var sesionencode = $('#user_name').attr('sesionencode');
    var usernombre = $('#name_user').html();
    var cargouser = $('#cargo_user').html();
    var dptouser = $('#departamento_user').html();
    var userestatus = $('#estatus_loading').attr('estatus');

    //var API_URL_permisos =  "servicios/services.permisos.php?accion=consultar_permisos";
    var API_URL_permisos =  "servicios/services.admin.tipopermisos.php?accion=consultar_permisos";
    var API_URL =  "servicios/services.admin.tipopermisos.php";
    var $table = $('#table').bootstrapTable({url: API_URL_permisos});
    
    $modal = $('#modal_permisos').modal({show: false});
    
    $alert = $('.alert').hide();

    var accion="";
        
    $(function () {
        // create event
        //Date range picker        
        $('#txt_fecha_registro').daterangepicker({
            singleDatePicker: true,
            format: 'DD/MM/YYYY',
            locale: {
              autoClose: true,              
              language: 'auto'
            }
        });

        $('#btn_crear_registro').click(function () {
            
            accion ='agregar_tipo_permisos';
            console.log(accion);
            
            showModal('Nuevo Registro');
            $modal.modal('show');
            // marcamos el check de inactivo
            $("#txt_radio_estatus0" ).prop("checked" , true );
            // desabilitamos el check de activo
            // $("#txt_radio_estatus1").prop('disabled', true);
            $("#txt_radio_estatus0").prop('disabled', false);
            $("#txt_radio_estatus1").prop('disabled', false);
            // cambiamos el texto del boton enviar
            $modal.find('button[name="btn_enviar_permiso"]').text("Agregar Permiso");
            
            
            // txt_tipo_personal
            // txt_tipo_permiso
            // txt_nombre_permiso
            // txt_reglas_legal
            // txt_fecha_registro
            // txt_radio_estatus
            
            // $('input:radio[name=txt_tipo_personal]:checked').val(1);
            // console.log($modal.find('input:radio[name=txt_tipo_personal]:checked').val());
            // $('input:radio[name=txt_tipo_permiso]:checked').val('');
            $("#txt_tipo_personal").val('');
            $("#txt_tipo_permiso").val('');
             // 
            $modal.find('input[name="txt_id_tipopermiso"]').val('');
            $modal.find('input[name="txt_nombre_permiso"]').val('');
            $modal.find('input[name="txt_dias_permiso"]').val('');
            $modal.find('input[name="txt_reglas_legal"]').val('');
            $modal.find('input[name="txt_recaudos"]').val('');
            $modal.find('input[name="txt_fecha_registro"]').val('');           
            $('input:radio[name=txt_radio_estatus]:checked').val('0');

            //console.log(accion);
        });
        
        $modal.find('#btn_enviar_permiso').click(function () {
            //console.log($(this).attr('id') + " --> " +  $(this).text());    
            var row = {};
            var rowid = {}
            $modal.find('input[id]').each(function () {
              row[$(this).attr('name')] = $(this).val();
              rowid[$(this).attr('id')] = $(this).val();
            });

            $modal.find('input[id]').each(function () {
              row[$(this).attr('name')] = $(this).val();
              rowid[$(this).attr('id')] = $(this).val();
            });

            var id_permiso = $modal.find('input[name="txt_id_tipopermiso"]').val();
            
            row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
            row['accion'] ="agregar_tipo_permisos"
            
            // console.log(row);
            
            // Object { 
            //           txt_nombre_permiso: "bre", 
            //           txt_dias_permiso: "dias", 
            //           txt_reglas_legal: "base", 
            //           txt_fecha_registro: "04/14/2016", 
            //           txt_radio_estatus: "", 
            //           accion: "agregar_tipo_permisos" 
            //         }

            var nombre_permiso = $modal.find('input[name="txt_nombre_permiso"]').val();
            if (nombre_permiso!='') {
              parametros = $("#form_modal_permisos").serialize() + '&id_tipopermiso='+id_permiso+'&accion='+ accion;
              console.log(parametros);
              API_URL =  "servicios/services.admin.tipopermisos.php";
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
        return [
            '<a class="view" href="javascript:" title="Ver Registro"><i class="glyphicon glyphicon-view glyphicon-eye-open"></i></a>  ',
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
        'click .view': function (e, value, row) {
            accion='ver_permisos'
            //console.log(row);
            showModal($(this).attr('title'), row);  
        },
        'click .update': function (e, value, row) {
            accion='modificar_tipos_permisos'
            // console.log(row);
            showModal($(this).attr('title'), row);  
        },
        'click .remove': function (e, value, row) {
            // console.log(row);
            accion='eliminar_tipos_permisos'
            if (row.estatus ==1) {
              var estatus ="Activo";
            }else{
              var estatus ="Inactivo";
            }  
            var id_permiso = row.id_tipopermiso;
            if (confirm('Esta seguro de eleminar este item? \n ' + row.nombre_tipo + ' - ' +row.numero_dias + ' \n ' +row.id_tipo_personal_txt + ' - ' +row.tipo_permiso_txt +  '\n ' + estatus)) {
                $.ajax({
                    url: API_URL + '?id_tipopermiso=' +row.id_tipopermiso + '&accion=' + accion ,
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
        if (accion=='agregar_tipo_permisos') {
          //code
          // habilitamos los check - activo
          $("#txt_radio_estatus0").prop("checked" , true ) 
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', true);
          $('#txt_fecha_registro').prop('readonly', true);
          //$modal.find('button[name="btn_enviar_permiso"]').text("Modificar Permiso");
          $modal.find('button[name="btn_enviar_permiso"]').text("Agregar Tipos de Permisos");
        }
        if (accion=='modificar_tipos_permisos') {
          // //code
          // // habilitamos los check - activo
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', false);

          // Object { 
          //       id_tipopermiso: "6",
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
          $modal.find('button[name="btn_enviar_permiso"]').text("Modificar Permiso");
          // SE CORRIGE LA FECHA ADECUADA AL DATERANGEPICKER
          var fechareg =  row['fecha_registro'].split('-');
          var ani_reg = fechareg[0];
          var mes_reg = fechareg[1];
          var dia_reg = fechareg[2];
          var freg = dia_reg + '/' + mes_reg + '/' + ani_reg;
          // LLENAMOS CADA INPUT CON LOS DATOS DE LA TABLA
          $modal.find('input[name="txt_id_tipopermiso"]').val(row['id_tipopermiso']);
          $("#txt_tipo_personal").val(row['id_tipo_personal']);
          $("#txt_tipo_permiso").val(row['tipo_permiso']);
          $modal.find('input[name="txt_nombre_permiso"]').val(row['nombre_tipo']);
          $modal.find('input[name="txt_dias_permiso"]').val(row['numero_dias']);
          $modal.find('input[name="txt_reglas_legal"]').val(row['reglas_legal']);
          $modal.find('input[name="txt_recaudos"]').val(row['recaudos']);
          $modal.find('input[name="txt_fecha_registro"]').val(freg);           
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