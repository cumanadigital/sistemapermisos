<?php
$nivelusuario = $_SESSION["sesion_nivel_usuario"];
$cargousuario = $_SESSION["sesion_cargo"];
// ver_arreglo($nivelusuario);
?>
<!--Array
(
    [userid] => 4
    [username] => estu
    [nivel_usuario] => 3
    [id_persona] => 3
    [usernombre] => Luis Rivero
    [userfoto] => 25888999
    [departamento] => Administraci�n
    [cargo] => Estudiante
    [estatus] => activo
    [ultimiacceso] => 2015-9-17 22:07:17
)-->
<li class="header">MENU PRINCIPAL<?php //echo $nivelusuario."-".$cargousuario;?></li>
<!-- Optionally, you can add icons to the links -->
<li id="inicio" class="active"><a href="main.php"><i class="fa fa-home"></i> <span>Inicio</span></a></li>
<!--
0:Admin, 
1:Jefe Dpto, 
2:Secretaría, 
3:Juridica, 
4:Director, 
5:Bienestar, 
6:Licencia, 
7:Dirección

-->
 
<!-- ROOT  -->
<!-- 
######  ####### ####### #######
#     # #     # #     #    #
#     # #     # #     #    #
######  #     # #     #    #
#   #   #     # #     #    #
#    #  #     # #     #    #
#     # ####### #######    #
-->

