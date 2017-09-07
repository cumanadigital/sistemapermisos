/**=============================================================================
 *
 *	Filename:  function.ajax.js
 *	
 *	(c)Autor: TSU Oswaldo Hernández
 *	
 *	Description: Ajax para hacer las consultas
 *	
 *	Licence: GPL|LGPL
 *	
 *===========================================================================**/
	var dato_usuario = ""
	$(document).ready(function(){
	
	var timeSlide = 500;
	var timeFadeOut = 500;

	var timeLoginSucces = 10;
	var timeLoginFail = 3000;
	var timeLoadHtml = 50;
	var timeExitSession = 10;
	
	var username = $('#user_name').attr('oculto');
	var userced = $('#user_name').attr('ocultoced');
	
	var usernombre = $('#name_user').html();
	var cargouser = $('#cargo_user').html();
	var dptouser = $('#departamento_user').html();
	var userestatus = $('#estatus_loading').attr('estatus');

	var username = $('#user_name').attr('oculto');
	
	// var userced = $('#user_name').attr('ocultoced');
	var sesionencode = $('#user_name').attr('sesionencode');
	// **********************
	var parametros_user = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&sesionencode='+sesionencode+'&relleno=valor';


	$modal2 = $('#modal_login2').modal({show: false});

	// $("#txt_reg_cedula").inputmask("99999999");
	$("#txt_reg_telefono").inputmask("9999-9999999");
	// $("#txt_reg_correo").inputmask("email");
	// $("#txt_reg_correo").inputmask('Regex', { regex: "[a-zA-Z0-9._%-]+@[a-zA-Z0-9-]+\\.[a-zA-Z]{2,4}" });
	// $("#txt_reg_correo").inputmask("{1,20}@{1,20}.{2,6}[.{2}]")
	// $("#txt_reg_correo").inputmask({ alias: "email"});
	hora();
	
	// $('#txt_reg_cedula').val('11829328');
	// $('#txt_reg_nombre').val('Oswaldo');
	// $('#txt_reg_apellido').val('Hernandez');
	// $('#txt_reg_correo').val('oswaldoehc@gmail.com');
	// $('#txt_reg_telefono').val('0416-5936395');
	// $('#txt_reg_password1').val('1234');
	// $('#txt_reg_password2').val('1234');

	// $('#txt_departamento').val('1');

	

	
	
	//	Eventos asociados a la pagina index.php
	//	Eventos asociados a la pagina index.php
	//	Eventos asociados a la pagina index.php
	


	 // ######   ####   #####   #    #      #####   ######       ####   ######   ####   #   ####   #    # 
	 // #       #    #  #    #  ##  ##      #    #  #           #       #       #       #  #    #  ##   # 
	 // #####   #    #  #    #  # ## #      #    #  #####        ####   #####    ####   #  #    #  # #  # 
	 // #       #    #  #####   #    #      #    #  #                #  #            #  #  #    #  #  # # 
	 // #       #    #  #   #   #    #      #    #  #           #    #  #       #    #  #  #    #  #   ## 
	 // #        ####   #    #  #    #      #####   ######       ####   ######   ####   #   ####   #    # 
	                                                                                                   
	// INICIO DE SESIÓN
	
	$('#iniciarsesion' ).on("click", function(event){
		console.log($(this).attr('id'));
		//$modal_login = $('#modal_login').modal({show: false});
		//$modal_login = $('#modal_articulos').modal({show: false});
		//$modal_login.modal('show');
		//showModal($(this).text());
		$('#modal_login').modal('show');
	});


	 // ######   ####   #####   #    #      #####   ######   ####   #   ####   #####  #####     ##    #####           #    #   ####   #    #    ##    #####   #   ####  
	 // #       #    #  #    #  ##  ##      #    #  #       #    #  #  #         #    #    #   #  #   #    #          #    #  #       #    #   #  #   #    #  #  #    # 
	 // #####   #    #  #    #  # ## #      #    #  #####   #       #   ####     #    #    #  #    #  #    #          #    #   ####   #    #  #    #  #    #  #  #    # 
	 // #       #    #  #####   #    #      #####   #       #  ###  #       #    #    #####   ######  #####           #    #       #  #    #  ######  #####   #  #    # 
	 // #       #    #  #   #   #    #      #   #   #       #    #  #  #    #    #    #   #   #    #  #   #           #    #  #    #  #    #  #    #  #   #   #  #    # 
	 // #        ####   #    #  #    #      #    #  ######   ####   #   ####     #    #    #  #    #  #    #           ####    ####    ####   #    #  #    #  #   ####  
	 // 	                                                                                                                 
	// $('#iniciarregistro' ).on("click", function(event){
	// 	console.log($(this).attr('id'));
	// 	$('#txt_reg_cedula').val('');
	// 	$('#txt_reg_nombre').val('');
	// 	$('#txt_reg_apellido').val('');
	// 	$('#txt_reg_correo').val('');
	// 	$('#txt_reg_telefono').val('');
	// 	$('#txt_reg_password1').val('');
	// 	$('#txt_reg_password2').val('');
	// 	$('#txt_departamento').val('0');


	// 	//$modal_login = $('#modal_login').modal({show: false});
	// 	//$modal_login = $('#modal_articulos').modal({show: false});
	// 	//$modal_login.modal('show');
	// 	//showModal($(this).text());
	// 	// $('#modal_register').modal('show');
	// 	$modal2.modal('show');
	// });

	 // #  #    #  #   ####   #   ####        ####   ######   ####   #   ####   #    # 
	 // #  ##   #  #  #    #  #  #    #      #       #       #       #  #    #  ##   # 
	 // #  # #  #  #  #       #  #    #       ####   #####    ####   #  #    #  # #  # 
	 // #  #  # #  #  #       #  #    #           #  #            #  #  #    #  #  # # 
	 // #  #   ##  #  #    #  #  #    #      #    #  #       #    #  #  #    #  #   ## 
	 // #  #    #  #   ####   #   ####        ####   ######   ####   #   ####   #    # 
	                                                                                		
	//	**** BOTON LOGIN USER (INGRESAR) EN index.php
	
    $('#login_userbttn').on("click", function(event){

    	// console.log("accion  ->  " + $(this).attr('id') + "  ->  " + $(this).text() );

		//setTimeout(function(){
			var username = $('#login_username').val();
			var userpass = $('#login_userpass').val();
			if ( $('#login_username').val() != "" && $('#login_userpass').val() != "" ){
				$('#content').html('<span class="timer" id="timer"></span>Cargando por favor espere');
				$.ajax({
					type: 'POST',
					url: 'servicios/log.inout.ajax.php',
					data: 'login_username=' + username+ '&login_userpass=' + userpass,
					success:function(response){
						console.log("response ");
						console.log(response);
						if ( response== 1 ){
							$('#content').html('<span class="timer" id="timer"></span> ' + msj('ini_sat'));
							redireccion(1,timeLoginSucces);
						}else{
							$('#content').html('<i id="timer" class="fa fa-user-times"></i> ' + msj('ini_err'));
							redireccion(0,timeLoginFail);
						}
					},
					error:function(){
						$('#content').html('<i id="timer" class="fa fa-warning"></i> ' + msj('ini_fal'));
						redireccion();
					}
				});
			}else{
				$('#content').html('<i id="timer" class="fa fa-user-times"></i> ' + msj('ini_err'));
				redireccion();
			}
		//},timeSlide);
		return false;
	});
		


	// #####   ######   ####   #   ####   #####  #####    ####       #    #   ####   #    #    ##    #####   #   ####  
	// #    #  #       #    #  #  #         #    #    #  #    #      #    #  #       #    #   #  #   #    #  #  #    # 
	// #    #  #####   #       #   ####     #    #    #  #    #      #    #   ####   #    #  #    #  #    #  #  #    # 
	// #####   #       #  ###  #       #    #    #####   #    #      #    #       #  #    #  ######  #####   #  #    # 
	// #   #   #       #    #  #  #    #    #    #   #   #    #      #    #  #    #  #    #  #    #  #   #   #  #    # 
	// #    #  ######   ####   #   ####     #    #    #   ####        ####    ####    ####   #    #  #    #  #   ####  
	    	    
 //    $('#login_register_user').on("click", function(event){

 //    	// console.log("accion  ->  " + $(this).attr('id') + "  ->  " + $(this).text() );

 //    	// $("#form_registrar_user").valid();
 //    	// event.preventDefault();

 //    	// $('#cerrar_register').click();
 //    	// $('#cerrar_register').click();
    	
 //    	// $('#loginbox_register .in').modal('hide');
    	
	// 	$modal2.modal('hide');

	// 	// $('#login_register_user').click(function(){
	// 	//setTimeout(function(){
	// 		var txt_reg_cedula 		= $('#txt_reg_cedula').val();
	// 		var txt_reg_nombre 		= $('#txt_reg_nombre').val();
	// 		var txt_reg_apellido 	= $('#txt_reg_apellido').val();
	// 		var txt_reg_correo 		= $('#txt_reg_correo').val();
	// 		var txt_reg_telefono 	= $('#txt_reg_telefono').val();
	// 		var txt_reg_password1 	= $('#txt_reg_password1').val();
	// 		var txt_reg_password2 	= $('#txt_reg_password2').val();
	// 		var txt_departamento 	= $('#txt_departamento').val();
			


	// 		if ( txt_reg_cedula != "" && txt_reg_nombre != "" && txt_reg_apellido != "" && txt_reg_correo != "" && txt_reg_telefono != "" && txt_reg_password1 != "" && txt_reg_password2 != "" && txt_departamento!='0'){
				
	// 			if (txt_reg_password1 == txt_reg_password2) {

	// 				$('#content').html('<span class="timer" id="timer"></span>Cargando por favor espere');
	// 				accion = "registrar_user_estudiante";
	// 				var datos_form = 	"txt_reg_cedula=" 	+ txt_reg_cedula + "&" + "txt_reg_nombre=" 	+ txt_reg_nombre + "&" + "txt_reg_apellido=" + txt_reg_apellido + "&" + "txt_reg_correo=" + txt_reg_correo  + "&" + "txt_reg_telefono=" + txt_reg_telefono  + "&" + "txt_reg_password1=" + txt_reg_password1  + "&" + "txt_reg_password2="+ txt_reg_password2 + "&" + "txt_departamento="+ txt_departamento ;
	// 				parametros =  datos_form + '&accion='+ accion;
	// 				// console.log(parametros);
	// 				$.ajax({
	// 					type: 'POST',
	// 					url: 'servicios/services.users.php',
	// 					data: parametros,
	// 					success:function(response){
	// 						console.log("response " + response);
	// 						if ( response== "@true" ){
	// 							// alert("Estudiante ya se encuentra registrado")
	// 						 	$('#content').html("<br><h3>Estudiante ya se encuentra registrado</h3>");
	// 						 	alert("Estudiante ya se encuentra registrado");
	// 							redireccion(0,500);
	// 						// }else{
	// 						// 	$('#content').html('<i id="timer" class="fa fa-user-times"></i> ' + msj('ini_err'));
	// 						// 	redireccion();
	// 						}else{
	// 							var objeto = JSON.parse(response);
 //                        		console.log(objeto);
 //                        	 	var mensajereg= "Estudiante registrado con \u00E9xito. Puede iniciar la sesi\u00F3n con los siguientes datos:\n - Usuario: " + objeto['login_user'] + "\n - Contrase\u00F1a: " +objeto['pass_user'] +"\nCopie estos datos en un lugar seguro</h3>";
	// 							$('#content').html("<br><h1>Estudiante registrado con \u00E9xito. </h1><h2>Puede iniciar la sesi\u00F3n con los siguientes datos:</h2><h3> - Usuario: " + objeto['login_user'] + "</h3><h3> - Contrase\u00F1a: " +objeto['pass_user'] +"</h3><h3>Copie estos datos en un lugar seguro</h3>" );
	// 							// alert("Estudiante registrado con \u00E9xito.\n - Usuario: " + objeto['login_user'] + "\n - Contrase\u00F1a: " +objeto['pass_user'] );
	// 							alert(mensajereg);
	// 							redireccion(0,500);
	// 						}
	// 					},
	// 					error:function(){
	// 						$('#content').html('<i id="timer" class="fa fa-warning"></i> ' + msj('ini_fal'));
	// 						redireccion();
	// 					}
	// 				});
	// 			}else{
	// 				alert("Password no coinciden");	
	// 			}
	// 		}else{
	// 			alert("Debe ingresar todos los valores");
	// 			// $('#content').html('<i id="timer" class="fa fa-user-times"></i> ' + msj('ini_err'));
	// 			// redireccion();
	// 		}
	// 	//},timeSlide);
	// 	return false;
	// });


	
	//	Eventos asociados a la pagina main.php
	//	Eventos asociados a la pagina main.php
	//	Eventos asociados a la pagina main.php
	                                                                                       
	//  ####   ######  #####   #####     ##    #####        ####   ######   ####   #   ####   #    # 
	// #    #  #       #    #  #    #   #  #   #    #      #       #       #       #  #    #  ##   # 
	// #       #####   #    #  #    #  #    #  #    #       ####   #####    ####   #  #    #  # #  # 
	// #       #       #####   #####   ######  #####            #  #            #  #  #    #  #  # # 
	// #    #  #       #   #   #   #   #    #  #   #       #    #  #       #    #  #  #    #  #   ## 
	//  ####   ######  #    #  #    #  #    #  #    #       ####   ######   ####   #   ####   #    # 
	                                                                                           	
	$('#sessionKiller, #sessionKiller2').click(function(){
		SessionKiller();
	});
	
	// $('#sessionKiller, #sessionKiller2, #perfil, #proveedor, #ordencompra , #ordenpedido, #reporte1, #reporte2' ).click(function(){
	// 	//console.log($(this).attr('id'));
	// });
	
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *


	var vista = 'vistas/vista_demo.html';
	var controlador = 'controladores/controller.demo.js';
	var contenedor = '';
	// var nivel = 'Inicio';
	var subnivel= 'Administrar - ' + $(this).text();

	 // #     #  #######  #     #  #     # 
	 // ##   ##  #        ##    #  #     # 
	 // # # # #  #        # #   #  #     # 
	 // #  #  #  #####    #  #  #  #     # 
	 // #     #  #        #   # #  #     # 
	 // #     #  #        #    ##  #     # 
	 // #     #  #######  #     #   #####  
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *                                                                                 
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *                                      
	 // #####   ######  #####   ######  #  #              ######   ####   #####   ####  
	 // #    #  #       #    #  #       #  #              #       #    #    #    #    # 
	 // #    #  #####   #    #  #####   #  #       #####  #####   #    #    #    #    # 
	 // #####   #       #####   #       #  #              #       #    #    #    #    # 
	 // #       #       #   #   #       #  #              #       #    #    #    #    # 
	 // #       ######  #    #  #       #  ######         #        ####     #     ####  
	// - PERFIL
	$("#perfil, #menu_admin_perfil, #menu_jefe_perfil, #menu_secre_perfil, #menu_juridica_perfil, #menu_director_perfil, #menu_bienestar_perfil, #menu_licencia_perfil").on("click", function(event){
		var vista = 'vistas/vista_usuario_contrasena.php';
		var controlador = 'controladores/controller.usuario.contrasena.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Administrar - ' + $(this).text();
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	// - FOTOS
	// 
	$("#menu_admin_perfil_foto, #menu_jefe_perfil_foto, #menu_secre_perfil_foto, #menu_juridica_perfil_foto, #menu_director_perfil_foto, #menu_bienestar_perfil_foto, #menu_licencia_perfil_foto ").on("click", function(event){
		var vista = 'vistas/vista_usuario_foto.php';
		var controlador = 'controladores/controller.usuario.foto.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Administrar - ' + $(this).text();
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});

	 // 
	 // #     #  #######  #     #  #     # 
	 // ##   ##  #        ##    #  #     # 
	 // # # # #  #        # #   #  #     # 
	 // #  #  #  #####    #  #  #  #     # 
	 // #     #  #        #   # #  #     # 
	 // #     #  #        #    ##  #     # 
	 // #     #  #######  #     #   #####  
	 // 
	 // 
	 // 
	// ROOT
	// ######  ####### ####### #######
	// #     # #     # #     #    #
	// #     # #     # #     #    #
	// ######  #     # #     #    #
	// #   #   #     # #     #    #
	// #    #  #     # #     #    #
	// #     # ####### #######    #
	
	$('#menu_admin_registrar_planteles').on("click", function(event){
		console.log($(this).attr('id') + " --> " +  $(this).text());
	});

	// ADMIN - ROOT - ADMINISTRAR - PLANTELES
	$("#menu_admin_registrar_planteles").on("click", function(event){
		var vista = 'vistas/vista_admin_registrar_planteles.php';
		var controlador = 'controladores/controller.admin.registrar.planteles.js';
		var contenedor = '';
		var subnivel= 'Administrar - ' + $(this).text();
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});


	 // ADMIN - INFORMATICA
	 // ###                                                                           
	 //  #   #    #  ######   ####   #####   #    #    ##    #####  #   ####     ##   
	 //  #   ##   #  #       #    #  #    #  ##  ##   #  #     #    #  #    #   #  #  
	 //  #   # #  #  #####   #    #  #    #  # ## #  #    #    #    #  #       #    # 
	 //  #   #  # #  #       #    #  #####   #    #  ######    #    #  #       ###### 
	 //  #   #   ##  #       #    #  #   #   #    #  #    #    #    #  #    #  #    # 
	 // ###  #    #  #        ####   #    #  #    #  #    #    #    #   ####   #    # 

	$( '#menu_admin_periodos, \
		#menu_admin_tipopermisos, \
		#menu_admin_diasferiados, \
		#menu_admin_usuarios, \
		#menu_admin_perfil, \
		#menu_admin_perfil_foto').on("click", function(event){
		console.log($(this).attr('id') + " --> " +  $(this).text());
	});
	
	// ADMIN - INFORMATICA - ADMINISTRAR - PERIODOS ACADEMICOS
	$("#menu_admin_periodos").on("click", function(event){
		var vista = 'vistas/vista_admin_periodo.php';
		var controlador = 'controladores/controller.admin.periodos.js';
		var contenedor = '';
		var subnivel= 'Administrar - ' + $(this).text();
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	
	// ADMIN - INFORMATICA - ADMINISTRAR - TIPOS DE PERMISOS
	$("#menu_admin_tipopermisos").on("click", function(event){
		var contenedor = '';
		// //var nivel = 'Inicio';
		var vista = 'vistas/vista_admin_tipopermisos.php';
		var controlador = 'controladores/controller.admin.tipopermisos.js';
		var subnivel= 'Administrar - ' + $(this).text();
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});

	
	// ADMIN - INFORMATICA - ADMINISTRAR - DIAS FERIADOS
	$("#menu_admin_diasferiados").on("click", function(event){
		var vista = 'vistas/vista_admin_diasferiados.php';
		var controlador = 'controladores/controller.admin.diasferiados.js';
		var contenedor = '';
		// //var nivel = 'Inicio';
		var subnivel= 'Administrar - ' + $(this).text();
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});

	// ADMIN - INFORMATICA - USUARIOS - GESTIONAR
	$("#menu_admin_usuarios").on("click", function(event){
		var vista = 'vistas/vista_admin_usuario.php';
		var controlador = 'controladores/controller.admin.usuario.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Administrar - ' + $(this).text();
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	//* * * * * * * * * * * * * * * * * * *
	// ######   #######  ######    #####   #######  #     #     #     #       
	// #     #  #        #     #  #     #  #     #  ##    #    # #    #       
	// #     #  #        #     #  #        #     #  # #   #   #   #   #       
	// ######   #####    ######    #####   #     #  #  #  #  #     #  #       
	// #        #        #   #          #  #     #  #   # #  #######  #       
	// #        #        #    #   #     #  #     #  #    ##  #     #  #       
	// #        #######  #     #   #####   #######  #     #  #     #  ####### 
	// 
	// MENU DEMO FUNCIONES
	$(' #menu_jefe_registrar_permisos, \
		#menu_jefe_consultar_permisos, \
		#menu_jefe_procesar_permisos, \
		#menu_jefe_registrar_vacaciones, \
		#menu_jefe_consultar_vacaciones, \
		#menu_jefe_procesar_vacaciones, \
		#menu_jefe_demo4').on("click", function(event){
		//alert($(this).text());
		console.log($(this).attr('id') + " --> " +  $(this).text());
		////console.log($(this).text());
	});	
	// PERMISOS
	// PERMISOS
	// PERMISOS
	$('#menu_jefe_registrar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_jefe_registra_permiso.php';
		var controlador = 'controladores/controller.jefe.registrapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Registrar Permisos';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// // 
	$('#menu_jefe_consultar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_jefe_consulta_permiso.php';
		var controlador = 'controladores/controller.jefe.consultapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Consultar Permisos';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	$('#menu_jefe_procesar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_jefe_procesar_permiso.php';
		var controlador = 'controladores/controller.jefe.procesarpermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Procesar Permisos';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// VACACIONES
	// VACACIONES
	// VACACIONES
	$('#menu_jefe_registrar_vacaciones').on("click", function(event){		
		var vista = 'vistas/vista_jefe_registrar_vacaciones.php';
		var controlador = 'controladores/controller.jefe.registrarvacaciones.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Registrar Vacaciones';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	$('#menu_jefe_procesar_vacaciones').on("click", function(event){		
		var vista = 'vistas/vista_jefe_procesar_vacaciones.php';
		var controlador = 'controladores/controller.jefe.procesarvacaciones.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Procesar Vacaciones';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	$('#menu_jefe_consultar_vacaciones').on("click", function(event){		
		var vista = 'vistas/vista_jefe_consulta_vacaciones.php';
		var controlador = 'controladores/controller.jefe.consultavacaciones.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Consultar Vacaciones';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// // 
	// $('#menu_jefe_demo2').on("click", function(event){		
	// 	var vista = 'vistas/vista_conectividad1.php';
	// 	var controlador = 'controladores/controller.demo.js';
	// 	var contenedor = '';
	// 	//var nivel = 'Inicio';
	// 	var subnivel= 'Informaci\u00f3n';
	// 	var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
	// 	CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	// });
	// // 
	// $('#menu_jefe_demo3' ).on("click", function(event){		
	// 	var vista = 'vistas/template_forms.html';
	// 	var controlador = 'controladores/controller.demo.js';
	// 	var contenedor = '';
	// 	//var nivel = 'Inicio';
	// 	var subnivel= 'Informaci\u00f3n';
	// 	var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
	// 	CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	// });
	// // 
	// $('#menu_jefe_demo4' ).on("click", function(event){		
	// 	var vista = 'vistas/vista_planilla_full.html';
	// 	var controlador = 'controladores/controller.demo.js';
	// 	var contenedor = '';
	// 	//var nivel = 'Inicio';
	// 	var subnivel= 'Informaci\u00f3n';
	// 	var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
	// 	CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	// });
	
//  #####   #######   #####   ######            ######   #######  ######    #####   #######  #     #     #     #       
// #     #  #        #     #  #     #           #     #  #        #     #  #     #  #     #  ##    #    # #    #       
// #        #        #        #     #           #     #  #        #     #  #        #     #  # #   #   #   #   #       
//  #####   #####    #        ######            ######   #####    ######    #####   #     #  #  #  #  #     #  #       
//       #  #        #        #   #    ###      #        #        #   #          #  #     #  #   # #  #######  #       
// #     #  #        #     #  #    #   ###      #        #        #    #   #     #  #     #  #    ##  #     #  #       
//  #####   #######   #####   #     #  ###      #        #######  #     #   #####   #######  #     #  #     #  ####### 

// MENU DEMO FUNCIONES
	$(' #menu_secretaria_registrar_permisos, \
		#menu_secretaria_consultar_permisos, \
		#menu_secretaria_consultar_vacaciones, \
		#menu_secretaria_procesar_vacaciones, \
		#menu_secre_demo4').on("click", function(event){
		//alert($(this).text());
		console.log($(this).attr('id') + " --> " +  $(this).text());
		////console.log($(this).text());
	});	
	// rol - demos - copy - paste
	// 
	// PERMISOS
	// 
	$('#menu_secretaria_registrar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_secretaria_registra_permiso.php';
		var controlador = 'controladores/controller.secretaria.registrapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Registrar Permisos';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	$('#menu_secretaria_consultar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_secretaria_consulta_permiso.php';
		var controlador = 'controladores/controller.secretaria.consultapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Consultar Permisos';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	// VACACIONES
	// 
	$('#menu_secretaria_procesar_vacaciones').on("click", function(event){		
		var vista = 'vistas/vista_secretaria_procesar_vacaciones.php';
		var controlador = 'controladores/controller.secretaria.procesarvacaciones.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Procesar Vacaciones';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	$('#menu_secretaria_consultar_vacaciones').on("click", function(event){		
		var vista = 'vistas/vista_secretaria_consulta_vacaciones.php';
		var controlador = 'controladores/controller.secretaria.consultavacaciones.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Consultar Vacaciones';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});


	

//       #  #     #  ######   ###  ######   ###   #####      #    
//       #  #     #  #     #   #   #     #   #   #     #    # #   
//       #  #     #  #     #   #   #     #   #   #         #   #  
//       #  #     #  ######    #   #     #   #   #        #     # 
// #     #  #     #  #   #     #   #     #   #   #        ####### 
// #     #  #     #  #    #    #   #     #   #   #     #  #     # 
//  #####    #####   #     #  ###  ######   ###   #####   #     # 
// MENU DEMO FUNCIONES
	$(' #menu_juridica_registrar_permisos, \
		#menu_juridica_consultar_permisos, \
		#menu_secre_demo3, \
		#menu_secre_demo4').on("click", function(event){
		//alert($(this).text());
		console.log($(this).attr('id') + " --> " +  $(this).text());
		////console.log($(this).text());
	});	
	// rol - demos - copy - paste
	$('#menu_juridica_registrar_permisos').on("click", function(event){		
		// var vista = 'vistas/vista_juridica_registra_permiso.php';
		// var controlador = 'controladores/controller.juridica.registrapermisos.js';
		var vista = 'vistas/vista_juridica_registra_permiso.php';
		var controlador = 'controladores/controller.juridica.registrapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Informaci\u00f3n';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	$('#menu_juridica_consultar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_juridica_consulta_permiso.php';
		var controlador = 'controladores/controller.juridica.consultapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Informaci\u00f3n';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});



// #        ###   #####   #######  #     #   #####   ###     #    
// #         #   #     #  #        ##    #  #     #   #     # #   
// #         #   #        #        # #   #  #         #    #   #  
// #         #   #        #####    #  #  #  #         #   #     # 
// #         #   #        #        #   # #  #         #   ####### 
// #         #   #     #  #        #    ##  #     #   #   #     # 
// #######  ###   #####   #######  #     #   #####   ###  #     # 
// 
// MENU DEMO FUNCIONES
	$(' #menu_licencia_registrar_licencia, \
		#menu_bienestar_consultar_denuncias, \
		#menu_licencia_registrar_suplente, \
		#menu_secre_demo4').on("click", function(event){
		//alert($(this).text());
		console.log($(this).attr('id') + " --> " +  $(this).text());
		////console.log($(this).text());
	});	
	// rol - demos - copy - paste
	$('#menu_licencia_registrar_licencia').on("click", function(event){		
		// var vista = 'vistas/vista_juridica_registra_permiso.php';
		// var controlador = 'controladores/controller.juridica.registrapermisos.js';
		var vista = 'vistas/vista_licencia_registrar_licencia.php';
		var controlador = 'controladores/controller.licencia.registrarlicencia.js';

		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Registrar Licencias';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	// $('#menu_licencia_consultar_licencia').on("click", function(event){		
	// 	var vista = 'vistas/vista_licencia_consultar_licencia.php';
	// 	var controlador = 'controladores/controller.licencia.registrarlicencia.js';
	// 	var contenedor = '';
	// 	//var nivel = 'Inicio';
	// 	var subnivel= 'Informaci\u00f3n';
	// 	var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
	// 	CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	// });
	$('#menu_licencia_registrar_suplente').on("click", function(event){		
		var vista = 'vistas/vista_licencia_registrar_suplente.php';
		var controlador = 'controladores/controller.licencia.registrarsuplentes.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Suplentes';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});



// ######   ###  #######  #     #  #######   #####   #######     #     ######  
// #     #   #   #        ##    #  #        #     #     #       # #    #     # 
// #     #   #   #        # #   #  #        #           #      #   #   #     # 
// ######    #   #####    #  #  #  #####     #####      #     #     #  ######  
// #     #   #   #        #   # #  #              #     #     #######  #   #   
// #     #   #   #        #    ##  #        #     #     #     #     #  #    #  
// ######   ###  #######  #     #  #######   #####      #     #     #  #     # 

// MENU DEMO FUNCIONES
	$(' #menu_bienestar_registra_denuncias, \
		#menu_bienestar_consultar_denuncias, \
		#menu_secre_demo3, \
		#menu_secre_demo4').on("click", function(event){
		//alert($(this).text());
		console.log($(this).attr('id') + " --> " +  $(this).text());
		////console.log($(this).text());
	});	
	// rol - demos - copy - paste
	$('#menu_bienestar_registra_denuncias').on("click", function(event){		
		// var vista = 'vistas/vista_juridica_registra_permiso.php';
		// var controlador = 'controladores/controller.juridica.registrapermisos.js';
		var vista = 'vistas/vista_bienestar_registra_denuncia.php';
		var controlador = 'controladores/controller.bienestar.registradenuncia.js';

		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Registrar Denuncia';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	$('#menu_bienestar_consultar_denuncias').on("click", function(event){		
		var vista = 'vistas/vista_carousel.html';
		var controlador = 'controladores/controller.juridica.consultapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Informaci\u00f3n';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
//      #  ######  ######  ######      #  #    #  #    #  ######  #####   #    ##    #####   ####  
//      #  #       #       #           #  ##   #  ##  ##  #       #    #  #   #  #     #    #    # 
//      #  #####   #####   #####       #  # #  #  # ## #  #####   #    #  #  #    #    #    #    # 
//      #  #       #       #           #  #  # #  #    #  #       #    #  #  ######    #    #    # 
// #    #  #       #       #           #  #   ##  #    #  #       #    #  #  #    #    #    #    # 
//  ####   ######  #       ######      #  #    #  #    #  ######  #####   #  #    #    #     ####  


// MENU DEMO FUNCIONES
	$(' #menu_director_registrar_permisos, \
		#menu_director_consultar_permisos, \
		#menu_director_registrar_denuncias, \
		#menu_director_consultar_denuncias, \
		#menu_director_registrar_vacaciones, \
		#menu_director_consultar_vacaciones').on("click", function(event){
		//alert($(this).text());
		console.log($(this).attr('id') + " --> " +  $(this).text());
		////console.log($(this).text());
	});	
	// PERMISOS
	$('#menu_director_registrar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_director_registra_permiso.php';
		var controlador = 'controladores/controller.director.registrapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Registrar Permisos Cortos';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	$('#menu_director_consultar_permisos').on("click", function(event){		
		var vista = 'vistas/vista_director_consulta_permiso.php';
		var controlador = 'controladores/controller.director.consultapermisos.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Informaci\u00f3n  - Consultar Permisos';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	// 
	// VACACIONES
	$('#menu_director_registrar_vacaciones' ).on("click", function(event){		
		var vista = 'vistas/vista_director_registra_vacaciones.php';
		var controlador = 'controladores/controller.director.registravacaciones.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Informaci\u00f3n';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	// 
	$('#menu_director_consultar_vacaciones' ).on("click", function(event){		
		var vista = 'vistas/vista_director_consulta_vacaciones.php';
		var controlador = 'controladores/controller.director.consultavacaciones.js';
		var contenedor = '';
		//var nivel = 'Inicio';
		var subnivel= 'Informaci\u00f3n';
		var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
		CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	});
	//
	//
	// // DENUNCIAS
	// $('#menu_director_registrar_vacaciones' ).on("click", function(event){		
	// 	var vista = 'vistas/vista_carousel.html';
	// 	var controlador = 'controladores/controller.demo.js';
	// 	var contenedor = '';
	// 	//var nivel = 'Inicio';
	// 	var subnivel= 'Informaci\u00f3n';
	// 	var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
	// 	CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	// });
	// // 
	// $('#menu_director_consultar_vacaciones' ).on("click", function(event){		
	// 	var vista = 'vistas/vista_carousel.html';
	// 	var controlador = 'controladores/controller.demo.js';
	// 	var contenedor = '';
	// 	//var nivel = 'Inicio';
	// 	var subnivel= 'Informaci\u00f3n';
	// 	var parametros = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&';
	// 	CargarHtml(vista,controlador,contenedor,subnivel,parametros);
	// });






	 // #######                                                                  #####                                                                  
	 // #        #    #  #    #   ####   #   ####   #    #  ######   ####       #     #  ######  #    #  ######  #####     ##    #       ######   ####  
	 // #        #    #  ##   #  #    #  #  #    #  ##   #  #       #           #        #       ##   #  #       #    #   #  #   #       #       #      
	 // #####    #    #  # #  #  #       #  #    #  # #  #  #####    ####       #  ####  #####   # #  #  #####   #    #  #    #  #       #####    ####  
	 // #        #    #  #  # #  #       #  #    #  #  # #  #            #      #     #  #       #  # #  #       #####   ######  #       #            # 
	 // #        #    #  #   ##  #    #  #  #    #  #   ##  #       #    #      #     #  #       #   ##  #       #   #   #    #  #       #       #    # 
	 // #         ####   #    #   ####   #   ####   #    #  ######   ####        #####   ######  #    #  ######  #    #  #    #  ######  ######   ####  
	                                                                                                                                                 
	                                                                                                                                                 
	//	* * * * * * Funciones generales * * * * * *
	//	* * * * * * Funciones generales * * * * * *
	//	* * * * * * Funciones generales * * * * * *

	/* @description Permite cargar una Vista HTML con su archivo JS
	 * @param {String} vista URL de la vista html
	 * @param {String} controlador URL del controlador JS
	 * @param {String} nivel Valor del Breadcund Nivel
	 * @param {String} subnivel Valor del Breadcund subnivel
	 */
	function CargarHtml(vista,controlador,contenedor,subnivel,parametros) {
		//console.log(parametros);
		controlador || ( controlador = null ) ;
		contenedor || ( contenedor = '#content') ;
		parametros || ( parametros = '') ;
		//console.log(parametros);
		dato_usuario = parametros;
		
		$(contenedor).html('<span class="timer" id="timer"></span>Cargando por favor espere');
		// * * * * * * * * * * * * * * * * * * * * * * *
		//Cargamos el Archivo HTML/PHP
		$.ajax({
			type: 'POST',
			url: vista,
			//encoding:"UTF-8",
			//contentType: "charset=utf-8", 
			//data: 'name_user='+name_user+'&foto_user='+foto_user+'&token1='+rand_code(),
			data: parametros + 'token1='+rand_code(),
			success:function(response){
				$('#breadcrumb_subnivel').html(subnivel);
				$('#header_principal').html(subnivel);
				
				$(contenedor).html(response);
				if (controlador!=null) {
					CargarJS(controlador)
				}
			},
			error:function(){
				$(contenedor).html('<span class="timer" id="timer"></span>' + msj('res_err'));
				MostrarNotificacion(msj('res_err'));
				redireccion(1,5000);
			}
		});
	}
	
	/* @description Permite cargar una Vista HTML con su archivo JS
	 * @param {String} vista URL de la vista html
	 * @param {String} controlador URL del controlador JS
	 * @param {String} nivel Valor del Breadcund Nivel
	 * @param {String} subnivel Valor del Breadcund subnivel
	 */
	function CargarHtmlInicio(vista,controlador,contenedor,subnivel) {
		controlador || ( controlador = null ) ;
		var name_user = $('#name_user').text();
		var foto_user    = $('#foto_user').attr('src');
		$('#content').html('<span class="timer" id="timer"></span>Cargando por favor espere');
		// * * * * * * * * * * * * * * * * * * * * * * *
		//Cargamos el Archivo HTML/PHP
		$.ajax({
			type: 'POST',
			url: vista,
			//encoding:"UTF-8",
			//contentType: "charset=utf-8", 
			data: 'name_user='+name_user+'&foto_user='+foto_user+'&token1='+rand_code(),
			success:function(response){
				$('#breadcrumb_subnivel').html(subnivel);
				$('#content').html(response);
				if (controlador!=null) {
					CargarJS(controlador)
				}
			},
			error:function(){
				$('#content').html('<span class="timer" id="timer"></span>' + msj('res_err'));
				MostrarNotificacion(msj('res_err'));
				redireccion(1,1000);
			}
		});
	}
	
	function Consulta_Ajax_Modal(accion,servicio,parametros,contenedor) {
		//console.log("Consulta_Ajax");
		accion || ( accion = null ) ;
		servicio || ( servicio = null ) ;
		parametros || ( parametros = '') ;
		contenedor || ( contenedor = '#content') ;
		//servicio = "servicios/servicios.admin.cargos.php?nocache=" + Math.random();
		$(contenedor).html('<span class="timer" id="timer"></span>Enviando datos... por favor espere');
		// * * * * * * * * * * * * * * * * * * * * * * *
		//Cargamos el Archivo HTML/PHP    
		$.ajax({
			type: 'POST',
			url: servicio,
			//encoding:"UTF-8",
			//contentType: "charset=utf-8", 
			data: parametros + "&token1="+rand_code(),
			success:function(response){
				$(contenedor).html(response);
			},
			error:function(){
				$(contenedor).html('<span class="timer" id="timer"></span>' + msj('res_err'));
				MostrarNotificacion(msj('res_err'));
				redireccion(1,10000);
			}
		});    
	}

	/* @description Permite cargar un archivo JS
	 * @param {String} controlador URL del controlador JS
	 */
	function CargarJS(controlador) {
		//code
		// * * * * * * * * * * * * * * * * * * * * * * *
		//Cargamos el Archivo JS
		$.getScript( controlador)
		.done(function( script, textStatus ) {
			//console.log( textStatus );
		})
		.fail(function( jqxhr, settings, exception ) {
			//$( "#div.log" ).text( "Triggered ajaxError handler." );
			MostrarNotificacion('Triggered ajax Error handler.');
		});
	}
	
	function pruebafuncion() {
		//code
		console.log("pruebafuncion");
	}
	
	function redireccion(link,tiempo){
		//console.log('redireccionando ' + hora() );
		link || ( link = 0) ;
		tiempo || ( tiempo = 500 );
		if (link==0) {
			link='servicios/logout.php';
		}
		if (link==1) {
			link='main.php';
		}
		setTimeout(function(){
			window.location.href = link;
		},(timeSlide + tiempo));
	}

	function SessionKiller() {
		var mensajesalir = tildes_unicode('Cerrando la sesión');
		$('#content').html('<span class="timer" id="timer"></span>' + msj('ini_out'));
		$('#timer').fadeIn(300);
		$('#alertBoxes').html('<div class="box-success"></div>');
		$('.box-danger').hide(0).html('Espera un momento&#133;');
		$('.box-danger').slideDown(timeSlide);
		redireccion(0,10);
	}

});

function pruebafuncion2() {
	//code
	console.log("pruebafuncion2");
}
/* @description Consulta Ajax retorna arreglo en json
 * @param {accion} valor del accion
 * @param {servicio} url del sercvio php
 * @param {parmetros} parametros adicionales 
 */
function Consulta_Ajax_JSON(accion,servicio,parametros) {
		//console.log("Consulta_Ajax");
		accion || ( accion = null ) ;
		servicio || ( servicio = null ) ;
		parametros || ( parametros = '') ;
		// console.log(accion,servicio);
		// console.log(parametros);
		//contenedor || ( contenedor = '#content') ;
		//servicio = "servicios/servicios.admin.cargos.php?nocache=" + Math.random();
		//$(contenedor).html('<span class="timer" id="timer"></span>Enviando datos... por favor espere');
		// * * * * * * * * * * * * * * * * * * * * * * *
		//Cargamos el Archivo HTML/PHP    
		$.ajax({
			type: 'POST',
			url: servicio,
			//encoding:"UTF-8",
			//contentType: "charset=utf-8", 
			data: parametros + "&token1="+rand_code(),
			success:function(response){
				//console.log(response);
				//var objeto = JSON.parse(response);
				//console.log(objeto);
				return(response)
				//$('#content').html(JSON.parse(response));
			},
			error:function(){
				//$(contenedor).html('<span class="timer" id="timer"></span>' + msj('res_err'));
				MostrarNotificacion(msj('res_err'));
				//redireccion(1,10000);
			}
		});    
	}
		
	
	
// * * * * * * Chuletarios * * * * * * * * *
// * * * * * * Chuletarios * * * * * * * * *
// * * * * * * Chuletarios * * * * * * * * *

//    class="content' 	-> $('.content')
//    id="content' 	-> $('#content')

//var valorInput = $("#unInput").val();
//var valorSpan = $("#unSpan").text();
//var valorDiv = $("#unDiv").html();



// ######   #######  ######    #####   #######  #     #     #     #       
// #     #  #        #     #  #     #  #     #  ##    #    # #    #       
// #     #  #        #     #  #        #     #  # #   #   #   #   #       
// ######   #####    ######    #####   #     #  #  #  #  #     #  #       
// #        #        #   #          #  #     #  #   # #  #######  #       
// #        #        #    #   #     #  #     #  #    ##  #     #  #       
// #        #######  #     #   #####   #######  #     #  #     #  ####### 



//  #####   #######   #####   ######            ######   #######  ######    #####   #######  #     #     #     #       
// #     #  #        #     #  #     #           #     #  #        #     #  #     #  #     #  ##    #    # #    #       
// #        #        #        #     #           #     #  #        #     #  #        #     #  # #   #   #   #   #       
//  #####   #####    #        ######            ######   #####    ######    #####   #     #  #  #  #  #     #  #       
//       #  #        #        #   #    ###      #        #        #   #          #  #     #  #   # #  #######  #       
// #     #  #        #     #  #    #   ###      #        #        #    #   #     #  #     #  #    ##  #     #  #       
//  #####   #######   #####   #     #  ###      #        #######  #     #   #####   #######  #     #  #     #  ####### 



//       #  #     #  ######   ###  ######   ###   #####      #    
//       #  #     #  #     #   #   #     #   #   #     #    # #   
//       #  #     #  #     #   #   #     #   #   #         #   #  
//       #  #     #  ######    #   #     #   #   #        #     # 
// #     #  #     #  #   #     #   #     #   #   #        ####### 
// #     #  #     #  #    #    #   #     #   #   #     #  #     # 
//  #####    #####   #     #  ###  ######   ###   #####   #     # 



// #        ###   #####   #######  #     #   #####   ###     #    
// #         #   #     #  #        ##    #  #     #   #     # #   
// #         #   #        #        # #   #  #         #    #   #  
// #         #   #        #####    #  #  #  #         #   #     # 
// #         #   #        #        #   # #  #         #   ####### 
// #         #   #     #  #        #    ##  #     #   #   #     # 
// #######  ###   #####   #######  #     #   #####   ###  #     # 



// ######   ###  #######  #     #  #######   #####   #######     #     ######  
// #     #   #   #        ##    #  #        #     #     #       # #    #     # 
// #     #   #   #        # #   #  #        #           #      #   #   #     # 
// ######    #   #####    #  #  #  #####     #####      #     #     #  ######  
// #     #   #   #        #   # #  #              #     #     #######  #   #   
// #     #   #   #        #    ##  #        #     #     #     #     #  #    #  
// ######   ###  #######  #     #  #######   #####      #     #     #  #     # 


                                                                                                 
 //      #  ######  ######  ######      #  #    #  #    #  ######  #####   #    ##    #####   ####  
 //      #  #       #       #           #  ##   #  ##  ##  #       #    #  #   #  #     #    #    # 
 //      #  #####   #####   #####       #  # #  #  # ## #  #####   #    #  #  #    #    #    #    # 
 //      #  #       #       #           #  #  # #  #    #  #       #    #  #  ######    #    #    # 
 // #    #  #       #       #           #  #   ##  #    #  #       #    #  #  #    #    #    #    # 
 //  ####   ######  #       ######      #  #    #  #    #  ######  #####   #  #    #    #     ####  
                                                                                                 