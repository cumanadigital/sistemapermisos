<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Tipos de Permisos</h3>
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
                <a class="create btn btn-default" id="btn_crear_registro" href="javascript:">Agregar Tipos de Permisos</a>
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
                    data-filter-control="true"
              >
                <thead>
                  <tr>
                   <!--<th data-field="state" data-checkbox="true"></th>-->
                   <th data-field="id_tipopermiso" data-filter-control="input" data-sortable="true" data-halign="center" data-align="center"  >Id</th>
                   <th data-field="id_tipo_personal_txt" data-filter-control="select" data-sortable="true" data-halign="center"  >Personal</th>
                   <th data-field="tipo_permiso_txt" data-filter-control="select" data-sortable="true" data-halign="center"  >Tipo de Permiso</th>
                   <th data-field="nombre_tipo"   data-filter-control="select" data-sortable="true" data-halign="center"  >Descripción</th>                   
                   <th data-field="numero_dias"   data-filter-control="input" data-sortable="true" data-halign="center" data-align="center"  >Días</th>
                   
                   <!-- <th data-field="reglas_legal"  data-filter-control="input" data-sortable="true" data-halign="center" data-align="center"  >Base Legal</th> -->
                   
                   <th data-field="estatus"  data-sortable="true" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th>
                   <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th>
                 </tr>
                </thead>
              </table>
            </div> <!--// fin col-sm-->
          </div><!--// fin row-->
<?php
//
?>
          <form class="form-horizontal" id="form_modal_permisos">	
            <div id="modal_permisos" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Agregar Nuevos Permisos</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">
                        
                        
                      <div class="form-group">
                          <label for="txt_tipo_personal" class="col-sm-3 control-label">Personal</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_id_tipopermiso" type="hidden" name="txt_id_tipopermiso">
                            <select class="form-control" id="txt_tipo_personal" name="txt_tipo_personal">
                              <option value='' selected=selected>Seleccionar...</option>
                              <option value='1'>Administrativo</option>
                              <option value='2'>Docente</option>
                              <option value='3'>Obrero</option>
                            </select>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_tipo_permiso" class="col-sm-3 control-label">Categoría</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="txt_tipo_permiso" name="txt_tipo_permiso">
                              <option value="" selected=selected>Seleccionar...</option>
                              <option value='1'>Obligatorio</option>
                              <option value='2'>Potestastivo</option>
                            </select>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_nombre_permiso" class="col-sm-3 control-label">Nombre</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_nombre_permiso" type="text"   name="txt_nombre_permiso" placeholder="Ingrese nombre" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_dias_permiso" class="col-sm-3 control-label">Días</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_dias_permiso" type="text"   name="txt_dias_permiso" placeholder="Ingrese días" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_reglas_legal" class="col-sm-3 control-label">Base Legal</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_reglas_legal" type="text"   name="txt_reglas_legal" placeholder="Ingrese base legal" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_recaudos" class="col-sm-3 control-label">Recaudos</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_recaudos" type="text"   name="txt_recaudos" placeholder="Ingrese recaudos necesarios" >
                          </div>
                        </div>


                        <div class="form-group">
                          <label for="txt_fecha_registro" class="col-sm-3 control-label">Fecha Registro</label>
                          <div class="col-sm-9">
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <input class="form-control pull-right"  type="text"   id="txt_fecha_registro"    name="txt_fecha_registro"  >
                            </div><!-- /.input group -->
                          </div>
                        </div><!-- /.form group -->
                        
                        <div class="form-group">
                          <label for="txt_radio_estatus" class="col-sm-3 control-label">Estatus</label>
                          <div class="col-sm-9">
                            <div class="radio">
                            <label>
                              <input type="radio" name="txt_radio_estatus" id="txt_radio_estatus0" value="0" checked>
                              Inactivo
                            </label>
                            <!--</div>-->
                            <!--<div class="radio">-->
                            <label>
                              <input type="radio" name="txt_radio_estatus" id="txt_radio_estatus1" value="1" >
                              Activo
                            </label>
                          </div>
                          </div>
                        </div>
                        
                      </div><!-- /.box-body -->
                  </div> <!--/.modal-body-->
                  
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                      <button type="button" name="btn_enviar_permiso" id="btn_enviar_permiso"  class="btn btn-primary submit">Enviar</button>
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

<script src="apiv3.0/plugins/bootstrap-table/extensions/filter-control/bootstrap-table-filter-control.js"></script>