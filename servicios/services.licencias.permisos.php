<?php //require('../conf/config.php');?>
<?php require('../conf/config.postgres.php');?>
<?php require('../apiv3.0/funciones/postgres.class.php'); ?>
<?php require('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
//{"txt_codigo_periodo":"","txt_nombre_periodo":"oswaldo","txt_rango_fecha":"01/07/2016 - 01/09/2016","txt_fecha_inicio":"","txt_fecha_cierre":"","txt_radio_estatus":"0","accion":"agregar_permisos"}
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
	//		[accion] => agregar_permisos
	//		[token1] => 4f3:;EB15E360;¡BB!c1
	//)
	//	
	//ver_arreglo($_SESSION);
	//echo 'datos';
	// ver_arreglo($datos);
	//die();
	$fecha_registro = date("Y/m/d h:i:s");
	$accion					=	$datos['accion']; //	agregar_permisos"
	switch ($accion){
		case 'consultar_permisos':
			consultar_permisos($datos);
		break;
		case 'agregar_permisos':
			agregar_permisos($datos);
		break;
		case 'modificar_permisos':
			modificar_permisos($datos);
		break;
		case 'eliminar_permisos':
			eliminar_permisos($datos);
		break;
		// case 'consultar_permisos_activo':
		// 	consultar_permisos_activo($datos);
		// break;
	}
?>
<?php
	function consultar_permisos($datos) {
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		//
		// ver_arreglo($datos);		    
		$nivel_usuario =  $datos['sesion_nivel_usuario'];  //[sesion_nivel_usuario] => jefeinmediato   
		// Array
		// (
		//     [accion] => consultar_permisos
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
			$cadena_cedula = " per.persona_cedula = $persona_cedula AND ";
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
		$sql= "SELECT 	P.id_permiso, 
						P.id_funcionario, 
						
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
																	
						P.fecha_permiso, 
						P.numero_dias, 
						P.id_tipopermiso, 
						TP.nombre_tipo,
						TP.numero_dias as TPnumero_dias,
						P.motivo_permiso, 
						P.fecha_desde, 
						P.fecha_hasta, 
						P.fecha_recepcion, 
						
						P.observacion, 
						P.id_jefeinmediato, 

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
					FROM permisos.permisos AS P       
					INNER JOIN permisos.tipo_permiso AS TP ON TP.id_tipopermiso = P.id_tipopermiso
					/*-- enlace hacia funcionario*/
					LEFT JOIN comun.empleado_dependencia ed ON ed.empleado_dep_uid = P.id_funcionario
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
					LEFT JOIN comun.empleado_dependencia ed2 ON ed2.empleado_dep_uid = P.id_jefeinmediato
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
			if ($nivel_usuario=="jefeinmediato" || $nivel_usuario=="director" ){
				$sql.=     " (
					   			plan.pl_estadistico IN ($cadena_id_dependencias) 
								OR fd.dependencia_uid  IN ($cadena_id_dependencias) 
							)  ";

			}
			
			$sql.= "	ORDER BY P.id_permiso DESC";

		// ver_arreglo($sql);
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
	function agregar_permisos($datos) {

		$fecha_registro = date("Y/m/d h:i:s");
		
		// Array
		// (
		//     [txt_id_jefeinmediato] => 17326068
		//     [txt_id_permiso] => 
		//     [txt_id_personal] => 1
		//     [txt_cedula_personal] => 11829328
		//     [txt_nombre_funcionario] => OSWALDO HERNÁNDEZ
		//     [txt_tipo_personal] => ADMINISTRATIVO
		//     [txt_id_cargo_funcional] => 333
		//     [txt_cargo_funcional] => COORDINADOR DE SISTEMAS Y BASE DE DATOS
		//     [txt_municipio] => SUCRE
		//     [txt_id_lugar_trabajo] => 123
		//     [txt_lugar_trabajo] => DIV. DE INFORMATICA Y SISTEMAS
		//     [txt_tipo_permiso] => 
		//     [txt_motivo_permiso] => 
		//     [txt_cantidad_dias] => 
		//     [txt_periodo_registro] => 
		//     [txt_fecha_registro] => 
		//     [id_permiso] => 
		//     [accion] => agregar_permisos
		//     [sesion_userid] => 5
		//     [sesion_username] => director
		//     [sesion_nivel_usuario] => 4
		//     [sesion_id_persona] => 11
		//     [sesion_ingreso] => 2016-04-19 00:33:57
		//     [sesion_idpersona] => 11
		//     [sesion_usernombre] => Alberto Abellán Nuez
		//     [session_username1] => Alberto
		//     [session_username2] => Abellán
		//     [sesion_cedula] => 17326068
		//     [sesion_userfoto] => 17326068
		//     [sesion_iddepartamento] => 7
		//     [sesion_departamento] => Plantel Educativo
		//     [sesion_cargo] => Director
		//     [sesion_estatus] => 1
		//     [sesion_ultimiacceso] => 2016-4-26 11:09:36
		//     [sesion_id_periodo] => 1
		//     [sesion_nombre_periodo_periodo] => I- 2016
		//     [sesion_fecha_inicio_periodo] => 2016-01-01
		//     [sesion_fecha_cierre_periodo] => 2016-06-30
		//     [sesion_fecha_inicio_recuado] => 2015-12-15
		//     [sesion_fecha_cierre_recuado] => 2016-01-15
		//     [sesion_estatus_periodo] => 1
		//     [cierre] => final
		//     [token1] => F¿1?e8bDa1E7¡eDbCF0:
		// )

		
		$sesion_userid	=	$datos['sesion_userid']; //
		$sesion_id_persona	=	$datos['sesion_id_persona']; //

		// $txt_id_jefeinmediato	=	$datos['txt_id_jefeinmediato']; //
		$txt_id_jefeinmediato	=	$sesion_id_persona; //
		$txt_id_permiso			=	$datos['txt_id_permiso']; // 
		
		$txt_id_personal		=	$datos['txt_id_personal']; //
		$txt_cedula_personal	=	$datos['txt_cedula_personal']; //
		$txt_nombre_funcionario	=	$datos['txt_nombre_funcionario']; //
		$txt_tipo_personal		=	$datos['txt_tipo_personal']; //
		$txt_id_cargo_funcional	=	$datos['txt_id_cargo_funcional']; //
		$txt_cargo_funcional	=	$datos['txt_cargo_funcional']; //
		$txt_municipio			=	$datos['txt_municipio']; //
		$txt_id_lugar_trabajo	=	$datos['txt_id_lugar_trabajo']; //
		$txt_lugar_trabajo		=	$datos['txt_lugar_trabajo']; //
		
		$txt_tipo_permiso		=	$datos['txt_tipo_permiso']; //
		$txt_motivo_permiso		=	$datos['txt_motivo_permiso']; //
		$txt_cantidad_dias		=	$datos['txt_cantidad_dias']; //
		$txt_periodo_registro	=	$datos['txt_periodo_registro']; //
		$txt_fecha_registro		=	$datos['txt_fecha_registro']; //
		$id_permiso				=	$datos['id_permiso']; //

		$accion					=	$datos['accion']; // agregar_permisos
		$token1					=	$datos['token1']; // DDaa5!Bc9Bd:dcAEe¡bb
		
		$txt_fecha_registro = Fecha_To_mysql($txt_fecha_registro);

		$periodo	= explode(" - ", $txt_periodo_registro);
		$fecha_desde =  Fecha_To_mysql($periodo[0]);
		$fecha_hasta =  Fecha_To_mysql($periodo[1]);

		$estatus = '4';
		$observacion = 'Otorgado por Jefe Inmediato';
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
		$sql = "INSERT INTO permisos.permisos( 
            				id_funcionario,
            				numero_solicitud, 
            				fecha_permiso, 
            				numero_dias, 
            				motivo_permiso, 
            				fecha_desde, 
            				fecha_hasta, 
            				fecha_recepcion, 
            				id_tipopermiso, 
            				observacion,
            				estatus, 
            				id_jefeinmediato)
    			VALUES (
    						'$txt_id_personal', 
    						'$numero_solicitud',
    						'$txt_fecha_registro', 
    						 $txt_cantidad_dias, 
    						'$txt_motivo_permiso', 
            				'$fecha_desde', 
            				'$fecha_hasta', 
            				'$fecha_registro', 
            				'$txt_tipo_permiso', 
            				'$observacion',
            				'$estatus', 
            				'$txt_id_jefeinmediato');";
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
	function modificar_permisos($datos) {
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
		$accion				=	$_POST['accion']; // agregar_permisos
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
	function eliminar_permisos($datos) {
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