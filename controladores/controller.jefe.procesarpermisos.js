console.log("javascript - jefe procesar permisos");


    var permite_eliminar = false;    
    var username = $('#user_name').attr('oculto');
    var userced = $('#user_name').attr('ocultoced');
    var sesionencode = $('#user_name').attr('sesionencode');
    var usernombre = $('#name_user').html();
    var cargouser = $('#cargo_user').html();
    var dptouser = $('#departamento_user').html();
    var userestatus = $('#estatus_loading').attr('estatus');

    var cantdependencias = $('#user_name').attr('cantdependencias');
    // alert(cantdependencias);
    // console.log(sesionencode);

    // sesion_id_persona=yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq

    var API_URL_director_permisos =  "servicios/services.jefe.permisos.php?accion=consultar_permisos&"+sesionencode;
    var $table = $('#table').bootstrapTable({url: API_URL_director_permisos});

    // if ( cantdependencias>=1) {
    //   $table.bootstrapTable('showColumn', 'departamento_persona');
    // }else{
    //   $table.bootstrapTable('hideColumn', 'departamento_persona');
    // }
    
    // $table.bootstrapTable('hideColumn', 'id_permiso');


    var txt_tipo_permiso       = $("#txt_tipo_permiso");
  
    $modal = $('#ventana_modal').modal({show: false});
    
    $alert = $('.alert').hide();

    // $cuadro_busqueda_datos_laborales = $('#cuadro_busqueda_datos_laborales').hide();
    // $cuadro_datos_laborales = $('#cuadro_datos_laborales').hide();
    // $cuadro_solicitud_permiso = $('#cuadro_solicitud_permiso').hide();

    var accion="";
    
    // console.log(fecha_actual2());
    // 
    // console.log(randomstring(20));

    // console.log(sumaFecha(3,fecha_actual()));
    
     $(function () {


        $('#btn_limpiar').click(function () {

            limpiar_form();
            
        });

        $modal.find('#btn_enviar_modal').click(function () {

            accion ='procesar_permisos';

            var id_permiso = $("#txt_id_permiso").val();

            var cedula = $("#txt_cedula_personal").val();
            if (cedula!='') {
              parametros = $("#form_ventana_modal").serialize() + '&id_permiso='+id_permiso+'&accion='+ accion  + '&'+sesionencode;
              
              console.log(parametros);
              alert(parametros);
              
              API_URL =  "servicios/services.jefe.permisos.php";
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

                      $("#txt_estatus1").prop('disabled', true);
                      $("#txt_estatus2").prop('disabled', true);
                      $("#txt_estatus3").prop('disabled', true);

                      $("#txt_observacion").prop("disabled", true);

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
              window.open("vistas/pdf/formato_permisos.pdf", "Imprimir", "width=640,height=480");
        });


     });

    function limpiar_form(){

      accion ='limpiar_funcionario';
      
      console.log(accion);

      $('#btn_imprimir').hide();
      $('#btn_enviar_modal').hide();

      // $('#cuadro_busqueda_datos_laborales').fadeOut(300);
      // $('#cuadro_datos_laborales').fadeOut(300);
      // $('#cuadro_solicitud_permiso').fadeOut(300);

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
      
      $("#txt_tipo_permiso").val('');
      $("#txt_motivo_permiso").val('');
      $("#txt_cantidad_dias").val('');
      $("#txt_periodo_registro").val('');
      $("#txt_cantidad_dias").val('');
      $("#txt_fecha_registro").val('');
      $("#id_tipopermiso").val('');

      $("#txt_estatus1").prop("checked" , true );
      $("#txt_estatus2").prop("checked" , false );
      $("#txt_estatus3").prop("checked" , false );

      $("#txt_observacion").text('');
      $("#txt_observacion").val('');

    };


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
      var f_hasta = row.fecha_hasta.split('-'); //"2016-04-13"
      var f_periodo = f_desde[2]+"/"+f_desde[1]+"/"+f_desde[0]+ ' hasta ' + f_hasta[2]+"/"+f_hasta[1]+"/"+f_hasta[0];
      return f_periodo;
    }

    function StatusFecha1(value,row) {
      var f_desde = row.fecha_desde.split('-');  //"2016-04-11"
      var f_periodo = f_desde[2]+"/"+f_desde[1]+"/"+f_desde[0];
      return f_periodo;
    }

    function StatusFecha2(value,row) {
      var f_hasta = row.fecha_hasta.split('-'); //"2016-04-13"
      var f_periodo = f_hasta[2]+"/"+f_hasta[1]+"/"+f_hasta[0];
      return f_periodo;
    }
  

    function actionFormatter(value,row) {
      var icono0 = ['<a class="process " href="javascript:"  title="Procesar Registro"    ><i class="glyphicon glyphicon-view glyphicon-cog"></i></a>'];
      // icono0.push(  '<a class="update" href="javascript:" title="Aprobar Permiso" ><i class="glyphicon glyphicon-succes glyphicon-ok"           ></i></a>');
      // icono0.push(  '<a class="remove" href="javascript:" title="Rechazar Permiso"><i class="glyphicon glyphicon-error  glyphicon-remove-circle"></i></a>');
      // console.info(icono0);
      // var icono = []
      return [icono0].join('');  
   }

    function actionFormatter2(value,row) {
      // glyphicon-ok-circle
      var icono1 = '<a class="seleccionar" href="javascript:" title="Procesar Registro"><i class="glyphicon glyphicon-green glyphicon glyphicon-ok-sign "></i></a>';
        return icono1;
    }



    function StatusFormatter(value, row) {
        var icon = "";
        // console.log(row.estatus);

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
        // return icon;
        return row.departamento_persona
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
    //         // mostramos el formulario para ingresar los datos de permisos a solicitar
    //         $('#cuadro_solicitud_permiso').fadeIn(300);

    //         //  cargamos los valores en pantalla
    //         $("#txt_tipo_personal").val(row['categoria_cargo_descripcion']);
    //         $("#txt_id_cargo_funcional").val(row['empleado_dep_uid']);
    //         $("#txt_cargo_funcional").val(row['cargo_labora']);
    //         $("#txt_municipio").val(row['municipio_nombre']);
    //         $("#txt_id_lugar_trabajo").val(row['empleado_dep_uid']);
    //         $("#txt_lugar_trabajo").val(row['dependencia_labora']);

    //         //activamos el boton de enviar formulario
    //         $modal.find('button[name="btn_enviar_modal"]').show();

    //         Cargar_Combo_Permisos(row['categoria_cargo_descripcion'].toLowerCase());

          
    //     }
    // };

    // 
    function showModal(title, row) {
        console.log(title);
        console.log(row);
        // alert(title);
        // alert(row);
        // alert(row.toSource());
        // 
        // limpiar_form();

        $('#txt_fecha_registro').prop('readonly', true);
        
        if (accion=='procesar_permisos') {
          // //code
          // // habilitamos los check - activo
 

          var estatus = row['estatus'];
          alert(estatus);
          if (estatus=='1' ) {
            // $("#txt_estatus1").prop("checked" , true );
            $("#txt_estatus1").prop('disabled', true);
            $("#txt_estatus2").prop('disabled', false);
            $("#txt_estatus3").prop('disabled', false);
            
            $("#txt_observacion").prop("disabled", false);

            $('#btn_imprimir').hide();
            $('#btn_enviar_modal').show();
          }else{
          // if (estatus=='2' || estatus=='3' ) {
            $("#txt_estatus1").prop('disabled', true);
            $("#txt_estatus2").prop('disabled', true);
            $("#txt_estatus3").prop('disabled', true);

            $("#txt_observacion").prop("disabled", true);
            
            $('#btn_imprimir').show();
            $('#btn_enviar_modal').hide();
          }
          //   
          
          //  CAMBIAMOS EL TITULO DE LA VENTANA MODAL  
          $modal.find('.modal-title').text(title);
          // CAMBIAMOS EL NOMBRE EL TEXTO BOTON DE ENVIAR
          $modal.find('button[name="btn_enviar_modal"]').text("Procesar Permiso");
          // SE CORRIGE LA FECHA ADECUADA AL DATERANGEPICKER
          var fechareg =  row['fecha_permiso'].split('-');
          var ani_reg = fechareg[0];
          var mes_reg = fechareg[1];
          var dia_reg = fechareg[2];
          var freg = dia_reg + '/' + mes_reg + '/' + ani_reg;

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


          // LLENAMOS CADA INPUT CON LOS DATOS DE LA TABLA
          // 
          // $modal.find('input[name="txt_id_permiso"]').val(row['id_tipopermiso']);
          // $("#txt_tipo_personal").val(row['id_tipo_personal']);
          // $("#txt_tipo_permiso").val(row['permiso']);
          // $modal.find('input[name="txt_nombre_permiso"]').val(row['nombre_tipo']);
          // $modal.find('input[name="txt_dias_permiso"]').val(row['numero_dias']);
          // $modal.find('input[name="txt_reglas_legal"]').val(row['reglas_legal']);
          // $modal.find('input[name="txt_recaudos"]').val(row['recaudos']);
          
          $modal.find('input[name="txt_fecha_registro"]').val(freg);

        // ({  id_permiso:"41", 
        //     id_funcionario:"demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG", 
        //     cedula_persona:"11829328", 
        //     apellidos_nombres:"HERNANDEZ CAMPOS OSWALDO ENRIQUES", 
        //     id_departamento_persona:"sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT", 
        //     departamento_persona:"DIV. DE INFORMATICA Y SISTEMAS", 
        //     cargo_persona:"COORD. SISTEMAS Y BASES DE DATOS", 
        //     categoria_cargo_descripcion:"ADMINISTRATIVO", 
        //     cargo_codigo:"10000C", 
        //     cargo_denominacion:"BACHILLER CONTRATADO", 
        //     municipio_nombre:"SUCRE", 
        //     fecha_permiso:"2016-09-20", 
        //     numero_dias:"7", 
        //     id_tipopermiso:"156", 
        //     nombre_tipo:"Diligencias Personales", 
        //     tpnumero_dias:"xxC", 
        //     motivo_permiso:"viaje personal", 
        //     fecha_desde:"2016-09-21", 
        //     fecha_hasta:"2016-09-28", 
        //     fecha_recepcion:"2016-09-20 09:10:05", 
        //     estatus:"1", 
        //     observacion:"viaje personal", 
        //     id_jefeinmediato:"zTYaccdG-L4ei-5wOI-hAQo-N9CiEFQp9BYb", 
        //     cedula_persona2:"10462223", 
        //     apellidos_nombres2:"RINCONES GONZALEZ JOSE GREGORIO", 
        //     nombre_persona2:"RINCONES GONZALEZ", 
        //     apellido_persona2:"JOSE GREGORIO", 
        //     departamento_persona2:"DIVISION DE PERSONAL", 
        //     cargo_persona2:"JEFE DE DIVISION", 
        //     categoria_cargo_descripcion2:"DOCENTE", 
        //     cargo_codigo2:"1125DI", 
        //     cargo_denominacion2:"DOC. V   /AULA", 
        //     municipio_nombre2:"SUCRE", 
        //     separador:"---"})
        //
        //     
             
        //fecha_desde:"2016-09-21", 
        //fecha_hasta:"2016-09-28", 
        //     
          $("#txt_id_jefeinmediato").val(userced);
          
          $("#txt_id_permiso").val(row['id_permiso']);

          $("#txt_id_personal").val('');
          $("#txt_cedula_personal").val(row['cedula_persona']);
          $("#txt_nombre_funcionario").val(row['apellidos_nombres']);
          $("#txt_tipo_personal").val(row['categoria_cargo_descripcion']);
          
          // $("#txt_id_cargo_funcional").val(row['permiso']);
          $("#txt_cargo_funcional").val(row['cargo_persona']);

          $("#txt_municipio").val(row['municipio_nombre']);
          // $("#txt_id_lugar_trabajo").val(row['permiso']);
          $("#txt_lugar_trabajo").val(row['departamento_persona']);
          
          $("#txt_tipo_permiso").val( row['nombre_tipo'] + ' (' + row['tpnumero_dias'] + ')' );
          $("#txt_motivo_permiso").val(row['motivo_permiso']);
          $("#txt_cantidad_dias").val(row['numero_dias']);
          
          $("#txt_periodo_registro").val(fecha_periodo);

          
          $("#txt_fecha_registro").val(freg);

          // $("txt_observacion").text(row['observacion']);
          $("#txt_observacion").val('');  
          // alert(row['estatus_observacion']);   
          $("#txt_observacion").text(row['estatus_observacion']);          

          // estatus


          // $("#id_tipopermiso").val(row['permiso']);

          
          // // CAMBIAMOS EL INPUT RADIO DE ESTATUS
          if (row['estatus']=='1' ){
            $("#txt_estatus1" ).prop("checked" , true )  
          }
          if (row['estatus']=='2' || row['estatus']=='4' || row['estatus']=='5' ){
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

