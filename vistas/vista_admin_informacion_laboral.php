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
                <a class="create btn btn-default" id="btn_crear_periodo"href="javascript:">Agregar Plantel</a>
                <span class="alert"></span>
              </p>
            </div> <!--// fin col-sm-->
          </div>	<!--// fin row-->
          
          <div class="row">
            <div class="col-sm12 col-md-12">
<!--               <table id="table22"
                    data-show-refresh="true"
                    data-show-columns="true"
                    data-search="true"
                    data-pagination="true"
                    data-query-params="queryParams"
                    data-toolbar="#toolbar1"
              >
                <thead>
                  <tr>
                   <th data-field="id_periodo" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Id</th>
                   <th data-field="nombre_periodo" data-filter-control="select" data-sortable="false" data-halign="center"  >Nombre</th>                   
                   <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Inicio Periodo</th>
                   <th data-field="fecha_cierre" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fin Periodo</th>
                   <th data-field="estatus" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th>
                   <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th>
                 </tr>
                </thead>
              </table> -->

              <table id="table"
                    data-show-refresh="true"
                    data-show-columns="true"
                    data-search="true"
                    data-pagination="true"
                    data-query-params="queryParams"
                    data-toolbar="#toolbar1"
                    data-page-size="5"
                    data-page-list="[5,10,25,50,100]"
              >
                      <!-- 
                      id_info_laboral, 
                      nom_ape, 
                      ci, 
                      dir_hab, 
                      telf_hab, 
                      telf_movil, 
                      email, 
                      twitter, 
                      funcion_laboral, 
                      tipo_personal, 
                      nivel_instruccion, 
                      fecha_ingreso, 
                      vacaciones_vencidas, 
                      dependencia, 
                      cod_dependencia_cobro, 
                      horas, 
                      cod_dependencia_labora, 
                      area_formacion, 
                      alergias, 
                      cirugias, 
                      grupo_sanguineo, 
                      destrezas, 
                      posesion_vivienda, 
                      estado_vivienda, 
                      discapacidad_patologia, 
                      partido_politico, 
                      telefono_familiar, 
                      contacto_familiar, 
                      nom_ape_hijos, 
                      ci_hijos, 
                      fecha_nacimiento_hijos, 
                      genero_hijos, 
                      discapacidad_hijos, 
                      grado_estudio_hijos
 -->
                <thead>
                  <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-field="id_info_laboral" data-sortable="false" data-halign="center" data-align="center">Id</th>
                    <th data-field="centro_laboral" data-sortable="false" data-halign="center" data-align="center">Centro Laboral</th>
                    <th data-field="nom_ape" data-filter-control="select" data-sortable="false" data-halign="center"  >Nombre Apellido</th>                   
                    <th data-field="ci" data-sortable="true" data-halign="center" data-align="center"  >Cédula</th>
                    <th data-field="unir"  data-sortable="true" data-halign="center" data-align="center" data-align="center" data-formatter="UnirFormatter" >Teléfonos</th>
                    <th data-field="unir2"  data-sortable="true" data-halign="center" data-align="center" data-align="center" data-formatter="UnirFormatter2" >Redes</th>
                    <th data-field="funcion_laboral" data-sortable="true" data-halign="center" data-align="center"  >Función<br>Laboral</th>
                    <th data-field="tipo_personal" data-sortable="true" data-halign="center" data-align="center"  >Tipo de<br>Personal</th>                   
                    <th data-field="nivel_instruccion" data-sortable="true" data-halign="center" data-align="center"  >Nivel<br>Instrucción</th>
                    <th data-field="fecha_ingreso" data-sortable="true" data-halign="center" data-align="center"  >Fecha<br>Ingreso</th>
                    <th data-field="vacaciones_vencidas" data-sortable="true" data-halign="center" data-align="center" >Vacaciones<br>Vencidas</th>
                    <th data-field="unir3" data-sortable="true" data-halign="center" data-align="center" data-formatter="UnirFormatter3" >Dependencia<br>Nómina Laboral</th>
                    <!-- <th data-field="horas" data-sortable="true" data-halign="center" data-align="center"  >Horas</th> -->
                    <th data-field="area_formacion" data-sortable="true" data-halign="center" data-align="center"  >Área Formación</th>
                    <th data-field="unir_medico" data-sortable="true" data-halign="center" data-align="center" data-formatter="UnirFormatter4" >Datos<br>Médicos</th>
                    <!-- <th data-field="" data-sortable="true" data-halign="center" data-align="center"  >Cédula</th> -->
                    <!-- <th data-field="telf_hab" data-sortable="true" data-halign="center" data-align="center" >Tel. Hab.</th> -->
                    <!-- <th data-field="telf_movil" data-sortable="true" data-halign="center" data-align="center" >Tel. Cel.</th> -->
                    <!-- <th data-field="email" data-sortable="true" data-halign="center" data-align="center" >Email</th> -->
                    <!-- <th data-field="twitter" data-sortable="true" data-halign="center" data-align="center" >Twitter</th> -->

                    <!-- <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th> -->
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