console.log("javascript - jefe procesar vacaciones");


    var permite_eliminar = false;    
    var username = $('#user_name').attr('oculto');
    var userced = $('#user_name').attr('ocultoced');
    var sesionencode = $('#user_name').attr('sesionencode');
    var usernombre = $('#name_user').html();
    var cargouser = $('#cargo_user').html();
    var dptouser = $('#departamento_user').html();
    var userestatus = $('#estatus_loading').attr('estatus');

    var cantdependencias = $('#user_name').attr('cantdependencias');

    var API_URL_director_vacaciones =  "servicios/services.secretaria.vacaciones.php?accion=consultar_vacaciones&"+sesionencode;
    var $table = $('#table').bootstrapTable({url: API_URL_director_vacaciones});

    // if ( cantdependencias>1) {
    //   $table.bootstrapTable('showColumn', 'departamento_persona');
    // }else{
    //   $table.bootstrapTable('hideColumn', 'departamento_persona');
    // }
    

    var txt_periodo       = $("#txt_periodo");
  
    $modal = $('#ventana_modal').modal({show: false});
    
    $alert = $('.alert').hide();

    // $cuadro_busqueda_datos_laborales = $('#cuadro_busqueda_datos_laborales').show();
    // $cuadro_datos_laborales = $('#cuadro_datos_laborales').hide();
    // $cuadro_solicitud_vacaciones = $('#cuadro_solicitud_vacaciones').hide();

    var accion="";
    
    // console.log(fecha_actual2());
    // 
    // console.log(randomstring(20));

    // console.log(sumaFecha(3,fecha_actual()));
    
    Cargar_Combo_Periodos(1);

    limpiar_form();

     $(function () {



        // create event
        //Date range picker        
        $('#txt_lapso_vacaciones').daterangepicker({
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

        // $('#txt_fecha_registro').daterangepicker({
        //     singleDatePicker: true,
        //     format: 'DD/MM/YYYY',
        //     opens: 'left',
        //     drops: 'up',
        //     locale: {
        //       autoClose: true,              
        //       language: 'auto'
        //     }
        // });

        // $('#txt_fecha_ingreso_me').daterangepicker({
        //     singleDatePicker: true,
        //     showDropdowns: true,
        //     format: 'DD/MM/YYYY',
        //     opens: 'left',
        //     drops: 'up',
        //     locale: {
        //       autoClose: true,              
        //       language: 'auto'
        //     }
        // });


        // $('#btn_crear_registro').click(function () {

        //     limpiar_form();

        //     showModal('Nuevo Registro');
        //     $modal.modal('show');
        //     // marcamos el check de inactivo
        //     // $("#txt_radio_estatus0" ).prop("checked" , true );
        //     // desabilitamos el check de activo
        //     // $("#txt_radio_estatus1").prop('disabled', true);
        //     // cambiamos el texto del boton enviar
        //     $modal.find('button[name="btn_enviar_modal"]').text("Solicitar Vacaciones");

        //     $modal.find('button[name="btn_enviar_modal"]').hide();
            
        //     $('#cuadro_busqueda_datos_laborales').hide();
        //     $('#cuadro_datos_laborales').hide();
        //     $('#cuadro_solicitud_vacaciones').hide();
            
        //     $("#txt_id_jefeinmediato").val(userced);
        //     $("#txt_id_vacaciones").val('');

        //     $("#txt_id_personal").val('');
        //     $("#txt_cedula_personal").val('');
        //     $("#txt_nombre_funcionario").val('');
        //     $("#txt_tipo_personal").val('');
        //     $("#txt_id_cargo_funcional").val('');
        //     $("#txt_cargo_funcional").val('');
        //     $("#txt_municipio").val('');
        //     $("#txt_id_lugar_trabajo").val('');
        //     $("#txt_lugar_trabajo").val('');
            
        //     $("#txt_periodo").val('');
        //     $("#txt_tipo_vacaciones").val('');
        //     $("#txt_cantidad_dias").val('');
        //     $("#txt_periodo_registro").val('');
        //     $("#txt_cantidad_dias").val('');
        //     $("#txt_fecha_registro").val('');
        //     $("#id_tipovacaciones").val('');
        //     //
        //     $("#txt_cedula_personal").focus();
        // });


        // $('#btn_buscar').click(function () {
        //     // showModal('Nuevo Registro');
        //     // $modal.modal('show');
        //     // // marcamos el check de inactivo
        //     // // $("#txt_radio_estatus0" ).prop("checked" , true );
        //     // // desabilitamos el check de activo
        //     // // $("#txt_radio_estatus1").prop('disabled', true);
        //     // // cambiamos el texto del boton enviar
        //     // $modal.find('button[name="btn_enviar_modal"]').text("Agregar vacaciones");
            
        //     accion ='consultar_funcionarios';

        //     var cedula = $("#txt_cedula_personal").val();
        //     console.log(cedula);
        //     // $('#cuadro_busqueda_datos_laborales').show();
            
        //     // var cedula = $("#txt_cedula_personal").val();
        //     if (cedula!='') {
        //       parametros =  'cedula='+cedula+'&accion='+ accion  + '&'+sesionencode;
        //       // console.log(parametros);
        //       API_URL =  "servicios/services.funcionarios.php";
        //       $.ajax({
        //           url: API_URL + ($modal.data('id') || ''),
        //           type: 'POST',
        //           //contentType: 'application/json',
        //           //data: JSON.stringify(row),
        //           data: parametros + "&token1="+rand_code(),
        //           success: function (response) {
        //               // $modal.modal('hide');
        //               // showAlert('Registro con éxito!', 'success');
        //               // $table.bootstrapTable('refresh');
        //               // console.log('ok entro en la consulta');
        //               console.log(response.length);
        //               console.log(response);

        //               // var mydata =  [
        //               //                  {
        //               //                     "persona_uid":"Eqz41mUb-HT4Z-Q2J0-LM6o-iciHokHBrGYt",
        //               //                     "persona_cedula":"11829328",
        //               //                     "apellidos_nombres":"HERNANDEZ CAMPOS OSWALDO ENRIQUES",
        //               //                     "dependencia_labora":"DIV. DE INFORMATICA Y SISTEMAS",
        //               //                     "cargo_labora":"COORD. SISTEMAS Y BASES DE DATOS",
        //               //                     "cargo_codigo":"10000C",
        //               //                     "cargo_denominacion":"BACHILLER CONTRATADO",
        //               //                     "municipio_nombre":"SUCRE"
        //               //                  },
        //               //                  {
        //               //                     "persona_uid":"Eqz41mUb-HT4Z-Q2J0-LM6o-iciHokHBrGYt",
        //               //                     "persona_cedula":"11829328",
        //               //                     "apellidos_nombres":"HERNANDEZ CAMPOS OSWALDO ENRIQUES",
        //               //                     "dependencia_labora":"DIV. DE INFORMATICA Y SISTEMAS",
        //               //                     "cargo_labora":"COORD. SISTEMAS Y BASES DE DATOS",
        //               //                     "cargo_codigo":"20000C",
        //               //                     "cargo_denominacion":"TECNICO SUPERIOR UNIVERSI",
        //               //                     "municipio_nombre":"SUCRE"
        //               //                  }
        //               //               ];
                      
        //               // var mydata =  [
        //               //                {
        //               //                   "persona_uid":"wQvNVxKi-96FI-apTX-D72o-b4CJlrtdGGUq",
        //               //                   "persona_cedula":"12269509",
        //               //                   "apellidos_nombres":"FIGUEROA VALLENILLA YSABEL CRISITNA",
        //               //                   "dependencia_labora":"COORD. SISTEMA DE GESTION ESCOLAR",
        //               //                   "cargo_labora":"ANALISTA SGE",
        //               //                   "cargo_codigo":"8030C",
        //               //                   "cargo_denominacion":"ASEADOR CONTRATADO",
        //               //                   "municipio_nombre":"SUCRE"
        //               //                }
        //               //             ];


        //               if (response.length == 1 ) {
        //                 // console.log("es falso");
        //                 $("#txt_nombre_funcionario").val('no encontrado');
        //               }else{
                        
        //                 var data_func =  JSON.parse(response);
        //                 // console.log(typeof(data_func));
        //                 // console.log(data_func);
        //                 var tamanio = data_func.length;
        //                 // console.log(tamanio);  
        //                 // console.log(data_func); 
        //                 var nombre = data_func[0]['apellidos_nombres'];
        //                 $("#txt_nombre_funcionario").val(nombre);
        //                 if (tamanio>=1) {
        //                   //mostrar el cuadro de busqueda
        //                   $('#cuadro_busqueda_datos_laborales').show();
        //                   var $table2 = $('#table2').bootstrapTable('destroy' );
        //                   var $table2 = $('#table2').bootstrapTable( { data : data_func } );
        //                 }else{
        //                   //No es necesario mostrar el cuadro de busqueda
        //                   $('#cuadro_busqueda_datos_laborales').hide();
        //                 }

        //               }

        //           },
        //           error: function () {
        //               $modal.modal('hide');
        //               showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item error!', 'danger');
        //           }
        //       });
                
        //     }else{
        //       alert("Debe ingresar los datos");
        //     }
        //     console.log(accion);
        // });


        $('#btn_limpiar').click(function () {

            limpiar_form();
            
        });


        $modal.find('#btn_enviar_modal').click(function () {

            accion ='procesar_vacaciones';

            //console.log($(this).attr('id') + " --> " +  $(this).text());    

            var id_vacaciones = $("#txt_id_vacaciones").val();
            var periodo = $("#txt_id_vacaciones").val();

            var cedula = $("#txt_cedula_personal").val();
            if (cedula!='') {
              parametros = $("#form_ventana_modal").serialize() + '&id_vacaciones='+id_vacaciones+'&accion='+ accion  + '&'+sesionencode;
              
              console.log(parametros);
              
              API_URL =  "servicios/services.secretaria.vacaciones.php";
              $.ajax({
                  url: API_URL + ($modal.data('id') || ''),
                  type: 'POST',
                  //contentType: 'application/json',
                  //data: JSON.stringify(row),
                  data: parametros + "&token1="+rand_code(),
                  success: function (response) {
                      // $modal.modal('hide');
                      $modal.find('button[name="btn_enviar_modal"]').hide();
                      alert("Registro con éxito!");
                      showAlert('Registro con éxito!', 'success');
                      
                      $table.bootstrapTable('refresh');
                      console.log(response);
                      $modal.find('button[name="btn_imprimir"]').show();
                      
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


        $('#btn_imprimir').click(function () {
            window.open("vistas/pdf/formato_vacaciones.pdf", "Imprimir", "width=640,height=480");
        });


     });

    function limpiar_form(){
            accion ='limpiar_funcionario';
            
            console.log(accion);

            $('#cuadro_busqueda_datos_laborales').hide();
            $('#cuadro_datos_laborales').show();
            $('#cuadro_solicitud_vacaciones').show();

            $('#btn_imprimir').hide();
            // $modal.find('button[name="btn_imprimir"]').hide();

            $('#table2').bootstrapTable('destroy' );


            $("#txt_id_jefeinmediato").val(userced);    //txt_id_jefeinmediato
            $("#txt_id_vacaciones").val('');            //txt_id_vacaciones
            $("#txt_id_personal").val('');              //txt_id_personal
            $("#txt_cedula_personal").val('');          //txt_cedula_personal
            $("#txt_nombre_funcionario").val('');       //txt_nombre_funcionario

            
            $("#txt_tipo_personal").val('');            //txt_tipo_personal           
            $("#txt_id_cargo_funcional").val('');       //txt_id_cargo_funcional
            $("#txt_cargo_funcional").val('');          //
            $("#txt_municipio").val('');
            $("#txt_id_lugar_trabajo").val('');
            $("#txt_lugar_trabajo").val('');
            

            
            $("#txt_condicion_laboral").val('');
            $("#txt_fecha_ingreso_me").val('');
            $("#txt_periodo").val('');
            $("#txt_lapso_vacaciones").val('');
            $("#txt_tipo_vacaciones").val('');
            $("#txt_fecha_registro").val('');
            $("#txt_observacion").val('');
            $("#txt_observacion_estatus").val('');
            
            
    }


    function Cargar_Combo_Periodos(tipo_personal){
        // Limpiamos el contenido del select
        txt_periodo.empty();
        txt_periodo.append("<option value=''>Seleccione</option>");

        
        //cargar select PERIODOS
        // PERIODOS
        var accion = "consultar_periodos_filtro";
        var tipo_personal = '1'; // 1-administrativo 2-docente 3-obrero
        var tipo_usuario = 'director';
        $.ajax({

            type: "GET",
            url: "servicios/services.admin.periodos.php",
            data: "&accion=" + accion + "&tipo_personal=" + tipo_personal + "&tipo_usuario=" + tipo_usuario + "&token1="+rand_code(),
            success: function(response)
            {
              // console.log(response);
              var arreglo_tipos = JSON.parse(response);
              var tipos_periodo_estatus = ""
              var estado = 0;
              $.each(arreglo_tipos, function(i,item){
                    // console.log(item);
                    // console.log(item.estatus, item.periodo, item.id_tipovacaciones, item.nombre_tipo);
                  if (item.estatus==0) {
                      tipos_periodo_estatus = " - Inactivo";
                  }else{
                      tipos_periodo_estatus = " - Activo";
                  }
                   // if (item.periodo==2 && estado==0) {
                   //     estado=1;
                   //     txt_periodo.append("</optgroup>");
                   //     txt_periodo.append("<optgroup label='vacaciones Potestativos'>");
                   // }
                   // tipos_vacacionesS
                  txt_periodo.append("<option value='"+item.id_periodo+"' >" + item.nombre_periodo +  tipos_periodo_estatus + "</option>");
              })
              
            }
        });

    }


    function queryParams(params) {
        return {};
    }

    function NombrePersonal(value,row) {
      var nombre = row.persona_nombres;
      var apellido = row.persona_apellidos;
      var nombrecompleto = nombre + ' ' + apellido;
      return nombrecompleto;
    }

    
    function StatusPeriodo(value,row) {
      
      var f_desde = row.fecha_desde.split('-');  //"2016-04-11"
      var f_hasta = row.fecha_hasta.split('-');; //"2016-04-13"
      var f_periodo = f_desde[2]+"/"+f_desde[1]+"/"+f_desde[0]+ ' hasta ' + f_hasta[2]+"/"+f_hasta[1]+"/"+f_hasta[0];
      return f_periodo;
    }

    function FechaDesde(value,row) {
      
      var f_desde = row.fecha_desde.split('-');  //"2016-04-11"
      var f_hasta = row.fecha_hasta.split('-');; //"2016-04-13"
      var f_periodo = f_desde[2]+"/"+f_desde[1]+"/"+f_desde[0];
      return f_periodo;
    }

    function FechaHasta(value,row) {
      
      var f_desde = row.fecha_desde.split('-');  //"2016-04-11"
      var f_hasta = row.fecha_hasta.split('-');; //"2016-04-13"
      var f_periodo = f_hasta[2]+"/"+f_hasta[1]+"/"+f_hasta[0];
      return f_periodo;
    }


    function actionFormatter(value,row) {
      var icono0 = '<a class="process" href="javascript:" title="Procesar Vacaciones"><i class="glyphicon glyphicon-view glyphicon-cog"></i></a>'
      // var icono1 = '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-edit"></i></a>  '
      // var icono2 = ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-remove-circle"></i></a>'
      // console.log(icono)
        return [ icono0 ].join('');
        // '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-edit"></i></a>  ',
        //     ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-remove-circle"></i></a>',
    }

    // function actionFormatter2(value,row) {
    //   // glyphicon-ok-circle
    //   var icono1 = '<a class="seleccionar" href="javascript:" title="Seleccionar Registro"><i class="glyphicon glyphicon-green glyphicon glyphicon-ok-sign "></i></a>';
    //     return icono1;
    // }



    function StatusFormatter(value, row) {
        var icon = "";
        // console.log(row.estatus);
        if (row.estatus == 0 ) {
          icon = '<span class="pull-center badge bg-gray">Solic.</span>';
        } 
        if (row.estatus == 1 ) {
          icon = '<span class="pull-center badge bg-yellow">Pend.</span>';
        }
        if (row.estatus == 2 ) {
          icon = '<span class="pull-center badge bg-green">Aprob.</span>';
        }
        if (row.estatus == 3 ) {
          icon ='<span class="pull-center badge bg-red">Rech.</span>';
        }
        if (row.estatus == 4 ) {
          icon ='<span class="pull-center badge bg-blue">Autom.</span>';
        }

        // if (row.estatus == 1 ) {
        //   icon = '<span class="pull-center badge bg-green">Aprob</span>';
        // }else{
        //   icon ='<span class="pull-center badge bg-red">Rech.</span>';
        // }
        return icon;
    }

    
    function StatusPersonal(value, row) {
        var icon = "";
        //console.log(row.estatus);
        if (row.categoria_cargo_descripcion == 'ADMINISTRATIVO' ) {
          icon = '<span class="pull-center badge bg-green">Adm</span>';
        }
        if (row.categoria_cargo_descripcion == 'DOCENTE' ) {
          icon = '<span class="pull-center badge bg-blue">Doc</span>';
        }
        if (row.categoria_cargo_descripcion == 'OBRERO' ) {
          icon = '<span class="pull-center badge bg-yellow">Obr</span>';
        }
        return icon;
    }

    function StatusDependencia(value, row) {
        var icon = "";
        //console.log(row.estatus);
        if (row.departamento_persona.length>=35 ) {
          icon = row.departamento_persona.slice(0,22) + "...";
        }else{
          icon = row.departamento_persona;
        }
        return icon;
    }


    


    // update and delete events
    window.actionEvents = {
        'click .process': function (e, value, row) {
              accion='procesar_permisos'
              // console.log(row);
              // limpiar_form();
              showModal($(this).attr('title'), row);  
        }
       
    };

    // window.actionEvents2 = {
        
    //     'click .seleccionar': function (e, value, row) {
    //         accion='selecionar_funcionario';
    //         console.log(accion, row);

    //         // [
    //         //    {
    //         //       "empleado_dep_uid":"demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG",
    //         //       "persona_uid":"Eqz41mUb-HT4Z-Q2J0-LM6o-iciHokHBrGYt",
    //         //       "persona_cedula":"11829328",
    //         //       "apellidos_nombres":"HERNANDEZ CAMPOS OSWALDO ENRIQUES",
    //         //       "dependencia_labora":"DIV. DE INFORMATICA Y SISTEMAS",
    //         //       "cargo_labora":"COORD. SISTEMAS Y BASES DE DATOS",
    //         //       "categoria_cargo_descripcion":"ADMINISTRATIVO",
    //         //       "cargo_codigo":"10000C",
    //         //       "cargo_denominacion":"BACHILLER CONTRATADO",
    //         //       "municipio_nombre":"SUCRE"
    //         //    }
    //         // ]

    //         $("#txt_id_personal").val(row['empleado_dep_uid']);

    //         // ocultamos el cuadro de seleccion de cargo funcional 
    //         $('#cuadro_busqueda_datos_laborales').fadeOut(300);
    //         // mostramos los datos laborales seleccionados
    //         $('#cuadro_datos_laborales').fadeIn(300);
    //         // mostramos el formulario para ingresar los datos de vacaciones a solicitar
    //         $('#cuadro_solicitud_vacaciones').fadeIn(300);

    //         //  cargamos los valores en pantalla
    //         $("#txt_tipo_personal").val(row['categoria_cargo_descripcion']);
    //         $("#txt_id_cargo_funcional").val(row['empleado_dep_uid']);
    //         $("#txt_cargo_funcional").val(row['cargo_labora']);
    //         $("#txt_municipio").val(row['municipio_nombre']);
    //         $("#txt_id_lugar_trabajo").val(row['empleado_dep_uid']);
    //         $("#txt_lugar_trabajo").val(row['dependencia_labora']);

    //         //activamos el boton de enviar formulario
    //         $modal.find('button[name="btn_enviar_modal"]').show();

    //         Cargar_Combo_Periodos(row['categoria_cargo_descripcion'].toLowerCase());

    //         // $("#txt_id_jefeinmediato").val(userced);    //txt_id_jefeinmediato
    //         // $("#txt_id_vacaciones").val('');            //txt_id_vacaciones
    //         // $("#txt_id_personal").val('');              //txt_id_personal
    //         // $("#txt_cedula_personal").val('');          //txt_cedula_personal
    //         // $("#txt_nombre_funcionario").val('');       //txt_nombre_funcionario

            
    //         // $("#txt_tipo_personal").val('');            //txt_tipo_personal           
    //         // $("#txt_id_cargo_funcional").val('');       //txt_id_cargo_funcional
    //         // $("#txt_cargo_funcional").val('');          //
    //         // $("#txt_municipio").val('');
    //         // $("#txt_id_lugar_trabajo").val('');
    //         // $("#txt_lugar_trabajo").val('');
            

            
    //         // $("#txt_condicion_laboral").val('');
    //         // $("#txt_fecha_ingreso_me").val('');
    //         // $("#txt_periodo").val('');
    //         // $("#txt_lapso_vacaciones").val('');
    //         // $("#txt_tipo_vacaciones").val('');
    //         // $("#txt_fecha_registro").val('');
    //         // $("#ttxt_observacion").val('');

          
    //     }
    // };

    // 
    function showModal(title, row) {
        // console.log(title, row);
        // 
        // alert(row.toSource());
        // console.info(row.toSource());
         
        $('#txt_fecha_ingreso_me').prop('readonly', true);
        // $('#txt_periodo_registro').prop('readonly', true);
        $('#txt_fecha_registro').prop('readonly', true);

        // 
        // if (accion=='agregar_vacaciones') {
        //   //code
        //   // habilitamos los check - activo
        //   $("#txt_radio_estatus0").prop("checked" , true ) 
        //   $("#txt_radio_estatus0").prop('disabled', false);
        //   $("#txt_radio_estatus1").prop('disabled', true);
        //   $('#txt_fecha_registro').prop('readonly', true);
        //   //$modal.find('button[name="btn_enviar_modal"]').text("Modificar vacaciones");
        //   $modal.find('button[name="btn_enviar_modal"]').text("Agregar vacaciones");
        // }
        // 
        if (accion=='procesar_permisos') {
          // //code
          // // habilitamos los check - activo
          
          // $("#txt_radio_estatus0").prop('disabled', false);
          // $("#txt_radio_estatus1").prop('disabled', false);
          
          var estatus = row['estatus'];
          // alert(estatus);
          if (estatus=='0') {
            // $("#txt_estatus1").prop("checked" , true );
            $("#txt_estatus1").prop('disabled', false);
            $("#txt_estatus2").prop('disabled', true);
            $("#txt_estatus3").prop('disabled', false);
            
            $("#txt_observacion_estatus").prop("disabled", false);


            // $("#txt_observacion_estatus").prop("disabled", true);
            // $("#txt_lapso_vacaciones").prop("disabled", true);
            $("#txt_periodo").prop("disabled", true);
            $("#txt_condicion_laboral").prop("disabled", true);

            $("#txt_tipo_vacaciones").prop("disabled", true);
            $("#txt_fecha_registro").prop("disabled", true);



            $('#btn_imprimir').hide();
            $('#btn_enviar_modal').show();
          }


          // if (estatus=='1') {
          //   // $("#txt_estatus1").prop("checked" , true );
          //   $("#txt_estatus1").prop('disabled', true);
          //   $("#txt_estatus2").prop('disabled', true);
          //   $("#txt_estatus3").prop('disabled', true);


            
          //   $("#txt_observacion_estatus").prop("disabled", true);
          //   $("#txt_lapso_vacaciones").prop("disabled", true);

          //   $('#btn_imprimir').hide();
          //   $('#btn_enviar_modal').show();
          // }
          if (estatus=='1' || estatus=='2' || estatus=='3' || estatus=='4' ) {
            $("#txt_estatus1").prop('disabled', true);
            $("#txt_estatus2").prop('disabled', true);
            $("#txt_estatus3").prop('disabled', true);

            $("#txt_observacion_estatus").prop("disabled", true);
            $("#txt_lapso_vacaciones").prop("disabled", true);
            $("#txt_periodo").prop("disabled", true);
            $("#txt_condicion_laboral").prop("disabled", true);

            $("#txt_tipo_vacaciones").prop("disabled", true);
            $("#txt_fecha_registro").prop("disabled", true);

            // $("#txt_fecha_registro").prop("disabled", true);

            
            $('#btn_imprimir').show();
            $('#btn_enviar_modal').hide();
          }

          // Cargar_Combo_Periodos();

          //
          //  CAMBIAMOS EL TITULO DE LA VENTANA MODAL  
          $modal.find('.modal-title').text(title);
          // CAMBIAMOS EL NOMBRE EL TEXTO BOTON DE ENVIAR
          $modal.find('button[name="btn_enviar_modal"]').text("Procesar vacaciones");



          $("#txt_id_personal").val(row['empleado_dep_uid']);

          // // ocultamos el cuadro de seleccion de cargo funcional 
          // $('#cuadro_busqueda_datos_laborales').hide();
          // // mostramos los datos laborales seleccionados
          // $('#cuadro_datos_laborales').show();
          // // mostramos el formulario para ingresar los datos de vacaciones a solicitar
          // $('#cuadro_solicitud_vacaciones').fadeIn(300);


          // ( 
          //  {
          //    id_vacaciones:"10", 
          //    fecha_solicitud:"2016-07-27", 
          //    id_funcionario:"demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG",
          //    tipo_personal:"ADMINISTRATIVO", 
          //    cargo_funcional:"COORD. SISTEMAS Y BASES DE DATOS", 
          //    
          //    numero_dias:null, 
          //    
          //    fecha_desde:"2016-07-26", 
          //    fecha_hasta:"2016-07-29", 
          //    id_periodo:"1", 
          //    nombre_periodo:"PERIODO ESCOLAR 2015-2016", 
          //    
          //    fecha_retorno:"2016-07-29", 
          //    observacion:"bb", 
          //    
          //    id_jefeinmediato:"yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq", 
          //    id_jefepersonal:"yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq", 
          //    
          //    id_municipio:"SUCRE", 
          //    id_dependencialaboral:"demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG", 
          //    tipo_vacaciones:"1", 
          //    estatus:"1", 
          //    condicion_laboral:"2", 
          //    
          //    cedula_persona:"11829328", 
          //    apellidos_nombres:"HERNANDEZ CAMPOS OSWALDO ENRIQUES", 
          //    
          //    id_departamento_persona:"sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT", 
          //    departamento_persona:"DIV. DE INFORMATICA Y SISTEMAS", 
          //    
          //    cargo_persona:"COORD. SISTEMAS Y BASES DE DATOS", 
          //    categoria_cargo_descripcion:"ADMINISTRATIVO", 
          //    cargo_codigo:"10000C", 
          //    cargo_denominacion:"BACHILLER CONTRATADO", 
          //    
          //    municipio_nombre:"SUCRE", 
          //    
          //    cedula_persona2:"12659282", 
          //    apellidos_nombres2:"CASTILLO BRAVO KLEITZER JESUS", 
          //    nombre_persona2:"CASTILLO BRAVO", 
          //    apellido_persona2:"KLEITZER JESUS", 
          //    departamento_persona2:"COORD. ZONAL DE INFORMATICA EDUCATIVA", 
          //    cargo_persona2:"COORDINADOR ZONAL", 
          //    categoria_cargo_descripcion2:"ADMINISTRATIVO", 
          //    cargo_codigo2:"10000C", 
          //    cargo_denominacion2:"BACHILLER CONTRATADO", 
          //    municipio_nombre2:"SUCRE", 
          //    separador:"---"
          //   }
          //  )
          //            
          
          // Cargar_Combo_Periodos(row['tipo_personal'].toLowerCase());
          
          //  cargamos los valores en pantalla
          //  
          var fechareg =  row['fecha_solicitud'].split('-');
          var ani_reg = fechareg[0];
          var mes_reg = fechareg[1];
          var dia_reg = fechareg[2];
          var freg = dia_reg + '/' + mes_reg + '/' + ani_reg;

          //  
          var fechaini =  row['fecha_desde'].split('-');
          var ani_ini = fechaini[0];
          var mes_ini = fechaini[1];
          var dia_ini = fechaini[2];
          var fini = dia_ini + '/' + mes_ini + '/' + ani_ini;


          var fechafin =  row['fecha_hasta'].split('-');
          var ani_fin = fechafin[0];
          var mes_fin = fechafin[1];
          var dia_fin = fechafin[2];
          var ffin = dia_fin + '/' + mes_fin + '/' + ani_fin;

          var fecha_periodo = fini + ' - ' + ffin;


          // $("#txt_id_jefeinmediato").val(userced);    //txt_id_jefeinmediato
          $("#txt_id_vacaciones").val(row['id_vacaciones']);            //txt_id_vacaciones
          $("#txt_id_personal").val(row['id_funcionario']);              //txt_id_personal
          $("#txt_cedula_personal").val(row['cedula_persona']);          //txt_cedula_personal
          $("#txt_nombre_funcionario").val(row['apellidos_nombres']);       //txt_nombre_funcionario

          
          $("#txt_tipo_personal").val(row['tipo_personal']);            //txt_tipo_personal           
          // $("#txt_id_cargo_funcional").val(row['valor']);       //txt_id_cargo_funcional
          $("#txt_cargo_funcional").val(row['cargo_persona']);          //
          $("#txt_municipio").val(row['municipio_nombre']);
          $("#txt_id_lugar_trabajo").val(row['id_departamento_persona']);
          $("#txt_lugar_trabajo").val(row['departamento_persona']);
          

          
          $("#txt_condicion_laboral").val(row['condicion_laboral']);
          $("#txt_fecha_ingreso_me").val(row['fecha_ingreso_me']);
          // alert(row['id_periodo']);
          $("#txt_periodo").val(row['id_periodo']);
          $("#txt_lapso_vacaciones").val(fecha_periodo);
          $("#txt_tipo_vacaciones").val(row['tipo_vacaciones']);
          $("#txt_fecha_registro").val(freg);
          // estatus_observacion
          $("#txt_observacion").val(row['observacion']);
          $("#txt_observacion_estatus").val(row['estatus_observacion']);
          
          

          // $("#txt_tipo_personal").val(row['categoria_cargo_descripcion']);
          // $("#txt_id_cargo_funcional").val(row['empleado_dep_uid']);
          // $("#txt_cargo_funcional").val(row['cargo_labora']);
          // $("#txt_municipio").val(row['municipio_nombre']);
          // $("#txt_id_lugar_trabajo").val(row['empleado_dep_uid']);
          // $("#txt_lugar_trabajo").val(row['dependencia_labora']);

          // //activamos el boton de enviar formulario
          // $modal.find('button[name="btn_enviar_modal"]').show();

         

          
        



          // // SE CORRIGE LA FECHA ADECUADA AL DATERANGEPICKER
          // var fechareg =  row['fecha_registro'].split('-');
          // var ani_reg = fechareg[0];
          // var mes_reg = fechareg[1];
          // var dia_reg = fechareg[2];
          // var freg = dia_reg + '/' + mes_reg + '/' + ani_reg;
          // // LLENAMOS CADA INPUT CON LOS DATOS DE LA TABLA
          // $modal.find('input[name="txt_id_vacaciones"]').val(row['id_tipovacaciones']);
          // $("#txt_tipo_personal").val(row['id_tipo_personal']);
          // $("#txt_periodo").val(row['periodo']);
          // $modal.find('input[name="txt_nombre_vacaciones"]').val(row['nombre_tipo']);
          // $modal.find('input[name="txt_dias_vacaciones"]').val(row['numero_dias']);
          // $modal.find('input[name="txt_reglas_legal"]').val(row['reglas_legal']);
          // $modal.find('input[name="txt_recaudos"]').val(row['recaudos']);
          // $modal.find('input[name="txt_fecha_registro"]').val(freg);           
          
          // 
          // // CAMBIAMOS EL INPUT RADIO DE ESTATUS
          if (row['estatus']=='0'){
            $("#txt_estatus1" ).prop("checked" , true )  
          }
          if (row['estatus']=='1'){
            $("#txt_estatus1" ).prop("checked" , true )  
          }
          if (row['estatus']=='2'){
            $("#txt_estatus2" ).prop("checked" , true )
          }
          if (row['estatus']=='3'){
            $("#txt_estatus3" ).prop("checked" , true )
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

