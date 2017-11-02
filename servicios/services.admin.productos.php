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
//{"txt_codigo_producto":"","txt_nombre_producto":"oswaldo","txt_rango_fecha":"01/07/2016 - 01/09/2016","txt_fecha_inicio":"","txt_fecha_cierre":"","txt_radio_estatus":"0","accion":"agregar_productos"}
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
	//		[txt_codigo_producto] => 
	//		[txt_nombre_producto] => producto nnn
	//		[txt_rango_fecha] => 01/09/2016 - 01/10/2016
	//		[txt_fecha_inicio] => 
	//		[txt_fecha_cierre] => 
	//		[txt_radio_estatus] => 0
	//		[accion] => agregar_productos
	//		[token1] => 4f3:;EB15E360;¡BB!c1
	//)
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	//ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_productos"
	switch ($accion){
		case 'consultar_productos':
			consulta_productos($datos);
		break;
		case 'agregar_productos':
			agregar_productos($datos);
		break;
		case 'modificar_productos':
			modificar_productos($datos);
		break;
		case 'eliminar_productos':
			eliminar_productos($datos);
		break;
		case 'consultar_productos_filtro':
			consultar_productos_filtro($datos);
		break;
	}
?>
<?php
	function consulta_productos($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		$sql = "SELECT 	prod.id_producto, 
						prod.codigo_producto, 
						prod.descripcion_producto, 
						prod.medida_producto, 
						prod.id_categoria, 
       					prod.unidades_producto, 
       					cat.nombre_categoria, 
       					cat.descripcion_categoria
				FROM almacen.productos as prod
				INNER JOIN almacen.categoria AS cat ON cat.id_categoria = prod.id_categoria
				ORDER BY prod.id_producto";
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
	function consultar_productos_filtro($datos) {
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
	function agregar_productos($datos) {
		// INICIA LA CONEXION CON EL SERVIDOR 
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
			// Array
			// (
			//     [txt_id_producto] => 
			//     [txt_codigo_producto] => codigo
			//     [txt_descripcion_producto] => Descripción
			//     [txt_medida_producto] => Medida
			//     [txt_id_categoria] => id_categoria
			//     [txt_unidades_producto] => Unidades
			//     [accion] => agregar_productos
			//     [token1] => ?B5A?20D7CB46d:a75B2
			// )

			$txt_id_producto			=	$datos['txt_id_producto']; //
			$txt_codigo_producto		=	$datos['txt_codigo_producto']; //
			$txt_descripcion_producto	=	$datos['txt_descripcion_producto']; //	oswaldo",
			$txt_medida_producto		=	$datos['txt_medida_producto']; //
			$txt_id_categoria			=	$datos['txt_id_categoria']; //
			$txt_unidades_producto		=	$datos['txt_unidades_producto']; //
			$numero_solicitud = uniqid();
			// CONSULTA SQL A GENERAR
			$sql =		"INSERT INTO almacen.productos
									(	codigo_producto, 
            							descripcion_producto, 
            							medida_producto, 
            							id_categoria,
            							unidades_producto )
					    VALUES (		'$txt_codigo_producto', 
            							'$txt_descripcion_producto', 
            							'$txt_medida_producto', 
            							$txt_id_categoria,
            							$txt_unidades_producto );";
		$dato=consultar($sql,$Postgres);
		$NumeroDeFilas = $Postgres->NumeroDeFilasAfectadas();
		if ($NumeroDeFilas>0) {
			$cadena = "insert@";
		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}
?>
<?php
	function modificar_productos($datos) {
		// INICIA LA CONEXION CON EL SERVIDOR 
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// PARAMETROS DEL FORMULARIO
		$txt_id_producto			=	$datos['txt_id_producto']; //
		$txt_codigo_producto		=	$datos['txt_codigo_producto']; //
		$txt_descripcion_producto	=	$datos['txt_descripcion_producto']; //	oswaldo",
		$txt_medida_producto		=	$datos['txt_medida_producto']; //
		$txt_id_categoria			=	$datos['txt_id_categoria']; //
		$txt_unidades_producto		=	$datos['txt_unidades_producto']; //
		$numero_solicitud = uniqid();
		// CONSULTA SQL A GENERAR
		$sql = "UPDATE almacen.productos 
					SET	codigo_producto			=	'$txt_codigo_producto', 
						descripcion_producto	=	'$txt_descripcion_producto', 
						medida_producto			=	'$txt_medida_producto',
						id_categoria			=	$txt_id_categoria, 
						unidades_producto		=	$txt_unidades_producto
				WHERE id_producto=$txt_id_producto";
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
	function eliminar_productos($datos) {
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// PARAMETROS DEL FORMULARIO
		$txt_id_producto			=	$datos['id_producto']; //
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		$numero_solicitud = uniqid();
		// CONSULTA SQL A GENERAR
		$sql = "DELETE FROM almacen.productos WHERE id_producto=$txt_id_producto";
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