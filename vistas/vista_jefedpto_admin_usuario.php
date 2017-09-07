<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Usuarios Nivel 1</h3>
        <div class="box-tools pull-right">
          <!--<button id="boton_minus_busqueda" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>-->
        </div><!-- /.box-tools -->
      </div><!-- /.box-header -->
      
      <!--  BOX-BODY  -->
      <div class="box-body">
      <!--CONTENIDO AQUI-->
      <!--CONTENIDO AQUI-->
      <!--CONTENIDO AQUI-->

          <div class="row"> 
            <div class="col-sm12 col-md-12">
              <p class="toolbar" id="toolbar1">
                <a class="create btn btn-default" id="btn_crear_usuario"href="javascript:">Agregar Nuevo Usuario</a>
                <span class="alert"></span>
              </p>
            </div> <!--// fin col-sm-->
          </div>	<!--// fin row-->
          
          <div class="row">
            <div class="col-sm12 col-md-12">
              <table id="table"
                    data-show-refresh="true"
                    data-show-columns="true"
                    data-search="true"
                    data-pagination="true"
                    data-query-params="queryParams"
                    data-toolbar="#toolbar1"
              >
                <thead>
                  <tr>
                   <!--<th data-field="state" data-checkbox="true"></th>-->
                   <th data-field="id_usuario" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th>
                   <th data-field="image"              data-halign="center" data-align="center" data-formatter="imageFormatter">Foto</th>
                   
                   <th data-field="cedula_persona" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Cédula</th>
                   <th data-field="nombre_persona" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Nombre</th>                   
                   <th data-field="apellido_persona" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center">Apellido</th>
                   <th data-field="cargo_persona" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Cargo</th>
                   <th data-field="departamento_persona" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Departamento</th>
                   <th data-field="nombre_usuario" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Usuario</th>
                   <!-- <th data-field="estatus" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th> -->
                   <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th>
                 </tr>
                </thead>
              </table>
            </div> <!--// fin col-sm-->
          </div><!--// fin row-->
<?php
//
?>
<form class="form-horizontal" id="form_modal_usuario"> 
            <div id="modal_usuario" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Registrar usuario</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">
            <!-- //*******************************
            //******************************* -->
            
                        <form id="form_registrar_user" action="" method="post" autocomplete="off">
                          
                          <!-- <div class="form-group has-feedback">
                            <input id="txt_reg_cedula" name="txt_reg_cedula" type="text" class="form-control" placeholder="Cédula">
                            <span class="fa fa-credit-card form-control-feedback"></span>
                          </div> -->
                          <div class="form-group has-feedback">
                            <input id="txt_id_persona" name="txt_id_persona" type="hidden" >
                            <input id="txt_reg_cedula" name="txt_reg_cedula" type="text" pattern="\d+" class="form-control" placeholder="Cédula" disabled="disabled">
                            <span class="fa fa-credit-card form-control-feedback"></span>
                          </div>
                          

                          <div class="form-group has-feedback">
                            <input id="txt_reg_nombre" name="txt_reg_nombre" type="text" class="form-control" placeholder="Nombre Completo">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                          </div>

                          <div class="form-group has-feedback">
                            <input id="txt_reg_apellido" name="txt_reg_apellido" type="text" class="form-control" placeholder="Apellido Completo">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                          </div>

                          <div class="form-group has-feedback">
                            <input id="txt_reg_correo" name="txt_reg_correo" type="email" class="form-control" placeholder="Correo Electrónico">
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                          </div>

                          <div class="form-group has-feedback">
                            <input id="txt_reg_telefono" name="txt_reg_telefono" type="phone" class="form-control" placeholder="Telefóno">
                            <span class="fa  fa-phone form-control-feedback"></span>
                          </div>

                          <div class="form-group has-feedback">
                          <!-- <label for="txt_tipo_dedicacion" class="col-sm-3 control-label">Tipo de Dedicación</label> -->
                          <!-- <div class="col-sm-9"> -->
                            <select class="form-control" id="txt_departamento" name="txt_departamento">
                                <option value="0" selected="selected">Departamento...</option>
                                <option value="1" >División de Personal</option>
                                <option value="2" >Coordinación de Personal</option>
                                <option value="3" >Coordinación de Bienestar Social</option>
                                <option value="4" >Coordinación de Aseroría Jurídica</option>
                                <option value="5" >DIvisón de Informática y Sistemas</option>
                            </select>
                          <!-- </div> -->
                          </div>

                          <div class="form-group has-feedback">
                          <!-- <label for="txt_tipo_dedicacion" class="col-sm-3 control-label">Tipo de Dedicación</label> -->
                          <!-- <div class="col-sm-9"> -->
                            <select class="form-control" id="txt_cargo" name="txt_cargo">
                                <option value="0" selected="selected">Cargo...</option>
                                <option value="1" >Jefe de Departamento</option>
                                <option value="2" >Secretaria</option>
                                <option value="3" >Analista</option>
                                <option value="4" >Coordinador</option>
                            </select>
                          <!-- </div> -->
                          </div>


                          <div class="form-group has-feedback">
                            <input id="txt_reg_password1" name="txt_reg_password1" type="password" class="form-control" placeholder="Password">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                          </div>
                          
                          <div class="form-group has-feedback">
                            <input id="txt_reg_password2" name="txt_reg_password2" type="password" class="form-control" placeholder="Retype password">
                            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
                          </div>

            <!-- //.....*******************************
            //.....******************************* -->
                        
                      </div><!-- /.box-body -->
                  </div> <!--/.modal-body-->
                  
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                      <button type="button" name="btn_enviar_user" id="btn_enviar_user"  class="btn btn-primary submit">Registrar</button>
                    </div>
                    
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
          
          </form>

      <!--./.....CONTENIDO AQUI-->
      <!--./.....CONTENIDO AQUI-->
      <!--./.....CONTENIDO AQUI-->
                        
      </div><!-- /.box-body -->
    </div><!-- /.box -->    
  </div><!-- /.col-sm-12 -->               
</div>

<!--...javascript AQUI-->
<!--...javascript AQUI-->
<!--...javascript AQUI-->
<script src="apiv3.0/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="apiv3.0/plugins/bootstrap-table/locale/bootstrap-table-es-SP.js"></script>