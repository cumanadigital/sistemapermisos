<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Planteles</h3>
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
                <a class="create btn btn-default" id="btn_crear_registro"href="javascript:">Agregar Plantel</a>
                <span class="alert"></span>
              </p>
            </div> <!--// fin col-sm-->
          </div>	<!--// fin row-->
          
          <div class="row">
            <div class="col-sm12 col-md-12">
             <!--  <table id="table"
                      data-show-refresh="true"
                      data-show-columns="true"
                      data-search="true"
                      data-pagination="true"
                      data-query-params="queryParams"
                    data-toolbar="#toolbar1"
              > -->
                <!-- <thead> -->
                  <!-- <tr> -->
                      <!--<th data-field="state" data-checkbox="true"></th>-->
                   <!-- <th data-field="id_periodo" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th> -->
                   <!-- <th data-field="nombre_periodo" data-filter-control="select" data-sortable="false" data-halign="center"  >Nombre</th>                    -->
                       <!-- <th data-field="fecha_recaudo_ini" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Inicio Recaudo</th> -->
                       <!-- <th data-field="fecha_recaudo_fin" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fin Recaudo</th> -->
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Inicio Periodo</th> -->
                   <!-- <th data-field="fecha_cierre" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fin Periodo</th> -->
                   <!-- <th data-field="estatus" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th> -->
                   <!-- <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th> -->
                 <!-- </tr> -->
                <!-- </thead> -->
              <!-- </table> -->

                <table id="table"
               data-show-refresh="true"
               data-show-columns="true"
               data-search="true"
               data-show-export="true"
               data-pagination="true"
               data-page-list="[5, 10, 25, 50, 100]"
               data-query-params="queryParams"
               data-toolbar=".toolbar"
               data-filter-control="true">
            <thead>
            <tr>
               <!-- <th data-field="name">Name</th>
                <th data-field="stargazers_count">Stars</th>-->
                <!--<th data-field="listado_nacionalidad">Nac</th>-->
                 <!--<th data-field="state" data-checkbox="true"></th>-->
                   <th data-field="plan_uid"          data-filter-control="input"   data-sortable="true" data-halign="center" data-align="center" >Id</th>
                   <th data-field="plan_codigodea"    data-filter-control="input"   data-sortable="true" data-halign="center" data-align="center" >Cod Plantel</th>
                   <th data-field="plan_nombre"       data-filter-control="input"   data-sortable="true" data-halign="center" data-align="left"   >Plantel</th>
                   <th data-field="plan_codnomina"    data-filter-control="input"   data-sortable="true" data-halign="center" data-align="center" >Cod. Nómina</th>                   
                   <th data-field="municipio_nombre"  data-filter-control="select"  data-sortable="true" data-halign="center" data-align="center" >Municipio</th>
                   <th data-field="parroquia_nombre"  data-filter-control="input"   data-sortable="true" data-halign="center" data-align="center" >Parroquia</th>
                   <th data-field="md_nombre"         data-filter-control="select"  data-sortable="true" data-halign="center" data-align="center" >Modalidad</th>
                
                <th data-field="action"
                    data-align="center"
                    data-formatter="actionFormatter"
                    data-events="actionEvents">Action</th>
            </tr>
            </thead>
        </table>

            </div> <!--// fin col-sm-->
          </div><!--// fin row-->
<?php
//
?>
          <form class="form-horizontal" id="form_modal_registros">	
            <div id="modal_registros" class="modal fade">
              <!-- <div class="modal-dialog"> -->
              <div class="modal-dialog" id="modal-dialog-xl">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Plantel</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">
                        
                        <div class="form-group">
                          <label for="txt_plan_nombre" class="col-sm-3 control-label">Nombre Dependencia</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_plan_codigodea" type="hidden" name="txt_plan_codigodea">
                            <input class="form-control" id="txt_plan_nombre" type="text"   name="txt_plan_nombre" placeholder="Ingrese nombre" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_plan_codnomina" class="col-sm-3 control-label">Dependencia Nómina</label>
                          <div class="col-sm-9">
                            <!-- <input class="form-control" id="txt_plan_codnomina" type="hidden" name="txt_plan_codnomina"> -->
                            <input class="form-control" id="txt_plan_codnomina" type="text"   name="txt_plan_codnomina" placeholder="Código Nómina" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_plan_nombre" class="col-sm-3 control-label">Nombre Dependencia</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_plan_codigodea" type="hidden" name="txt_plan_codigodea">
                            <input class="form-control" id="txt_plan_nombre" type="text"   name="txt_plan_nombre" placeholder="Ingrese nombre" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_plan_nombre" class="col-sm-3 control-label">Nombre Dependencia</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_plan_codigodea" type="hidden" name="txt_plan_codigodea">
                            <input class="form-control" id="txt_plan_nombre" type="text"   name="txt_plan_nombre" placeholder="Ingrese nombre" >
                          </div>
                        </div>
                        
                      </div><!-- /.box-body -->
                  </div> <!--/.modal-body-->
                  
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                      <button type="button" name="btn_enviar_periodo" id="btn_enviar_periodo"  class="btn btn-primary submit">Enviar</button>
                    </div>
                  
                  
                    
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
          
          </form>							
<?php /* ?>
          <form class="form-horizontal" id="form_modal_registros222">  
            <div id="modal_registros" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Plantel</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">
                        
                        <div class="form-group">
                          <label for="txt_nombre_periodo" class="col-sm-3 control-label">Nombre</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_codigo_periodo" type="hidden" name="txt_codigo_periodo">
                            <input class="form-control" id="txt_nombre_periodo" type="text"   name="txt_nombre_periodo" placeholder="Ingrese nombre" >
                          </div>
                        </div>
                        

                        <div class="form-group" hidden="true">
                          <label for="txt_fecha_recaudo" class="col-sm-3 control-label">Fecha Recaudos</label>
                          <div class="col-sm-9">
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <input class="form-control pull-right"  type="text"   id="txt_fecha_recaudo"    name="txt_fecha_recaudo"  >
                              <input class="form-control"             type="hidden" id="txt_fecha_recaudo_inicio"   name="txt_fecha_inicio" >
                              <input class="form-control"             type="hidden" id="txt_fecha_recaudo_cierre"   name="txt_fecha_cierre" >
                            </div><!-- /.input group -->
                          </div>
                        </div><!-- /.form group -->

                        <div class="form-group">
                          <label for="txt_fecha_cierre" class="col-sm-3 control-label">Fecha Periodo</label>
                          <div class="col-sm-9">
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <input class="form-control pull-right"  type="text"   id="txt_rango_fecha"    name="txt_rango_fecha"  >
                              <input class="form-control"             type="hidden" id="txt_fecha_inicio"   name="txt_fecha_inicio" >
                              <input class="form-control"             type="hidden" id="txt_fecha_cierre"   name="txt_fecha_cierre" >
                            </div><!-- /.input group -->
                          </div>
                        </div><!-- /.form group -->
                        
                        <div class="form-group">
                          <label for="txt_radio_estatus" class="col-sm-3 control-label">Estatus de Periodo</label>
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
                      <button type="button" name="btn_enviar_periodo" id="btn_enviar_periodo"  class="btn btn-primary submit">Enviar</button>
                    </div>
                  
                  
                    
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
          
          </form>             
<?php */ ?>
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