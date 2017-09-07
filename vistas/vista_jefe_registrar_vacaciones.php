<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Historial de Vacaciones</h3>
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
                <a class="create btn btn-default" id="btn_crear_registro" href="javascript:">Solicitud de Vacaciones</a>
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
                    data-page-size="5"
                    data-page-list="[5,10,25,50,100]"
                    data-query-params="queryParams"
                    data-toolbar="#toolbar1"
              >
                <thead>
                  <tr>
                   <!--<th data-field="state" data-checkbox="true"></th>-->
                   <!-- <th data-field="id_vacaciones" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th> -->

                   <th data-field="departamento_persona" data-filter-control="select" data-sortable="false" data-halign="center" data-formatter="StatusDependencia" >Dependencia</th>

                   <th data-field="cedula_persona" data-filter-control="select" data-sortable="false" data-halign="center" >Cédula</th>
                   <th data-field="apellidos_nombres" data-filter-control="select" data-sortable="false" data-halign="center">Nombre Apellido</th>
                   <th data-field="tipo_personal" data-filter-control="select" data-sortable="false" data-halign="center" data-formatter="StatusPersonal" >Personal</th>
                   <!-- <th data-field="tipo_vacaciones" data-filter-control="select" data-sortable="false" data-halign="center"  >vacaciones</th> -->
                   <!-- <th data-field="id_tipovacaciones" data-filter-control="select" data-sortable="false" data-halign="center"  >vacaciones</th> -->
                   <!-- <th data-field="motivo_vacaciones" data-filter-control="select" data-sortable="false" data-halign="center"  >Motivo</th>                    -->
                   <!-- <th data-field="numero_dias" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Días</th> -->
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusPeriodo" >Periodo</th> -->
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fecha Culm.</th> -->
                   <!-- <th data-field="reglas_legal" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Base Legal</th> -->
                   <th data-field="fecha_desde" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="FechaDesde" >Desde</th>
                   <th data-field="fecha_hasta" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="FechaHasta" >Hasta</th>
                   <th data-field="estatus" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th>
                   <!-- <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th> -->
                 </tr>
                </thead>
              </table>
            </div> <!--// fin col-sm-->
          </div><!--// fin row-->
          
