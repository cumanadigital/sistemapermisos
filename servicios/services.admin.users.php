<?php require('../conf/config.postgres.php');?>
<?php require('../apiv3.0/funciones/postgres.class.php'); ?>
<?php require('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
	 $datos = array();
	if ($_POST){
		// echo "post<br>"; 
		$datos=$_POST;
		// ver_arreglo($_POST);	
	}
	if ($_GET){
		// echo "get<br>";
		$datos=$_GET;
	}
  	//echo json_encode($datos);
  	if (count($datos)>0) {
  		$accion			= $datos['accion']; //	agregar"
  		//ver_arreglo($datos);
  	}else{
  		$accion="salir";
  		//$accion="buscar_asignaturas";
  		
  	}
  	// $accion="buscar_preparaduria";
  	//
  	$fecha_registro 	= date("Y/m/d h:i:s");
  	//
	switch ($accion){
		// case 'registrar_user_estudiante':
		// 	registrar_user_estudiante($datos);
		// break;
		
		case 'agregar_usuario':
			agregar_usuario($datos);
		break;
		case 'consultar_usuario':
			consultar_usuario($datos);
		break;
		case 'modificar_usuario':
			modificar_usuario($datos);
		break;
		case 'eliminar_usuario':
			eliminar_usuario($datos);
		break;
		// case 'consultar_usuario_estudiante':
		// 	consultar_usuario_estudiante($datos);
		// break;
		// case 'modificar_usuario_estudiante':
		// 	modificar_usuario_estudiante($datos);
		// break;
		// case 'eliminar_usuario_estudiante':
		// 	eliminar_usuario_estudiante($datos);
		// break;
	}
	//******************************************************************
	////******************************************************************
	/////******************************************************************
	/////******************************************************************
	/////******************************************************************
// 	function registrar_user_estudiante($data){
// 		$txt_reg_cedula 	= $data['txt_reg_cedula'];  //=> 11829328
// 		$txt_reg_nombre 	= $data['txt_reg_nombre'];  //=> Oswaldo
// 		$txt_reg_apellido 	= $data['txt_reg_apellido'];  //=> Hernandez
// 		$txt_reg_correo 	= $data['txt_reg_correo'];  //=> oswaldoehc@gmail.com
// 		$txt_reg_telefono 	= $data['txt_reg_telefono'];  //=> 0416-5936395
// 		$txt_reg_password1 	= $data['txt_reg_password1'];  //=> 1234
// 		$txt_reg_password2 	= $data['txt_reg_password2'];  //=> 1234		
// 		$txt_departamento 	= $data['txt_departamento'];
// 		$accion 			= $data['accion'];  //=> registrar_user_estudiante
// 		$estatus = "activo";
// 		$nivel = "3";
// // 
// 		$conexion = conectar(); 
// 		mysql_set_charset('utf8',$conexion); //formato de datos utf8
// 		//
// 		$sql= "	SELECT 
// 					estudiante.id_estudiante, 
// 				    estudiante.cedula, 
// 				    estudiante.apellido_alumno,
// 				    estudiante.nombre_alumno, 
// 				    estudiante.foto_alumno,
// 				    estudiante.correo_alumno,
// 				    estudiante.telefono_alumno,
// 				    estudiante.estatus_alumno,
// 				    departamento.id_departamento,
// 				    departamento.nombre_departamento 
// 				FROM estudiante 
// 				INNER JOIN departamento ON (estudiante.id_departamento=departamento.id_departamento)
// 				WHERE ( estudiante.cedula = '$txt_reg_cedula' ) 
// 				ORDER BY estudiante.id_departamento ASC, estudiante.apellido_alumno ASC";
// 		//
// 		$resultado_sql = consultar($sql, $conexion);
// 		$number = numresult($resultado_sql);	
// 		// echo ('$number->'.$number);
// 		if ($number>0) {
// 			$arreglo = datos_consultas_array($resultado_sql);
// 			// ver_arreglo($arreglo);
// 			echo ("@true");
// 		}else{
// 			$new_usuario = $txt_reg_cedula  . strtoupper(substr($txt_reg_apellido,0,1) . substr($txt_reg_nombre,0,1) ) ;
// 			$new_password = $txt_reg_cedula; 
// 			// echo $new_usuario."<br>";
// 			// echo "@false<br>";
// 			$sql2 = "INSERT INTO `estudiante`( 
// 								    `cedula`, 
// 								    `nombre_alumno`, 
// 								    `apellido_alumno`, 
// 								    `telefono_alumno`, 
// 								    `correo_alumno`,  
// 								    `foto_alumno`,
// 								    `id_departamento`, 
// 								    `estatus_alumno`) 
// 					VALUES (
// 									'$txt_reg_cedula',
// 									'$txt_reg_nombre',
// 									'$txt_reg_apellido',
// 									'$txt_reg_telefono',
// 									'$txt_reg_correo',
// 									'$txt_reg_cedula',
// 									'$txt_departamento',
// 									'$estatus')";
// 			// ver_arreglo($sql2);
// 			$resultado_sql2 = consultar($sql2, $conexion);
// // 
// 			// *********************
// 			$sql3 = "SELECT id_estudiante FROM estudiante WHERE cedula = '$txt_reg_cedula' LIMIT 1";
// 			// ver_arreglo($sql3);
// 			$resultado_sql3 = consultar($sql3, $conexion);
// 			$number3=numresult($resultado_sql3);
// 			$arreglo3 = datos_consultas_array($resultado_sql3);
// 			// ver_arreglo($arreglo3);
// 			//******************************************
// 			$id_estudiante = $arreglo3[0]['id_estudiante'];
// 			$fecha_registro 	= date("Y/m/d h:i:s");
// 			$sql4 ="INSERT INTO `usuario`(
// 									`nombre_usuario`, 
// 									`clave_usuario`, 
// 									`nivel_usuario`, 
// 									`id_persona`, 
// 									`fechasesion`) 
// 					VALUES (
// 									'$new_usuario',
// 									'$txt_reg_password1',
// 									'$nivel',
// 									'$id_estudiante',
// 									'$fecha_registro')";
// 			$resultado_sql4 = consultar($sql4, $conexion);
// 			$resultado['login_user']= $new_usuario;
// 			$resultado['pass_user']= $txt_reg_password1;
// 			echo json_encode($resultado);
// 		}
// 	}
	// *******************************************
	// *******************************************
	
function agregar_usuario($data){
		ver_arreglo($data);
		
		$txt_reg_cedula 	= $data['txt_reg_cedula'];  //=> 11829328
		$txt_reg_nombre 	= $data['txt_reg_nombre'];  //=> Oswaldo
		$txt_reg_apellido 	= $data['txt_reg_apellido'];  //=> Hernandez
		$txt_reg_correo 	= $data['txt_reg_correo'];  //=> oswaldoehc@gmail.com
		$txt_reg_telefono 	= $data['txt_reg_telefono'];  //=> 0416-5936395
		$txt_reg_password1 	= $data['txt_reg_password1'];  //=> 1234
		$txt_reg_password2 	= $data['txt_reg_password2'];  //=> 1234		
		$txt_departamento 	= $data['txt_departamento'];
		$txt_cargo 			= $data['txt_cargo'];
		
		$accion 			= $data['accion'];  //=> registrar_user_estudiante
		$estatus = "1";
		$nivel = $txt_cargo;
// 
		$conexion = conectar(); 
		mysql_set_charset('utf8',$conexion); //formato de datos utf8
		//
		 $sql = "SELECT
					id_personal as id_persona,
					cedula_personal as cedula_persona,
					nombre_personal as nombre_persona,
					apellido_personal as apellido_persona,
					correo_personal as correo_persona,
					telefono_personal as telefono_persona,
					foto_personal as foto_persona,
					estatus_personal as estatus_persona,
					departamento.id_departamento as id_departamento,
					departamento.nombre_departamento as departamento_persona,
					nombre_cargo as cargo_persona
				FROM personal
				INNER JOIN departamento
					ON departamento.id_departamento = personal.id_departamento
				INNER JOIN cargo
					ON cargo.id_cargo = personal.id_cargo
				WHERE ( cedula_personal = '$txt_reg_cedula' ) " ;
		$resultado_sql = consultar($sql, $conexion);
		$number = numresult($resultado_sql);	
		// echo ('$number->'.$number);
		if ($number>0) {
			$arreglo = datos_consultas_array($resultado_sql);
			// ver_arreglo($arreglo);
			echo ("@true");
		}else{
			$new_usuario = $txt_reg_cedula  . strtoupper(substr($txt_reg_apellido,0,1) . substr($txt_reg_nombre,0,1) ) ; 
			// echo $new_usuario."<br>";
			// echo "@false<br>";
			

			$sql = 	"INSERT INTO `personal` ( 
								    `cedula_personal`, 
								    `nombre_personal`, 
								    `apellido_personal`, 
								    `correo_personal`, 
								    `telefono_personal`, 
								    `foto_personal`, 
								    `estatus_personal`, 
								    `id_departamento`, 
								    `id_cargo`) 
							   VALUES (
							    	'$txt_reg_cedula', 
							       	'$txt_reg_nombre', 
							       	'$txt_reg_apellido', 
							       	'$txt_reg_correo', 
							       	'$txt_reg_telefono', 
							       	'$txt_reg_cedula', 
							       	'$estatus', 
							       	'$txt_departamento', 
							       	'$txt_cargo')";

			$resultado_sql = consultar($sql, $conexion);
// 
			// *********************
			$sql3 = "SELECT id_personal FROM personal WHERE cedula_personal = '$txt_reg_cedula' LIMIT 1";
			// ver_arreglo($sql3);
			$resultado_sql3 = consultar($sql3, $conexion);
			$number3=numresult($resultado_sql3);
			$arreglo3 = datos_consultas_array($resultado_sql3);
			// ver_arreglo($arreglo3);
			//******************************************
			$id_personal = $arreglo3[0]['id_personal'];
			$fecha_registro 	= date("Y/m/d h:i:s");
			$sql4 ="INSERT INTO `usuario`(
									`nombre_usuario`, 
									`clave_usuario`, 
									`nivel_usuario`, 
									`id_persona`, 
									`fechasesion`) 
					VALUES (
									'$new_usuario',
									'$txt_reg_password1',
									'$nivel',
									'$id_personal',
									'$fecha_registro')";
			$resultado_sql4 = consultar($sql4, $conexion);
			$resultado['login_user']= $new_usuario;
			$resultado['pass_user']= $txt_reg_password1;
			echo json_encode($resultado);
		}
	}

	// *******************************************
	// *******************************************
	function consultar_usuario($data){
		$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
		// *******************
		$sql = "SELECT 	U.id_usuario, 
										U.login_usuario as nombre_usuario, 
									/*	--U.password_usuario, */
										U.id_funcionario as id_persona, 
										U.fecha_ultimo_acceso, 
										U.tipo_usuario, 
										UPPER (U.rol_usuario) AS rol_usuario, 
										U.estatus_usuario as estatus_persona,
										per.persona_cedula as cedula_persona,
										btrim((COALESCE(per.persona_apellidos, ''::character varying)::text || ' '::text) || COALESCE(per.persona_nombres, ''::character varying)::text) AS apellidos_nombres,
										per.persona_apellidos as nombre_persona,
										per.persona_nombres as apellido_persona,
										COALESCE(plan.pl_nombre, fd.dependencia_nombre, d.dependencia_nombre) AS departamento_persona,
										COALESCE(fc.funcion_cargo_descripcion, c.cargo_denominacion) AS cargo_persona,
										car.categoria_cargo_descripcion,
										c.cargo_codigo,
										c.cargo_denominacion ,
										U.id_dependencia ,
										upper(m.municipio_nombre::text) AS municipio_nombre
							FROM permisos.usuario AS U
							LEFT JOIN comun.empleado_dependencia ed ON ed.empleado_dep_uid = U.id_funcionario
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

							ORDER BY U.id_usuario DESC";
		// *********************************
		$dato=consultar($sql,$Postgres);
  		$NumeroDeFilas = $Postgres->NumeroDeFilas();
  		if ($NumeroDeFilas>0) {
  			foreach ($dato as $key => $value) {
  				$id_dependencia = $value['id_dependencia'];
				$ARRay_dep_uis=array();
				$ARRay_dep_uis = explode(",", $id_dependencia);
				$texto='';
				for ($i=0;$i<count($ARRay_dep_uis);$i++){
					if($i<count($ARRay_dep_uis)-1)
						$texto.=" pl_estadistico="."'".$ARRay_dep_uis[$i]."' or";
					else 
						$texto.=" pl_estadistico="."'".$ARRay_dep_uis[$i]."' ";
				}
  				$sql2= "SELECT * from ( 
						(SELECT pl_estadistico,
								pl_nombre,
								--pl_coddea,
								--cast( pl_municipio as  int)as  pl_municipio,
								UPPER(municipio_nombre) AS municipio_nombre
							FROM comun.planteles
							LEFT JOIN comun.municipio ON( CAST(municipio_codigo AS INT) = CAST(pl_municipio AS INT) )  
							WHERE pl_coddea = 'ZE_INTERNA'
							order by   pl_nombre 
						)
					union(
						SELECT dependencia_uid AS pl_estadistico,
						dependencia_nombre AS pl_nombre ,
						--dependencia_codigonomina AS pl_coddea ,
						--dependencia_municipio AS pl_municipio,
						UPPER(municipio_nombre) AS municipio_nombre
						FROM comun.dependencia
						LEFT JOIN comun.municipio ON( CAST(municipio_codigo AS INT) = CAST(dependencia_municipio AS INT) )
						--where (  dependencia_codigonomina like '0020%' or dependencia_codigonomina like '001%')
						--     and dependencia_codigonomina   <> '002071847' and   dependencia_codigonomina <> '002071837' 
						--     and dependencia_codigonomina   <> '002071857' and   dependencia_codigonomina <> '002071837' 
						--     and dependencia_codigonomina   <> '002071827' and   dependencia_codigonomina <> '001200489' 
						--     and dependencia_codigonomina   <> '001200487' and  dependencia_codigonomina <> '001200480'
						order by dependencia_nombre--dependencia_codigonomina
						) 

					) as alias 
					where $texto
					order by  alias.pl_nombre   ";

				$dato2=consultar($sql2,$Postgres);
		  		// ver_arreglo($dato2);
		  		// ver_arreglo(json_encode($dato2));
		  		
		  		
		  		$NumeroDeFilas2 = $Postgres->NumeroDeFilas();
		  		if ($NumeroDeFilas2>0) {
		  			$cadena="";
		  			foreach ($dato2 as $key2 => $value2) {
		  				# code...
		  				// ver_arreglo($value2['pl_nombre']);
		  				$pos = intval($key2) + 1; 
		  				$cadena.= $pos  ."- ". limitarPalabras($value2['pl_nombre'],30,"...") . "<br>";
		  			}
		  			// ver_arreglo($dato2[0]['pl_nombre']);
		  		}else{
		  			// print_r(false);
		  		}
				// dependencias_admin3:"0- CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS<br>1- DIV. DE INFORMATICA Y SISTEMAS<br>"

			  	// $dato[$key]['dependencias_admin'] = json_encode($dato2);
			  	$dato[$key]['dependencias_admin2'] = $dato2;
			  	$dato[$key]['dependencias_admin3'] = $cadena;
			  	
  				// ver_arreglo ($value['id_dependencia']); // => sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT
  				# code...
  			}

  			echo json_encode($dato);
  		}else{
  			echo 'false';
  		}
	}

	function modificar_usuario($data) {
		// PARAMETROS DEL FORMULARIO
		// ver_arreglo($data);
		$txt_id_persona 	= $data['txt_id_persona'];  //=> 11829328

		// $txt_reg_cedula 	= $data['txt_reg_cedula'];  //=> 11829328
		$txt_reg_nombre 	= $data['txt_reg_nombre'];  //=> Oswaldo
		$txt_reg_apellido 	= $data['txt_reg_apellido'];  //=> Hernandez
		$txt_reg_correo 	= $data['txt_reg_correo'];  //=> oswaldoehc@gmail.com
		$txt_reg_telefono 	= $data['txt_reg_telefono'];  //=> 0416-5936395
		$txt_reg_password1 	= $data['txt_reg_password1'];  //=> 1234
		$txt_reg_password2 	= $data['txt_reg_password2'];  //=> 1234		
		$txt_departamento 	= $data['txt_departamento'];
		$txt_cargo 			= $data['txt_cargo'];
		$accion 			= $data['accion'];  //=> registrar_user_estudiante
		$estatus = "activo";
		$nivel = "3";

		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		$numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$conexion = conectar();
		// CONSULTA SQL A GENERAR
		$sql = "UPDATE `personal` SET 
							`nombre_personal`='$txt_reg_nombre',
							`apellido_personal`='$txt_reg_apellido',
							`correo_personal`='$txt_reg_correo',
							`telefono_personal`=$txt_reg_telefono,
							`id_departamento`=$txt_departamento,
							`id_cargo`=$txt_cargo 
				WHERE `id_personal` =  $txt_id_persona";
		$cadena = "";
		$resultado_sql = consultar($sql, $conexion);
		if ($resultado_sql) {
			$cadena = $cadena . "update@";

			if ($txt_reg_password1!='') {
				$sql2 = "UPDATE `usuario` SET 
								`clave_usuario`= '$txt_reg_password1' 
				 		WHERE (`id_persona` = $txt_id_persona and `nivel_usuario` !='3')";
				ver_arreglo($sql2);
				$resultado_sql2 = consultar($sql2, $conexion);
				$cadena = $cadena . "update2@"; 
			}

		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}


	function eliminar_usuario($datos) {
		// PARAMETROS DEL FORMULARIO
		$txt_id	=	$datos['id_persona'];
		// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
		$numero_solicitud = uniqid();
		// INICIA LA CONEXION CON EL SERVIDOR MYSQL
		$conexion = conectar();
		// CONSULTA SQL A GENERAR
		$sql = "DELETE FROM `personal` WHERE `personal`.`id_personal` = $txt_id";
		// EJECUTAR LA CONSULTA
		$resultado_sql = consultar($sql, $conexion);
		if ($resultado_sql) {
			$cadena = "eliminado@";
			$sql2 = "DELETE FROM `usuario` WHERE (`usuario`.`id_persona` = $txt_id and nivel_usuario != '3')";
			$resultado_sql = consultar($sql2, $conexion);
		}else{
			$cadena = "false@";
		}
		print_r($cadena);
	}


	// *******************************************
	// *******************************************
	// function consultar_usuario_estudiante($data){
	// 	$conexion = conectar();
	// 	mysql_set_charset('utf8',$conexion); //formato de datos utf8

	// 	$sql 	="SELECT
	// 				id_estudiante as id_persona,
	// 				cedula as cedula_persona,
	// 				nombre_alumno as nombre_persona,
	// 				apellido_alumno as apellido_persona, 
	// 				correo_alumno as correo_persona, 
	// 				telefono_alumno as telefono_persona,
	// 				foto_alumno as foto_persona, 
	// 				estatus_alumno as estatus_persona,
	// 				nombre_usuario AS nombre_usuario,
	// 				departamento.id_departamento as id_departamento,
	// 				departamento.nombre_departamento as departamento_persona,
	// 				'Estudiante' as cargo_persona
	// 			FROM estudiante 
	// 			INNER JOIN departamento 
	// 				ON departamento.id_departamento = estudiante.id_departamento
	// 			INNER JOIN usuario
	// 				ON usuario.id_persona = estudiante.id_estudiante

	// 			WHERE ( usuario.nivel_usuario ='3' )
	// 			ORDER BY cedula ASC";

	//    //  $sql = "SELECT
	// 			// 	id_personal as id_persona,
	// 			// 	cedula_personal as cedula_persona,
	// 			// 	nombre_personal as nombre_persona,
	// 			// 	apellido_personal as apellido_persona,
	// 			// 	correo_personal as correo_persona,
	// 			// 	telefono_personal as telefono_persona,
	// 			// 	foto_personal as foto_persona,
	// 			// 	estatus_personal as estatus_persona,
	// 			// 	nombre_usuario AS nombre_usuario,
	// 			// 	departamento.id_departamento as id_departamento,
	// 			// 	departamento.nombre_departamento as departamento_persona,
	// 			// 	cargo.id_cargo as id_cargo,
	// 			// 	nombre_cargo as cargo_persona
	// 			// FROM personal
	// 			// INNER JOIN departamento
	// 			// 	ON departamento.id_departamento = personal.id_departamento
	// 			// INNER JOIN cargo
	// 			// 	ON cargo.id_cargo = personal.id_cargo
	// 			// INNER JOIN usuario
	// 			// 	ON usuario.id_persona = personal.id_personal

	// 			// WHERE ( ) AND ( usuario.nivel_usuario !='3')
	// 			// ORDER BY departamento.id_departamento ASC, cargo.id_cargo ASC 
	// 			// " ;

	// 	//echo $sql;
	//   	$resultado_sql = consultar($sql, $conexion);
	// 	//$dato = array();
	// 	$arreglo = datos_consultas_array($resultado_sql);
	// 	// ver_arreglo($arreglo);
	//     echo json_encode($arreglo);
	// }

	// function modificar_usuario_estudiante($data) {
	// 	// PARAMETROS DEL FORMULARIO
	// 	// ver_arreglo($data);
	// 	$txt_id_persona 	= $data['txt_id_persona'];  //=> 11829328

	// 	// $txt_reg_cedula 	= $data['txt_reg_cedula'];  //=> 11829328
	// 	$txt_reg_nombre 	= $data['txt_reg_nombre'];  //=> Oswaldo
	// 	$txt_reg_apellido 	= $data['txt_reg_apellido'];  //=> Hernandez
	// 	$txt_reg_correo 	= $data['txt_reg_correo'];  //=> oswaldoehc@gmail.com
	// 	$txt_reg_telefono 	= $data['txt_reg_telefono'];  //=> 0416-5936395
	// 	$txt_reg_password1 	= $data['txt_reg_password1'];  //=> 1234
	// 	$txt_reg_password2 	= $data['txt_reg_password2'];  //=> 1234		
	// 	$txt_departamento 	= $data['txt_departamento'];
	// 	// $txt_cargo 			= $data['txt_cargo'];
	// 	$accion 			= $data['accion'];  //=> registrar_user_estudiante
	// 	$estatus = "activo";
	// 	$nivel = "3";

	// 	// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
	// 	$numero_solicitud = uniqid();
	// 	// INICIA LA CONEXION CON EL SERVIDOR MYSQL
	// 	$conexion = conectar();
	// 	// CONSULTA SQL A GENERAR
	// 	// 
	// 	$sql = "UPDATE `estudiante` SET 
	// 						`nombre_alumno`='$txt_reg_nombre',
	// 						`apellido_alumno`='$txt_reg_apellido',
	// 						`telefono_alumno`='$txt_reg_telefono',
	// 						`correo_alumno`='$txt_reg_correo',
	// 						`id_departamento`='$txt_departamento' 
	// 						WHERE `id_estudiante` = $txt_id_persona";

	// 	// $sql = "UPDATE `personal` SET 
	// 	// 					`nombre_personal`='$txt_reg_nombre',
	// 	// 					`apellido_personal`='$txt_reg_apellido',
	// 	// 					`correo_personal`='$txt_reg_correo',
	// 	// 					`telefono_personal`='$txt_reg_telefono',
	// 	// 					`id_departamento`=$txt_departamento,
	// 	// 					`id_cargo`=$txt_cargo 
	// 	// 		WHERE `id_personal` =  $txt_id_persona";
	// 	$cadena = "";
	// 	$resultado_sql = consultar($sql, $conexion);
	// 	if ($resultado_sql) {
	// 		$cadena = $cadena . "update@";

	// 		if ($txt_reg_password1!='') {
	// 			$sql2 = "UPDATE `usuario` SET 
	// 							`clave_usuario`= '$txt_reg_password1' 
	// 			 		WHERE (`id_persona` = $txt_id_persona and `nivel_usuario` ='3')";
	// 			// ver_arreglo($sql2);
	// 			$resultado_sql2 = consultar($sql2, $conexion);
	// 			$cadena = $cadena . "update2@"; 
	// 		}

	// 	}else{
	// 		$cadena = "false@";
	// 	}
	// 	print_r($cadena);
	// }


	// function eliminar_usuario_estudiante($datos) {
	// 	// PARAMETROS DEL FORMULARIO
	// 	$txt_id	=	$datos['id_persona'];
	// 	// VARIABLE UNICA BASADA EN TIMESTAMP PARA GENERAR UN ID UNICO PARA LA SOLICITUD
	// 	$numero_solicitud = uniqid();
	// 	// INICIA LA CONEXION CON EL SERVIDOR MYSQL
	// 	$conexion = conectar();
	// 	// CONSULTA SQL A GENERAR
	// 	$sql = "DELETE FROM `estudiante` WHERE `estudiante`.`id_estudiante` = $txt_id";
	// 	// EJECUTAR LA CONSULTA
	// 	$resultado_sql = consultar($sql, $conexion);
	// 	if ($resultado_sql) {
	// 		$cadena = "eliminado@";
	// 		$sql2 = "DELETE FROM `usuario` WHERE (`usuario`.`id_persona` = $txt_id and nivel_usuario = '3')";
	// 		$resultado_sql = consultar($sql2, $conexion);
	// 	}else{
	// 		$cadena = "false@";
	// 	}
	// 	print_r($cadena);
	// }
?>