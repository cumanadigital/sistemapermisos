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
	// Array
	// (
	//     [accion] => consultar_centros_trabajo
	//     [id_categoria] => nGa5r6sx-5gQg-kXeL-B5KK-5SAcfVMsPIdJ
	//     [tipo_personal] => 1
	//     [tipo_usuario] => root
	//     [token1] => ¡BCB6¡;c¡517¿1e5717d
	// )
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	// ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_registros"
	switch ($accion){
		case 'consultar_registros':
			consultar_registros($datos);
		break;
		// case 'agregar_registros':
		// 	agregar_registros($datos);
		// break;
		// case 'modificar_registros':
		// 	modificar_registros($datos);
		// break;
		// case 'eliminar_registros':
		// 	eliminar_registros($datos);
		// break;
		// case 'consultar_registros_filtro':
		// 	consultar_registros_filtro($datos);
		// break;
		case 'consultar_centros_trabajo':
			consultar_registros_filtro($datos);
		break;
	}
?>
<?php
	function consultar_registros($datos) {
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
		// 
		$sql=  "SELECT pl.*, deno.*,tpd.*,estplan.*,clase.*,cat.*,plancond.*,tpmat.*,turno.*, mod.*,est.*,mun.*,parr.*,pl.plan_ciudad
				FROM plantel_datos.plantel as pl
				 LEFT JOIN comun.dependencia as dep ON(dep.dependencia_codigonomina = pl.plan_codnomina ) 
				 LEFT JOIN plantel_datos.denominacion as deno ON(deno.de_uid = pl.plan_denominacion )
				 LEFT JOIN plantel_datos.tipo_dependencia as tpd  ON(tpd.td_uid = plan_tipodep )
				 LEFT JOIN plantel_datos.estatus_plantel as estplan  ON(estplan.ep_uid = plan_estatus )
				 LEFT JOIN plantel_datos.clase as clase  ON(clase.cl_uid = ep_uid )
				 LEFT JOIN plantel_datos.categoria  as cat  ON(cat.ct_uid = plan_categoria )
				 LEFT JOIN plantel_datos.condestudio  as plancond  ON(plancond.ce_uid = pl.plan_condicionestudio )
				 LEFT JOIN plantel_datos.tipo_matricula  as tpmat  ON(tpmat.tm_uid = pl.plan_tipomatricula )
				 LEFT JOIN plantel_datos.turno  as turno  ON(turno.tu_uid = pl.plan_turno )
				 LEFT JOIN plantel_datos.modalidad as mod  ON(mod.md_uid = pl.plan_modalidad )
				 LEFT JOIN comun.estado as est  ON(est.estado_codigo = cast(pl.plan_estado as int) )
				 LEFT JOIN comun.municipio as mun  ON(mun.municipio_uid = pl.plan_municipio  )
				 LEFT JOIN comun.parroquia as parr  ON(parr.parroquia_uid = pl.plan_parroquia )
				 LEFT JOIN comun.ciudad as ciud ON(ciud.ciudad_uid = pl.plan_ciudad)
				 ORDER BY mun.municipio_nombre, parr.parroquia_nombre";
		$dato=consultar($sql,$Postgres);
		// ver_arreglo($dato);
		$NumeroDeFilas = $Postgres->NumeroDeFilas();
		if ($NumeroDeFilas>0) {
			echo json_encode($dato);
		}else{
			echo 'false';
		}
	}
