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
//{"txt_codigo_periodo":"","txt_nombre_periodo":"oswaldo","txt_rango_fecha":"01/07/2016 - 01/09/2016","txt_fecha_inicio":"","txt_fecha_cierre":"","txt_radio_estatus":"0","accion":"agregar_registros"}
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
	//		[accion] => agregar_registros
	//		[token1] => 4f3:;EB15E360;¡BB!c1
	//)
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	//ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_registros"
	switch ($accion){
		case 'consultar_municipios':
			consultar_municipios($datos);
		break;
	}
?>
<?php
	function consultar_municipios($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// $sql = "SELECT 	id_periodo, 
		// 				nombre_periodo, 
		// 				fecha_inicio, 
		// 				fecha_cierre, 
		// 				fecha_recaudo_ini, 
		// 				fecha_recaudo_fin, 
		// 				id_jefe_personal, 
		// 				id_jefezona, 
		// 				estatus, 
		// 				observacion
		// 		FROM permisos.periodo ORDER BY id_periodo";

		$sql="	SELECT 	municipio_uid, 
						UPPER(municipio_nombre) as municipio_nombre, 
						municipio_capital, 
						municipio_estado,
						municipio_codigo, 
						municipio_codigo_n
				FROM comun.municipio AS mun
				WHERE municipio_estado = 17
				ORDER BY mun.municipio_estado, mun.municipio_nombre;";

		$dato=consultar($sql,$Postgres);
		// ver_arreglo($dato);
		// Array
		// (
		//     [0] => Array
		//         (
		//             [municipio_uid] => nGa5r6sx-5gQg-kXeL-B5KK-5SAcfVMsPIdJ
		//             [upper] => ANDRÉS ELOY BLANCO
		//             [municipio_capital] => Casanay
		//             [municipio_estado] => 17
		//             [municipio_codigo] => 1
		//             [municipio_codigo_n] => 296
		//         )
		//     [14] => Array
		//         (
		//             [municipio_uid] => 4N99Flu9-cZw1-gXS7-KjlZ-HaF1vs0lm4ZU
		//             [upper] => VALDEZ
		//             [municipio_capital] => Güiria
		//             [municipio_estado] => 17
		//             [municipio_codigo] => 15
		//             [municipio_codigo_n] => 310
		//         )
		// )


		$NumeroDeFilas = $Postgres->NumeroDeFilas();
		if ($NumeroDeFilas>0) {
			echo json_encode($dato);
		}else{
			echo 'false';
		}
	}
?>