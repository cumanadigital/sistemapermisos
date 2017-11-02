<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Productos</h3>
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
                <a class="create btn btn-default" id="btn_abrir_modal" href="javascript:">Nuevo</a>
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
                   <th data-field="id_producto" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th>
                   <th data-field="codigo_producto" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Código</th>
                   <th data-field="descripcion_producto" data-filter-control="select" data-sortable="true" data-halign="center"  >Descripción</th>                   
                   <th data-field="medida_producto" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Medida</th>
                   <th data-field="nombre_categoria" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Categoria</th>
                   <th data-field="unidades_producto" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" >Unidades</th>
                   <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th>
                 </tr>
                </thead>
              </table>
            </div> <!--// fin col-sm-->
          </div><!--// fin row-->
<?php
//
?>
          <form class="form-horizontal" id="form_modal_productos">	
            <div id="modal_productos" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Productos</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">
                        <div class="form-group">
                          <label for="txt_codigo_producto" class="col-sm-3 control-label">Código</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_id_producto" type="hidden" name="txt_id_producto">
                            <input class="form-control" id="txt_codigo_producto" type="text"   name="txt_codigo_producto" placeholder="Ingrese Código" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_descripcion_producto" class="col-sm-3 control-label">Descripción</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_descripcion_producto" type="text"   name="txt_descripcion_producto" placeholder="Ingrese Descripción" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_medida_producto" class="col-sm-3 control-label">Medida</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_medida_producto" type="text"   name="txt_medida_producto" placeholder="Ingrese Medida" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_id_categoria" class="col-sm-3 control-label">id_categoria</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_id_categoria" type="text"   name="txt_id_categoria" placeholder="Ingrese Categoria" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_unidades_producto" class="col-sm-3 control-label">Unidades</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_unidades_producto" type="text"   name="txt_unidades_producto" placeholder="Ingrese Unidades" >
                          </div>
                        </div>
                        

                        
                      </div><!-- /.box-body -->
                  </div> <!--/.modal-body-->
                  
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                      <button type="button" name="btn_enviar_producto" id="btn_enviar_producto"  class="btn btn-primary submit">Enviar</button>
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