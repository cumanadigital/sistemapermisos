    console.log("javascript - jefedpto admin usuario");

    var permite_eliminar = false;    
    var username = $('#user_name').attr('oculto');
    var userced = $('#user_name').attr('ocultoced');
    var sesionencode = $('#user_name').attr('sesionencode');
    var usernombre = $('#name_user').html();
    var cargouser = $('#cargo_user').html();
    var dptouser = $('#departamento_user').html();
    var userestatus = $('#estatus_loading').attr('estatus');

    //var API_URL_usuario =  "servicios/services.periodos.php?accion=consultar_usuario";
    var API_URL_usuario =  "servicios/services.admin.users.php?accion=consultar_usuario";
    var API_URL =  "servicios/services.admin.users.php";
    var $table = $('#table').bootstrapTable({url: API_URL_usuario});
        $table.bootstrapTable('hideColumn', 'cargo_persona');
    
    // $modal = $('#modal_usuario').modal({show: false});

    $modal = $('#ventana_modal').modal({show: false});

    var txt_dependencia = $("#txt_dependencia");

    $alert = $('.alert').hide();
    
    var accion="";  
    
$(function () {

    // Limpiamos el contenido del select tipos de permisos
    txt_dependencia.empty();
    txt_dependencia.append("<option value=''>Seleccione</option>");

    accion = 'consultar_dependencias';
    $.ajax({
        type: "GET",
        url: "servicios/services.dependencias.php",
        data: "&accion=" + accion  +  "&token1=" + rand_code(),
        success: function(response)
        {
          // console.log(response);
          var arreglo_dependencias = JSON.parse(response);
          var tipos_permisos_estatus = ""
          var estado = 0;
          $.each(arreglo_dependencias, function(i,item){
               // { "pl_estadistico":"9JgiqZVT71yk6HNaUI-XjApz-PzQ01-ASpkxAlqYr0",
               //   "pl_nombre":"ALMACEN GENERAL",
               //   "pl_coddea":"ZE_INTERNA",
               //   "pl_municipio":"14",
               //   "municipio_nombre":"SUCRE"},
               //  
               // console.log(item); 
              txt_dependencia.append("<option value='"+item.pl_estadistico+"' >" + item.pl_nombre + " ( " + item.municipio_nombre + " )" + "</option>");
          })
          // txt_dependencia.append("</optgroup>");
        }
    });


    $('#btn_crear_usuario').click(function () {

        $('#btn_limpiar').click();

        $('#cuadro_busqueda_datos_laborales').hide();
        $('#cuadro_datos_laborales').hide();
        $('#cuadro_solicitud_permiso').hide();
        
        $modal.find('button[name="btn_enviar_modal"]').text("Agregar Usuario");
        $modal.find('button[name="btn_enviar_modal"]').hide();

        showModal('Nuevo Registro');
        $modal.modal('show');
        accion = 'agregar_usuario';
        $("#txt_reg_cedula").prop('disabled', false);

    });


    $('#btn_buscar').click(function () {

        accion ='consultar_funcionarios';

        var cedula = $("#txt_cedula_personal").val();
        console.log(cedula);
        // $('#cuadro_busqueda_datos_laborales').show();
        
        // var cedula = $("#txt_cedula_personal").val();
        if (cedula!='') {
          parametros =  'cedula='+cedula+'&accion='+ accion  + '&'+sesionencode;
          // console.log(parametros);
          API_URL =  "servicios/services.funcionarios.php";
          $.ajax({
              url: API_URL + ($modal.data('id') || ''),
              type: 'POST',
              //contentType: 'application/json',
              //data: JSON.stringify(row),
              data: parametros + "&token1="+rand_code(),
              success: function (response) {
                  // $modal.modal('hide');
                  // showAlert('Registro con éxito!', 'success');
                  // $table.bootstrapTable('refresh');
                  // console.log('ok entro en la consulta');
                  console.log(response.length);
                  console.log(response);

                  // var mydata =  [
                  //                  {
                  //                     "persona_uid":"Eqz41mUb-HT4Z-Q2J0-LM6o-iciHokHBrGYt",
                  //                     "persona_cedula":"11829328",
                  //                     "apellidos_nombres":"HERNANDEZ CAMPOS OSWALDO ENRIQUES",
                  //                     "dependencia_labora":"DIV. DE INFORMATICA Y SISTEMAS",
                  //                     "cargo_labora":"COORD. SISTEMAS Y BASES DE DATOS",
                  //                     "cargo_codigo":"10000C",
                  //                     "cargo_denominacion":"BACHILLER CONTRATADO",
                  //                     "municipio_nombre":"SUCRE"
                  //                  },
                  //                  {
                  //                     "persona_uid":"Eqz41mUb-HT4Z-Q2J0-LM6o-iciHokHBrGYt",
                  //                     "persona_cedula":"11829328",
                  //                     "apellidos_nombres":"HERNANDEZ CAMPOS OSWALDO ENRIQUES",
                  //                     "dependencia_labora":"DIV. DE INFORMATICA Y SISTEMAS",
                  //                     "cargo_labora":"COORD. SISTEMAS Y BASES DE DATOS",
                  //                     "cargo_codigo":"20000C",
                  //                     "cargo_denominacion":"TECNICO SUPERIOR UNIVERSI",
                  //                     "municipio_nombre":"SUCRE"
                  //                  }
                  //               ];
                  
                  // var mydata =  [
                  //                {
                  //                   "persona_uid":"wQvNVxKi-96FI-apTX-D72o-b4CJlrtdGGUq",
                  //                   "persona_cedula":"12269509",
                  //                   "apellidos_nombres":"FIGUEROA VALLENILLA YSABEL CRISITNA",
                  //                   "dependencia_labora":"COORD. SISTEMA DE GESTION ESCOLAR",
                  //                   "cargo_labora":"ANALISTA SGE",
                  //                   "cargo_codigo":"8030C",
                  //                   "cargo_denominacion":"ASEADOR CONTRATADO",
                  //                   "municipio_nombre":"SUCRE"
                  //                }
                  //             ];


                  if (response.length == 1 ) {
                    // console.log("es falso");
                    $("#txt_nombre_funcionario").val('no encontrado');
                  }else{
                    
                    var data_func =  JSON.parse(response);
                    // console.log(typeof(data_func));
                    // console.log(data_func);
                    var tamanio = data_func.length;
                    // console.log(tamanio);  
                    // console.log(data_func); 
                    var nombre = data_func[0]['apellidos_nombres'];
                    $("#txt_nombre_funcionario").val(nombre);
                    if (tamanio>=1) {
                      //mostrar el cuadro de busqueda
                      $('#cuadro_busqueda_datos_laborales').show();
                      var $table2 = $('#table2').bootstrapTable('destroy' );
                      var $table2 = $('#table2').bootstrapTable( { data : data_func } );
                    }else{
                      //No es necesario mostrar el cuadro de busqueda
                      $('#cuadro_busqueda_datos_laborales').hide();
                    }
                    ///////////////////////////////
                    //   console.log(nombre);    //
                  ///////////////////////////////
                  }
              },
              error: function () {
                  $modal.modal('hide');
                  showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item error!', 'danger');
              }
          });
            
        }else{
          alert("Debe ingresar los datos");
        }
        console.log(accion);
    });


    $('#btn_limpiar').click(function () {
        accion ='limpiar_funcionario';
        
        console.log(accion);

        $('#cuadro_busqueda_datos_laborales').fadeOut(300);
        $('#cuadro_datos_laborales').fadeOut(300);
        $('#cuadro_solicitud_permiso').fadeOut(300);

        $('#table2').bootstrapTable('destroy' );


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

        $("#txt_rol_usuario").val('');
        $("#txt_dependencia").val('');
        
        
        // $("#txt_dependencia").val('');
        // $("#txt_motivo_permiso").val('');
        // $("#txt_cantidad_dias").val('');
        // $("#txt_periodo_registro").val('');
        // $("#txt_cantidad_dias").val('');
        // $("#txt_fecha_registro").val('');
        // $("#id_tipopermiso").val('');
        
    });


    $( "#txt_rol_usuario" ).change(function() {
      // alert( "Handler for .change() called." );
      // alert( this.value ); // or $(this).val()
      if (this.value == 'jefeinmediato') {
        $('#caja_dependencia').show();
      }else{
        $('#caja_dependencia').hide();
      }
      

    });


    $modal.find('#btn_enviar_user').click(function () {
        console.log($(this).attr('id') + " --> " +  $(this).text());    
        var row = {};
        var rowid = {}
        // $modal.find('input[id]').each(function () {
        //   row[$(this).attr('name')] = $(this).val();
        //   rowid[$(this).attr('id')] = $(this).val();
        // });

          var txt_id_persona =       $('#txt_id_persona').val();
          var txt_reg_cedula =       $('#txt_reg_cedula').val();
          var txt_reg_nombre =       $('#txt_reg_nombre').val();
          var txt_reg_apellido =     $('#txt_reg_apellido').val();
          var txt_reg_correo =       $('#txt_reg_correo').val();
          var txt_reg_telefono =     $('#txt_reg_telefono').val();
          var txt_reg_password1 =    $('#txt_reg_password1').val();
          var txt_reg_password2 =    $('#txt_reg_password2').val();
          var txt_departamento =     $('#txt_departamento').val();
          var txt_cargo =            $('#txt_cargo').val();
          

        
        // row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
        row['accion'] ="agregar_usuario"
        
        // console.log(row);
        
        // var nombre_periodo = $modal.find('input[name="txt_nombre_usuario"]').val();
        // var rango_fecha = $modal.find('input[name="txt_rango_fecha"]').val();
             

        if ( txt_reg_cedula != "" && txt_reg_nombre != "" && txt_reg_apellido != "" && txt_reg_correo != "" && txt_reg_telefono != "" && txt_departamento!='0' && txt_cargo!='0'){
          
          if (txt_reg_password1 == txt_reg_password2) {
              // accion = 'agregar_usuario';
              parametros = $("#form_modal_usuario").serialize() + '&accion='+ accion;
              API_URL =  "servicios/services.admin.users.php";
              $.ajax({
                  url: API_URL,
                  type: 'POST',
                  //contentType: 'application/json',
                  //data: JSON.stringify(row),
                  data: parametros + "&token1="+rand_code(),
                  success: function (response) {
                      console.log(response);
                      if (response == '@true') {
                        alert("usuario ya existe");
                      }else{
                        $modal.modal('hide');
                        showAlert('Registro con éxito!', 'success');
                        $table.bootstrapTable('refresh');
                        console.log(response);
                      }
                  },
                  error: function () {
                      $modal.modal('hide');
                      showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item error!', 'danger');
                  }
              });
            }else{
              alert("Contraseña no valida");    
            }
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
            '<a class="photoupdate" href="javascript:" title="Actualizar Foto"><i class="glyphicon glyphicon-camera"></i></a>  ',
            '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-edit"></i></a>  ',
            ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-remove-circle"></i></a>',
        ].join('');
    }

    function actionFormatter2(value,row) {
      // glyphicon-ok-circle
      var icono1 = '<a class="seleccionar" href="javascript:" title="Seleccionar Registro"><i class="glyphicon glyphicon-green glyphicon glyphicon-ok-sign "></i></a>';
        return icono1;
    }

    
    function StatusFormatter(value, row) {
        var icon = "";
        //console.log(row.estatus);
        if (row.estatus_persona == '1' ) {
          icon = '<span class="pull-center badge bg-green">Activo</span>';
        }else{
          icon ='<span class="pull-center badge bg-red">Inactivo</span>';
        }
        //return '<i class="glyphicon ' + icon + '"></i> ' + row.estatus;
        //return row.estatus;
        return icon;
    }


    function imageFormatter(value,row) { 
    var archivo = getAbsolutePath() + 'media/carnet/'+row.cedula_persona+'.jpg'
    if  (!LinkCheck(archivo)){
        archivo = getAbsolutePath() + 'media/carnet/noimage3.png'
    }
    var tamano = '45px';
    var foto = '<div class="pull-left image"><img height="'+tamano+'" src="'+archivo+'" class="img-circle" alt="User Image"></div>';        
    return foto;
}
//#################################################
//#################################################
function imageFormatter2(value,row) {
    var archivo = getAbsolutePath() + 'media/carnet/'+row.cedula_persona+'.jpg'
    if  (!LinkCheck(archivo)){
        archivo = getAbsolutePath() + 'media/carnet/noimage3.png'
    }
    var tamano = '120px';
    var foto = '<div class="pull-left image"><img height="'+tamano+'" src="'+archivo+'" class="img-circle" alt="User Image"></div>';
    return foto;      
}

function abrirVentana(cedula){
//guardo la referencia de la ventana para poder utilizarla luego
ventana_secundaria = window.open("vistas/subirfoto/index.php?cedula="+cedula,"miventana","width=640,height=480,menubar=no")
}

function cerrarVentana(){
//la referencia de la ventana es el objeto window del popup. Lo utilizo para acceder al método close
ventana_secundaria.close()
} 
    
    // update and delete events
    window.actionEvents = {
        'click .photoupdate': function (e, value, row) {
            abrirVentana(row.cedula_persona)  
        },
        'click .update': function (e, value, row) {
            accion='modificar_usuario'
            //console.log(row);
            showModal($(this).attr('title'), row);  
        },
        'click .remove': function (e, value, row) {
            accion='eliminar_usuario'
            if (row.estatus_persona ==1) {
              var estatus ="Activo";
            }else{
              var estatus ="Inactivo";
            }  
            if (confirm('Esta seguro de eleminar este item? \n ' + row.cedula_persona + ' \n ' +row.nombre_persona + ' ' +row.apellido_persona)) {
                $.ajax({
                    url: API_URL + '?id_persona=' +row.id_persona + '&accion=' + accion ,
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

    window.actionEvents2 = {
        
        'click .seleccionar': function (e, value, row) {
            accion='selecionar_funcionario';
            console.log(accion, row);

            // [
            //    {
            //       "empleado_dep_uid":"demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG",
            //       "persona_uid":"Eqz41mUb-HT4Z-Q2J0-LM6o-iciHokHBrGYt",
            //       "persona_cedula":"11829328",
            //       "apellidos_nombres":"HERNANDEZ CAMPOS OSWALDO ENRIQUES",
            //       "dependencia_labora":"DIV. DE INFORMATICA Y SISTEMAS",
            //       "cargo_labora":"COORD. SISTEMAS Y BASES DE DATOS",
            //       "categoria_cargo_descripcion":"ADMINISTRATIVO",
            //       "cargo_codigo":"10000C",
            //       "cargo_denominacion":"BACHILLER CONTRATADO",
            //       "municipio_nombre":"SUCRE"
            //    }
            // ]

            $("#txt_id_personal").val(row['empleado_dep_uid']);

            // ocultamos el cuadro de seleccion de cargo funcional 
            $('#cuadro_busqueda_datos_laborales').fadeOut(300);
            // mostramos los datos laborales seleccionados
            $('#cuadro_datos_laborales').fadeIn(300);
            // mostramos el formulario para ingresar los datos de permisos a solicitar
            $('#cuadro_solicitud_permiso').fadeIn(300);

            //  cargamos los valores en pantalla
            $("#txt_tipo_personal").val(row['categoria_cargo_descripcion']);
            $("#txt_id_cargo_funcional").val(row['empleado_dep_uid']);
            $("#txt_cargo_funcional").val(row['cargo_labora']);
            $("#txt_municipio").val(row['municipio_nombre']);
            $("#txt_id_lugar_trabajo").val(row['empleado_dep_uid']);
            $("#txt_lugar_trabajo").val(row['dependencia_labora']);

            //activamos el boton de enviar formulario
            $modal.find('button[name="btn_enviar_modal"]').show();
          
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
        console.log(title, row);
        $('#txt_id_persona').val('');
        $('#txt_reg_cedula').val('');
        $('#txt_reg_nombre').val('');
        $('#txt_reg_apellido').val('');
        $('#txt_reg_correo').val('');
        $('#txt_reg_telefono').val('');
        $('#txt_reg_password1').val('');
        $('#txt_reg_password2').val('');
        $('#txt_departamento').val('0');
        $('#txt_cargo').val('0');



        console.log("row. ",row, accion);
        
        if (accion=='agregar_usuario') {
          //code
          // habilitamos los check - activo
          // $("#txt_radio_estatus0").prop("checked" , true ) 
          // $("#txt_radio_estatus0").prop('disabled', false);
          // $("#txt_radio_estatus1").prop('disabled', true);
          //$modal.find('button[name="btn_enviar_user"]').text("Modificar Periodo");
          $modal.find('button[name="login_register_user"]').text("Agregar Usuario");
        }
        if (accion=='modificar_usuario') {

           // Object { id_persona: "1", 
           // cedula_persona: "11829328", 
           // nombre_persona: "Oswaldo", 
           // apellido_persona: "Hernández", 
           // correo_persona: "oswaldoehc@gmail.com", 
           // telefono_persona: "04165936395", 
           // foto_persona: "11829328", 
           // estatus_persona: "1", 
           // id_departamento: "1", 
           // departamento_persona: "Administración", 
           // 1 más… }

          $('#txt_id_persona').val(row['id_persona']);
          $('#txt_reg_cedula').val(row['cedula_persona']);
          $('#txt_reg_nombre').val(row['nombre_persona']);
          $('#txt_reg_apellido').val(row['apellido_persona']);
          $('#txt_reg_correo').val(row['correo_persona']);
          $('#txt_reg_telefono').val(row['telefono_persona']);
          $('#txt_reg_password1').val('');
          $('#txt_reg_password2').val('');
          $('#txt_departamento').val(row['id_departamento']);
          $('#txt_cargo').val(row['id_cargo']);


          //code
          // habilitamos los check - activo
          // $("#txt_radio_estatus0").prop('disabled', false);
          // $("#txt_radio_estatus1").prop('disabled', false);


          $modal.find('.modal-title').text(title);

          // if (row['estatus']==0){
          //   $("#txt_radio_estatus0" ).prop("checked" , true )  
          // }else{
          //   $("#txt_radio_estatus1" ).prop("checked" , true )
          // }
          
          $modal.find('button[name="login_register_user"]').text("Modificar Usuario");
          
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