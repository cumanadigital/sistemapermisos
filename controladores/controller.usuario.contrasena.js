    console.log("javascript - usuario - contraseña");

    var username = $('#user_name').attr('oculto');
    var userced = $('#user_name').attr('ocultoced');
    var sesionencode = $('#user_name').attr('sesionencode');
    var usernombre = $('#name_user').html();
    var cargouser = $('#cargo_user').html();
    var dptouser = $('#departamento_user').html();
    var userestatus = $('#estatus_loading').attr('estatus');

    var tipo_proceso ="a"; // asignatura 
    var parametros_user = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&'+sesionencode + '&relleno=valor';
    //var parametros_user1= 'accion=consultar' + '&estatus_envio='+tipo_proceso + '&';
    //var API_URL_asignatura =  "servicios/jefe.admin.asignaturas.php" + '?' + parametros_user1 + parametros_user;

    var API_URL =  "servicios/jefe.admin.periodos.php";
    
    $f = $('#form1');
    
    $alert = $('.alert').hide();
    
    var accion="";
        
    $(function () {
        // create event
        $('#form1').find('#btn_cerrar').click(function () {
            $('#form1').find('input[name="txt_password_nuevo"]').val('');
            $('#form1').find('input[name="txt_password_confirma"]').val('');
        });

        $('#form1').find('#btn_enviar').click(function () {
            //console.log($(this).attr('id') + " --> " +  $(this).text());    
            var row = {};
            var rowid = {}
            $('#form1').find('input[id]').each(function () {
              row[$(this).attr('name')] = $(this).val();
              rowid[$(this).attr('id')] = $(this).val();
            });
            
            //row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
            row['accion'] ="modificar"
            
            //console.log(row);
            
            //var txt_00 = $('#form1').find('input[name="txt_password_actual"]').val();
            var txt_01 = $('#form1').find('input[name="txt_password_nuevo"]');
            var txt_02 = $('#form1').find('input[name="txt_password_confirma"]');

            
            if ( txt_01.val()!='' && txt_02.val()!='') {

              if ( txt_01.val() == txt_02.val() ) {

                  accion = 'modificar';
                  parametros = $("#form1").serialize() + '&accion='+ accion;
                  API_URL =  "servicios/services.pasword.php";
                  $.ajax({
                      url: API_URL,
                      type: 'POST',
                      data: parametros + '&' + parametros_user + "&token1="+rand_code(),
                      success: function (response) {
                          //$modal.modal('hide');
                          showAlert('Modificado con éxito!', 'success');
                          //$table.bootstrapTable('refresh');

                          txt_01.val('');
                          txt_02.val('');
                      },
                      error: function () {
                          //$modal.modal('hide');
                          showAlert('Create item error!', 'danger');
                      }
                  });
              }else{
                alert("Confirmar correctamente la nueva contraseña");  
              }  
            }else{
              alert("Debe ingresar los datos");
            }            
        });
    });


    function showAlert(title, type) {
        $alert.attr('class', 'alert alert-' + type || 'success')
              .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
        setTimeout(function () {
            $alert.hide();
        }, 3000);
    }