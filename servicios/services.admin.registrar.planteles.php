<?php 
	// NOTA: Esta enlazado con postgres
	// require('../conf/config.postgres.php');
	// require('../apiv3.0/funciones/postgres.class.php');

	// NOTA: Esta enlazado con mysql
	// require('../conf/config.login.php');
	// require('../apiv3.0/funciones/mysql.class.php'); 
?>
<?php require('../conf/config.postgres.php');?>
<?php require('../apiv3.0/funciones/postgres.class.php'); ?>
<?php require('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
//{"txt_codigo_periodo":"","txt_nombre_periodo":"oswaldo","txt_rango_fecha":"01/07/2016 - 01/09/2016","txt_fecha_inicio":"","txt_fecha_cierre":"","txt_radio_estatus":"0","accion":"agregar_periodos"}
	//echo DB_SERVER. "<br>";
	//echo DB_NAME. "<br>";
	//echo DB_USER. "<br>";
	//echo DB_PASSWORD. "<br>";
	//echo DB_DRIVER. "<br>";	
	//echo "Desde servicios: ".getcwd() . "\n";
	//sleep(2);
	//ver_arreglo($_POST);
	$datos = array();
	if ($_POST){
		$datos=$_POST;	
	}
	if ($_GET){
		$datos=$_GET;	
	}
	//Array
	//(
	//		[txt_codigo_periodo] => 
	//		[txt_nombre_periodo] => periodo nnn
	//		[txt_rango_fecha] => 01/09/2016 - 01/10/2016
	//		[txt_fecha_inicio] => 
	//		[txt_fecha_cierre] => 
	//		[txt_radio_estatus] => 0
	//		[accion] => agregar_periodos
	//		[token1] => 4f3:;EB15E360;¡BB!c1
	//)
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	//ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_periodos"
	switch ($accion){
		case 'consultar_periodos':
			consulta_periodos($datos);
		break;
		case 'agregar_periodos':
			agregar_periodos($datos);
		break;
		case 'modificar_periodos':
			modificar_periodos($datos);
		break;
		case 'eliminar_periodos':
			eliminar_periodos($datos);
		break;
		case 'consultar_periodos_filtro':
			consultar_periodos_filtro($datos);
		break;
	}
?>
<?php
	function consulta_periodos($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		$sql = "SELECT 	id_periodo, 
						nombre_periodo, 
						fecha_inicio, 
						fecha_cierre, 
						fecha_recaudo_ini, 
						fecha_recaudo_fin, 
						id_jefe_personal, 
						id_jefezona, 
						estatus, 
						observacion
						FROM permisos.periodo ORDER BY id_periodo";
		$dato=consultar($sql,$Postgres);
		$NumeroDeFilas = $Postgres->NumeroDeFilas();
		if ($NumeroDeFilas>0) {
			echo json_encode($dato);
		}else{
			echo 'false';
		}
	}
?>
<?php
	function consultar_periodos_filtro($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		$sql = "SELECT 	id_periodo, 
										nombre_periodo, 
										fecha_inicio, 
										fecha_cierre, 
										fecha_recaudo_ini, 
       							fecha_recaudo_fin, 
       							id_jefe_personal, 
       							id_jefezona, 
       							estatus, 
       							observacion
						FROM permisos.periodo ORDER BY id_periodo DESC";
		$dato=consultar($sql,$Postgres);
		$NumeroDeFilas = $Postgres->NumeroDeFilas();
		if ($NumeroDeFilas>0) {
			echo json_encode($dato);
		}else{
			echo 'false';
		}
	}
?>
<?php
	function agregar_periodos($datos) {
		// INICIA LA CONEXION CON EL SERVIDOR 
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		//$data = split("@",$datos);
		//$data = explode("@",$datos);
		//ver_arreglo($datos);
		//die();
		// PARAMETROS DEL FORMULARIO
			$txt_codigo_periodo	=	$_POST['txt_codigo_periodo']; //
			$txt_nombre_periodo	=	$_POST['txt_nombre_periodo']; //	oswaldo",
			// 
			$txt_rango_fecha		=	$_POST['txt_rango_fecha']; //	01/09/2016_-_01/09/2016",
			$fechas = explode(" - ", $txt_rango_fecha);
			$txt_fecha_inicio		=	date("Y-m-d", strtotime($fechas[0]));//	",
			$txt_fecha_cierre		=	date("Y-m-d", strtotime($fechas[1])); //	",
			// 
			$txt_rango_fecha_reca		=	$_POST['txt_fecha_recaudo']; //	01/09/2016_-_01/09/2016",
			$fechas_reca = explode(" - ", $txt_rango_fecha_reca);
			$txt_fecha_inicio_reca		=	date("Y-m-d", strtotime($fechas_reca[0]));//	",
			$txt_fecha_cierre_reca		=	date("Y-m-d", strtotime($fechas_reca[1])); //	",
			// 
			$txt_radio_estatus	=	$_POST['txt_radio_estatus']; //	0",/
			//PARAMETROS DE LA SESION - USUARIO
			//		$dptouser 								= $_POST['dptouser']; // => Administración
			//		$cargouser 								= $_POST['cargouser']; // => Estudiante
			//		$userestatus 							= $_POST['userestatus']; // => activo
			//		$userced 									= $_POST['userced']; // => 25888999
			//		$sesionencode 						= $_POST['sesionencode']; // => sesion_userid'=4
			//		$sesion_username 					= $_POST['sesion_username']; // => estu
			//		$sesion_nivel_usuario 		= $_POST['sesion_nivel_usuario']; // => 3
			//		$sesion_id_persona 				= $_POST['sesion_id_persona']; // => 3
			//		$sesion_ingreso 					= $_POST['sesion_ingreso']; // => 2016-01-02 17:28:44
			//		$sesion_idpersona 				= $_POST['sesion_idpersona']; // => 3
			//		$sesion_usernombre 				= $_POST['sesion_usernombre']; // => Luis Rivero
			//		$sesion_cedula 						= $_POST['sesion_cedula']; // => 25888999
			//		$sesion_userfoto 					= $_POST['sesion_userfoto']; // => 25888999
			//		$sesion_iddepartamento 		= $_POST['sesion_iddepartamento']; // => 1
			//		$sesion_departamento 			= $_POST['sesion_departamento']; // => Administración
			//		$sesion_cargo 						= $_POST['sesion_cargo']; // => Estudiante
			//		$sesion_estatus 					= $_POST['sesion_estatus']; // => activo
			//		$sesion_ultimiacceso 			= $_POST['sesion_ultimiacceso']; // => 2016-1-2 19:01:20
			//		
			//		$sesion_id_periodo 				= $_POST['sesion_id_periodo']; //  => 1
			//    $sesion_nombre_periodo 		= $_POST['sesion_nombre_periodo_periodo']; //  => 2015-2016
			//    $sesion_fechaini_periodo 	= $_POST['sesion_fecha_inicio_periodo']; //  => 2015-10-01
			//    $sesion_fechacie_periodo 	= $_POST['sesion_fecha_cierre_periodo']; //  => 2016-10-01
			//    $sesion_estatus_periodo 	= $_POST['sesion_estatus_periodo']; //  => 1
			//		 
			//		$accion 									= $_POST['accion']; // => agregar_cursos_dirigidos
			//		$token1 									= $_POST['token1']; // => 86D¡0:2fff39d2242EE3
		//************************************
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		$numero_solicitud = uniqid();
			// CONSULTA SQL A GENERAR
			$sql =		"INSERT INTO permisos.periodo(
									nombre_periodo, 
									fecha_inicio, 
									fecha_cierre, 
									fecha_recaudo_ini, 
									fecha_recaudo_fin, 
									id_jefe_personal, 
									id_jefezona, 
									estatus, 
									observacion)
							  VALUES (
											'$txt_nombre_periodo', 
											'$txt_fecha_inicio', 
											'$txt_fecha_cierre', 
											'$txt_fecha_inicio_reca', 
							        '$txt_fecha_cierre_reca', 
							        '', 
							        '', 
							        '$txt_radio_estatus', 
							        '')";
		$dato=consultar($sql,$Postgres);
		$NumeroDeFilas = $Postgres->NumeroDeFilas();
		if ($NumeroDeFilas>0) {
			// echo json_encode($dato);
			$cadena = "insert@";
		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}
?>
<?php
	function modificar_periodos($datos) {
		// INICIA LA CONEXION CON EL SERVIDOR 
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// PARAMETROS DEL FORMULARIO
		$txt_codigo_periodo	=	$_POST['txt_codigo_periodo']; //
		$txt_nombre_periodo	=	$_POST['txt_nombre_periodo']; //	oswaldo",
		// 
		$txt_rango_fecha		=	$_POST['txt_rango_fecha']; //	01/09/2016_-_01/09/2016",
		$fechas = explode(" - ", $txt_rango_fecha);
		$txt_fecha_inicio		=	date("Y-m-d", strtotime($fechas[0]));//	",
		$txt_fecha_cierre		=	date("Y-m-d", strtotime($fechas[1])); //	",
		// 
		$txt_rango_fecha_reca		=	$_POST['txt_fecha_recaudo']; //	01/09/2016_-_01/09/2016",
		$fechas_reca = explode(" - ", $txt_rango_fecha_reca);
		$txt_fecha_inicio_reca		=	date("Y-m-d", strtotime($fechas_reca[0]));//	",
		$txt_fecha_cierre_reca		=	date("Y-m-d", strtotime($fechas_reca[1])); //	",
		// 
		$txt_radio_estatus	=	$_POST['txt_radio_estatus']; //	0",		
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		$numero_solicitud = uniqid();
		// CONSULTA SQL A GENERAR
		$sql = "UPDATE permisos.periodo
   					SET nombre_periodo='$txt_nombre_periodo', 
   							fecha_inicio='$txt_fecha_inicio', 
   							fecha_cierre='$txt_fecha_cierre', 
       					fecha_recaudo_ini='$txt_fecha_inicio_reca', 
       					fecha_recaudo_fin='$txt_fecha_cierre_reca', 
       					id_jefe_personal='', 
       					id_jefezona='', 
       					estatus='$txt_radio_estatus', 
       					observacion=''
 						WHERE id_periodo=$txt_codigo_periodo";

		$dato=consultar($sql,$Postgres);
		$NumeroDeFilas = $Postgres->NumeroDeFilasAfectadas();
		if($NumeroDeFilas>0) {
			// echo json_encode($dato);
			$cadena = "update@";
		}else{
		 	$cadena = "false@";
		}
		print_r($cadena);
	}
?>
<?php
	function eliminar_periodos($datos) {
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// PARAMETROS DEL FORMULARIO
		$txt_id_articulo	=	$datos['id_periodo'];
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		$numero_solicitud = uniqid();
		// CONSULTA SQL A GENERAR
		$sql = "DELETE FROM permisos.periodo WHERE id_periodo = $txt_id_articulo";
		// EJECUTAR LA CONSULTA
		$dato=consultar($sql,$Postgres);
		$NumeroDeFilas = $Postgres->NumeroDeFilasAfectadas();
		if ($NumeroDeFilas>0) {
			// echo json_encode($dato);
			$cadena = "eliminado@";
		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}
?>