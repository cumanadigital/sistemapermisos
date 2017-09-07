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
          
    $alert = $('.alert').hide();

    var accion="";

    limpiar_form();
    
    $(function () {


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

            limpiar_form();
            
        });


     });

    function limpiar_form(){

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
        
        $('#btn_buscar').fadeIn(300);


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
        //console.log(row.estatus);
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
        return icon;
    }

    function VacacionesFormatter(value, row) {
        var icon = "";
        //console.log(row.estatus);
        if (row.tipo_vacaciones == 1 ) {
          icon = '<span class="pull-center badge bg-green">Regulares</span>';
        }else{
          icon ='<span class="pull-center badge bg-red">Atrasadas</span>';
        }
        return icon;
    }

    
    function CondicionFormatter(value, row) {
        var icon = "";
        //console.log(row.estatus);
        if (row.tipo_vacaciones == 1 ) {
          icon = '<span class="pull-center badge bg-blue">Cont.</span>';
        }else{
          icon ='<span class="pull-center badge bg-green">Fijo</span>';
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
            var API_URL_director_permisos =  "servicios/services.director.vacaciones.php?accion=consultar_vacaciones" + "&persona_cedula="+persona_cedula+ "&"+sesionencode;
            var $table = $('#table').bootstrapTable({url: API_URL_director_permisos});

            if ( cantdependencias>1) {
              $table.bootstrapTable('showColumn', 'departamento_persona');
            }else{
              $table.bootstrapTable('hideColumn', 'departamento_persona');
            }

            // Cargar_Combo_Permisos(row['categoria_cargo_descripcion'].toLowerCase());

          
        }
    };

 
    function showAlert(title, type) {
        $alert.attr('class', 'alert alert-' + type || 'success')
              .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
        setTimeout(function () {
            $alert.hide();
        }, 3000);
    }

