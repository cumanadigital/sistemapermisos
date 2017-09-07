<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-2 col-md-2"></div>
  <div class="col-sm-8 col-md-8">
  
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Cambiar Contraseña</h3>
        <div class="box-tools pull-right">
          <!-- <button id="boton_minus_busqueda" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button> -->
        </div><!-- /.box-tools -->
      </div><!-- /.box-header -->
      
      <!--  BOX-BODY  -->
      

      <div class="box-body">
      <!--CONTENIDO AQUI-->
      <!--CONTENIDO AQUI-->
      <!--CONTENIDO AQUI-->
          <form id="form1" class="form-horizontal">
            
            <div class="box-body">
            
              <!-- <div class="form-group">
                <label for="txt_password_actual" class="col-sm-4 control-label">Contraseña Actual</label>
                <div class="col-sm-8">
                  <input type="hidden" class="form-control" id="id_registro" name="id_registro">
                  <input type="password" class="form-control" id="txt_password_actual" name="txt_password_actual" placeholder="Password Actual">
                </div>
              </div> -->
              <div class="form-group">
                <label for="txt_password_nuevo" class="col-sm-4 control-label">Nueva Contraseña</label>
                <div class="col-sm-8">
                  <input type="password" class="form-control" id="txt_password_nuevo" name="txt_password_nuevo" placeholder="Password Nuevo">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-4 control-label">Confirmar</label>
                <div class="col-sm-8">
                  <input type="password" class="form-control" id="txt_password_confirma" name="txt_password_confirma" placeholder="Confirmar Password">
                </div>
              </div>
              <span class="alert"></span>

            
            </div><!-- /.box-body -->
            
            

            <div class="modal-footer">
                <button type="button" name="btn_cerrar" id="btn_cerrar" class="btn btn-default cancel">Cancelar</button>
                <button type="button" name="btn_enviar" id="btn_enviar"  class="btn btn-primary submit">Enviar</button>
            </div><!-- /.box-footer -->
          
          </form>
      <!--./.....CONTENIDO AQUI-->
      <!--./.....CONTENIDO AQUI-->
      <!--./.....CONTENIDO AQUI-->
                        
      </div><!-- /.box-body -->
    </div><!-- /.box -->    
  </div><!-- /.col-sm-8 -->
  <div class="col-sm-2 col-md-2"></div>               
</div>

<!--...javascript AQUI-->
<!--...javascript AQUI-->
<!--...javascript AQUI-->
<!-- <script src="apiv3.0/plugins/bootstrap-table/bootstrap-table.js"></script> -->
<!-- <script src="apiv3.0/plugins/bootstrap-table/locale/bootstrap-table-es-SP.js"></script> -->