?>
<?php
	function consultar_registros_filtro($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		$id_categoria = $datos['id_categoria'];
		// $sql=  "SELECT pl.*, deno.*,tpd.*,estplan.*,clase.*,cat.*,plancond.*,tpmat.*,turno.*, mod.*,est.*,mun.*,parr.*,pl.plan_ciudad
		// 		FROM plantel_datos.plantel as pl
		// 		LEFT JOIN comun.dependencia as dep ON(dep.dependencia_codigonomina = pl.plan_codnomina ) 
		// 		LEFT JOIN plantel_datos.denominacion as deno ON(deno.de_uid = pl.plan_denominacion )
		// 		LEFT JOIN plantel_datos.tipo_dependencia as tpd  ON(tpd.td_uid = plan_tipodep )
		// 		LEFT JOIN plantel_datos.estatus_plantel as estplan  ON(estplan.ep_uid = plan_estatus )
		// 		LEFT JOIN plantel_datos.clase as clase  ON(clase.cl_uid = ep_uid )
		// 		LEFT JOIN plantel_datos.categoria  as cat  ON(cat.ct_uid = plan_categoria )
		// 		LEFT JOIN plantel_datos.condestudio  as plancond  ON(plancond.ce_uid = pl.plan_condicionestudio )
		// 		LEFT JOIN plantel_datos.tipo_matricula  as tpmat  ON(tpmat.tm_uid = pl.plan_tipomatricula )
		// 		LEFT JOIN plantel_datos.turno  as turno  ON(turno.tu_uid = pl.plan_turno )
		// 		LEFT JOIN plantel_datos.modalidad as mod  ON(mod.md_uid = pl.plan_modalidad )
		// 		LEFT JOIN comun.estado as est  ON(est.estado_codigo = cast(pl.plan_estado as int) )
		// 		LEFT JOIN comun.municipio as mun  ON(mun.municipio_uid = pl.plan_municipio  )
		// 		LEFT JOIN comun.parroquia as parr  ON(parr.parroquia_uid = pl.plan_parroquia )
		// 		LEFT JOIN comun.ciudad as ciud ON(ciud.ciudad_uid = pl.plan_ciudad)
		// 		WHERE plan_municipio LIKE '$id_categoria' 
		// 		--ORDER BY pl.plan_codigodea
		// 		ORDER BY pl.plan_nombre;";
		
		$sql=  "SELECT 	pl.plan_uid, pl.plan_codigodea ,pl.plan_nombre, pl.plan_municipio, mun.municipio_uid, mun.municipio_nombre 
				FROM plantel_datos.plantel as pl
				-- LEFT JOIN comun.dependencia as dep ON(dep.dependencia_codigonomina = pl.plan_codnomina ) 
				-- LEFT JOIN plantel_datos.denominacion as deno ON(deno.de_uid = pl.plan_denominacion )
				-- LEFT JOIN plantel_datos.tipo_dependencia as tpd  ON(tpd.td_uid = plan_tipodep )
				-- LEFT JOIN plantel_datos.estatus_plantel as estplan  ON(estplan.ep_uid = plan_estatus )
				-- LEFT JOIN plantel_datos.clase as clase  ON(clase.cl_uid = ep_uid )
				-- LEFT JOIN plantel_datos.categoria  as cat  ON(cat.ct_uid = plan_categoria )
				-- LEFT JOIN plantel_datos.condestudio  as plancond  ON(plancond.ce_uid = pl.plan_condicionestudio )
				-- LEFT JOIN plantel_datos.tipo_matricula  as tpmat  ON(tpmat.tm_uid = pl.plan_tipomatricula )
				-- LEFT JOIN plantel_datos.turno  as turno  ON(turno.tu_uid = pl.plan_turno )
				-- LEFT JOIN plantel_datos.modalidad as mod  ON(mod.md_uid = pl.plan_modalidad )
				LEFT JOIN comun.estado as est  ON(est.estado_codigo = cast(pl.plan_estado as int) )
				LEFT JOIN comun.municipio as mun  ON(mun.municipio_uid = pl.plan_municipio  )
				-- LEFT JOIN comun.parroquia as parr  ON(parr.parroquia_uid = pl.plan_parroquia )
				-- LEFT JOIN comun.ciudad as ciud ON(ciud.ciudad_uid = pl.plan_ciudad)
				WHERE plan_municipio LIKE '$id_categoria' 
				--ORDER BY pl.plan_codigodea
				ORDER BY pl.plan_nombre;";
		// ver_arreglo($sql);		
		$dato=consultar($sql,$Postgres);
		// ver_arreglo($dato);
		// Array
		// 	(
		// 	    [0] => Array
		// 	        (
		// 	            [plan_uid] => 640
		// 	            [plan_codigodea] => OD14861911
		// 	            [plan_codestadistico] => 191672
		// 	            [plan_codnomina] => 
		// 	            [plan_codnominadep] => 
		// 	            [plan_nombre] => C E I LA CHAGUARAMA
		// 	            [plan_denominacion] => 
		// 	            [plan_tipodep] => 3
		// 	            [plan_estatus] => 1
		// 	            [plan_zona] => 
		// 	            [plan_clase] => 
		// 	            [plan_categoria] => 
		// 	            [plan_fechafundada] => 1880-01-01
		// 	            [plan_condicionestudio] => 1
		// 	            [plan_tipomatricula] => 3
		// 	            [plan_turno] => 2
		// 	            [plan_modalidad] => 3
		// 	            [plan_observacion] => 
		// 	            [plan_director] => 11382531
		// 	            [plan_supervisor] => 
		// 	            [plan_pais] => 
		// 	            [plan_estado] => 17
		// 	            [plan_municipio] => Xu7enpgt-DrwW-Jwkf-ryxa-8HHlVlM2dFLk
		// 	            [plan_parroquia] => 
		// 	            [plan_ciudad] => 
		// 	            [plan_localidad] => 
		// 	            [plan_direccion] => CASERIO CHAGUARAMA VIA AGRICOLA PARADERO CUMANA
		// 	            [plan_telefono] => 4266824144
		// 	            [plan_telefono_opc] => 
		// 	            [plan_correo_institucional] => 
		// 	            [plan_correo] => 
		// 	            [plan_twitter] => 
		// 	            [plan_facebook] => 
		// 	            [plan_createuser] => 
		// 	            [plan_createtime] => 2016-08-01 00:00:00
		// 	            [estado_uid] => w5BL89KV-Lt9o-ADDI-Xxfl-jwDVo0mVvnD4
		// 	            [estado_nombre] => Sucre
		// 	            [estado_capital] => Cumaná
		// 	            [estado_codigo] => 17
		// 	            [municipio_uid] => Xu7enpgt-DrwW-Jwkf-ryxa-8HHlVlM2dFLk
		// 	            [municipio_nombre] => Mejía
		// 	            [municipio_capital] => San Antonio del Golfo
		// 	            [municipio_estado] => 17
		// 	            [municipio_codigo] => 11
		// 	            [municipio_codigo_n] => 306
		// 	            [?column?] => --
		// 	        )
		$NumeroDeFilas = $Postgres->NumeroDeFilas();
		if ($NumeroDeFilas>0) {
			echo json_encode($dato);
		}else{
			print_r('false');
		}
	}
?>
<?php
	function agregar_registros($datos) {
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
	function modificar_registros($datos) {
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
	function eliminar_registros($datos) {
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