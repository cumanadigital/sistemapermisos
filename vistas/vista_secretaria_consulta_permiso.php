<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Busqueda de Permisos</h3>
        <div class="box-tools pull-right">
          <!-- <button id="boton_minus_busqueda" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button> -->
        </div><!-- /.box-tools -->
      </div><!-- /.box-header -->
      
      <!--  BOX-BODY  -->
      <div class="box-body">
      <!--CONTENIDO AQUI-->
      <!--CONTENIDO AQUI-->
      <!--CONTENIDO AQUI-->

        <!-- Horizontal Form -->
        <!-- form start -->
          <form class="form-horizontal">
            <div class="box-body">

              <div class="row" id="cuadro_busqueda_valores">
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
                        <!-- <button type="button" name="btn_buscar" id="btn_buscar" class="btn btn-flat"><i class="fa fa-search"></i></button> -->
                        <!-- <button type="button" name="btn_limpiar" id="btn_limpiar" class="btn btn-flat"><i class="fa  fa-trash"></i></button> -->
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


              <div class="row" id="cuadro_busqueda_datos_laborales" hidden="true">
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

              <div  id="cuadro_datos_laborales" hidden="true">

                  <div class="row" >
                    <!-- col1 -->
                    <div class="col-sm-4">
                      <!-- //code -->
                      <div class="form-group" >
                        <label for="txt_tipo_personal" class="col-sm-4 control-label">Personal</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" id="txt_tipo_personal" name="txt_tipo_personal" placeholder="" readonly="readonly">
                        </div>
                      </div>
                    </div>
                    <!-- col2 -->
                    <div class="col-sm-8">
                      <!-- //code -->
                      <div class="form-group">
                        <label for="txt_cargo_funcional" class="col-sm-4 control-label">Cargo Funcional</label>
                        <div class="col-sm-8">
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
                        <label for="txt_municipio" class="col-sm-4 control-label">Municipio</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" id="txt_municipio" name="txt_municipio" placeholder="" readonly="readonly">
                        </div>
                      </div>
                    </div>
                    <!-- col2 -->
                    <div class="col-sm-8">
                      <!-- //code -->
                      <div class="form-group">
                        <label for="txt_lugar_trabajo" class="col-sm-4 control-label">Lugar de Trabajo</label>
                        <div class="col-sm-8">
                          <input type="hidden" class="form-control" id="txt_id_lugar_trabajo" name="txt_id_lugar_trabajo" readonly="readonly">
                          <input type="text" class="form-control" id="txt_lugar_trabajo" name="txt_lugar_trabajo" placeholder="" readonly="readonly">
                        </div>
                      </div>
                    </div>
                    <!-- cierre -->
                  </div>


            </div>


            <div class="row" id="cuadro_de_resultados" hidden="true">

            <div class="col-sm12 col-md-12">
              <table id="table"
                    data-show-refresh="false"
                    data-show-columns="false"
                    data-search="false"
                    data-pagination="true"
                    data-page-size="5"
                    data-page-list="[5,10,25,50,100]"
                    data-query-params="queryParams"
                    data-toolbar="#toolbar111"
              >
                <thead>
                  <tr>
                   <!--<th data-field="state" data-checkbox="true"></th>-->
                   <th data-field="id_permiso" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Id</th>

                   <th data-field="departamento_persona" data-filter-control="select" data-sortable="true" data-halign="center" data-formatter="StatusDependencia" >Dependencia</th>

                   <!-- <th data-field="cedula_persona" data-filter-control="select" data-sortable="false" data-halign="center" >Cédula</th> -->
                   <!-- <th data-field="apellidos_nombres" data-filter-control="select" data-sortable="false" data-halign="center">Nombre Apellido</th> -->
                   <!-- <th data-field="categoria_cargo_descripcion" data-filter-control="select" data-sortable="false" data-halign="center" data-formatter="StatusPersonal" >Personal</th> -->
                   <th data-field="nombre_tipo" data-filter-control="select" data-sortable="true" data-halign="center"  >Permiso</th>
                   <th data-field="tpnumero_dias" data-filter-control="select" data-sortable="true" data-halign="center"  >xxD</th>
                   <th data-field="motivo_permiso" data-filter-control="select" data-sortable="true" data-halign="center"  >Motivo</th>                   
                   <th data-field="numero_dias" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center"  >Días</th>
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center" data-formatter="StatusPeriodo" >Periodo</th> -->
                   <!-- <th data-field="fecha_inicio" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fecha Culm.</th> -->
                   <!-- <th data-field="reglas_legal" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Base Legal</th> -->
                   <th data-field="fecha_desde" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center" data-formatter="FechaDesde" >Desde</th>
                   <th data-field="fecha_hasta" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center" data-formatter="FechaHasta" >Hasta</th>
                   <!-- <th data-field="fecha_cierre" data-filter-control="select" data-sortable="false" data-halign="center" data-align="center"  >Fin Periodo</th> -->
                   <th data-field="estatus" data-filter-control="select" data-sortable="true" data-halign="center" data-align="center" data-formatter="StatusFormatter" >Estatus</th>
                   <!-- <th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents">Acción</th> -->
                 </tr>
                </thead>
              </table>
            </div> <!--// fin col-sm-->
          </div><!--// fin row-->



            <!-- <div class="box-footer">
              <button type="submit" class="btn btn-default">Cancel</button>
              <button type="submit" class="btn btn-info pull-right">Sign in</button>
            </div> -->
            <!-- /.box-footer -->

            <div class="box-footer">
              <button type="button" name="btn_limpiar" id="btn_limpiar" class="btn btn-default" ><i class="fa  fa-trash"></i> Limpiar</button>
              <button type="button" name="btn_buscar"  id="btn_buscar"  class="btn btn-primary pull-right"><i class="fa fa-search"></i> Buscar</button>
            </div>
            <!-- /.box-footer -->

          </form>
        

        </div> <!-- /.box-->
        
        <hr style="color: #0056b2;" />


        <div id='calendar'></div>
                        

          
          

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

<link rel='stylesheet' href='apiv3.0/plugins/fullcalendar/fullcalendar.css' />
<!-- <script src='lib/jquery.min.js'></script> -->
<script src='apiv3.0/plugins/moment-develop/moment.js'></script>
<script src='apiv3.0/plugins/fullcalendar/fullcalendar.js'></script>
<script src='apiv3.0/plugins/fullcalendar/locale-all.js'></script>
<!-- <script src='apiv3.0/plugins/fullcalendar/es.js'></script> -->