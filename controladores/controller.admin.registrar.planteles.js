    console.log("javascript - root registrar planteles");

    //var API_URL_periodos =  "servicios/services.periodos.php?accion=consultar_registros";
    var API_URL_planteles =  "servicios/services.admin.planteles.php?accion=consultar_registros";
    var API_URL =  "servicios/services.admin.planteles.php";
    var $table = $('#table').bootstrapTable({url: API_URL_planteles});
    
    $modal = $('#modal_registros').modal({show: false});

    $modal_asignar_autoridades = $('#ventana_modal_asignar_autoridades').modal({show: false});


    var permite_eliminar = false;    
    var username = $('#user_name').attr('oculto');
    var userced = $('#user_name').attr('ocultoced');
    var sesionencode = $('#user_name').attr('sesionencode');
    var usernombre = $('#name_user').html();
    var cargouser = $('#cargo_user').html();
    var dptouser = $('#departamento_user').html();
    var userestatus = $('#estatus_loading').attr('estatus');

    var cantdependencias = $('#user_name').attr('cantdependencias');

    
    
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

        

        //$modal.find('#btn_crear_registro').click(function ()  {
        //
        //});
        $('#btn_crear_registro').click(function () {
            accion ='agregar_registros';
            console.log(accion)
            showModal('PLANTELES: Nuevo Registro');
            $modal.modal('show');
            // // marcamos el check de inactivo
            // $("#txt_radio_estatus0" ).prop("checked" , true );
            // // desabilitamos el check de activo
            // $("#txt_radio_estatus1").prop('disabled', true);
            // // cambiamos el texto del boton enviar
            // $modal.find('button[name="btn_enviar_periodo"]').text("Agregar Plantel");
            
            
            // $modal.find('input[name="txt_codigo_periodo"]').val('');
            // $modal.find('input[name="txt_nombre_periodo"]').val('');
            // $modal.find('input[name="txt_rango_fecha"]').val('');
            // $modal.find('input[name="txt_fecha_inicio"]').val('');
            // $modal.find('input[name="txt_fecha_cierre"]').val('');

            // $modal.find('input[name="txt_fecha_recaudo"]').val('');
            // $modal.find('input[name="txt_fecha_recaudo_inicio"]').val('');
            // $modal.find('input[name="txt_fecha_recaudo_cierre"]').val('');

            //console.log(accion);
        });



        $('#btn_buscar').click(function () {
            accion ='consultar_funcionarios';
            var cedula = $("#txt_cedula_personal").val();
            console.log(cedula);
            // // $('#cuadro_busqueda_datos_laborales').show();
            // // var cedula = $("#txt_cedula_personal").val();
            if (cedula!='') {
              parametros =  'cedula='+cedula+'&accion='+ accion  + '&'+sesionencode;
              console.log(parametros);
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

        
        $modal.find('#btn_enviar_periodo').click(function () {
            //console.log($(this).attr('id') + " --> " +  $(this).text());    
            var row = {};
            var rowid = {}
            $modal.find('input[id]').each(function () {
              row[$(this).attr('name')] = $(this).val();
              rowid[$(this).attr('id')] = $(this).val();
            });
            
            row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
            row['accion'] ="agregar_registros"
            
            // console.log(row);
            
            var nombre_periodo = $modal.find('input[name="txt_nombre_periodo"]').val();
            var rango_fecha = $modal.find('input[name="txt_rango_fecha"]').val();
            
            if (nombre_periodo!='' && rango_fecha!= '') {
              parametros = $("#form_modal_registros").serialize() + '&accion='+ accion;
              API_URL =  "servicios/services.admin.planteles.php";
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
        return [
            '<div class="btn-group">',
            '  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">',
            '    Seleccione <span class="caret"></span>',
            '  </button>',
            '  <ul class="dropdown-menu pull-right" role="menu">',
            // '    <li><a class="view" href="javascript:" title="Ver Registro"><i class="glyphicon glyphicon-view glyphicon-eye-open"></i>Ver Registro</a></li>',
            '    <li><a class="update" href="javascript:" title="Editar Registro"><i class="glyphicon glyphicon-warning glyphicon-edit"></i>Modificar Registro</a></li>',
            // '    <li><a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-error glyphicon-remove-circle"></i>Eliminar Registro</a></li>',
            
            '    <li><a class="add_autoridades" href="javascript:" title="Asignar Autoridades"><i class="glyphicon glyphicon-green glyphicon glyphicon-user "></i>Asignar Autoridades</a></li>',


            '  </ul>',
            '</div>'
        ].join('');
    }
    
    function actionFormatter_222(value,row) {
        return [
            '<div class="btn-group">',
            '  <button type="button" class="btn btn-default">Action</button>',
            '  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">',
            '    <span class="caret"></span>',
            '    <span class="sr-only">Toggle Dropdown</span>',
            '  </button>',
            '  <ul class="dropdown-menu" role="menu">',
            '    <li><a href="#">Action</a></li>',
            '    <li><a href="#">Another action</a></li>',
            '    <li><a href="#">Something else here</a></li>',
            '    <li class="divider"></li>',
            '    <li><a href="#">Separated link</a></li>',
            '  </ul>',
            '</div>'
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
            accion='ver_registro'
            // console.log(row);
            // console.log($(this).attr('title'));
            showModal($(this).attr('title'), row);  
        },
        'click .update': function (e, value, row) {
            accion='modificar_registro'
            //console.log(row);
            // console.log($(this).attr('title'));
            showModal($(this).attr('title'), row);  
        },


        'click .add_autoridades': function (e, value, row) {
            accion='add_autoridades'
            // console.log(e);
            // console.log(value);
            // console.log(row);
            // console.log($(this).attr('title'));
            // alert($(this).attr('title'));
            // showAlert($(this).attr('title'), 'success');
            // showModal($(this).attr('title'), row);
            // plan_codigodea: "OD04691901", 
            // plan_codestadistico: "190018", 
            // plan_codnomina: "123456", 
            // plan_codnominadep: "", 
            // plan_nombre: "U E BOLIVARIANA RIO GRANDE",
            // 
            
            
            
            $('#cuadro_busqueda_datos_laborales').hide();
            var $table2 = $('#table2').bootstrapTable('destroy' );
            // var $table2 = $('#table2').bootstrapTable( { data : data_func } );


            // 
            title_plan_nombre = $(this).attr('title') + ' - ' + row['plan_nombre'] + ' [' + row['plan_codigodea'] + ']';  

            // LIMPIAR CAMPOS DE FORMULARIO AL ABRIR LA MODAL
            $modal_asignar_autoridades.find('input[name="txt_id_plantel"]').val('');
            $modal_asignar_autoridades.find('input[name="txt_id_periodo"]').val('');
            $modal_asignar_autoridades.find('input[name="txt_id_personal"]').val('');
            $modal_asignar_autoridades.find('input[name="txt_cedula_personal"]').val('');
            $modal_asignar_autoridades.find('input[name="txt_nombre_funcionario"]').val('');

            $modal_asignar_autoridades.find('input[name="txt_id_plantel"]').val(row['plan_uid']);

            $modal_asignar_autoridades.find('.modal-title').text(title_plan_nombre);


            
            
          
            



            

            $("#btn_enviar_modal").attr('disabled', true);
            // $("#btn_enviar_modal").hide();


            showModalName($modal_asignar_autoridades,$(this).attr('title'), row);
              
        },

        'click .remove': function (e, value, row) {
            // console.log($(this).attr('title'));
            accion='eliminar_registro'
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

    window.actionEvents2 = {
        
        'click .seleccionar': function (e, value, row) {
            accion='selecionar_funcionario';
            console.log(accion, row);

            // // [
           // { 
           // empleado_dep_uid: "demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG", 
           // persona_uid: "Eqz41mUb-HT4Z-Q2J0-LM6o-iciHokHBrGYt", 
           // persona_cedula: "11829328", 
           // apellidos_nombres: "HERNANDEZ CAMPOS OSWALDO ENRIQUES", 
           // dependencia_labora: "DIV. DE INFORMATICA Y SISTEMAS", 
           // cargo_labora: "COORD. SISTEMAS Y BASES DE DATOS", 
           // categoria_cargo_descripcion: "ADMINISTRATIVO", 
           // cargo_codigo: "10000C", 
           // cargo_denominacion: "BACHILLER CONTRATADO", 
           // horas_laboradas: "0/0",
           // empleado_fechaingreso:"2011-01-01" 
           // municipio_nombre":"SUCRE" 
           // }
            // // ]


            // $("#txt_id_personal").val(row['empleado_dep_uid']);

            // ocultamos el cuadro de seleccion de cargo funcional 
            $('#cuadro_busqueda_datos_laborales').fadeOut(300);
            // mostramos los datos laborales seleccionados
            // $('#cuadro_datos_laborales').fadeIn(300);
            // // mostramos el formulario para ingresar los datos de permisos a solicitar
            // $('#cuadro_solicitud_permiso').fadeIn(300);

            // //  cargamos los valores en pantalla
            // $("#txt_tipo_personal").val(row['categoria_cargo_descripcion']);
            // $("#txt_id_cargo_funcional").val(row['empleado_dep_uid']);
            // $("#txt_cargo_funcional").val(row['cargo_labora']);
            // $("#txt_municipio").val(row['municipio_nombre']);
            // $("#txt_id_lugar_trabajo").val(row['empleado_dep_uid']);
            // $("#txt_lugar_trabajo").val(row['dependencia_labora']);

            // //activamos el boton de enviar formulario
            // $modal.find('button[name="btn_enviar_modal"]').show();

            // Cargar_Combo_Permisos(row['categoria_cargo_descripcion'].toLowerCase());

          
        }
    };


    function showModalName(ventana,title, row) {
      // body...
      console.log(accion);
      console.log(ventana);
      console.log(title);
      console.log(row);

      // if (accion=='agregar_registros') {
      //   $modal.find('button[name="btn_enviar_periodo"]').text("Modificar Plantel");
      // }
      ventana.modal('show');
    }
    //
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
        // console.log("row. " + row.id_periodo, accion);
        console.log(accion);
        if (accion=='agregar_registros') {
          //code
          // habilitamos los check - activo
          $modal.find('.modal-title').text(title);
          $("#txt_radio_estatus0").prop("checked" , true ) 
          $("#txt_radio_estatus0").prop('disabled', false);
          $("#txt_radio_estatus1").prop('disabled', true);
          //$modal.find('button[name="btn_enviar_periodo"]').text("Modificar Plantel");
          $modal.find('button[name="btn_enviar_periodo"]').text("Agregar Plantel");
        }

        if (accion=='ver_registro') {
          // //code
          // // habilitamos los check - activo
          // $("#txt_radio_estatus0").prop('disabled', true);
          // $("#txt_radio_estatus1").prop('disabled', true);

          // $("#txt_nombre_periodo").attr('disabled', true);
          // $("#txt_fecha_recaudo").attr('disabled', true);
          // $("#txt_rango_fecha").attr('disabled', true);
          
          // $("#btn_enviar_periodo").attr('disabled', true);
          // $("#btn_enviar_periodo").hide();


          // // fecha periodo
          // var fechaini =  row['fecha_inicio'].split('-');
          // var fechafin =  row['fecha_cierre'].split('-');
          
          // var ani_ini = fechaini[0];
          // var mes_ini = fechaini[1];
          // var dia_ini = fechaini[2];
          
          // var ani_fin = fechafin[0];
          // var mes_fin = fechafin[1];
          // var dia_fin = fechafin[2];
          
          // var fini = mes_ini + '/' + dia_ini + '/' + ani_ini;
          // var ffin = mes_fin + '/' + dia_fin + '/' + ani_fin;
          // var rango =  fini + ' - ' + ffin;

          // // fecha recaudos
          // var fechaini_reca =  row['fecha_recaudo_ini'].split('-');
          // var fechafin_reca =  row['fecha_recaudo_fin'].split('-');
          
          // var ani_ini_reca = fechaini_reca[0];
          // var mes_ini_reca = fechaini_reca[1];
          // var dia_ini_reca = fechaini_reca[2];
          
          // var ani_fin_reca = fechafin_reca[0];
          // var mes_fin_reca = fechafin_reca[1];
          // var dia_fin_reca = fechafin_reca[2];
          
          // var fini_reca  = mes_ini_reca + '/' + dia_ini_reca + '/' + ani_ini_reca;
          // var ffin_reca  = mes_fin_reca + '/' + dia_fin_reca + '/' + ani_fin_reca;
          // var rango_reca = fini_reca    +' - '+ ffin_reca;

          // // console.log(rango);
          // // console.log(rango_reca);

          // $modal.find('.modal-title').text(title);
          // $modal.find('input[name="txt_codigo_periodo"]').val(row['id_periodo']);
          // $modal.find('input[name="txt_nombre_periodo"]').val(row['nombre_periodo']);
          
          // $modal.find('input[name="txt_rango_fecha"]').val(rango );
          // $modal.find('input[name="txt_fecha_inicio"]').val(ani_ini + '/' + mes_ini + '/' + dia_ini );
          // $modal.find('input[name="txt_fecha_cierre"]').val(ani_fin + '/' + mes_fin + '/' + dia_fin );

          // $modal.find('input[name="txt_fecha_recaudo"]').val(rango_reca);
          // $modal.find('input[name="txt_fecha_recaudo_inicio"]').val(ani_ini_reca + '/' + mes_ini_reca + '/' + dia_ini_reca );
          // $modal.find('input[name="txt_fecha_recaudo_cierre"]').val(ani_fin_reca + '/' + mes_fin_reca + '/' + dia_fin_reca );
          // if (row['estatus']==0){
          //   $("#txt_radio_estatus0" ).prop("checked" , true )  
          // }else{
          //   $("#txt_radio_estatus1" ).prop("checked" , true )
          // }

          $modal.find('button[name="btn_enviar_periodo"]').text("Ver Plantel");
          
        }

        if (accion=='modificar_registro' ) {
          // //code
          // // habilitamos los check - activo
          // $("#txt_radio_estatus0").prop('disabled', false);
          // $("#txt_radio_estatus1").prop('disabled', false);

          // $("#txt_nombre_periodo").attr('disabled', false);
          // $("#txt_fecha_recaudo").attr('disabled', false);
          // $("#txt_rango_fecha").attr('disabled', false);
          
          // $("#btn_enviar_periodo").attr('disabled', false);
          // $("#btn_enviar_periodo").show();

          
          // // fecha periodo
          // var fechaini =  row['fecha_inicio'].split('-');
          // var fechafin =  row['fecha_cierre'].split('-');
          
          // var ani_ini = fechaini[0];
          // var mes_ini = fechaini[1];
          // var dia_ini = fechaini[2];
          
          // var ani_fin = fechafin[0];
          // var mes_fin = fechafin[1];
          // var dia_fin = fechafin[2];
          
          // var fini = mes_ini + '/' + dia_ini + '/' + ani_ini;
          // var ffin = mes_fin + '/' + dia_fin + '/' + ani_fin;
          // var rango =  fini + ' - ' + ffin;

          // // fecha recaudos
          // var fechaini_reca =  row['fecha_recaudo_ini'].split('-');
          // var fechafin_reca =  row['fecha_recaudo_fin'].split('-');
          
          // var ani_ini_reca = fechaini_reca[0];
          // var mes_ini_reca = fechaini_reca[1];
          // var dia_ini_reca = fechaini_reca[2];
          
          // var ani_fin_reca = fechafin_reca[0];
          // var mes_fin_reca = fechafin_reca[1];
          // var dia_fin_reca = fechafin_reca[2];
          
          // var fini_reca  = mes_ini_reca + '/' + dia_ini_reca + '/' + ani_ini_reca;
          // var ffin_reca  = mes_fin_reca + '/' + dia_fin_reca + '/' + ani_fin_reca;
          // var rango_reca = fini_reca    +' - '+ ffin_reca;

          // // console.log(rango);
          // // console.log(rango_reca);

          // $modal.find('.modal-title').text(title);
          // $modal.find('input[name="txt_codigo_periodo"]').val(row['id_periodo']);
          // $modal.find('input[name="txt_nombre_periodo"]').val(row['nombre_periodo']);
          
          // $modal.find('input[name="txt_rango_fecha"]').val(rango );
          // $modal.find('input[name="txt_fecha_inicio"]').val(ani_ini + '/' + mes_ini + '/' + dia_ini );
          // $modal.find('input[name="txt_fecha_cierre"]').val(ani_fin + '/' + mes_fin + '/' + dia_fin );

          // $modal.find('input[name="txt_fecha_recaudo"]').val(rango_reca);
          // $modal.find('input[name="txt_fecha_recaudo_inicio"]').val(ani_ini_reca + '/' + mes_ini_reca + '/' + dia_ini_reca );
          // $modal.find('input[name="txt_fecha_recaudo_cierre"]').val(ani_fin_reca + '/' + mes_fin_reca + '/' + dia_fin_reca );
          // if (row['estatus']==0){
          //   $("#txt_radio_estatus0" ).prop("checked" , true )  
          // }else{
          //   $("#txt_radio_estatus1" ).prop("checked" , true )
          // }
          
          $modal.find('button[name="btn_enviar_periodo"]').text("Modificar Plantel");
          
        }
        
        $modal.modal('show');
    }

    function showAlert(title, type) {
        $alert.attr('class', 'alert alert-' + type || 'success')
              .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
        setTimeout(function () {
            $alert.hide();
        }, 5000);
    }