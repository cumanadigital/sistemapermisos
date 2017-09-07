console.log("javascript usuarios fotos");

var username = $('#user_name').attr('oculto');
var userced = $('#user_name').attr('ocultoced');
var sesionencode = $('#user_name').attr('sesionencode');
var usernombre = $('#name_user').html();
var cargouser = $('#cargo_user').html();
var dptouser = $('#departamento_user').html();
var userestatus = $('#estatus_loading').attr('estatus');
// **********************
var parametros_user = 'dptouser='+dptouser + '&cargouser='+cargouser + '&userestatus='+userestatus +  '&userced='+userced + '&sesionencode='+sesionencode+'&relleno=valor';



function abrirVentana(){
//guardo la referencia de la ventana para poder utilizarla luego
ventana_secundaria = window.open("vistas/subirfoto/index.php?cedula="+userced,"miventana","width=640,height=480,menubar=no")
}

function cerrarVentana(){
//la referencia de la ventana es el objeto window del popup. Lo utilizo para acceder al método close
ventana_secundaria.close()
} 


              // <a href="vistas/subirfoto/index.php?cedula=11829328" target="_blank">Enlace</a>