<?php
//
?>
          <form class="form-horizontal" id="form_ventana_modal" >	
            <div id="ventana_modal" class="modal fade">
              <div class="modal-dialog" id="modal-dialog-xl">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="fa fa-tag">&nbsp;</i>Registrar Vacaciones (Jefe de Personal)</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">

                        <div class="row">
                            <div class="col-sm-4">
                              <!-- //code -->
                              <div class="form-group">
                              <label for="txt_cedula_personal" class="col-sm-3 control-label">Cédula</label>
                              <div class="col-sm-9">
                              <input class="form-control" id="txt_id_jefeinmediato"  type="hidden" name="txt_id_jefeinmediato">
                              <input class="form-control" id="txt_id_vacaciones"  type="hidden" name="txt_id_vacaciones">
                              <input class="form-control" id="txt_id_personal" type="hidden" name="txt_id_personal">
                              <div class="input-group">
                                <input class="form-control" id="txt_cedula_personal" type="text"   name="txt_cedula_personal" placeholder="Buscar" >
                                <span class="input-group-btn">
                                  <button type="button" name="btn_buscar" id="btn_buscar" class="btn btn-flat"><i class="fa fa-search"></i></button>
                                  <button type="button" name="btn_limpiar" id="btn_limpiar" class="btn btn-flat"><i class="fa  fa-trash"></i></button>
                                </span>
                              </div>

                              </div>
                            </div>
                          </div>

                          <div class="col-sm-8">
                            <!-- //code -->
                            <div class="form-group">
                              <label for="txt_nombre_funcionario" class="col-sm-3 control-label">Apellido y Nombre</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" id="txt_nombre_funcionario" name="txt_nombre_funcionario"  placeholder="" readonly="readonly">
                              </div>
                            </div>
                          </div>

                        </div>


                        <div class="row" id="cuadro_busqueda_datos_laborales">
                            <!-- col1 -->
                            <div class="col-sm-12">
                              <!-- //code -->
                              <table id="table2"
                                    data-show-refresh="false"
                                    data-show-columns="false"
                              >
                                <thead>
                                  <tr>
                                   <th data-field="municipio_nombre" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"    >Municipio</th>
                                   <th data-field="categoria_cargo_descripcion" data-filter-control="select" data-sortable="false" data-halign="center"             >Personal</th>                   
                                   <th data-field="cargo_labora" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"        >Cargo Funcional</th>
                                   <th data-field="dependencia_labora" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Lugar de Trabajo</th>
                                   <th data-field="cargo_codigo" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"        >Código</th>
                                   <th data-field="cargo_denominacion" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Cargo Nominal</th>
                                   <th data-field="action" data-align="center" data-formatter="actionFormatter2" data-events="actionEvents2"                        >Acción</th>
                                 </tr>
                                </thead>
                              </table>
                            </div>
                            <!-- cierre -->
                            <br>
                        </div>

                        <div  id="cuadro_datos_laborales">

                            <div class="row" >
                              <!-- col1 -->
                              <div class="col-sm-4">
                                <!-- //code -->
                                <div class="form-group" >
                                  <label for="txt_tipo_personal" class="col-sm-3 control-label">Personal</label>
                                  <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txt_tipo_personal" name="txt_tipo_personal" placeholder="" readonly="readonly">
                                  </div>
                                </div>
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-8">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_cargo_funcional" class="col-sm-3 control-label">Cargo Funcional</label>
                                  <div class="col-sm-9">
                                    <input type="hidden" class="form-control" id="txt_id_cargo_funcional" name="txt_id_cargo_funcional" readonly="readonly">
                                    <input type="text" class="form-control" id="txt_cargo_funcional" name="txt_cargo_funcional" placeholder="" readonly="readonly">
                                  </div>
                                </div>
                              </div>
                              <!-- cierre -->
                            </div>


                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-4">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_municipio" class="col-sm-3 control-label">Municipio</label>
                                  <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txt_municipio" name="txt_municipio" placeholder="" readonly="readonly">
                                  </div>
                                </div>
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-8">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_lugar_trabajo" class="col-sm-3 control-label">Lugar de Trabajo</label>
                                  <div class="col-sm-9">
                                    <input type="hidden" class="form-control" id="txt_id_lugar_trabajo" name="txt_id_lugar_trabajo" readonly="readonly">
                                    <input type="text" class="form-control" id="txt_lugar_trabajo" name="txt_lugar_trabajo" placeholder="" readonly="readonly">
                                  </div>
                                </div>
                              </div>
                              <!-- cierre -->
                            </div>
                              
                            <hr style="color: #0056b2;" />
                        
                        </div>  <!-- ./ cuadro_datos_laborales -->
                        

                        <div id="cuadro_solicitud_vacaciones">


                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_condicion_laboral" class="col-sm-4 control-label">Condición Lab.</label>
                                  <div class="col-sm-8">
                                    <select class="form-control" id="txt_condicion_laboral" name="txt_condicion_laboral">
                                      <option value=''>Seleccione</option>
                                      <option value='1' >Contratado</option>
                                      <option value='2' >Fijo</option>                        
                                    </select>
                                  </div>
                                </div> 
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_fecha_ingreso_me" class="col-sm-4 control-label">Fecha Ingreso MPPE</label>
                                  <div class="col-sm-8">
                                    <div class="input-group">
                                      <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                      </div>
                                      <input class="form-control pull-right"  type="text"   id="txt_fecha_ingreso_me"    name="txt_fecha_ingreso_me"  >
                                    </div><!-- /.input group -->
                                  </div>
                                </div><!-- /.form group -->
                              </div>
                              <!-- row cierre -->
                            </div>

                            <!-- <hr style="color: #0056b2;" /> -->

                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_periodo" class="col-sm-4 control-label">Periodo</label>
                                  <div class="col-sm-8">
                                    <select class="form-control" id="txt_periodo" name="txt_periodo">
                                      <option value=''>Seleccione</option>                        
                                    </select>
                                  </div>
                                </div>

                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                
                                <div class="form-group">
                                  <label for="txt_lapso_vacaciones" class="col-sm-4 control-label">Lapso Solicitado</label>
                                  <div class="col-sm-8">
                                    <div class="input-group">
                                      <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                      </div>
                                      <input class="form-control pull-right"  type="text"   id="txt_lapso_vacaciones"    name="txt_lapso_vacaciones"  >
                                    </div><!-- /.input group -->
                                  </div>
                                </div><!-- /.form group -->
                              </div>
                              <!-- row cierre -->
                            </div>   


                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_tipo_vacaciones" class="col-sm-4 control-label">Vacaciones</label>
                                  <div class="col-sm-8">
                                    <select class="form-control" id="txt_tipo_vacaciones" name="txt_tipo_vacaciones">
                                      <option value=''>Seleccione</option>
                                      <option value='1' >Regulares</option>
                                      <option value='2' >Atrasadas</option>                        
                                    </select>

                                  </div>
                                </div>
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_fecha_registro" class="col-sm-4 control-label">Fecha Solicitud</label>
                                  <div class="col-sm-8">
                                    <div class="input-group">
                                      <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                      </div>
                                      <input class="form-control pull-right"  type="text"   id="txt_fecha_registro"    name="txt_fecha_registro"  >
                                    </div><!-- /.input group -->
                                  </div>
                                </div><!-- /.form group -->
                              </div>
                              <!-- row cierre -->
                            </div>


                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_observacion" class="col-sm-4 control-label">Observaciones</label>
                                  <div class="col-sm-8">
                                    <textarea class="form-control" id="txt_observacion" name="txt_observacion" rows="2" placeholder="Enter ..."></textarea>
                                  </div>
                                </div>
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <!-- //code -->

                              </div>
                              <!-- row cierre -->
                            </div>

                        </div> <!-- /.cuadro_solicitud_vacaciones -->                        

                      </div><!-- /.box-body -->
                  </div> <!--/.modal-body-->
                  
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
                      <button type="button" name="btn_enviar_modal" id="btn_enviar_modal"  class="btn btn-primary submit"><i class="fa fa-save"></i> Solicitar</button>
                      <button type="button" name="btn_imprimir" id="btn_imprimir"  class="btn btn-success"><i class="fa fa-print"></i> Imprimir</button>
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