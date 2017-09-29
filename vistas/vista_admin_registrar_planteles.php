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







          <form class="form-horizontal" id="form_ventana_modal_asignar_autoridades" > 
            <div id="ventana_modal_asignar_autoridades" class="modal fade">
              <div class="modal-dialog" id="modal-dialog-xl">
                <div class="modal-content">
                  
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="fa fa-tag">&nbsp;</i>Asignar Autoridades - Director(a)</h4>
                  </div>
                  
                  <div class="modal-body">
                      <div class="box-body">

                        <div class="row">
                            <div class="col-sm-4">
                              <!-- //code -->
                              <div class="form-group">
                              <label for="txt_cedula_personal" class="col-sm-4 control-label">Cédula</label>
                              <div class="col-sm-8">
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
                              <label for="txt_nombre_funcionario" class="col-sm-4 control-label">Apellido y Nombre</label>
                              <div class="col-sm-8">
                                <input type="text" class="form-control" id="txt_nombre_funcionario" name="txt_nombre_funcionario"  placeholder="" readonly="readonly">
                              </div>
                            </div>
                          </div>

                        </div>



                        <div class="row">
                            <div class="col-sm-4">
                              <!-- //code -->
                              <div class="form-group">
                              <label for="txt_telefono_residencia" class="col-sm-4 control-label">Teléfono Residencial</label>
                              <div class="col-sm-8">
                                <input class="form-control" id="txt_telefono_residencia" type="tel" name="txt_telefono_residencia" placeholder="Ejm 0293-1234567" 
                                pattern="\([0-9]{4}\)[-][0-9]{7}[0-9]{4}" 
                                title="Formato validos (0293)432-1234"
                                 >
                              </div>
                            </div>
                          </div>

                          <div class="col-sm-4">
                              <!-- //code -->
                              <div class="form-group">
                              <label for="txt_telefono_celular" class="col-sm-4 control-label">Teléfono Celular</label>
                              <div class="col-sm-8">
                                <input class="form-control" id="txt_telefono_celular" type="text"   name="txt_telefono_celular"   placeholder="Ejm 0416-1234567" list="listatelefonos">
                                <datalist id="listatelefonos">
                                  <option value="0416-0000000">
                                  <option value="0426-0000000">
                                  <option value="0412-0000000">
                                  <option value="0414-0000000">
                                  <option value="0424-0000000">
                              </datalist>
                              </div>
                            </div>
                          </div>

                          <div class="col-sm-4">
                            <!-- //code -->
                            <div class="form-group">
                              <label for="txt_nombre_funcionario" class="col-sm-4 control-label">Correo Elect.</label>
                              <div class="col-sm-8">
                                <input type="email" class="form-control" id="txt_nombre_funcionario" name="txt_nombre_funcionario"  placeholder="Ingrese correo válido" >
                              </div>
                            </div>
                          </div>

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
                                    <input type="hidden" class="form-control" id="txt_id_cargo_funcional" name="txt_id_cargo_funcional">
                                    <input type="text" class="form-control" id="txt_cargo_funcional" name="txt_cargo_funcional" placeholder="Director" >
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
                                   <th data-field="cargo_denominacion" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fecha Asig.</th>
                                   <th data-field="action" data-align="center" data-formatter="actionFormatter2" data-events="actionEvents2"                        >Acción</th>
                                 </tr>
                                </thead>
                              </table>
                            </div>
                            <!-- cierre -->
                            <br>
                        </div>

                        
                        

                        <div id="cuadro_solicitud_permiso" style="display: none;">

                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_tipo_permiso" class="col-sm-4 control-label">Tipo de Permiso</label>
                                  <div class="col-sm-8">
                                    <select class="form-control" id="txt_tipo_permiso" name="txt_tipo_permiso">
                                      <option value=''>Seleccione</option>
                                      
                                      <optgroup label="Permisos Obligatorios">  
                                        <option value='11' disabled="disabled">Matrimonio</option>
                                        <option value='12' disabled="disabled">Reposo prenatal</option>
                                        <option value='13' disabled="disabled">Reposo Post-Natal</option>
                                        <option value='14' disabled="disabled">Nacimiento de Hijos</option>
                                        <option value='15' >Enfermedad</option>
                                        <option value='16' >Fallecimiento de Familiar</option>
                                        <option value='17' >Participación activa en evento deportivo</option>
                                        <option value='18' >Comparecencia obligatoria ante una autoridad</option>
                                      </optgroup>

                                      <optgroup label="Permisos Potestativos">  
                                        <option value='51' >Enfermedad Familiar</option>
                                        <option value='52' >Accidente Grave Familiar</option>
                                        <option value='53' >Siniestro</option>
                                        <option value='54' >Realizar Estudios</option>
                                        <option value='55' >Presentar Exámenes</option>
                                        <option value='56' >Diligencias Personales</option>
                                        <option value='57' >Actividades Deportivas</option>
                                        <option value='58' >Asistencia a Seminario</option>
                                        <option value='59' >Conferencia o Congreso</option>
                                        <option value='60' >Becas</option>
                                        <option value='61' >Otros</option>
                                      </optgroup>                        
                                    </select>
                                  </div>
                                </div>

                              </div>
                              <!-- col2 -->
                              <div class="col-sm-6">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_motivo_permiso" class="col-sm-4 control-label">Motivo de Permiso</label>
                                  <div class="col-sm-8">
                                    <input type="text" class="form-control" id="txt_motivo_permiso" name="txt_motivo_permiso" placeholder="Ingresa motivo">
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