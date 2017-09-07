console.log("javascript - admin tipos de permisos");


    var permite_eliminar = false;    
    var username = $('#user_name').attr('oculto');
    var userced = $('#user_name').attr('ocultoced');
    var sesionencode = $('#user_name').attr('sesionencode');
    var usernombre = $('#name_user').html();
    var cargouser = $('#cargo_user').html();
    var dptouser = $('#departamento_user').html();
    var userestatus = $('#estatus_loading').attr('estatus');

    var cantdependencias = $('#user_name').attr('cantdependencias');
    

    // var txt_tipo_permiso       = $("#txt_tipo_permiso");
  
    // $modal = $('#ventana_modal').modal({show: false});
    
    $alert = $('.alert').hide();

    // $cuadro_busqueda_datos_laborales = $('#cuadro_busqueda_datos_laborales').hide();
    // $cuadro_datos_laborales = $('#cuadro_datos_laborales').hide();
    // $cuadro_solicitud_permiso = $('#cuadro_de_resultados').hide();

    var accion="";
    
    // console.log(fecha_actual2());
    // 
    // console.log(randomstring(20));

    // console.log(sumaFecha(3,fecha_actual()));
    
     $(function () {


         $('#calendar').fullCalendar({
                // put your options and callbacks here
            locale: 'es',
            dayClick: function() {
                alert('a day has been clicked!');
            },
            String, default: 'timezone',
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            buttonText: {
                today: 'Hoy',
                month: 'Mes',
                week: 'Semana',
                day: 'Día',
                year: 'Año'
            },

            events: [
                {
                    title  : 'event1',
                    start  : '2016-09-15'
                },
                {
                    title  : 'event2',
                    start  : '2016-09-19',
                    end    : '2016-09-21'
                },
                {
                    title  : 'event3',
                    start  : '2016-09-23T12:30:00',
                    allDay : false // will make the time show
                }
            ]

            //Random default events
            // events: [
            //     {
            //       title: 'All Day Event',
            //       start: new Date(y, m, 1),
            //       backgroundColor: "#f56954", //red
            //       borderColor: "#f56954" //red
            //     },
            //     {
            //       title: 'Long Event',
            //       start: new Date(y, m, d - 5),
            //       end: new Date(y, m, d - 2),
            //       backgroundColor: "#f39c12", //yellow
            //       borderColor: "#f39c12" //yellow
            //     },
            //     {
            //       title: 'Meeting',
            //       start: new Date(y, m, d, 10, 30),
            //       allDay: false,
            //       backgroundColor: "#0073b7", //Blue
            //       borderColor: "#0073b7" //Blue
            //     },
            //     {
            //       title: 'Lunch',
            //       start: new Date(y, m, d, 12, 0),
            //       end: new Date(y, m, d, 14, 0),
            //       allDay: false,
            //       backgroundColor: "#00c0ef", //Info (aqua)
            //       borderColor: "#00c0ef" //Info (aqua)
            //     },
            //     {
            //       title: 'Birthday Party',
            //       start: new Date(y, m, d + 1, 19, 0),
            //       end: new Date(y, m, d + 1, 22, 30),
            //       allDay: false,
            //       backgroundColor: "#00a65a", //Success (green)
            //       borderColor: "#00a65a" //Success (green)
            //     },
            //     {
            //       title: 'Click for Google',
            //       start: new Date(y, m, 28),
            //       end: new Date(y, m, 29),
            //       url: 'http://google.com/',
            //       backgroundColor: "#3c8dbc", //Primary (light-blue)
            //       borderColor: "#3c8dbc" //Primary (light-blue)
            //     }
            //   ],
            //   editable: true,
            //   droppable: true
            // }
        })



        $('#btn_buscar').click(function () {

            accion ='consultar_funcionarios';

            var cedula = $("#txt_cedula_personal").val();
            // console.log(cedula);
            if (cedula!='') {
              parametros =  'cedula='+cedula+'&accion='+ accion  + '&'+sesionencode;
              // console.log(parametros);
              API_URL =  "servicios/services.funcionarios.php";
              $.ajax({
                  url: API_URL ,
                  type: 'POST',
                  //contentType: 'application/json',
                  //data: JSON.stringify(row),
                  data: parametros + "&token1="+rand_code(),
                  success: function (response) {

                      if (response.length == 1 ) {
                        // console.log("es falso");
                        $("#txt_nombre_funcionario").val('no encontrado');
                      }else{
                        
                        var data_func =  JSON.parse(response);
                        var tamanio = data_func.length;
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
                        $('#btn_buscar').hide();

                      }
                       
                      
                  },
                  error: function () {
                      showAlert('Process' + ' item error!', 'danger');
                  }
              });
                
            }else{
              alert("Debe ingresar los datos");
            }
            console.log(accion);
        });

        // *********************************************************
        // *********************************************************
        $('#btn_limpiar').click(function () {
            accion ='limpiar_funcionario';
            
            console.log(accion);

            $('#cuadro_busqueda_datos_laborales').fadeOut(300);
            $('#cuadro_datos_laborales').fadeOut(300);
            $('#cuadro_de_resultados').fadeOut(300);

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
            
            // $("#txt_tipo_permiso").val('');
            // $("#txt_motivo_permiso").val('');
            // $("#txt_cantidad_dias").val('');
            // $("#txt_periodo_registro").val('');
            // $("#txt_cantidad_dias").val('');
            // $("#txt_fecha_registro").val('');
            // $("#id_tipopermiso").val('');

            $('#btn_buscar').fadeIn(300);
            
        });




        // $modal.find('#btn_enviar_modal').click(function () {

            // accion ='agregar_permisos';

            // //console.log($(this).attr('id') + " --> " +  $(this).text());    
            // // var row = {};
            // // var rowid = {}
            // // $modal.find('input[id]').each(function () {
            // //   row[$(this).attr('name')] = $(this).val();
            // //   rowid[$(this).attr('id')] = $(this).val();
            // // });
            // // $modal.find('input[id]').each(function () {
            // //   row[$(this).attr('name')] = $(this).val();
            // //   rowid[$(this).attr('id')] = $(this).val();
            // // });
            // var id_permiso = $("#txt_id_permiso").val();
            // var tipo_permiso = $("#txt_id_permiso").val();
            // // row['txt_radio_estatus'] = $('input:radio[name=txt_radio_estatus]:checked').val();
            // // row['accion'] ="agregar_permisos"
            // // console.log(row);
            
            // // Object { 
            // //           txt_nombre_permiso: "bre", 
            // //           txt_dias_permiso: "dias", 
            // //           txt_reglas_legal: "base", 
            // //           txt_fecha_registro: "04/14/2016", 
            // //           txt_radio_estatus: "", 
            // //           accion: "agregar_permisos" 
            // //         }

            // var cedula = $("#txt_cedula_personal").val();
            // if (cedula!='') {
            //   parametros = $("#form_ventana_modal").serialize() + '&id_permiso='+id_permiso+'&accion='+ accion  + '&'+sesionencode;
              
            //   console.log(parametros);
              
            //   API_URL =  "servicios/services.secretaria.permisos.php";
            //   $.ajax({
            //       url: API_URL + ($modal.data('id') || ''),
            //       type: 'POST',
            //       //contentType: 'application/json',
            //       //data: JSON.stringify(row),
            //       data: parametros + "&token1="+rand_code(),
            //       success: function (response) {
            //           $modal.modal('hide');
            //           showAlert('Registro con éxito!', 'success');
            //           $table.bootstrapTable('refresh');
            //           console.log(response);
            //           //console.log(data);
            //           //showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item successful!', 'success');
            //           //var result = append(data).html();
            //           //$('#showresults').html(result);
            //       },
            //       error: function () {
            //           $modal.modal('hide');
            //           showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item error!', 'danger');
            //       }
            //   });
                
            // }else{
            //   alert("Debe ingresar los datos");
            // }
            
            // //for (var name in row) {
            //   //console.log('input[name="' + name + '"]').val(row[name]);
            // //  $modal.find('input[name="' + name + '"]').val(row[name]);
            // //}
            
        // });




     });



    // function Cargar_Combo_Permisos(tipo_personal){
    //     // Limpiamos el contenido del select tipos de permisos
    //     txt_tipo_permiso.empty();
    //     txt_tipo_permiso.append("<option value=''>Seleccione</option>");
    //     txt_tipo_permiso.append("<optgroup label='Permisos Obligatorios'>");
        
    //     //cargar select PERIODOS
    //     // PERIODOS
    //     var accion = "consultar_tipopermisos_filtro";
    //     // var tipo_personal = '1'; // 1-administrativo 2-docente 3-obrero
    //     var tipo_usuario = 'director';
    //     $.ajax({

    //         type: "GET",
    //         url: "servicios/services.admin.tipopermisos.php",
    //         data: "&accion=" + accion + "&tipo_personal=" + tipo_personal + "&tipo_usuario=" + tipo_usuario + "&token1="+rand_code(),
    //         success: function(response)
    //         {
    //           // console.log(response);
    //           var arreglo_tipos_permisos = JSON.parse(response);
    //           var tipos_permisos_estatus = ""
    //           var estado = 0;
    //           $.each(arreglo_tipos_permisos, function(i,item){
    //                 // Object { 
    //                 //           id_tipopermiso: "101", 
    //                 //           tipo_permiso: "1", 
    //                 //           tipo_permiso_txt: "Obligatorio", 
    //                 //           nombre_tipo: "Matrimonio", 
    //                 //           numero_dias: "8H", 
    //                 //           reglas_legal: "POR MATRIMONIO, SEGÚN CLÁUSULA 72 D…", 
    //                 //           recaudos: "COPIA DE CÉDULA DE IDENTIDAD LEGIBL…", 
    //                 //           id_tipo_personal: "1", 
    //                 //           id_tipo_personal_txt: "Administrativo", 
    //                 //           fecha_registro: "2016-07-01",
    //                 //           estatus: "1"
    //                 //          } 
    //                 // console.log(item);
    //                 // console.log(item.estatus, item.tipo_permiso, item.id_tipopermiso, item.nombre_tipo);
    //               if (item.estatus==0) {
    //                   tipos_permisos_estatus = " - Inactivo";
    //               }else{
    //                   tipos_permisos_estatus = " - Activo";
    //               }
    //                if (item.tipo_permiso==2 && estado==0) {
    //                    estado=1;
    //                    txt_tipo_permiso.append("</optgroup>");
    //                    txt_tipo_permiso.append("<optgroup label='Permisos Potestativos'>");
    //                }
    //                // tipos_permisosS
    //               txt_tipo_permiso.append("<option value='"+item.id_tipopermiso+"' >" + item.nombre_tipo + " (Días: " + item.numero_dias + " )" + "</option>");
    //           })
    //           txt_tipo_permiso.append("</optgroup>");
    //         }
    //     });



    // }


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
      var f_periodo = f_desde[2]+"/"+f_desde[1]+"/"+f_desde[0]
      return f_periodo;
    }

    function FechaHasta(value,row) {
      
      var f_desde = row.fecha_desde.split('-');  //"2016-04-11"
      var f_hasta = row.fecha_hasta.split('-');; //"2016-04-13"
      var f_periodo = f_hasta[2]+"/"+f_hasta[1]+"/"+f_hasta[0];
      return f_periodo;
    }

    


    function actionFormatter(value,row) {
      var icono0 = '<a class="view" href="javascript:" title="Ver Registro"><i class="glyphicon glyphicon-view glyphicon-eye-open"></i></a>'
      // var icono1 = '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-edit"></i></a>  '
      // var icono2 = ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-remove-circle"></i></a>'
      // console.log(icono)
        return [ icono0 ].join('');
        // '<a class="update" href="javascript:" title="Modificar Registro"><i class="glyphicon glyphicon-edit"></i></a>  ',
        //     ' <a class="remove" href="javascript:" title="Eliminar Registro"><i class="glyphicon glyphicon-remove-circle"></i></a>',
    }

    function actionFormatter2(value,row) {
      // glyphicon-ok-circle
      var icono1 = '<a class="seleccionar" href="javascript:" title="Seleccionar Registro"><i class="glyphicon glyphicon-green glyphicon glyphicon-ok-sign "></i></a>';
        return icono1;
    }



    function StatusFormatter(value, row) {
        var icon = "";
        console.log(row.estatus);
        // if (row.estatus == 1 ) {
        //   icon = '<span class="pull-center badge bg-green">Aprob</span>';
        // }else{
        //   icon ='<span class="pull-center badge bg-red">Rech.</span>';
        // }
        if (row.estatus == null ) {

        } else if (row.estatus == '1' ) {  
          icon = '<span class="pull-center badge bg-yellow">Pendiente</span>';
        } else if (row.estatus == '2' ) {
          icon = '<span class="pull-center badge bg-green">Aprobado</span>';
        } else if (row.estatus == '3' ) {
          icon = '<span class="pull-center badge bg-red">Rechazado</span>';
        } else if (row.estatus == '4' ) {
          icon = '<span class="pull-center badge bg-blue">Jefe Inm.</span>';
        } else if (row.estatus == '5' ) {
          icon = '<span class="pull-center badge bg-green">Jefe Pers.</span>';
        // }else{
          // icon ='<span class="pull-center badge bg-red">Rech.</span>';
        }

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
    // window.actionEvents = {
    //     'click .update': function (e, value, row) {
    //         accion='modificar_permisos'
    //         // console.log(row);
    //         showModal($(this).attr('title'), row);  
    //     },
    //     'click .remove': function (e, value, row) {
    //         // console.log(row);
    //         accion='eliminar_permisos'
    //         if (row.estatus ==1) {
    //           var estatus ="Activo";
    //         }else{
    //           var estatus ="Inactivo";
    //         }  
    //         var id_permiso = row.id_permiso;
    //         if (confirm('Esta seguro de eleminar este item? \n ' + row.nombre_tipo + ' - ' +row.numero_dias + ' \n ' +row.id_tipo_personal_txt + ' - ' +row.tipo_permiso_txt +  '\n ' + estatus)) {
    //             $.ajax({
    //                 url: API_URL + '?id_permiso=' +row.id_tipopermiso + '&accion=' + accion ,
    //                 //type: 'POST',
    //                 success: function () {
    //                     $table.bootstrapTable('refresh');
    //                     showAlert('Registro borrado con exito!', 'success');
    //                 },
    //                 error: function () {
    //                     showAlert('Delete item error!', 'danger');
    //                 }
    //             })
    //         }
    //     }
    // };

    window.actionEvents2 = {
        
        'click .seleccionar': function (e, value, row) {
            accion='selecionar_funcionario';
            console.log(accion, row);
            

            var persona_cedula = row['persona_cedula'];//persona_cedula":"11829328"
            $("#txt_id_personal").val(row['empleado_dep_uid']);

            // ocultamos el cuadro de seleccion de cargo funcional 
            $('#cuadro_busqueda_datos_laborales').fadeOut(300);
            // mostramos los datos laborales seleccionados
            $('#cuadro_datos_laborales').fadeIn(300);
            // mostramos el formulario para ingresar los datos de permisos a solicitar
            $('#cuadro_de_resultados').fadeIn(300);

            //  cargamos los valores en pantalla
            $("#txt_tipo_personal").val(row['categoria_cargo_descripcion']);
            $("#txt_id_cargo_funcional").val(row['empleado_dep_uid']);
            $("#txt_cargo_funcional").val(row['cargo_labora']);
            $("#txt_municipio").val(row['municipio_nombre']);
            $("#txt_id_lugar_trabajo").val(row['empleado_dep_uid']);
            $("#txt_lugar_trabajo").val(row['dependencia_labora']);

            //activamos el boton de enviar formulario
            $('#btn_buscar').hide();


            // var valor=persona_cedula;
            var API_URL_director_permisos =  "servicios/services.secretaria.permisos.php?accion=consultar_permisos" + "&persona_cedula="+persona_cedula+ "&"+sesionencode;
            var $table = $('#table').bootstrapTable({url: API_URL_director_permisos});

            if ( cantdependencias>=1) {
              $table.bootstrapTable('showColumn', 'departamento_persona');
            }else{
              $table.bootstrapTable('hideColumn', 'departamento_persona');
            }

            // Cargar_Combo_Permisos(row['categoria_cargo_descripcion'].toLowerCase());

          
        }
    };

    // 
    // function showModal(title, row) {
    //     // console.log(title, row);
    //     $('#txt_fecha_registro').prop('readonly', true);
    //     if (accion=='agregar_permisos') {
    //       //code
    //       // habilitamos los check - activo
    //       $("#txt_radio_estatus0").prop("checked" , true ) 
    //       $("#txt_radio_estatus0").prop('disabled', false);
    //       $("#txt_radio_estatus1").prop('disabled', true);
    //       $('#txt_fecha_registro').prop('readonly', true);
    //       //$('#btn_buscar').text("Modificar Permiso");
    //       $('#btn_buscar').text("Agregar Permiso");
    //     }
    //     if (accion=='modificar_permisos') {
    //       // //code
    //       // // habilitamos los check - activo
    //       $("#txt_radio_estatus0").prop('disabled', false);
    //       $("#txt_radio_estatus1").prop('disabled', false);

    //       // Object { 
    //       //       id_permiso: "6",
    //       //       tipo_permiso: "1", 
    //       //       tipo_permiso_txt: "Obligatorio", 
    //       //       nombre_tipo: "mmm", 
    //       //       numero_dias: "nnnn", 
    //       //       reglas_legal: "bbbb", 
    //       //       recaudos: "rrrr", 
    //       //       id_tipo_personal: "2", 
    //       //       id_tipo_personal_txt: "Docente", 
    //       //       fecha_registro: "2016-04-03", 
    //       //       estatus:"0"
    //       //  } 
    //       //
    //       //  CAMBIAMOS EL TITULO DE LA VENTANA MODAL  
    //       $modal.find('.modal-title').text(title);
    //       // CAMBIAMOS EL NOMBRE EL TEXTO BOTON DE ENVIAR
    //       $('#btn_buscar').text("Modificar Permiso");
    //       // SE CORRIGE LA FECHA ADECUADA AL DATERANGEPICKER
    //       var fechareg =  row['fecha_registro'].split('-');
    //       var ani_reg = fechareg[0];
    //       var mes_reg = fechareg[1];
    //       var dia_reg = fechareg[2];
    //       var freg = dia_reg + '/' + mes_reg + '/' + ani_reg;
    //       // LLENAMOS CADA INPUT CON LOS DATOS DE LA TABLA
    //       $modal.find('input[name="txt_id_permiso"]').val(row['id_tipopermiso']);
    //       $("#txt_tipo_personal").val(row['id_tipo_personal']);
    //       $("#txt_tipo_permiso").val(row['tipo_permiso']);
    //       $modal.find('input[name="txt_nombre_permiso"]').val(row['nombre_tipo']);
    //       $modal.find('input[name="txt_dias_permiso"]').val(row['numero_dias']);
    //       $modal.find('input[name="txt_reglas_legal"]').val(row['reglas_legal']);
    //       $modal.find('input[name="txt_recaudos"]').val(row['recaudos']);
    //       $modal.find('input[name="txt_fecha_registro"]').val(freg);           
          
    //       // // CAMBIAMOS EL INPUT RADIO DE ESTATUS
    //       // if (row['estatus']==0){
    //       //   $("#txt_radio_estatus0" ).prop("checked" , true )  
    //       // }else{
    //       //   $("#txt_radio_estatus1" ).prop("checked" , true )
    //       // }
    //     }
    //     // MOSTRAMOS LA VENTANA MODAL
    //     $modal.modal('show');
    // }
    // 
    function showAlert(title, type) {
        $alert.attr('class', 'alert alert-' + type || 'success')
              .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
        setTimeout(function () {
            $alert.hide();
        }, 3000);
    }