<?php if ($nivelusuario=='root') {?>     <!--0:Admin,-->
<!--USUARIOS DE INFORMATICA-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Planteles</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_admin_registrar_planteles"><a href="javascript:void(0);"></i><i class="fa  fa-file-o"></i> <span>Gestionar</span></a></li>
    </ul>
</li>

<!--PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_admin_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_admin_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>


<!-- 
// ADMIN - INFORMATICA
// ###                                                                           
//  #   #    #  ######   ####   #####   #    #    ##    #####  #   ####     ##   
//  #   ##   #  #       #    #  #    #  ##  ##   #  #     #    #  #    #   #  #  
//  #   # #  #  #####   #    #  #    #  # ## #  #    #    #    #  #       #    # 
//  #   #  # #  #       #    #  #####   #    #  ######    #    #  #       ###### 
//  #   #   ##  #       #    #  #   #   #    #  #    #    #    #  #    #  #    # 
// ###  #    #  #        ####   #    #  #    #  #    #    #    #   ####   #    # 
 -->
<?php if ($nivelusuario=='admin') {?>     <!--0:Admin,-->
<!--USUARIOS DE INFORMATICA-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Administrar</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_admin_periodos"><a href="javascript:void(0);"></i><i class="fa  fa-file-o"></i> <span>Periodos</span></a></li>
        <li id="menu_admin_tipopermisos"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Tipos de Permisos</span></a></li>
        <li id="menu_admin_diasferiados"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Días Feriados</span></a></li>
    </ul>
</li>

<!--USUARIOS DE INFORMATICA-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Usuarios</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_admin_usuarios"><a href="javascript:void(0);"><i class="fa fa-users"></i> <span>Gestionar</span></a></li>
    </ul>
</li>

<!--PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_admin_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_admin_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>


<!-- 
       #  #######  #######  #######      ######   #######      ######   #######  ######    #####   #######  #     #     #     #       
       #  #        #        #            #     #  #            #     #  #        #     #  #     #  #     #  ##    #    # #    #       
       #  #        #        #            #     #  #            #     #  #        #     #  #        #     #  # #   #   #   #   #       
       #  #####    #####    #####        #     #  #####        ######   #####    ######    #####   #     #  #  #  #  #     #  #       
 #     #  #        #        #            #     #  #            #        #        #   #          #  #     #  #   # #  #######  #       
 #     #  #        #        #            #     #  #            #        #        #    #   #     #  #     #  #    ##  #     #  #       
  #####   #######  #        #######      ######   #######      #        #######  #     #   #####   #######  #     #  #     #  ####### 
  -->                                                                                                                                     

<?php if ($nivelusuario=='personal') {?>     <!--1:Jefe Dpto de Personal,-->
<!--MODULO XXXX -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Permisos</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_jefe_procesar_permisos"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Procesar</span></a></li>
        <li id="menu_jefe_registrar_permisos"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Registrar</span></a></li>        
        <li id="menu_jefe_consultar_permisos"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Consultar</span></a></li>   
    </ul>
</li>
<!--MODULO XXXX -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Vacaciones</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_jefe_procesar_vacaciones"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Procesar</span></a></li>
        <li id="menu_jefe_registrar_vacaciones"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Registrar</span></a></li>        
        <li id="menu_jefe_consultar_vacaciones"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Consultar</span></a></li>
    </ul>
</li>
<!--PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_jefe_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_jefe_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>


<!-- 
//  #####   #######   #####   ######            ######   #######  ######    #####   #######  #     #     #     #       
// #     #  #        #     #  #     #           #     #  #        #     #  #     #  #     #  ##    #    # #    #       
// #        #        #        #     #           #     #  #        #     #  #        #     #  # #   #   #   #   #       
//  #####   #####    #        ######            ######   #####    ######    #####   #     #  #  #  #  #     #  #       
//       #  #        #        #   #    ###      #        #        #   #          #  #     #  #   # #  #######  #       
// #     #  #        #     #  #    #   ###      #        #        #    #   #     #  #     #  #    ##  #     #  #       
//  #####   #######   #####   #     #  ###      #        #######  #     #   #####   #######  #     #  #     #  ####### 
 -->
<?php if ($nivelusuario=='secretaria') {?>     <!--1:Secretaria,-->
<!--MODULO XXXX -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Permisos</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_secretaria_registrar_permisos"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Registrar</span></a></li>
        <li id="menu_secretaria_consultar_permisos"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
        <!-- <li id="menu_secre_demo1"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.1</span></a></li> -->
        <!-- <li id="menu_secre_demo2"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.2</span></a></li> -->
    </ul>
</li>
<!--MODULO VACACIONES -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Vacaciones</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_secretaria_procesar_vacaciones"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Procesar</span></a></li>
        <li id="menu_secretaria_consultar_vacaciones"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
        <!-- <li id="menu_secre_demo1"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.1</span></a></li> -->
        <!-- <li id="menu_secre_demo2"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.2</span></a></li> -->
    </ul>
</li>
<!--MODULO DENUNCIAS -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Denuncias</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <!-- <li id="menu_secretaria_procesar_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Procesar</span></a></li> -->
        <li id="menu_secretaria_consultar_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
        <!-- <li id="menu_secre_demo1"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.1</span></a></li> -->
        <!-- <li id="menu_secre_demo2"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.2</span></a></li> -->
    </ul>
</li>
<!--MODULO SUPLENCIAS -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Licencias</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <!-- <li id="menu_secretaria_procesar_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Procesar</span></a></li> -->
        <li id="menu_secretaria_consultar_licencias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
        <!-- <li id="menu_secre_demo1"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.1</span></a></li> -->
        <!-- <li id="menu_secre_demo2"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.2</span></a></li> -->
    </ul>
</li>
<!--MODULO SUPLENCIAS -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Reportes</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <!-- <li id="menu_secretaria_procesar_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Procesar</span></a></li> -->
        <li id="menu_secretaria_consultar_licencias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Expediente</span></a></li>
        <!-- <li id="menu_secre_demo1"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.1</span></a></li> -->
        <!-- <li id="menu_secre_demo2"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.2</span></a></li> -->
    </ul>
</li>
<!--PERFIL DE USUARIOS
    PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_secre_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_secre_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>

<!-- 
//       #  #     #  ######   ###  ######   ###   #####      #    
//       #  #     #  #     #   #   #     #   #   #     #    # #   
//       #  #     #  #     #   #   #     #   #   #         #   #  
//       #  #     #  ######    #   #     #   #   #        #     # 
// #     #  #     #  #   #     #   #     #   #   #        ####### 
// #     #  #     #  #    #    #   #     #   #   #     #  #     # 
//  #####    #####   #     #  ###  ######   ###   #####   #     # 
 -->
<?php if ($nivelusuario=='juridica') {?>     <!--1:Asesoría Jurídica,-->
<!--MODULO XXXX -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Permisos</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_juridica_registrar_permisos"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Registrar</span></a></li>
        <li id="menu_juridica_consultar_permisos"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
        <!-- <li id="menu_secre_demo1"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.1</span></a></li> -->
        <!-- <li id="menu_secre_demo2"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 1.2</span></a></li> -->
    </ul>
</li>
<!--PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_juridica_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_juridica_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>

<!-- 
 //      #  ######  ######  ######      #  #    #  #    #  ######  #####   #    ##    #####   ####  
 //      #  #       #       #           #  ##   #  ##  ##  #       #    #  #   #  #     #    #    # 
 //      #  #####   #####   #####       #  # #  #  # ## #  #####   #    #  #  #    #    #    #    # 
 //      #  #       #       #           #  #  # #  #    #  #       #    #  #  ######    #    #    # 
 // #    #  #       #       #           #  #   ##  #    #  #       #    #  #  #    #    #    #    # 
 //  ####   ######  #       ######      #  #    #  #    #  ######  #####   #  #    #    #     ####  
 -->
 <?php if ($nivelusuario=='jefeinmediato' || $nivelusuario=='director') {?>     <!--1:Jefe Inmediato - Director,-->
<!--MODULO XXXX -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Permisos</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_director_registrar_permisos"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Registrar</span></a></li>
        <li id="menu_director_consultar_permisos"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
    </ul>
</li>
<!--MODULO DENUNCIAS -->
<!-- <li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Denuncias</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_director_registrar_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Registrar</span></a></li>
        <li id="menu_director_consultar_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
    </ul>
</li> -->
<!--MODULO VACACIONES -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Vacaciones</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_director_registrar_vacaciones"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Registrar</span></a></li>
        <li id="menu_director_consultar_vacaciones"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
    </ul>
</li>
<!--PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_director_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_director_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>

<!-- 
// ######   ###  #######  #     #  #######   #####   #######     #     ######  
// #     #   #   #        ##    #  #        #     #     #       # #    #     # 
// #     #   #   #        # #   #  #        #           #      #   #   #     # 
// ######    #   #####    #  #  #  #####     #####      #     #     #  ######  
// #     #   #   #        #   # #  #              #     #     #######  #   #   
// #     #   #   #        #    ##  #        #     #     #     #     #  #    #  
// ######   ###  #######  #     #  #######   #####      #     #     #  #     # 
 -->
<?php if ($nivelusuario=='bienestar') {?>     <!--1:Jefe Dpto,-->
<!--MODULO XXXX -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Denuncias</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <!-- <li id="menu_bienestar_registra_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Procesar</span></a></li> -->
        <!-- <li id="menu_bienestar_consultar_denuncias"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li> -->
        <li id="#"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Procesar</span></a></li>
        <li id="#"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>

    </ul>
</li>
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Seguimiento</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="#"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Procesar</span></a></li>
        <li id="#"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
        <!-- <li id="menu_bienestar_soli_preparad1"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Submenu 1.3</span></a></li> -->
        <!-- <li id="menu_bienestar_soli_creditos1"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Submenu 1.4</span></a></li> -->
    </ul>
</li>
<!--PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_bienestar_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_bienestar_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>

<!-- 
// #        ###   #####   #######  #     #   #####   ###     #    
// #         #   #     #  #        ##    #  #     #   #     # #   
// #         #   #        #        # #   #  #         #    #   #  
// #         #   #        #####    #  #  #  #         #   #     # 
// #         #   #        #        #   # #  #         #   ####### 
// #         #   #     #  #        #    ##  #     #   #   #     # 
// #######  ###   #####   #######  #     #   #####   ###  #     # 
 -->
<?php if ($nivelusuario=='licencia') {?>     <!--1:Jefe Dpto,-->
<!--MODULO XXXX -->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Licencias</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_licencia_registrar_licencia"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Registrar</span></a></li>
        <li id="menu_licencia_consultar_licencia"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Consultar</span></a></li>
        <li id="menu_licencia_registrar_suplente"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Suplentes</span></a></li>
        <!-- <li id="menu_licencia_soli_creditos1"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Submenu 1.4</span></a></li> -->
    </ul>
</li>
<!--MODULO XXXX -->
<!-- <li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Proceso 2</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_licencia_soli_cursodir2"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Submenu 2.1</span></a></li>
        <li id="menu_licencia_soli_cursopar2"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Submenu 2.2</span></a></li>
        <li id="menu_licencia_soli_preparad2"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Submenu 2.3</span></a></li>
        <li id="menu_licencia_soli_creditos2"><a href="javascript:void(0);"><i class="fa  fa-file-o"></i> <span>Submenu 2.4</span></a></li>
    </ul>
</li> -->
<!--PERFIL DE USUARIOS-->
<li class="treeview">
    <a href="javascript:void(0);"><i class="fa fa-file"></i> <span>Mi Perfil</span><i class="fa fa-angle-left pull-right"></i></a>
    <ul class="treeview-menu">
        <li id="menu_licencia_perfil"><a href="javascript:void(0);"><i class="fa fa-file-o"></i> <span>Cambiar Contraseña</span></a></li>
        <li id="menu_licencia_perfil_foto"><a href="javascript:void(0);"><i class="fa fa-camera"></i> <span>Actualizar Foto</span></a></li>
    </ul>
</li>
<?php }?>





<?php //ver_arreglo($_SESSION);?>