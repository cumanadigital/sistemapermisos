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
                   <th hideColumn="true" data-field="id_usuario" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th>
                   <th data-field="image"              data-halign="center" data-align="center" data-formatter="imageFormatter">Foto</th>
                   
                   <th data-field="cedula_persona" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Cédula</th>
                   <th data-field="apellidos_nombres" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Apellidos - Nombres</th>
                   <th data-field="cargo_persona" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Cargo</th>

                   <th data-field="rol_usuario" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Nivel Usuario</th>

                   <!-- <th data-field="nombre_persona" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Nombre</th> -->
                   
                   
                   <!-- <th data-field="departamento_persona" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Dependencia</th> -->
                   
                   <th data-field="dependencias_admin3" data-filter-control="select" data-sortable="false" data-halign="center" data-align="left">Dependencias</th>
                   
                   <th data-field="nombre_usuario" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Login</th>
                   <th data-field="estatus" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th>
                   <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th>
                   <!-- <th class="col-sm-2" data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th> -->

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
                    <h4 class="modal-title"><i class="fa fa-tag">&nbsp;</i>Registrar Usuarios del Sistema</h4>
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
                              
                            <hr style="color: #0056b2;" />
                        
                        </div>  <!-- ./ cuadro_datos_laborales -->
                        

                        <div id="cuadro_solicitud_permiso">

                            

                          <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-4">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_rol_usuario" class="col-sm-3 control-label">Login</label>
                                  <div class="col-sm-9">
                                    <div class="input-group">
                                      <input class="form-control" id="txt_login" type="text"   name="txt_login" placeholder="Verificar" >
                                      <span class="input-group-btn">
                                        <button type="button" name="btn_buscar_login" id="btn_buscar_login" class="btn btn-flat"><i class="fa fa-search"></i></button>
                                        <!-- <button type="button" name="btn_limpiar" id="btn_limpiar" class="btn btn-flat"><i class="fa  fa-trash"></i></button> -->
                                      </span>
                                    </div>
                                  </div>
                                </div>

                              </div>
                              <!-- col2 -->

                              <div class="col-sm-4">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_password1" class="col-sm-3 control-label">Password</label>
                                  <div class="col-sm-9">
                                  <input class="form-control" id="txt_password1" type="text"   name="txt_password1" placeholder="secreto" >
                                    
                                  </div>
                                </div>
                              </div>
                              <!-- col3 -->
                              <div class="col-sm-4">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_password2" class="col-sm-3 control-label">Confirmar</label>
                                  <div class="col-sm-9">
                                    <input class="form-control" id="txt_password2" type="text"   name="txt_password2" placeholder="secreto" >  
                                  </div>
                                </div>
                              </div>
                              <!-- row cierre -->
                            </div>




                            <div class="row">
                              <!-- col1 -->
                              <div class="col-sm-4">
                                <!-- //code -->
                                <div class="form-group">
                                  <label for="txt_rol_usuario" class="col-sm-3 control-label">Roles</label>
                                  <div class="col-sm-9">
                                    <select class="form-control" id="txt_rol_usuario" name="txt_rol_usuario">
                                      <option value="" selected="selected">Seleccione</option>

                                        <option value="personal" >Jefe de Personal</option>
                                        <option value="juridica" >Aseroría Jurídica</option>
                                        <option value="secretaria" >Secretaria de Personal</option>
                                        <option value="jefeinmediato" >Jefe Inmediato</option>
                                        <option value="director" disabled="disabled">Director</option>

                                        <option value="bienestar" >Bienestar Social</option>
                                        <option value="licencia" >Licencias</option>
                                        
                                        <option value="admin" >Informática y Sistemas</option>
                                        <option value="root" >Super Admin</option>

                                    </select>
                                  </div>
                                </div>

                              </div>
                              <!-- col2 -->
                              <div class="col-sm-8">
                                <!-- //code -->
                                <div id="caja_dependencia" class="form-group" style="display: none">
                                  <label for="txt_dependencia" class="col-sm-3 control-label">Dependencias</label>
                                  <div class="col-sm-9">
                                    <select class="form-control" id="txt_dependencia" name="txt_dependencia">
                                      <option value="" selected="selected">Seleccione</option>
                                    </select>
                                  </div>
                                </div>
                              </div>
                              <!-- row cierre -->
                            </div>


                            <div class="row">
                                <div class="col-sm-12">
                                <!-- //code -->
                                <table id="table3"
                                      data-show-refresh="false"
                                      data-show-columns="false"
                                >
                                  <thead>
                                    <tr>
                                     <th data-field="pl_nombre"      data-halign="center" >Dependencia</th>
                                     <th data-field="municipio_nombre"  data-halign="center" >Municipio</th>                   
                                     <th data-field="action" data-align="center" data-formatter="actionFormatter2" data-events="actionEvents2"                        >Acción</th>
                                   </tr>
                                  </thead>
                                </table>
                              </div>
                              <!-- row cierre -->
                            </div>



                            



                        </div> <!-- /.cuadro_solicitud_permiso -->                        

                      </div><!-- /.box-body -->
                  </div> <!--/.modal-body-->
                  
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                      <button type="button" name="btn_enviar_modal" id="btn_enviar_modal"  class="btn btn-primary submit">Enviar</button>
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