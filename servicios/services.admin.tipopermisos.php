<?php //require('../conf/config.php');?>
<?php require('../conf/config.postgres.php');?>
<?php require('../apiv3.0/funciones/postgres.class.php'); ?>
<?php require('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
//{"txt_codigo_periodo":"","txt_nombre_periodo":"oswaldo","txt_rango_fecha":"01/07/2016 - 01/09/2016","txt_fecha_inicio":"","txt_fecha_cierre":"","txt_radio_estatus":"0","accion":"agregar_tipo_permisos"}
	//echo DB_SERVER. "<br>";
	//echo DB_NAME. "<br>";
	//echo DB_USER. "<br>";
	//echo DB_PASSWORD. "<br>";
	//echo DB_DRIVER. "<br>";	
	//echo "Desde servicios: ".getcwd() . "\n";
	//sleep(2);
	// ver_arreglo($_POST);
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
	//		[accion] => agregar_tipo_permisos
	//		[token1] => 4f3:;EB15E360;¡BB!c1
	//)
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	//ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_tipo_permisos"
	switch ($accion){
		case 'consultar_permisos':
			consultar_permisos($datos);
		break;
		case 'agregar_tipo_permisos':
			agregar_tipo_permisos($datos);
		break;
		case 'modificar_tipos_permisos':
			modificar_tipos_permisos($datos);
		break;
		case 'eliminar_tipos_permisos':
			eliminar_tipos_permisos($datos);
		break;
		case 'consultar_tipopermisos_filtro':
			consultar_tipopermisos_filtro($datos);
		break;
	}
?>
<?php
	function consultar_permisos($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		//
		$sql = "SELECT 
				id_tipopermiso, 
				tipo_permiso, 
				CASE WHEN tipo_permiso=1 THEN 'Obligatorio'
				     WHEN tipo_permiso=2 THEN 'Postestativo'
				END AS tipo_permiso_txt,  
				nombre_tipo, 
				numero_dias, 
				reglas_legal, 
				recaudos, 
				id_tipo_personal, 
				CASE WHEN id_tipo_personal=1 THEN 'Administrativo'
				     WHEN id_tipo_personal=2 THEN 'Docente'
				     WHEN id_tipo_personal=3 THEN 'Obrero'
				END AS id_tipo_personal_txt,
				fecha_registro, 
				estatus
			  FROM permisos.tipo_permiso
			  ORDER BY estatus DESC, id_tipo_personal, tipo_permiso, id_tipopermiso;";
		// ver_arreglo($sql); 
  		// $dato=consultar($sql,$Postgres);
		$dato=consultar($sql,$Postgres);
  		// ver_arreglo($dato);
  		$NumeroDeFilas = $Postgres->NumeroDeFilas();
  		// ver_arreglo($NumeroDeFilas);
  		// die();
  		if ($NumeroDeFilas>0) {
  			echo json_encode($dato);
  		}else{
  			echo 'false';
  		}
	}
?>
<?php
	function consultar_tipopermisos_filtro($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		$tipo_personal_txt 	=	$datos['tipo_personal'];
		$tipo_usuario 	= 	$datos['tipo_usuario'];
		if ($tipo_personal_txt=='administrativo') 	$tipo_personal=1;
		if ($tipo_personal_txt=='docente') 			$tipo_personal=2;
		if ($tipo_personal_txt=='obrero') 			$tipo_personal=3;
		
		//
		$texto_dias_permisos ="";
		
		if ($tipo_usuario=='director' ){
			$texto_dias_permisos.= " OR numero_dias IN ('1C','2C','3C','1H','2H','3H') ";  //-- PERMISOS CORTOS  
		}
		
		if ($tipo_usuario=='secretaria' ){
			$cadena_diasC = "";
			$cadena_diasH = "";
			for ($i=4; $i <=15 ; $i++) { 
				if ($i<15) {	
					$cadena_diasC.=	"'". $i ."C',"."'". $i ."H'," ;
			 	}else{
					$cadena_diasC.=	"'". $i ."C',"."'". $i ."H'" ;
				} 
				// ver_arreglo($cadena_diasC);
			}
			$texto_dias_permisos.= " OR numero_dias IN (".$cadena_diasC.") ";
			// $texto_dias_permisos.= " OR numero_dias IN ('4C','5C','6C','7C','8C','9C','10C','11C','12C','13C','14C','15C') "; // --PERMISOS MEDIOS  
			// $texto_dias_permisos.= " OR numero_dias IN ('4H','5H','6H','7H','8H','9H','10H','11H','12H','13H','14H','15H') "; // --PERMISOS MEDIOS
		}

		if ($tipo_usuario=='juridica' ){
			$cadena_diasC = "";
			$cadena_diasH = "";
			for ($i=16; $i <=180; $i++) { 
				if ($i<180) {	
					$cadena_diasC.=	"'". $i ."C',"."'". $i ."H'," ;
			 	}else{
					$cadena_diasC.=	"'". $i ."C',"."'". $i ."H'" ;
				} 
				// ver_arreglo($cadena_diasC);
			}
			$texto_dias_permisos.= " OR numero_dias IN (".$cadena_diasC.") ";

			// $texto_dias_permisos.= " OR numero_dias IN ('16C','17C','18C','19C','20C','21C','22C','23C','24C','25C','26C','27C','28C','29C','30C') "; // --PERMISOS LARGOS  
			// $texto_dias_permisos.= " OR numero_dias IN ('16H','17H','18H','19H','20H','21H','22H','23H','24H','25H','26H','27H','28H','29H','30H') "; // --PERMISOS LARGOS   
		}

		$sql = "SELECT 
					id_tipopermiso, 
					tipo_permiso, 
					CASE WHEN tipo_permiso=1 THEN 'Obligatorio'
					     WHEN tipo_permiso=2 THEN 'Postestativo'
					END AS tipo_permiso_txt,  
					nombre_tipo, 
					numero_dias, 
					reglas_legal, 
					recaudos, 
					id_tipo_personal, 
					CASE WHEN id_tipo_personal=1 THEN 'Administrativo'
					     WHEN id_tipo_personal=2 THEN 'Docente'
					     WHEN id_tipo_personal=3 THEN 'Obrero'
					END AS id_tipo_personal_txt,
					fecha_registro, 
					estatus 
			  	FROM permisos.tipo_permiso
			  	WHERE id_tipo_personal = $tipo_personal 
			  	AND estatus LIKE '1'
				
				AND (
					numero_dias IN ('xxC','xxH') -- PERMISOS POTESTATIVOS SIN DIAS ESTABLECIDOS
				
					$texto_dias_permisos
				
				)

			  	ORDER BY estatus DESC, id_tipo_personal, tipo_permiso, id_tipopermiso;";
		// 
  		// $dato=consultar($sql,$Postgres);
		// ver_arreglo($sql);
		$dato=consultar($sql,$Postgres);
  		// ver_arreglo($dato);
  		$NumeroDeFilas = $Postgres->NumeroDeFilas();
  		// ver_arreglo($NumeroDeFilas);
  		// die();
  		
  		if ($NumeroDeFilas>0) {
  			for ($i=0; $i < count($dato); $i++) { 
  				# code...
  				
  			}
  			echo json_encode($dato);
  		}else{
  			echo 'false';
  		}
	}
?>
<?php
	function agregar_tipo_permisos($datos) {
		$txt_tipo_personal	=	$_POST['txt_tipo_personal']; // 1
		$txt_tipo_permiso	=	$_POST['txt_tipo_permiso']; // 1
		$txt_nombre_permiso	=	$_POST['txt_nombre_permiso']; // aa
		$txt_dias_permiso	=	$_POST['txt_dias_permiso']; // bb
		$txt_reglas_legal	=	$_POST['txt_reglas_legal']; // cc
		$txt_recaudos		=	$_POST['txt_recaudos']; // cc
		$txt_fecha_registro	=	$_POST['txt_fecha_registro']; // 12/31/2016
		$txt_radio_estatus	=	$_POST['txt_radio_estatus']; // 
		$accion				=	$_POST['accion']; // agregar_tipo_permisos
		$token1				=	$_POST['token1']; // DDaa5!Bc9Bd:dcAEe¡bb
		
		
		$fecha = explode("/", $txt_fecha_registro);
		$dia = $fecha[0];
		$mes = $fecha[1];
		$ano = $fecha[2];

		$txt_fecha_registro = "$ano-$mes-$dia"; // '2016-12-31'


		//PARAMETROS DE LA SESION - USUARIO
		//************************************
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		
		// $numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		// $conexion = conectar();
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// CONSULTA SQL A GENERAR
		$sql = "INSERT INTO permisos.tipo_permiso( 
			            	tipo_permiso, 
			            	nombre_tipo, 
			            	numero_dias, 
			            	reglas_legal, 
			            	recaudos, 
			            	id_tipo_personal, 
			            	fecha_registro, 
			            	estatus)
			    VALUES 	(
			    			'$txt_tipo_permiso', 
			    			'$txt_nombre_permiso', 
			    			'$txt_dias_permiso', 
			    			'$txt_reglas_legal', 
			            	'$txt_recaudos', 
			            	'$txt_tipo_personal', 
			            	'$txt_fecha_registro', 
			            	'$txt_radio_estatus');";
		// ver_arreglo($sql);
		$resultado_sql=consultar($sql,$Postgres);
		if ($Postgres->NumeroDeFilasAfectadas()>0) {
			$cadena = "insert@";
		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}
?>
<?php
	function modificar_tipos_permisos($datos) {
		// PARAMETROS DEL FORMULARIO
		$txt_id_tipopermiso	=	$_POST['txt_id_tipopermiso']; // 1

		$txt_tipo_personal	=	$_POST['txt_tipo_personal']; // 1
		$txt_tipo_permiso	=	$_POST['txt_tipo_permiso']; // 1
		$txt_nombre_permiso	=	$_POST['txt_nombre_permiso']; // aa
		$txt_dias_permiso	=	$_POST['txt_dias_permiso']; // bb
		$txt_reglas_legal	=	$_POST['txt_reglas_legal']; // cc
		$txt_recaudos		=	$_POST['txt_recaudos']; // cc
		$txt_fecha_registro	=	$_POST['txt_fecha_registro']; // 12/31/2016
		$txt_radio_estatus	=	$_POST['txt_radio_estatus']; // 
		$accion				=	$_POST['accion']; // agregar_tipo_permisos
		$token1				=	$_POST['token1']; // DDaa5!Bc9Bd:dcAEe¡bb
		
		
		$fecha = explode("/", $txt_fecha_registro);
		$dia = $fecha[0];
		$mes = $fecha[1];
		$ano = $fecha[2];

		$txt_fecha_registro = "$ano-$mes-$dia"; // '2016-12-31'

		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// $conexion = conectar();
		// CONSULTA SQL A GENERAR
		$sql ="UPDATE permisos.tipo_permiso
				   SET 	tipo_permiso='$txt_tipo_permiso', 
				   		nombre_tipo='$txt_nombre_permiso', 
				   		numero_dias='$txt_dias_permiso', 
				       	reglas_legal='$txt_reglas_legal', 
				       	recaudos='$txt_recaudos', 
				       	id_tipo_personal='$txt_tipo_personal', 
				       	fecha_registro='$txt_fecha_registro', 
				       	estatus='$txt_radio_estatus'
				 WHERE (id_tipopermiso = '$txt_id_tipopermiso');";

		$resultado_sql=consultar($sql,$Postgres);
		if ($Postgres->NumeroDeFilasAfectadas()>0) {
			$cadena = "update@";
		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}
?>
<?php
	function eliminar_tipos_permisos($datos) {
		// PARAMETROS DEL FORMULARIO
		$txt_id_tipopermiso	=	$datos['id_tipopermiso']; // 1
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		// $numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// CONSULTA SQL A GENERAR
		$sql = "DELETE FROM permisos.tipo_permiso WHERE id_tipopermiso='$txt_id_tipopermiso';";
		// EJECUTAR LA CONSULTA
		$resultado_sql = consultar($sql, $Postgres);
		if ($Postgres->NumeroDeFilasAfectadas()>0) {
			$cadena = "delete@";
		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}
?>