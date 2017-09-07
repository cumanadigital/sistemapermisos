<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Días Feriados</h3>
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
                <a class="create btn btn-default" id="btn_crear_registro" href="javascript:">Agregar Días Feriados</a>
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
                  <!-- id_tipodiaferiado serial NOT NULL,
                  nombre_tipo character varying(255),
                  numero_dias integer,
                  reglas_legal character varying(255),
                  id_tipo_personal integer, -- 1=Administrativo...
                  CONSTRAINT id_tipodiaferiado PRIMARY KEY (id_tipodiaferiado) -->
                  <!-- id_tipodiaferiado, 
                  tipo_diaferiado, 
                  nombre_tipo, 
                  numero_dias, 
                  reglas_legal, 
                  recaudos, 
                  id_tipo_personal, 
                  fecha_registro -->

                   <!--<th data-field="state" data-checkbox="true"></th>-->
                   <th data-field="id_diaferiado" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th>
                   <th data-field="fecha_dmy" data-filter-control="select" data-sortable="false" data-halign="center"  >Fecha</th>
                   <th data-field="tipo_fecha_txt" data-filter-control="select" data-sortable="false" data-halign="center"  >Tipo</th>
                   <th data-field="motivo" data-filter-control="select" data-sortable="false" data-halign="center"  >Motivo</th>
                   <th data-field="jornada_txt" data-filter-control="select" data-sortable="false" data-halign="center"  >Jornada</th>                   
                   <th data-field="id_tipo_personal_txt" data-filter-control="select" data-sortable="false" data-halign="center"  >Personal</th>
                   <th data-field="estatus" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th>
                   <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th>
                 </tr>
                </thead>
              </table>
            </div> <!--// fin col-sm-->
          </div><!--// fin row-->
<?php
//
?>
          <form class="form-horizontal" id="form_modal_diasferiados">	
            <div id="modal_diasferiados" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Agregar Nuevos Días Feriados</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">
                        

                        <div class="form-group">
                          <label for="txt_fecha_diaferiado" class="col-sm-3 control-label">Día Feriado</label>
                          <div class="col-sm-9">
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <input class="form-control" id="txt_id_diaferiado" type="hidden" name="txt_id_diaferiado">
                              <input class="form-control pull-right"  type="text"   id="txt_fecha_diaferiado"    name="txt_fecha_diaferiado"  >
                            </div><!-- /.input group -->
                          </div>
                        </div><!-- /.form group -->


                        <div class="form-group">
                          <label for="txt_nombre_diaferiado" class="col-sm-3 control-label">Motivo</label>
                          <div class="col-sm-9">
                            <input class="form-control" id="txt_nombre_diaferiado" type="text"   name="txt_nombre_diaferiado" placeholder="Ingrese motivo" >
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_tipo_diaferiado" class="col-sm-3 control-label">Tipo</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="txt_tipo_diaferiado" name="txt_tipo_diaferiado">
                              <option value="" selected=selected>Seleccionar...</option>
                              <option value='1'>Feriado Nacional</option>
                              <option value='2'>Feriado Regional</option>
                              <option value='3'>Feriado Local</option>
                              <option value='4'>Contrato Colectivo</option>
                              <option value='5'>Ley Orgánica del Trabajo</option>
                            </select>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="txt_jornada" class="col-sm-3 control-label">Jornada</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="txt_jornada" name="txt_jornada">
                              <option value="" selected=selected>Seleccionar...</option>
                              <option value='1'>No Laborable</option>
                              <option value='2'>Laborable</option> 
                            </select>
                          </div>
                        </div>

                        
                        <div class="form-group">
                          <label for="txt_tipo_personal" class="col-sm-3 control-label">Aplicable al Personal</label>
                          <div class="col-sm-9">

                              <div class="checkbox">
                              <label>
                                <input type="checkbox" name="txt_tipo_personal1" id="txt_tipo_personal1" value="1">
                                Administrativo
                              </label>
                            </div>

                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="txt_tipo_personal2" id="txt_tipo_personal2" value="2">
                                Docente
                              </label>
                            </div>

                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="txt_tipo_personal3" id="txt_tipo_personal3" value="3" >
                                Obrero
                              </label>
                            </div>

                          </div>
                        </div>

                        
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
                      <button type="button" name="btn_enviar_diaferiado" id="btn_enviar_diaferiado"  class="btn btn-primary submit">Enviar</button>
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