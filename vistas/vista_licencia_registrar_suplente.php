<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Listado de Suplentes</h3>
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
                <a class="create btn btn-default" id="btn_crear_registro" href="javascript:">Agregar Suplentes</a>
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
                   <!-- <th data-field="id_permiso" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th> -->

                   <th data-field="departamento_persona" data-filter-control="select" data-sortable="false" data-halign="center" data-formatter="StatusDependencia" >Dependencia</th>

                   <th data-field="cedula_suplente" data-filter-control="select" data-sortable="false" data-halign="center" >Cédula</th>
                   <th data-field="nombre_suplente" data-filter-control="select" data-sortable="false" data-halign="center">Nombre</th>
                   <th data-field="apellido_suplente" data-filter-control="select" data-sortable="false" data-halign="center">Apellido</th>
                   <!-- <th data-field="categoria_cargo_descripcion" data-filter-control="select" data-sortable="false" data-halign="center" data-formatter="StatusPersonal" >Personal</th> -->
                   <th data-field="telefono_suplente" data-filter-control="select" data-sortable="false" data-halign="center"  >Teléfono</th>
                   <!-- <th data-field="id_tipopermiso" data-filter-control="select" data-sortable="false" data-halign="center"  >Permiso</th> -->
                   <!-- <th data-field="motivo_permiso" data-filter-control="select" data-sortable="false" data-halign="center"  >Motivo</th>                    -->
                   <th data-field="correo_suplente" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Correo</th>
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusPeriodo" >Periodo</th> -->
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fecha Culm.</th> -->
                   <!-- <th data-field="reglas_legal" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Base Legal</th> -->
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Inicio permiso</th> -->
                   <!-- <th data-field="fecha_cierre" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fin Periodo</th> -->
                   <!-- <th data-field="estatus" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th> -->
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
                    <h4 class="modal-title"><i class="fa fa-tag">&nbsp;</i>Registrar Suplencias</h4>
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
                              <input class="form-control" id="txt_id_permiso"  type="hidden" name="txt_id_permiso">
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

                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-4">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_municipio" class="col-sm-3 control-label">Permiso</label>
                                  <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txt_municipio" name="txt_municipio" placeholder="" readonly="readonly">
                                  </div>
                                </div>
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-8">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_lugar_trabajo" class="col-sm-3 control-label">Periodo</label>
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
                        

                        <div id="cuadro_solicitud_permiso">

                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-6">
                                <div class="form-group">
                                  <label for="txt_cedula_suplente" class="col-sm-4 control-label">Cédula</label>
                                  <div class="col-sm-8">
                                    <input type="text" class="form-control" id="txt_cedula_suplente" name="txt_cedula_suplente" placeholder="Ingresa Cédula">
                                  </div>
                                </div>

                                <!-- //code -->
                                <!-- <div class="form-group">
                                  <label for="txt_tipo_suplencia" class="col-sm-4 control-label">Tipo de Suplencia</label>
                                  <div class="col-sm-8">
                                    <select class="form-control" id="txt_tipo_permiso" name="txt_tipo_permiso">
                                      <option value=''>Seleccione</option>
                                      <option value='11' disabled="disabled">Parcial</option>
                                      <option value='12' disabled="disabled">Completa</option>                        
                                    </select>
                                  </div>
                                </div> -->

                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <div class="form-group">
                                  <label for="txt_nombre_suplente" class="col-sm-4 control-label">Nombre Apellido</label>
                                  <div class="col-sm-8">
                                    <input type="text" class="form-control" id="txt_nombre_suplente" name="txt_nombre_suplente" placeholder="Nombre Suplente">
                                  </div>
                                </div>
                              </div>
                              <!-- row cierre -->
                            </div>   


                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_cantidad_dias" class="col-sm-4 control-label">Cantidad de Días</label>
                                  <div class="col-sm-8">
                                    <input type="number" min="1" max="3" class="form-control" id="txt_cantidad_dias" name="txt_cantidad_dias" placeholder="Ingresa días">
                                  </div>
                                </div>
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_periodo_registro" class="col-sm-4 control-label">Periodo</label>
                                  <div class="col-sm-8">
                                    <div class="input-group">
                                      <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                      </div>
                                      <input class="form-control pull-right"  type="text"   id="txt_periodo_registro"    name="txt_periodo_registro"  >
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
                                <!-- <div class="form-group">
                                  <label for="txt_cantidad_dias" class="col-sm-4 control-label">Cantidad de Días</label>
                                  <div class="col-sm-8">
                                    <input type="text" class="form-control" id="txt_cantidad_dias" name="txt_cantidad_dias" placeholder="Ingresa días">
                                  </div>
                                </div> -->
                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_fecha_registro" class="col-sm-4 control-label">Fecha Registro</label>
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

                        </div> <!-- /.cuadro_solicitud_permiso -->                        

                      </div><!-- /.box-body -->
                  </div> <!--/.modal-body-->
                  
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
                      <button type="button" name="btn_enviar_modal" id="btn_enviar_modal"  class="btn btn-primary submit"><i class="fa fa-save"></i> Enviar</button>
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