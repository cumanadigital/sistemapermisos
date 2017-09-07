<?php //include('../conf/config.postgres.php');?>
<?php //include('../conf/config.login.php');?>
<?php //include('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php require('../conf/config.postgres.php');?>
<?php require('../apiv3.0/funciones/postgres.class.php'); ?>
<?php require('../apiv3.0/funciones/funciones3.0.php'); ?>
<?php
//echo "<pre>";
//print_r ($_SERVER);
//echo "</pre>";
//sleep(5);
//die();
//Bueno, pues hay 4 opciones por las cuales el sistema te regresará un 0 y
//solo un caso en el que te devolverá un 1
//Te devuelve un 0 (zero) si
//1 .- Ya están declaradas las variables de sesión o alguna de las dos
//2 .- La conexión a la DB no se logra hacer (servidor, nombre de usuario o contraseña incorrectos)
//3 .- No puede llevar a cabo la consulta (o sea en el momento en el que hace el mysql_query)
//4 .- Si hizo la consulta pero no encontró ningún resultado
//Debes verificar esos 4 puntos antes de poder hacer la consulta.
//Saludos.
//P.D: Un error muy común es que se nos olvida colocar la función session_start() al principio de nuestro archivo y sin ella, las variables de sesión no podrán existir.
//echo "<br />";
//print_r (DB_SERVER."<br />");
//print_r (DB_NAME."<br />");
//print_r (DB_USER."<br />");
//print_r (DB_PASSWORD."<br />");
//print_r (DB_DRIVER."<br />");
//die();
session_start();
//
$dbserver = DB_SERVER;
/*	Revisamos que sea una petición ajax, pues el indice HTTP_X_REQUESTED_WITH solo existe en este tipo de peticiones */
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
	
	if ( !isset($_SESSION['sesion_username']) && !isset($_SESSION['sesion_userid']) ){
		//echo "paso";
		// *** DATABASE MYSQL
		//
		// Text to ASCII Art Generator (TAAG) - patorjk.com
		// http://patorjk.com/software/taag/
		// 
		//	Font Name: ANSI Shadow
		//		
		// ██████╗  █████╗ ████████╗ █████╗ ██████╗  █████╗ ███████╗███████╗
		// ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
		// ██║  ██║███████║   ██║   ███████║██████╔╝███████║███████╗█████╗  
		// ██║  ██║██╔══██║   ██║   ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝  
		// ██████╔╝██║  ██║   ██║   ██║  ██║██████╔╝██║  ██║███████║███████╗
		// ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
		// 
		// ███╗   ███╗██╗   ██╗███████╗ ██████╗ ██╗                         
		// ████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗██║                         
		// ██╔████╔██║ ╚████╔╝ ███████╗██║   ██║██║                         
		// ██║╚██╔╝██║  ╚██╔╝  ╚════██║██║▄▄ ██║██║                         
		// ██║ ╚═╝ ██║   ██║   ███████║╚██████╔╝███████╗                    
		// ╚═╝     ╚═╝   ╚═╝   ╚══════╝ ╚══▀▀═╝ ╚══════╝                    
    // 
    // Font Name: Calvin S                                                                                
    //
	  // ╔╦╗╔═╗╔╦╗╔═╗╔╗ ╔═╗╔═╗╔═╗
	  //  ║║╠═╣ ║ ╠═╣╠╩╗╠═╣╚═╗║╣ 
	  // ═╩╝╩ ╩ ╩ ╩ ╩╚═╝╩ ╩╚═╝╚═╝
	  // ╔╦╗╦ ╦╔═╗╔═╗ ╦          
	  // ║║║╚╦╝╚═╗║═╬╗║          
	  // ╩ ╩ ╩ ╚═╝╚═╝╚╩═╝        

		if ( $dbserver == 'mysql') {
			//echo "paso 1";
			if ( @$idcnx = @mysql_connect(DB_SERVER,DB_USER,DB_PASSWORD) ){
				//echo "paso 2";	
				if ( @mysql_select_db(DB_NAME,$idcnx) ){
					//echo "paso 3";
					//$sql = 'SELECT * FROM usuario WHERE nombre_usuario="' . $_POST['login_username']. '" && clave_usuario="' . md5($_POST['login_userpass']) . '" LIMIT 1';
					$sql = 'SELECT * FROM usuario WHERE nombre_usuario="' . $_POST['login_username']. '" && clave_usuario="' . $_POST['login_userpass'] . '" LIMIT 1';
					// echo "<br />".$sql."<br />";
					if ( @$res = @mysql_query($sql) ){
						//echo "paso 4";
						if ( @mysql_num_rows($res) == 1 ){
							//echo "paso 5";
							$user = @mysql_fetch_array($res);
							$_SESSION['sesion_userid']				= $user['id_usuario'];
							$_SESSION['sesion_username']			= $user['nombre_usuario'];
							$_SESSION['sesion_nivel_usuario']		= $user['nivel_usuario'];
							$_SESSION['sesion_id_persona']			= $user['id_persona'];
							$_SESSION['sesion_ingreso']				= $user['fechasesion'];
							//print_r($user);
							//nivel_usuario
							//0:Admin, 1:Jefe Dpto, 2:Secretaria, 3:Estudiante, 4:Profesor
							if  ($_SESSION['sesion_nivel_usuario'] >= "23" ) { // ES ESTUDIANTE
								//echo "paso 6.1";
								//$sql2 =	"SELECT * FROM estudiante ".
								//				"INNER JOIN departamento ".
								//				"	ON departamento.id_departamento = estudiante.id_departamento ".
								//				"   WHERE estudiante.id_estudiante=" . $_SESSION['id_persona'] ;
								$sql2 	="SELECT
													id_estudiante as id_persona,
													cedula as cedula_persona,
													nombre_alumno as nombre_persona,
													apellido_alumno as apellido_persona, 
													correo_alumno as correo_persona, 
													telefono_alumno as telefono_persona,
													foto_alumno as foto_persona, 
													estatus_alumno as estatus_persona,
													departamento.id_departamento as id_departamento,
													departamento.nombre_departamento as departamento_persona,
													'Usuario' as cargo_persona
												FROM estudiante 
												INNER JOIN departamento 
													ON departamento.id_departamento = estudiante.id_departamento
												WHERE estudiante.id_estudiante=" . $_SESSION['sesion_id_persona'] ;
							}else{
									//echo "paso 6.2";
									$sql2 = "SELECT
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
												WHERE personal.id_personal=" . $_SESSION['sesion_id_persona'] ;
							}
							//ver_arreglo($sql2);
							if ( @$res2 = @mysql_query($sql2) ){
								//echo "paso 7";
								if ( @mysql_num_rows($res2) == 1 ){
									//echo "paso 8";
									$user2 = @mysql_fetch_array($res2);
									$_SESSION['sesion_idpersona']			= $user2['id_persona'];
									$_SESSION['sesion_usernombre']			= $user2['nombre_persona'] . " " .$user2['apellido_persona'];
									// 
									$nombres1 								= explode(' ', trim($user2['nombre_persona']));
									$_SESSION['session_username1'] 			= $nombres1[0];
									// 
									$nombres2 								= explode(' ', trim($user2['apellido_persona']));
									$_SESSION['session_username2'] 			= $nombres2[0];
									// 
									$_SESSION['sesion_cedula']				= $user2['cedula_persona'];
									$_SESSION['sesion_userfoto']			= $user2['foto_persona'];
									$_SESSION['sesion_iddepartamento']		= $user2['id_departamento'];
									$_SESSION['sesion_departamento'] 		= $user2['departamento_persona'];
									$_SESSION['sesion_cargo']				= $user2['cargo_persona'];
									$_SESSION['sesion_estatus']				= $user2['estatus_persona'];
									$_SESSION['sesion_ultimiacceso']		= date("Y-n-j H:i:s");
									//print_r($user2);
									$sql3 = "UPDATE `bdudoadmin`.`usuario` SET `fechasesion` = CURRENT_TIMESTAMP WHERE `usuario`.`id_usuario` = ".$_SESSION['sesion_userid'] .";";
									@$res3 = @mysql_query($sql3);
									echo 1;
								}
							}
							$sql3 = "SELECT `id_periodo`, `nombre_periodo`, `fecha_inicio`, `fecha_cierre`,`fecha_recaudo_ini`,`fecha_recaudo_fin`,`estatus` FROM `periodo` WHERE `estatus`='1' LIMIT 1 ";
							if ( @$res3 = @mysql_query($sql3) ){
								//echo "paso 7";
								if ( @mysql_num_rows($res3) == 1 ){
									//echo "paso 8";
									$user3 = @mysql_fetch_array($res3);
									$_SESSION['sesion_id_periodo']								= $user3['id_periodo'];
									$_SESSION['sesion_nombre_periodo_periodo']		= $user3['nombre_periodo'];
									$_SESSION['sesion_fecha_inicio_periodo']			= $user3['fecha_inicio'];
									$_SESSION['sesion_fecha_cierre_periodo']			= $user3['fecha_cierre'];

									$_SESSION['sesion_fecha_inicio_recuado']			= $user3['fecha_recaudo_ini'];
									$_SESSION['sesion_fecha_cierre_recuado']			= $user3['fecha_recaudo_fin'];

									$_SESSION['sesion_estatus_periodo']						= $user3['estatus'];
								}
							}
							// ver_arreglo($_SESSION);
							
						} else {
							// 4 .- Si hizo la consulta pero no encontró ningún resultado
							// login password - incorrectos
							echo "4 .- Si hizo la consulta pero no encontró ningún resultado";
							echo 0;
						}
					} else {
						// 3 .- No puede llevar a cabo la consulta (o sea en el momento
						// en el que hace el mysql_query)
						// no se pudo ejecutar la consulta
						echo "3 .- No puede llevar a cabo la consulta ";
						echo 0;
					}
				}
				mysql_close($idcnx);
			}
			else {
				// 2 .- La conexión a la DB no se logra hacer ya sea por
				// (servidor, nombre de usuario o contraseña incorrectos)
				// error conexión base datos;
				echo "La conexión a la DB no se logra hacer";
				echo 0;
			}
		} // FIN DB MYSQL
		// *** DATABASE POSTGRES
		// Text to ASCII Art Generator (TAAG) - patorjk.com
		// http://patorjk.com/software/taag/
		// 
		//	Font Name: ANSI Shadow
		//
		// ██████╗  ██████╗ ███████╗████████╗ ██████╗ ██████╗ ███████╗███████╗ ██████╗ ██╗     
		// ██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝██╔════╝ ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║     
		// ██████╔╝██║   ██║███████╗   ██║   ██║  ███╗██████╔╝█████╗  ███████╗██║   ██║██║     
		// ██╔═══╝ ██║   ██║╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  ╚════██║██║▄▄ ██║██║     
		// ██║     ╚██████╔╝███████║   ██║   ╚██████╔╝██║  ██║███████╗███████║╚██████╔╝███████╗
		// ╚═╝      ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝ ╚══▀▀═╝ ╚══════╝
    // 
    // Font Name: Calvin S                                                                                
    //
		// ╔╦╗╔═╗╔╦╗╔═╗╔╗ ╔═╗╔═╗╔═╗       
		//  ║║╠═╣ ║ ╠═╣╠╩╗╠═╣╚═╗║╣        
		// ═╩╝╩ ╩ ╩ ╩ ╩╚═╝╩ ╩╚═╝╚═╝       
		// ╔═╗╔═╗╔═╗╔╦╗╔═╗╦═╗╔═╗╔═╗╔═╗ ╦  
		// ╠═╝║ ║╚═╗ ║ ║ ╦╠╦╝║╣ ╚═╗║═╬╗║  
		// ╩  ╚═╝╚═╝ ╩ ╚═╝╩╚═╚═╝╚═╝╚═╝╚╩═╝

		if ( $dbserver = 'postgres') {
				//******* cadena de conexion para postgres
				$Postgres=new Postgres(DB_SERVER,DB_NAME,DB_USER,DB_PASSWORD);
				$nombre_usuario = $_POST['login_username'];
				$password_usuario = $_POST['login_userpass'];	
				// $sql =  "SELECT U.id_usuario, 
				// 				U.login_usuario, 
				// 				U.password_usuario, 
				// 				U.id_funcionario, 
			 //       				U.fecha_ultimo_acceso, 
			 //       				U.tipo_usuario, 
			 //       				U.rol_usuario,
			 //       				U.id_dependencia,
			 //       				U.estatus_usuario
				// 		FROM permisos.usuario as U 
				// 		WHERE U.login_usuario = '$nombre_usuario' AND U.password_usuario = '$password_usuario'";
  			
				$sql = "SELECT 	U.id_usuario, 
								U.login_usuario, 
								U.password_usuario, 
								U.id_funcionario, 
								U.fecha_ultimo_acceso, 
								U.tipo_usuario, 
								U.rol_usuario, 
								U.estatus_usuario,

								per.persona_uid,
								per.persona_cedula,
								btrim((COALESCE(per.persona_apellidos, ''::character varying)::text || ' '::text) || COALESCE(per.persona_nombres, ''::character varying)::text) AS apellidos_nombres,
								per.persona_apellidos,
								per.persona_nombres,
								ed.empleado_dep_uid,

								COALESCE(plan.pl_nombre, fd.dependencia_nombre, d.dependencia_nombre) AS dependencia_labora,
								COALESCE(fc.funcion_cargo_descripcion, c.cargo_denominacion) AS cargo_labora,
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
							WHERE U.login_usuario = '$nombre_usuario' AND U.password_usuario = '$password_usuario'
							ORDER BY U.id_usuario DESC";

  			// ver_arreglo($sql);
	  		$dato=consultar($sql,$Postgres);
	  		$NumeroDeFilas = $Postgres->NumeroDeFilas();
	  		if ($NumeroDeFilas>0) {
		  			// echo json_encode($dato);
		  			// [
		  			// 	{		
		  			// 		"id_usuario":"1",
		  			// 		"login_usuario":"admin",
		  			// 		"password_usuario":"1234",
		  			// 		"id_funcionario":"TRyS3ADv-bdWm-AH9e-gpRJ-Qw12Ulb1Vvda",
		  			// 		"fecha_ultimo_acceso":null,
		  			// 		"tipo_usuario":"admin",
		  			// 		"rol_usuario":"admin"
		  			// 	}
		  			// ]
		  			// ver_arreglo($dato);
		  			// 
		  				$_SESSION['sesion_userid']				= $dato[0]['id_usuario'];
						$_SESSION['sesion_username']			= $dato[0]['login_usuario'];
						$_SESSION['sesion_nivel_usuario']		= $dato[0]['rol_usuario'];
						$_SESSION['sesion_id_persona']			= $dato[0]['id_funcionario'];
						$_SESSION['sesion_id_dependencia']		= $dato[0]['id_dependencia'];
						$_SESSION['sesion_ingreso']				= $dato[0]['fecha_ultimo_acceso'];
						$_SESSION['sesion_estatus']				= $dato[0]['estatus_usuario'];
						// 
						$id_usuario								= $dato[0]['id_usuario'];
						$id_funcionario 						= $dato[0]['id_funcionario'];
						



		  				
		  				$_SESSION['sesion_idpersona']			= $dato[0]['persona_uid'];
						$_SESSION['sesion_usernombre']			= $dato[0]['persona_apellidos'] . ' ' . $dato[0]['persona_nombres'] ;
						$nombres1 								= explode(' ', trim($dato[0]['persona_apellidos']));
						$_SESSION['session_username1'] 			= $nombres1[0];
						// 
						$nombres2 								= explode(' ', trim($dato[0]['persona_nombres']));
						$_SESSION['session_username2'] 			= $nombres2[0];
						// 
						$_SESSION['sesion_cedula']				= $dato[0]['persona_cedula'];
						$_SESSION['sesion_userfoto']			= $dato[0]['persona_cedula'];
						$_SESSION['sesion_iddepartamento']		= $dato[0]['empleado_dep_uid'];
						$_SESSION['sesion_departamento'] 		= $dato[0]['dependencia_labora'];
						$_SESSION['sesion_cargo']				= $dato[0]['cargo_labora'];
						// 
						$_SESSION['sesion_ultimiacceso']		= date("Y-n-j H:i:s");




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
			  			$cadena1="";
			  			$cadena2="";
			  			$cadena3="";
			  			foreach ($dato2 as $key2 => $value2) {
			  				# code...
			  				// ver_arreglo($value2['pl_nombre']);
			  				if ($NumeroDeFilas2 > 1) {
			  					$pos = intval($key2) + 1; 
			  					$cadena1.= $pos  ."- ". $value2['pl_nombre'] . ";";

			  				}else{
			  					$cadena1= $value2['pl_nombre'] . ";";
			  				}
			  				$cadena2.= $value2['pl_nombre'] . ";";
			  				$cadena3.= $value2['municipio_nombre'] . ";";
			  				
			  			}
			  			// ver_arreglo($dato2[0]['pl_nombre']);
			  		}else{
			  			// print_r(false);
			  		}
					// dependencias_admin3:"0- CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS<br>1- DIV. DE INFORMATICA Y SISTEMAS<br>"

				  	// $dato[$key]['dependencias_admin'] = json_encode($dato2);
				  	$dato[$key]['dependencias_admin1'] = "'" . json_encode($dato2) . "'";
				  	$dato[$key]['dependencias_admin2'] = $dato2;
				  	$dato[$key]['dependencias_admin3'] = $cadena1;
				  	$dato[$key]['dependencias_admin4'] = $cadena2;
				  	$dato[$key]['dependencias_admin5'] = $cadena3;

				  	// $_SESSION['sesion_dependencias_admin1'] = addslashes(json_encode($dato2));
				  	$_SESSION['sesion_dependencias_admin2'] = $dato2;
				  	$_SESSION['sesion_dependencias_admin3'] = $cadena1;
				  	$_SESSION['sesion_dependencias_admin4'] = $cadena2;
				  	$_SESSION['sesion_dependencias_admin5'] = $cadena3;

				  	
	  				// ver_arreglo ($value['id_dependencia']); // => sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT
	  				# code...
	  			}










 



						$sql3 = "SELECT id_periodo, nombre_periodo, fecha_inicio, fecha_cierre, fecha_recaudo_ini, fecha_recaudo_fin, id_jefe_personal, id_jefezona, estatus, observacion FROM permisos.periodo WHERE estatus='1' LIMIT 1";
						$dato3=consultar($sql3,$Postgres);
				  		$NumeroDeFilas3 = $Postgres->NumeroDeFilas();
			  			if ($NumeroDeFilas3>0) {
			  					$_SESSION['sesion_id_periodo']								= $dato3[0]['id_periodo'];
									$_SESSION['sesion_nombre_periodo_periodo']		= $dato3[0]['nombre_periodo'];
									$_SESSION['sesion_fecha_inicio_periodo']			= $dato3[0]['fecha_inicio'];
									$_SESSION['sesion_fecha_cierre_periodo']			= $dato3[0]['fecha_cierre'];
									$_SESSION['sesion_fecha_inicio_recuado']			= $dato3[0]['fecha_recaudo_ini'];
									$_SESSION['sesion_fecha_cierre_recuado']			= $dato3[0]['fecha_recaudo_fin'];
									$_SESSION['sesion_estatus_periodo']						= $dato3[0]['estatus'];
									$_SESSION['sesion_id_jefe_personal']					= $dato3[0]['id_jefe_personal'];
									$_SESSION['sesion_id_jefezona']								= $dato3[0]['id_jefezona'];
									// 
									// ver_arreglo($_SESSION);
									$sql4 ="UPDATE permisos.usuario SET fecha_ultimo_acceso=NOW() WHERE id_usuario=$id_usuario";
									$dato4=consultar($sql4,$Postgres);
									echo 1;
			  			}else{
			  				echo "No encuentra periodo<br>";
			  				echo 0;
			  			}
							
		  			// }else{
		  			// 	echo "No encuentra funcionario<br>";
		  			// 	echo 0;
		  			// }
		  	}else{
		  		echo "No encuentra usuario<br>";
		  		echo 0;
				}
		  		// die();
		}// FIN DB POSTGRES
	}
	else{
		// 1 .- Ya están declaradas las variables de sesión o alguna de las dos
		// ya iniciaste sesion
		echo "1 .- Ya están declaradas las variables de sesión o alguna de las dos";
		echo 0;
	}
}else{
	//echo "en caso de no provenir de una llamada ajax";
	header("Location: logout.php");
	//die();	
}
?>