    console.log("javascript - jefedpto admin productos");

    var API_URL_productos =  "servicios/services.admin.productos.php?accion=consultar_productos";
    
    var $table = $('#table').bootstrapTable({url: API_URL_productos});
    
    $modal = $('#modal_productos').modal({show: false});
    
    $alert = $('.alert').hide();
    
    var accion="";

    $(function () {
        // create event
        $('#btn_abrir_modal').click(function () {
            accion ='agregar_productos';
            // console.log(accion)
            showModal('Nuevo Registro');
            $modal.modal('show');
            $modal.find('button[name="btn_enviar_producto"]').text("Agregar producto");
            $modal.find('input[name="txt_id_producto"]').val('');
            $modal.find('input[name="txt_codigo_producto"]').val('');
            $modal.find('input[name="txt_descripcion_producto"]').val('');
            $modal.find('input[name="txt_medida_producto"]').val('');
            $modal.find('input[name="txt_id_categoria"]').val('');
            $modal.find('input[name="txt_unidades_producto"]').val('');
        });
        
        $modal.find('#btn_enviar_producto').click(function () {
            console.log($(this).attr('id') + " --> " +  $(this).text());    
            // var row = {};
            // var rowid = {}
            // $modal.find('input[id]').each(function () {
            //   row[$(this).attr('name')] = $(this).val();
            //   rowid[$(this).attr('id')] = $(this).val();
            // });
            // // row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
            // row['accion'] ="agregar_productos"
            var codigo_producto = $modal.find('input[name="txt_codigo_producto"]').val();
            var descripcion_producto = $modal.find('input[name="txt_descripcion_producto"]').val();
            
            if (codigo_producto!='' && descripcion_producto!= '') {
              parametros = $("#form_modal_productos").serialize() + '&accion='+ accion;
              API_URL =  "servicios/services.admin.productos.php";
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

    // function queryParams(params) {
    //     return {};
    // }

    function actionFormatter(value,row) {
        return [
            '<a class="view" href="javascript:" title="Ver Registro"><i class="glyphicon glyphicon-view glyphicon-eye-open"></i></a>  ',
            '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-warning glyphicon-edit"></i></a>  ',
            ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-error glyphicon-remove-circle"></i></a>',
        ].join('');
    }
    
    // function StatusFormatter(value, row) {
    //     var icon = "";
    //     //console.log(row.estatus);
    //     if (row.estatus == 1 ) {
    //       icon = '<span class="pull-center badge bg-green">Activo</span>';
    //     }else{
    //       icon ='<span class="pull-center badge bg-red">Inactivo</span>';
    //     }
    //     return icon;
    // }
    
    // update and delete events
    window.actionEvents = {
        'click .view': function (e, value, row) {
            accion='ver_productos'
            // console.log(row);
            // console.log($(this).attr('title'));
            showModal($(this).attr('title'), row);  
        },
        'click .update': function (e, value, row) {
            accion='modificar_productos'
            //console.log(row);
            // console.log($(this).attr('title'));
            showModal($(this).attr('title'), row);  
        },
        'click .remove': function (e, value, row) {
            // console.log($(this).attr('title'));
            accion='eliminar_productos'
            // if (row.estatus ==1) {
            //   var estatus ="Activo";
            // }else{
            //   var estatus ="Inactivo";
            // }  
            if (confirm('Esta seguro de elIminar este item? \n ' + row.codigo_producto + ' \n ' +row.descripcion_producto + ' - ' +row.medida_producto + '\n ' )) {
                $.ajax({
                    url: API_URL + '?id_producto=' +row.id_producto + '&accion=' + accion ,
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
            id_producto: 0,
            txt_codigo_producto: '',
            txt_descripcion_producto: '', 
            txt_medida_producto: '', 
            txt_id_categoria: 0,
            txt_unidades_producto: 0
        };
        // console.log(title, row);
        console.log("row. " + row.id_producto, accion);
        
        if (accion=='agregar_productos') {
          //code
          $modal.find('.modal-title').text(title);
          $modal.find('button[name="btn_enviar_producto"]').text("Agregar producto");
        }

        if (accion=='ver_productos') {
          //code
          // habilitamos los check - activo
         
          $("#txt_codigo_producto").attr('disabled', true);
          $("#txt_descripcion_producto").attr('disabled', true);
          $("#txt_medida_producto").attr('disabled', true);
          $("#txt_id_categoria").attr('disabled', true);
          $("#txt_unidades_producto").attr('disabled', true);
                   
          $("#btn_enviar_producto").attr('disabled', true);
          $("#btn_enviar_producto").hide();

          $modal.find('.modal-title').text(title);
          $modal.find('input[name="txt_id_producto"]').val(row['id_producto']);
          $modal.find('input[name="txt_codigo_producto"]').val(row['codigo_producto']);
          $modal.find('input[name="txt_descripcion_producto"]').val(row['descripcion_producto']);
          $modal.find('input[name="txt_medida_producto"]').val(row['medida_producto']);
          $modal.find('input[name="txt_id_categoria"]').val(row['id_categoria']);
          $modal.find('input[name="txt_unidades_producto"]').val(row['unidades_producto']);
          $modal.find('button[name="btn_enviar_producto"]').text("Ver producto");
          
        }

        if (accion=='modificar_productos' ) {
          //code          
          
          $("#txt_codigo_producto").attr('disabled', false);
          $("#txt_descripcion_producto").attr('disabled', false);
          $("#txt_medida_producto").attr('disabled', false);
          $("#txt_id_categoria").attr('disabled', false);
          $("#txt_unidades_producto").attr('disabled', false);

          $("#btn_enviar_producto").attr('disabled', false);
          $("#btn_enviar_producto").show();

          $modal.find('.modal-title').text(title);
          $modal.find('input[name="txt_id_producto"]').val(row['id_producto']);
          $modal.find('input[name="txt_codigo_producto"]').val(row['codigo_producto']);
          $modal.find('input[name="txt_descripcion_producto"]').val(row['descripcion_producto']);
          $modal.find('input[name="txt_medida_producto"]').val(row['medida_producto']);
          $modal.find('input[name="txt_id_categoria"]').val(row['id_categoria']);
          $modal.find('input[name="txt_unidades_producto"]').val(row['unidades_producto']);
          
          $modal.find('button[name="btn_enviar_producto"]').text("Modificar producto");
          
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