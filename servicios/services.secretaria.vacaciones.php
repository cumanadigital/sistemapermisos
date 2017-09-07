<?php //require('../conf/config.php');?>
<?php require('../conf/config.postgres.php');?>
<?php require('../apiv3.0/funciones/postgres.class.php'); ?>
<?php require('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
//{"txt_codigo_periodo":"","txt_nombre_periodo":"oswaldo","txt_rango_fecha":"01/07/2016 - 01/09/2016","txt_fecha_inicio":"","txt_fecha_cierre":"","txt_radio_estatus":"0","accion":"agregar_vacaciones"}
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
	//		[accion] => agregar_vacaciones
	//		[token1] => 4f3:;EB15E360;¡BB!c1
	//)
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	// ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_vacaciones"
	switch ($accion){
		case 'consultar_vacaciones':
			consultar_vacaciones($datos);
		break;
		case 'agregar_vacaciones':
			agregar_vacaciones($datos);
		break;
		case 'procesar_vacaciones':
			procesar_vacaciones($datos);
		break;
		// case 'eliminar_vacaciones':
		// 	eliminar_vacaciones($datos);
		// break;
		// case 'consultar_vacaciones_activo':
		// 	consultar_vacaciones_activo($datos);
		// break;
	}
?>
<?php
	function consultar_vacaciones($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		//
		// ver_arreglo($datos);		    
		$nivel_usuario =  $datos['sesion_nivel_usuario'];  //[sesion_nivel_usuario] => jefeinmediato   
		// Array
		// (
		//     [accion] => consultar_vacaciones
		//     [sesion_userid] => 3
		//     [sesion_username] => secretaria
		//     [sesion_nivel_usuario] => secretaria
		//     [sesion_id_persona] => 4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26
		//     [sesion_id_dependencia] => ZN0AqxQjq-kaN-IYba-LaQL-La20AKjl2qFA
		//     [sesion_ingreso] => 2016-07-24 19:28:21.576569
		//     [sesion_estatus] => 1
		//     [sesion_idpersona] => qVLCgAP4-OFGJ-1EkI-kziw-HMMZ75pTHs0B
		//     [sesion_usernombre] => RODRIGUEZ GUTIERREZ MARIELYS DEL VALLE
		//     [session_username1] => RODRIGUEZ
		//     [session_username2] => MARIELYS
		//     [sesion_cedula] => 10945774
		//     [sesion_userfoto] => 10945774
		//     [sesion_iddepartamento] => 4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26
		//     [sesion_departamento] => SECRETARIA DE PERSONAL
		//     [sesion_cargo] => SECRETARIA
		//     [sesion_ultimiacceso] => 2016-7-24 21:18:58
		//     [sesion_dependencias_admin2] => 
		//     [sesion_dependencias_admin3] => SECRETARIA DE PERSONAL;
		//     [sesion_dependencias_admin4] => SECRETARIA DE PERSONAL;
		//     [sesion_dependencias_admin5] => SUCRE;
		//     [sesion_id_periodo] => 1
		//     [sesion_nombre_periodo_periodo] => PERIODO I- 2016
		//     [sesion_fecha_inicio_periodo] => 2016-01-01
		//     [sesion_fecha_cierre_periodo] => 2016-06-30
		//     [sesion_fecha_inicio_recuado] => 2015-12-15
		//     [sesion_fecha_cierre_recuado] => 2016-01-15
		//     [sesion_estatus_periodo] => 1
		//     [sesion_id_jefe_personal] => 
		//     [sesion_id_jefezona] => 
		//     [cierre] => final
		// )

		$persona_cedula = $datos['persona_cedula'];

		$id_jefeinmediato = $datos['sesion_id_persona'];
		$id_departamento = $datos['sesion_id_dependencia'];
		$array_id_departamento = explode(",",$datos['sesion_id_dependencia']);

		// sesion_nivel_usuario:"secretaria"
		// ver_arreglo($id_departamento);
		// ver_arreglo($array_id_departamento);
		$cadena_id_dependencias = "";
		for ($i=0; $i < count($array_id_departamento) ; $i++) { 
			# code...
			 if($i<count($array_id_departamento)-1)
				$cadena_id_dependencias.="'".$array_id_departamento[$i]."',";
			 else 
				$cadena_id_dependencias.="'".$array_id_departamento[$i]."'";
		}
		$cadena_cedula = "";
		if ($persona_cedula != "") {
			$cadena_cedula = " per.persona_cedula = $persona_cedula ";
		} 
		// ver_arreglo($cadena_id_dependencias);
		// ver_arreglo($datos['sesion_dependencias_admin2']);
		    
		// [sesion_id_dependencia] => 1T6AtL7V6-lSHd-tdFb-d4Y0-kjkJEvpJJjiA,sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT

		// ver_arreglo($datos['sesion_dependencias_admin2']);
		// ver_arreglo($datos['sesion_dependencias_admin3']);
		// ver_arreglo($datos['sesion_dependencias_admin4']);

		//	sesion_dependencias_admin2] => 
	 	//	[sesion_dependencias_admin3] => 1- CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS;2- DIV. DE INFORMATICA Y SISTEMAS;
	  	//	[sesion_dependencias_admin4] => CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS;DIV. DE INFORMATICA Y SISTEMAS;
	  	//	[sesion_dependencias_admin5] => SUCRE;SUCRE;
		//	[sesion_dependencias_admin2

		// ver_arreglo($id_funcionario);
		// 
		$sql= "	SELECT 	V.id_vacaciones, 
						V.fecha_solicitud, 
						V.id_funcionario, 
						V.tipo_personal, 
						V.cargo_funcional, 
						V.numero_dias, 
						V.fecha_desde, 
						V.fecha_hasta, 
						V.id_periodo, 
						P.nombre_periodo,
						V.fecha_retorno,
						V.fecha_ingreso_me, 
						V.observacion, 
						V.id_jefeinmediato, 
						V.id_jefepersonal, 
						V.id_municipio, 
						V.id_dependencialaboral, 
						V.tipo_vacaciones, 
						V.estatus,
						V.estatus_observacion,
						V.condicion_laboral,
						per.persona_cedula as cedula_persona,
						btrim((COALESCE(per.persona_apellidos, ''::character varying)::text || ' '::text) || COALESCE(per.persona_nombres, ''::character varying)::text) AS apellidos_nombres,
						--per.persona_apellidos as nombre_persona,
						--per.persona_nombres as apellido_persona,
						COALESCE(plan.pl_estadistico, fd.dependencia_uid, d.dependencia_uid) AS id_departamento_persona,
						COALESCE(plan.pl_nombre, fd.dependencia_nombre, d.dependencia_nombre) AS departamento_persona,
						COALESCE(fc.funcion_cargo_descripcion, c.cargo_denominacion) AS cargo_persona,
						car.categoria_cargo_descripcion,
						c.cargo_codigo,
						c.cargo_denominacion ,
						upper(m.municipio_nombre::text) AS municipio_nombre,

						--TP.nombre_tipo,
						--TP.numero_dias as TPnumero_dias,

						per2.persona_cedula as cedula_persona2,
						btrim((COALESCE(per2.persona_apellidos, ''::character varying)::text || ' '::text) || COALESCE(per2.persona_nombres, ''::character varying)::text) AS apellidos_nombres2,
						per2.persona_apellidos as nombre_persona2,
						per2.persona_nombres as apellido_persona2,

						COALESCE(plan2.pl_nombre, fd2.dependencia_nombre, d2.dependencia_nombre) AS departamento_persona2,
						COALESCE(fc2.funcion_cargo_descripcion, c2.cargo_denominacion) AS cargo_persona2,
						car2.categoria_cargo_descripcion as categoria_cargo_descripcion2,
						c2.cargo_codigo as cargo_codigo2,
						c2.cargo_denominacion as cargo_denominacion2 ,
						upper(m2.municipio_nombre::text) AS municipio_nombre2,
						
						'---' as separador

					  FROM permisos.vacaciones as V

						--INNER JOIN permisos.tipo_permiso AS TP ON TP.id_tipopermiso = V.id_tipopermiso
						/*-- enlace hacia funcionario*/
						LEFT JOIN permisos.periodo P ON P.id_periodo = V.id_periodo
						LEFT JOIN comun.empleado_dependencia ed ON ed.empleado_dep_uid = V.id_funcionario
						/*-- enlaces hacia la persona */
						LEFT JOIN comun.empleado e ON e.empleado_uid = ed.empleado_dep_empleado
						LEFT JOIN comun.persona per ON per.persona_cedula = e.empleado_persona
						/*-- enlaces hacia la dependencia*/
						LEFT JOIN comun.dependencia d ON d.dependencia_uid::text = ed.empleado_dep_dependencia::text
						LEFT JOIN comun.dependencia fd ON fd.dependencia_uid::text = ed.empleado_dep_dependencia_lab::text
						LEFT JOIN comun.planteles plan ON plan.pl_estadistico::text = ed.empleado_dep_dependencia_lab::text
						LEFT JOIN comun.municipio m ON m.municipio_codigo = d.dependencia_municipio
						LEFT JOIN comun.estado et ON et.estado_codigo = m.municipio_estado
						/*-- enlaces hacia cargo*/
						LEFT JOIN comun.cargo c ON c.cargo_codigo::text = ed.empleado_dep_codigocargo::text
						LEFT JOIN comun.categoria_cargo car ON car.categoria_cargo_uid::text = c.cargo_categoria::text
						LEFT JOIN comun.funcion_cargo fc ON fc.funcion_cargo_uid::text = ed.empleado_dep_cargofuncional::text


						/*-- enlace hacia jefe inmediato*/
						LEFT JOIN comun.empleado_dependencia ed2 ON ed2.empleado_dep_uid = V.id_jefeinmediato
						/*-- enlaces hacia la persona */
						LEFT JOIN comun.empleado e2 ON e2.empleado_uid = ed2.empleado_dep_empleado
						LEFT JOIN comun.persona per2 ON per2.persona_cedula = e2.empleado_persona
						/*-- enlaces hacia la dependencia*/
						LEFT JOIN comun.dependencia d2 ON d2.dependencia_uid::text = ed2.empleado_dep_dependencia::text
						LEFT JOIN comun.dependencia fd2 ON fd2.dependencia_uid::text = ed2.empleado_dep_dependencia_lab::text
						LEFT JOIN comun.planteles plan2 ON plan2.pl_estadistico::text = ed2.empleado_dep_dependencia_lab::text
						LEFT JOIN comun.municipio m2 ON m2.municipio_codigo = d2.dependencia_municipio
						LEFT JOIN comun.estado et2 ON et2.estado_codigo = m2.municipio_estado
						/*-- enlaces hacia cargo*/
						LEFT JOIN comun.cargo c2 ON c2.cargo_codigo::text = ed2.empleado_dep_codigocargo::text
						LEFT JOIN comun.categoria_cargo car2 ON car2.categoria_cargo_uid::text = c2.cargo_categoria::text
						LEFT JOIN comun.funcion_cargo fc2 ON fc2.funcion_cargo_uid::text = ed2.empleado_dep_cargofuncional::text ";

				
				
				// $sql.= "WHERE 
				// $cadena_cedula ";
				

				if ($nivel_usuario=="secretaria" &&  $persona_cedula == ""){
					$sql.= " ";
				}
				
				if ($nivel_usuario=="secretaria" &&  $persona_cedula != ""){
					$sql.= " WHERE ";
				}

				if ($nivel_usuario=="jefeinmediato" || $nivel_usuario=="director" ){
					$sql.= " WHERE ";
				}	
				
				if ($persona_cedula != ""){
					$sql.= " $cadena_cedula ";
				}

				// CUANDO SOLO SE BUSCAN SUS FUNCIONARIOS
				// if ($nivel_usuario=="jefeinmediato" || $nivel_usuario=="director" ){
				// 	$sql.=     " (
				// 		   			plan.pl_estadistico IN ($cadena_id_dependencias) 
				// 					OR fd.dependencia_uid  IN ($cadena_id_dependencias) 
				// 				)  ";

				// }
				
				$sql.= "	ORDER BY V.estatus ASC, V.id_vacaciones DESC";
	
		// ver_arreglo($sql);
		// 
  		$datoX=consultar($sql,$Postgres);
  		$NumeroDeFilasX = $Postgres->NumeroDeFilas();
  		if ($NumeroDeFilasX>0) {
  			echo json_encode($datoX);
  		}else{
  			echo 'false';
  		}
	}
?>
<?php
	function agregar_vacaciones($datos) {

		$fecha_registro = date("Y/m/d h:i:s");
		
		// ver_arreglo($datos);
		// Array
		// (
		//     [txt_id_jefeinmediato] => 12659282
		//     [txt_id_vacaciones] => 
		//     [txt_id_personal] => demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG
		//     [txt_cedula_personal] => 11829328
		//     [txt_nombre_funcionario] => HERNANDEZ CAMPOS OSWALDO ENRIQUES
		//     [txt_tipo_personal] => ADMINISTRATIVO
		//     [txt_id_cargo_funcional] => demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG
		//     [txt_cargo_funcional] => COORD. SISTEMAS Y BASES DE DATOS
		//     [txt_municipio] => SUCRE
		//     [txt_id_lugar_trabajo] => demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG
		//     [txt_lugar_trabajo] => DIV. DE INFORMATICA Y SISTEMAS
		//     
		//     [txt_condicion_laboral] => 2
		//     [txt_fecha_ingreso_me] => 01/07/2010
		//     [txt_periodo] => 1
		//     [txt_lapso_vacaciones] => 01/08/2016 - 19/08/2016
		//     [txt_tipo_vacaciones] => 2
		//     [txt_fecha_registro] => 26/07/2016
		//     [txt_observacion] => 15 dias atrasados abril del año 2014-2015
		//     [id_vacaciones] => 
		//     [accion] => agregar_vacaciones
		//     [sesion_userid] => 2
		//     [sesion_username] => cbit
		//     [sesion_nivel_usuario] => jefeinmediato
		//     [sesion_id_persona] => yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq
		//     [sesion_id_dependencia] => 9WaSPXNl3Pq8plQUD-XBaLX-VSI02-ZQCJKcPStn9,1T6AtL7V6-lSHd-tdFb-d4Y0-kjkJEvpJJjiA,sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT
		//     [sesion_ingreso] => 2016-07-25 10:55:40.403099
		//     [sesion_estatus] => 1
		//     [sesion_idpersona] => tzI6LdoI-Mgty-VhBI-bKQu-a2oy3QXdkx0P
		//     [sesion_usernombre] => CASTILLO BRAVO KLEITZER JESUS
		//     [session_username1] => CASTILLO
		//     [session_username2] => KLEITZER
		//     [sesion_cedula] => 12659282
		//     [sesion_userfoto] => 12659282
		//     [sesion_iddepartamento] => yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq
		//     [sesion_departamento] => COORD. ZONAL DE INFORMATICA EDUCATIVA
		//     [sesion_cargo] => COORDINADOR ZONAL
		//     [sesion_ultimiacceso] => 2016-7-25 23:11:59
		//     [sesion_dependencias_admin2] => 
		//     [sesion_dependencias_admin3] => 1- CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS;2- COORD. ZONAL DE INFORMATICA EDUCATIVA;3- DIV. DE INFORMATICA Y SISTEMAS;
		//     [sesion_dependencias_admin4] => CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS;COORD. ZONAL DE INFORMATICA EDUCATIVA;DIV. DE INFORMATICA Y SISTEMAS;
		//     [sesion_dependencias_admin5] => SUCRE;SUCRE;SUCRE;
		//     [sesion_id_periodo] => 1
		//     [sesion_nombre_periodo_periodo] => PERIODO ESCOLAR 2015-2016
		//     [sesion_fecha_inicio_periodo] => 2015-09-01
		//     [sesion_fecha_cierre_periodo] => 2016-08-31
		//     [sesion_fecha_inicio_recuado] => 2015-12-15
		//     [sesion_fecha_cierre_recuado] => 2016-01-15
		//     [sesion_estatus_periodo] => 1
		//     [sesion_id_jefe_personal] => 
		//     [sesion_id_jefezona] => 
		//     [cierre] => final
		//     [token1] => 5F58!8?:6F;fb96e2d!6
		// )

		
		$sesion_userid	=	$datos['sesion_userid']; //
		$sesion_id_persona	=	$datos['sesion_id_persona']; //

		// $txt_id_jefeinmediato	=	$datos['txt_id_jefeinmediato']; //
		$txt_id_jefeinmediato	=	$sesion_id_persona; //
		$txt_id_vacaciones		=	$datos['txt_id_vacaciones']; // 
		
		$txt_id_personal		=	$datos['txt_id_personal']; //
		$txt_cedula_personal	=	$datos['txt_cedula_personal']; //
		$txt_nombre_funcionario	=	$datos['txt_nombre_funcionario']; //
		$txt_tipo_personal		=	$datos['txt_tipo_personal']; //
		$txt_id_cargo_funcional	=	$datos['txt_id_cargo_funcional']; //
		$txt_cargo_funcional	=	$datos['txt_cargo_funcional']; //
		$txt_municipio			=	$datos['txt_municipio']; //
		$txt_id_lugar_trabajo	=	$datos['txt_id_lugar_trabajo']; //
		$txt_lugar_trabajo		=	$datos['txt_lugar_trabajo']; //

		$txt_condicion_laboral		=	$datos['txt_condicion_laboral']; // => 2 -------  1. Fijo 2.- Contratado
		$txt_fecha_ingreso_me		=	$datos['txt_fecha_ingreso_me']; // => 01/07/2010
		$txt_periodo				=	$datos['txt_periodo']; // => 1
		$txt_lapso_vacaciones		=	$datos['txt_lapso_vacaciones']; // => 01/08/2016 - 19/08/2016
		$txt_tipo_vacaciones		=	$datos['txt_tipo_vacaciones']; // => 2
		$txt_fecha_registro			=	$datos['txt_fecha_registro']; // => 26/07/2016
		$txt_observacion			=	$datos['txt_observacion']; // => 15 dias atrasados abril del año 2014-2015
		$id_vacaciones				=	$datos['id_vacaciones']; // => 

		$accion					=	$datos['accion']; // agregar_vacaciones
		$token1					=	$datos['token1']; // DDaa5!Bc9Bd:dcAEe¡bb
		
		$txt_fecha_registro 	= Fecha_To_mysql($txt_fecha_registro);
		$txt_fecha_ingreso_me 	= Fecha_To_mysql($txt_fecha_ingreso_me);

		$periodo	= explode(" - ", $txt_lapso_vacaciones);
		$fecha_desde =  Fecha_To_mysql($periodo[0]);
		$fecha_hasta =  Fecha_To_mysql($periodo[1]);

		$fecha_retorno = $fecha_hasta;

		$estatus = 1; 
						// 0 Solicitadas
						// 1 Pendiente -  revisadas
						// 2 aprobadas - 
						// 3 rechazada - 
						// 4 generada por jefe de personal

		// ver_arreglo($datos);
		// die();

		//PARAMETROS DE LA SESION - USUARIO
		//************************************
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		$numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		// $conexion = conectar();
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// CONSULTA SQL A GENERAR
		// 
		
		$sql = "INSERT INTO permisos.vacaciones(
            			fecha_solicitud, 
            			id_funcionario, 
            			tipo_personal,
            			cargo_funcional, 
            			--numero_dias, 
            			fecha_desde, 
            			fecha_hasta, 
            			id_periodo, 
            			fecha_retorno, 
            			observacion, 
            			id_jefeinmediato, 
            			id_jefepersonal, 
            			id_municipio, 
            			id_dependencialaboral, 
            			tipo_vacaciones,
            			condicion_laboral,
            			fecha_ingreso_me,
            			estatus)
    VALUES ( 
    					'$txt_fecha_registro', 
    					'$txt_id_personal', 
    					'$txt_tipo_personal', 
            			'$txt_cargo_funcional', 
            			--'?', 
            			'$fecha_desde', 
            			'$fecha_hasta', 
            			$txt_periodo, 
            			'$fecha_retorno', 
            			'$txt_observacion', 
            			'$txt_id_jefeinmediato',
            			'$txt_id_jefeinmediato', 
            			'$txt_municipio', 
            			'$txt_id_lugar_trabajo', 
            			 $txt_tipo_vacaciones, 
            			 $txt_condicion_laboral,
            			'$fecha_ingreso_me',
            			'$estatus' );";


		// $sql = "INSERT INTO permisos.permisos( 
  //           				id_funcionario,
  //           				numero_solicitud, 
  //           				fecha_permiso, 
  //           				numero_dias, 
  //           				motivo_permiso, 
  //           				fecha_desde, 
  //           				fecha_hasta, 
  //           				fecha_recepcion, 
  //           				id_tipopermiso, 
  //           				observacion, 
  //           				id_jefeinmediato)
  //   			VALUES (
  //   						'$txt_id_personal', 
  //   						'$numero_solicitud',
  //   						'$txt_fecha_registro', 
  //   						 $txt_cantidad_dias, 
  //   						'$txt_motivo_vacaciones', 
  //           				'$fecha_desde', 
  //           				'$fecha_hasta', 
  //           				'$fecha_registro', 
  //           				'$txt_tipo_vacaciones', 
  //           				'$txt_motivo_vacaciones', 
  //           				'$txt_id_jefeinmediato');";
		// ver_arreglo($sql);
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
	function procesar_vacaciones($datos) {
		// PARAMETROS DEL FORMULARIO
		
		// ver_arreglo($datos);
		// die();

		// Array
		// (
		//     [txt_id_jefeinmediato] => 10945774
		//     [txt_id_vacaciones] => 15
		//     [txt_id_personal] => PDKxwsi8-Q5rY-UrEM-fenO-u6Qgtlm5TQQy
		//     [txt_cedula_personal] => 5696743
		//     [txt_nombre_funcionario] => MORALES M MANUEL M
		//     [txt_tipo_personal] => ADMINISTRATIVO
		//     [txt_id_cargo_funcional] => 
		//     [txt_cargo_funcional] => ADMINISTRATIVO
		//     [txt_municipio] => SUCRE
		//     [txt_id_lugar_trabajo] => 1T4ALj7B6-JHSd-tDFb-D0q8-kFCLEmYJkjiO
		//     [txt_lugar_trabajo] => PERSONAL ADMINISTRATIVO
		//     [txt_condicion_laboral] => 2
		//     [txt_fecha_ingreso_me] => 
		//     [txt_periodo] => 8
		//     [txt_lapso_vacaciones] => 04/07/2016 - 05/08/2016
		//     [txt_tipo_vacaciones] => 2
		//     [txt_fecha_registro] => 27/06/2016
		//     [txt_observacion] => 30 días
		//     [txt_observacion_estatus] => 
		//     [id_vacaciones] => 15
		//     [accion] => procesar_vacaciones
		//     [sesion_userid] => 3
		//     [sesion_username] => secretaria
		//     [sesion_nivel_usuario] => secretaria
		//     [sesion_id_persona] => 4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26
		//     [sesion_id_dependencia] => ZN0AqxQjq-kaN-IYba-LaQL-La20AKjl2qFA
		//     [sesion_ingreso] => 2016-09-22 20:23:13.512447
		//     [sesion_estatus] => 1
		//     [sesion_idpersona] => qVLCgAP4-OFGJ-1EkI-kziw-HMMZ75pTHs0B
		//     [sesion_usernombre] => RODRIGUEZ GUTIERREZ MARIELYS DEL VALLE
		//     [session_username1] => RODRIGUEZ
		//     [session_username2] => MARIELYS
		//     [sesion_cedula] => 10945774
		//     [sesion_userfoto] => 10945774
		//     [sesion_iddepartamento] => 4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26
		//     [sesion_departamento] => SECRETARIA DE PERSONAL
		//     [sesion_cargo] => SECRETARIA
		//     [sesion_ultimiacceso] => 2016-9-22 21:10:26
		//     [sesion_dependencias_admin2] => 
		//     [sesion_dependencias_admin3] => SECRETARIA DE PERSONAL;
		//     [sesion_dependencias_admin4] => SECRETARIA DE PERSONAL;
		//     [sesion_dependencias_admin5] => SUCRE;
		//     [sesion_id_periodo] => 1
		//     [sesion_nombre_periodo_periodo] => PERIODO ESCOLAR 2015-2016
		//     [sesion_fecha_inicio_periodo] => 2015-09-01
		//     [sesion_fecha_cierre_periodo] => 2016-08-31
		//     [sesion_fecha_inicio_recuado] => 2015-12-15
		//     [sesion_fecha_cierre_recuado] => 2016-01-15
		//     [sesion_estatus_periodo] => 1
		//     [sesion_id_jefe_personal] => 
		//     [sesion_id_jefezona] => 
		//     [cierre] => final
		//     [token1] => E:9bfe4CCDbddaDcD96e
		// )

		$txt_id_vacaciones      	=	$_POST['txt_id_vacaciones']; // 14

		$txt_observacion_estatus	=	$_POST['txt_observacion_estatus']; // 1
		
		$txt_estatus				=	$_POST['txt_estatus']; // 1

		

		// $numero_dias				=	$_POST['txt_estatus']; // 1

		
		$txt_lapso_vacaciones		=	$datos['txt_lapso_vacaciones']; // => 01/08/2016 - 19/08/2016
		
		$periodo	= explode(" - ", $txt_lapso_vacaciones);
		
		$fecha_desde =  Fecha_To_mysql($periodo[0]);
		
		$fecha_hasta =  Fecha_To_mysql($periodo[1]);
		
		$fecha_retorno = $fecha_hasta;

		$accion				=	$_POST['accion']; // agregar_vacaciones
		$token1				=	$_POST['token1']; // DDaa5!Bc9Bd:dcAEe¡bb
		
		$estatus = 1; 
				// 0 Solicitadas
				// 1 Pendiente -  revisadas
				// 2 aprobadas - 
				// 3 rechazada - 
				// 4 generada por jefe de personal

		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// $conexion = conectar();
		// CONSULTA SQL A GENERAR
		$sql = "UPDATE permisos.vacaciones
					   SET  
							fecha_desde='$fecha_desde', 
							fecha_hasta='$fecha_hasta', 
							fecha_retorno='$fecha_hasta', 
					   		estatus=$txt_estatus, 
					        estatus_observacion='$txt_observacion_estatus'
				WHERE id_vacaciones = $txt_id_vacaciones;";	

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
	function eliminar_vacaciones($datos) {
		// PARAMETROS DEL FORMULARIO
		$txt_id_tipovacaciones	=	$datos['id_tipovacaciones']; // 1
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		// $numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// CONSULTA SQL A GENERAR
		$sql = "DELETE FROM permisos.tipo_permiso WHERE id_tipopermiso='$txt_id_tipovacaciones';";
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