<?php //include('../conf/config.postgres.php');?>
<?php
	// NOTA: 	El login de sistema esta enlazado con mysql 
	// define("DB_SERVER","localhost");
	// define("DB_NAME","bdpermisos");
	// define("DB_USER","userpermisos");
	// define("DB_PASSWORD","1234");
	// define("DB_DRIVER","mysql");
	// tablas: 
	// 		usuario
	// 		personal
	// 		departamento
	// 		cargo 
?>
<?php include('../conf/config.login.php');?>
<?php include('../apiv3.0/funciones/funciones3.0.php'); ?>
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
		if ( $dbserver = 'mysql') {
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
							$_SESSION['sesion_userid']					= $user['id_usuario'];
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
									$_SESSION['sesion_idpersona']				= $user2['id_persona'];
									$_SESSION['sesion_usernombre']			= $user2['nombre_persona'] . " " .$user2['apellido_persona'];
									
									$nombres1 								= explode(' ', trim($user2['nombre_persona']));
									$_SESSION['session_username1'] 			= $nombres1[0];

									$nombres2 								= explode(' ', trim($user2['apellido_persona']));
									$_SESSION['session_username2'] 			= $nombres2[0];


									$_SESSION['sesion_cedula']				= $user2['cedula_persona'];
									$_SESSION['sesion_userfoto']			= $user2['foto_persona'];
									$_SESSION['sesion_iddepartamento']		= $user2['id_departamento'];
									$_SESSION['sesion_departamento'] 		= $user2['departamento_persona'];
									$_SESSION['sesion_cargo']						= $user2['cargo_persona'];
									$_SESSION['sesion_estatus']					= $user2['estatus_persona'];
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
							ver_arreglo($_SESSION);
							
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
		if ( $dbserver = 'postgres') {
			//******* cadena de conexion para postgres
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
	die();	
}
?>