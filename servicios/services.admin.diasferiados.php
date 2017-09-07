<?php //require('../conf/config.php');?>
<?php require('../conf/config.postgres.php');?>
<?php require('../apiv3.0/funciones/postgres.class.php'); ?>
<?php require('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
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
	//		[accion] => agregar_diasferiados
	//		[token1] => 4f3:;EB15E360;¡BB!c1
	//)
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	//ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_diasferiados"
	switch ($accion){
		case 'consultar_diasferiados':
			consultar_diasferiados($datos);
		break;
		case 'agregar_diasferiados':
			agregar_diasferiados($datos);
		break;
		case 'modificar_diasferiados':
			modificar_diasferiados($datos);
		break;
		case 'eliminar_diasferiados':
			eliminar_diasferiados($datos);
		break;
		// case 'consultar_diasferiados_activo':
		// 	consultar_diasferiados_activo($datos);
		// break;
	}
?>
<?php
	function consultar_diasferiados($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		//
		// $sql = "SELECT 
		// 		id_tipopermiso, 
		// 		tipo_permiso, 
		// 		CASE WHEN tipo_permiso=1 THEN 'Obligatorio'
		// 		     WHEN tipo_permiso=2 THEN 'Postestativo'
		// 		END AS tipo_permiso_txt,  
		// 		nombre_tipo, 
		// 		numero_dias, 
		// 		reglas_legal, 
		// 		recaudos, 
		// 		id_tipo_personal, 
		// 		CASE WHEN id_tipo_personal=1 THEN 'Administrativo'
		// 		     WHEN id_tipo_personal=2 THEN 'Docente'
		// 		     WHEN id_tipo_personal=3 THEN 'Obrero'
		// 		END AS id_tipo_personal_txt,
		// 		fecha_registro, 
		// 		estatus
		// 	  FROM diasferiados.tipo_permiso
		// 	  ORDER BY estatus DESC, id_tipo_personal, tipo_permiso;";

		$sql = "SELECT 	
						id_diaferiado, 
						fecha,
						to_char(fecha, 'dd/MM/yyyy') as fecha_dmy, 
						tipo_fecha,
						CASE WHEN tipo_fecha='1' THEN 'Feriado Nacional'
						     WHEN tipo_fecha='2' THEN 'Feriado Regional'
						     WHEN tipo_fecha='3' THEN 'Feriado Local'
						     WHEN tipo_fecha='4' THEN 'Contrato Colectivo'
						     WHEN tipo_fecha='5' THEN 'Ley Orgánica del Trabajo'
						END AS tipo_fecha_txt, 
						motivo, 
						estatus, 
						jornada,
						CASE WHEN jornada='1' THEN 'No Laborable'
						     WHEN jornada='2' THEN 'Laborable'
						END AS jornada_txt, 
       					id_tipo_personal,
       					CASE WHEN id_tipo_personal='1-2-3' THEN 'Administrativo - Docente - Obrero'
						     WHEN id_tipo_personal='1-2' THEN 'Administrativo - Docente'
						     WHEN id_tipo_personal='1-3' THEN 'Administrativo - Obrero'
						     WHEN id_tipo_personal='2-3' THEN 'Docente - Obrero'
						     WHEN id_tipo_personal='1' THEN 'Administrativo'
						     WHEN id_tipo_personal='2' THEN 'Docente'
						     WHEN id_tipo_personal='3' THEN 'Obrero'
						END AS id_tipo_personal_txt
  				FROM permisos.dias_feriados
				ORDER BY fecha DESC, id_tipo_personal";
		// 
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
	function agregar_diasferiados($datos) {
		// ver_arreglo($datos);
		// Array
		// (
		//     [txt_id_diaferiado] => 
		//     [txt_fecha_diaferiado] => 04/18/2016
		//     [txt_nombre_diaferiado] => motivo
		//     [txt_tipo_diaferiado] => 1
		//     [txt_jornada] => 1
		//     [txt_tipo_personal1] => 1
		//     [txt_tipo_personal2] => 2
		//     [txt_tipo_personal3] => 3
		//     [txt_radio_estatus] => 0
		//     [id_diaferiado] => 
		//     [accion] => agregar_diasferiados
		//     [token1] => 8CE1Ff¡9c?:f¿0!3;FEB
		// )

		$txt_id_diaferiado 		= 	$datos['txt_id_diaferiado'];
		$txt_fecha_diaferiado	=	$datos['txt_fecha_diaferiado']; // 1
		$txt_nombre_diaferiado	=	$datos['txt_nombre_diaferiado']; // 1
		$txt_tipo_diaferiado	=	$datos['txt_tipo_diaferiado']; // aa
		$txt_jornada			=	$datos['txt_jornada']; // bb
		$txt_tipo_personal1		=	$datos['txt_tipo_personal1']; //
		$txt_tipo_personal2		=	$datos['txt_tipo_personal2']; //
		$txt_tipo_personal3		=	$datos['txt_tipo_personal3']; //

		if ($txt_tipo_personal1!='') {
			$txt_tipo_personal[]= $txt_tipo_personal1;
		}
		if ($txt_tipo_personal2!='') {
			$txt_tipo_personal[]= $txt_tipo_personal2;
		}
		if ($txt_tipo_personal3!='') {
			$txt_tipo_personal[]= $txt_tipo_personal3;
		}
		
		$txt_tipo_personal_txt 		= 	"$txt_tipo_personal1-$txt_tipo_personal2-$txt_tipo_personal3" ; 
		// $txt_tipo_personal_json = addcslashes(json_encode($txt_tipo_personal));
		// ver_arreglo($txt_tipo_personal_json);
		
		$txt_radio_estatus	=	$datos['txt_radio_estatus']; // 
		$accion				=	$datos['accion']; // agregar_diasferiados
		$token1				=	$datos['token1']; // DDaa5!Bc9Bd:dcAEe¡bb
		
		
		// [txt_fecha_diaferiado] => 04/18/2016
		// 18/04/2016
		// $fecha = explode("/", $txt_fecha_diaferiado);
		// $dia = $fecha[1]; 
		// $mes = $fecha[0];
		// $ano = $fecha[2];

		// $txt_fecha_diaferiado = "$ano-$mes-$dia"; // '2016-12-31'
		$txt_fecha_diaferiado =  Fecha_To_mysql($txt_fecha_diaferiado);

		//PARAMETROS DE LA SESION - USUARIO
		//************************************
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD		
		// $numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		// $conexion = conectar();
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// CONSULTA SQL A GENERAR

		$sql = "INSERT INTO permisos.dias_feriados( 
            				fecha,
            				tipo_fecha, 
            				motivo, 
            				estatus, 
            				jornada, 
            				id_tipo_personal)
    			VALUES (
    						'$txt_fecha_diaferiado', 
    						'$txt_tipo_diaferiado', 
    						'$txt_nombre_diaferiado', 
    						'$txt_radio_estatus', 
    						'$txt_jornada', 
            				'$txt_tipo_personal_txt');";

		ver_arreglo($sql);
		// die();
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
	function modificar_diasferiados($datos) {
		// PARAMETROS DEL FORMULARIO
		ver_arreglo($datos);
		// Array
		// (
		//     [txt_id_diaferiado] => 
		//     [txt_fecha_diaferiado] => 04/18/2016
		//     [txt_nombre_diaferiado] => motivo
		//     [txt_tipo_diaferiado] => 1
		//     [txt_jornada] => 1
		//     [txt_tipo_personal1] => 1
		//     [txt_tipo_personal2] => 2
		//     [txt_tipo_personal3] => 3
		//     [txt_radio_estatus] => 0
		//     [id_diaferiado] => 
		//     [accion] => agregar_diasferiados
		//     [token1] => 8CE1Ff¡9c?:f¿0!3;FEB
		// )

		$txt_id_diaferiado 		= 	$datos['txt_id_diaferiado'];
		$txt_fecha_diaferiado	=	$datos['txt_fecha_diaferiado']; // 1
		$txt_nombre_diaferiado	=	$datos['txt_nombre_diaferiado']; // 1
		$txt_tipo_diaferiado	=	$datos['txt_tipo_diaferiado']; // aa
		$txt_jornada			=	$datos['txt_jornada']; // bb
		$txt_tipo_personal1		=	$datos['txt_tipo_personal1']; //
		$txt_tipo_personal2		=	$datos['txt_tipo_personal2']; //
		$txt_tipo_personal3		=	$datos['txt_tipo_personal3']; //

		if ($txt_tipo_personal1!='') {
			$txt_tipo_personal[]= $txt_tipo_personal1;
		}
		if ($txt_tipo_personal2!='') {
			$txt_tipo_personal[]= $txt_tipo_personal2;
		}
		if ($txt_tipo_personal3!='') {
			$txt_tipo_personal[]= $txt_tipo_personal3;
		}
		
		$txt_tipo_personal_txt 		= 	"$txt_tipo_personal1-$txt_tipo_personal2-$txt_tipo_personal3" ; 
		// $txt_tipo_personal_json = addcslashes(json_encode($txt_tipo_personal));
		// ver_arreglo($txt_tipo_personal_json);
		
		$txt_radio_estatus	=	$datos['txt_radio_estatus']; // 
		$accion				=	$datos['accion']; // agregar_diasferiados
		$token1				=	$datos['token1']; // DDaa5!Bc9Bd:dcAEe¡bb
		
		
		// [txt_fecha_diaferiado] => 04/18/2016
		// 18/04/2016
		// $fecha = explode("/", $txt_fecha_diaferiado);
		// $dia = $fecha[1]; 
		// $mes = $fecha[0];
		// $ano = $fecha[2];
// 
		// $txt_fecha_diaferiado = "$ano-$mes-$dia"; // '2016-12-31'
		$txt_fecha_diaferiado =  Fecha_To_mysql($txt_fecha_diaferiado);

		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// $conexion = conectar();
		// CONSULTA SQL A GENERAR
		$sql ="UPDATE permisos.dias_feriados
				SET  	fecha='$txt_fecha_diaferiado', 
						tipo_fecha='$txt_tipo_diaferiado', 
						motivo='$txt_nombre_diaferiado', 
						estatus='$txt_radio_estatus',
						jornada='$txt_jornada', 
						id_tipo_personal='$txt_tipo_personal_txt'
				 WHERE (id_diaferiado = '$txt_id_diaferiado');";
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
	function eliminar_diasferiados($datos) {
		// PARAMETROS DEL FORMULARIO
		$txt_id_diaferiado 		= 	$datos['id_diaferiado'];
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		// $numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// CONSULTA SQL A GENERAR
		$sql = "DELETE FROM permisos.dias_feriados WHERE id_diaferiado='$txt_id_diaferiado';";
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