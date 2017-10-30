    console.log("javascript - root informacion laboral");

    //var API_URL_periodos =  "servicios/services.periodos.php?accion=consultar_periodos";
    // var API_URL_periodos =  "servicios/services.admin.periodos.php?accion=consultar_periodos";
    // var API_URL_info_laboral =  "servicios/services.informacion.laboral.php?accion=consultar_informacion";
    // var API_URL =  "servicios/services.admin.periodos.php";
    // var $table = $('#table').bootstrapTable({url: API_URL_periodos});
    // var $table = $('#table').bootstrapTable({url: API_URL_info_laboral});

    var txt_municipio               = $("#txt_municipio");
    var txt_centro_trabajo          = $("#txt_centro_trabajo");

    // $modal = $('#modal_registros').modal({show: false});
    
    $alert = $('.alert').hide();
    
    var accion="";
 
    $(function () {

        // Cargar_Combo_Municipios();

        // create event
        // 
        Cargar_Combo_Municipios();


        // $('#txt_centro_trabajo').select2();


        $('#btn_descarga_planilla').click(function () {
            accion ='btn_descarga_planilla';
            archivo = "files/NOMBRE_DEPENDENCIA_PLANILLA_CONSOLIDADO_FINAL_SOLICITUD_INTEGRAL_DE_INFORMACIÓN_LABORAL.ods";     
            console.log(accion);
            document.location = archivo;
        });

        // function Cargar_Combo_Municipios22(){
        //     var accion = "consultar_municipios22";
        //     console.log(accion);
        // };
        // 
        function Cargar_Combo_Municipios(){
            // Limpiamos el contenido del select tipos de permisos
            txt_municipio.empty();
            txt_municipio.append("<option value='' >Seleccione</option>");
            // txt_municipio.append("<optgroup label='Permisos Obligatorios'>");
            var accion = "consultar_municipios";
            console.log(accion);

            var tipo_personal = '1'; // 1-administrativo 2-docente 3-obrero
            var tipo_usuario = 'root';
            $.ajax({
                type: "GET",
                url: "servicios/services.admin.municipios.php",
                data: "&accion=" + accion + "&tipo_personal=" + tipo_personal + "&tipo_usuario=" + tipo_usuario + "&token1="+rand_code(),
                success: function(response)
                {
                    // console.log(response);
                    var arreglo_municipio = JSON.parse(response);
                    $.each(arreglo_municipio, function(i,item){
                        // console.log(item);
                        // { 
                        //     municipio_uid: "Llr6wefs-DICV-8g4z-IoRq-caL8Y4awlOaV", 
                        //     municipio_nombre: "SUCRE", 
                        //     municipio_capital: "Cumaná", 
                        //     municipio_estado: "17", 
                        //     municipio_codigo: "14", 
                        //     municipio_codigo_n: "309" 
                        // }
                        txt_municipio.append("<option value='"+item.municipio_uid+"' >" + item.municipio_codigo + " - " + item.municipio_nombre + "</option>");
                    })
                }
            });
        };


        $("#txt_municipio").change(function () {
            // console.info($(this).val());
            // console.info($(this));
            txt_centro_trabajo.empty();
            $("#txt_municipio option:selected").each(function () {
                id_category = $(this).val();
                console.info(id_category);
                Cargar_Combo_Centros_Locales(id_category);

            //     $.post("parroquias.php", { id_category: id_category }, function(data){
            //         $("#parroquia").html(data);
            //     });
            });
        })



        function Cargar_Combo_Centros_Locales(id_categoria){
            // // Limpiamos el contenido del select tipos de permisos
            txt_centro_trabajo.empty();
            txt_centro_trabajo.append("<option value='' >Cargando</option>");
            // // txt_municipio.append("<optgroup label='Permisos Obligatorios'>");
            var accion = "consultar_centros_trabajo";
            console.log(accion);
            console.info(id_categoria);

            var tipo_personal = '1'; // 1-administrativo 2-docente 3-obrero
            var tipo_usuario = 'root';
            $.ajax({
                type: "GET",
                url: "servicios/services.admin.planteles.php",
                data: "&accion=" + accion + "&id_categoria=" + id_categoria + "&tipo_personal=" + tipo_personal + "&tipo_usuario=" + tipo_usuario + "&token1="+rand_code(),
                success: function(response)
                {
                    // console.log(response);
                    txt_centro_trabajo.empty();
                    // txt_centro_trabajo.append("<option value='' >Cargando</option>");
                    var arreglo_centro_trabajo = JSON.parse(response);
                    $.each(arreglo_centro_trabajo, function(i,item){
                        console.log(item.plan_uid +" - " + item.plan_codigodea + " - " + item.plan_nombre);
                        // { 
                        //     municipio_uid: "Llr6wefs-DICV-8g4z-IoRq-caL8Y4awlOaV", 
                        //     municipio_nombre: "SUCRE", 
                        //     municipio_capital: "Cumaná", 
                        //     municipio_estado: "17", 
                        //     municipio_codigo: "14", 
                        //     municipio_codigo_n: "309" 
                        // }
                        
                        // txt_centro_trabajo.append("<option value='"+item.plan_uid+"' >" + item.plan_codigodea + " - " + item.plan_nombre + "</option>");
                        txt_centro_trabajo.append("<option value='"+item.plan_uid+"' >" +"(<b>"+item.plan_codigodea + ")<b> - " + item.plan_nombre + "</option>");
                        //txt_centro_trabajo.append("<option value='"+item.plan_uid+"' >" + item.plan_nombre + " [ " + item.plan_codigodea + " ]" + "</option>");
                    })
                }
            });
        };



    //     // function Cargar_Combo_Permisos(tipo_personal){
    //     //     // Limpiamos el contenido del select tipos de permisos
    //     //     txt_tipo_permiso.empty();
    //     //     txt_tipo_permiso.append("<option value=''>Seleccione</option>");
    //     //     // txt_tipo_permiso.append("<optgroup label='Permisos Obligatorios'>");
            
    //     //     //cargar select PERIODOS
    //     //     // PERIODOS
    //     //     var accion = "consultar_tipopermisos_filtro";
    //     //     // var tipo_personal = '1'; // 1-administrativo 2-docente 3-obrero
    //     //     var tipo_usuario = 'secretaria';
    //     //     // var tipo_usuario = 'juridica';
    //     //     $.ajax({

    //     //         type: "GET",
    //     //         url: "servicios/services.admin.tipopermisos.php",
    //     //         data: "&accion=" + accion + "&tipo_personal=" + tipo_personal + "&tipo_usuario=" + tipo_usuario + "&token1="+rand_code(),
    //     //         success: function(response)
    //     //         {
    //     //           // console.log(response);
    //     //           var arreglo_tipos_permisos = JSON.parse(response);
    //     //           var tipos_permisos_estatus = ""
    //     //           var estado = 0;
    //     //           $.each(arreglo_tipos_permisos, function(i,item){
    //     //                 // Object { 
    //     //                 //           id_tipopermiso: "101", 
    //     //                 //           tipo_permiso: "1", 
    //     //                 //           tipo_permiso_txt: "Obligatorio", 
    //     //                 //           nombre_tipo: "Matrimonio", 
    //     //                 //           numero_dias: "8H", 
    //     //                 //           reglas_legal: "POR MATRIMONIO, SEGÚN CLÁUSULA 72 D…", 
    //     //                 //           recaudos: "COPIA DE CÉDULA DE IDENTIDAD LEGIBL…", 
    //     //                 //           id_tipo_personal: "1", 
    //     //                 //           id_tipo_personal_txt: "Administrativo", 
    //     //                 //           fecha_registro: "2016-07-01",
    //     //                 //           estatus: "1"
    //     //                 //          } 
    //     //                 // console.log(item);
    //     //                 // console.log(item.estatus, item.tipo_permiso, item.id_tipopermiso, item.nombre_tipo);
    //     //               if (item.estatus==0) {
    //     //                   tipos_permisos_estatus = " - Inactivo";
    //     //               }else{
    //     //                   tipos_permisos_estatus = " - Activo";
    //     //               }
    //     //                if (item.tipo_permiso==2 && estado==0) {
    //     //                    estado=1;
    //     //                    txt_tipo_permiso.append("</optgroup>");
    //     //                    txt_tipo_permiso.append("<optgroup label='Permisos Potestativos'>");
    //     //                }
    //     //                // tipos_permisosS
    //     //               txt_tipo_permiso.append("<option value='"+item.id_tipopermiso+"' >" + item.nombre_tipo + " (Días: " + item.numero_dias + " )" + "</option>");
    //     //           })
    //     //           txt_tipo_permiso.append("</optgroup>");
    //     //         }
    //     //     });
    

    // Cargar_Combo_Municipios();

    
    }); // fin de $ function

  
    function showAlert(title, type) {
        $alert.attr('class', 'alert alert-' + type || 'success')
              .html('<i class="glyphicon glyphicon-check"></i> ' + title).show();
        setTimeout(function () {
            $alert.hide();
        }, 3000);
    }