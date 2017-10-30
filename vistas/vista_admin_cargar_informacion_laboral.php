<?php 
require_once('../conf/config.php');
require_once('../apiv3.0/funciones/funciones3.0.php');
?>

<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="box box-solid box-primary ">
      <!--  BOX HEADER      -->
      <div class="box-header with-border">
        <h3 class="box-title">Cargar Archivo de Informacion Laboral Formato CSV</h3>
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
      <br>
        <div class="col-sm-2 col-md-2"></div>

        <div class="col-sm-8 col-md-8">
          
          <form action='importar22.php' method='post' enctype="multipart/form-data">
                
                <div class="form-group row">
                  <label class="control-label col-sm-3">Municipio:</label>
                  <div class="col-xs-6">
                    <select name="txt_municipio" id="txt_municipio" class="form-control"></select>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="control-label col-sm-3">Centro de Trabajo:</label>
                  <div class="col-xs-6">
                    <select name="txt_centro_trabajo" class="form-control" id="txt_centro_trabajo">
                      <option value="" disabled selected>Seleccione</option>
                     <!--  <option value="">a</option>
                      <option value="">b</option>
                      <option value="">c</option>
                      <option value="">d</option>
                      <option value="">e</option> -->
                    </select>
                  </div>
                </div>

                <div class="form-group row">
                  <label  class="control-label">  </label>
                  <div class="controls">
                    <input type='file' accept=".csv" title="Seleccione para Cargar el Archivo CSV" class="btn" name='sel_file' size='200000' >
                  </div>
                </div>

                <div class="form-group">
                  <input type='submit' class="btn btn-mini btn-primary" name='submit' value='Enviar'>
                </div>

              </form>
            
        </div>

        <div class="col-sm-2 col-md-2"></div>
      </div>


      <br><br>
      <div class="row">
          <div class="col-sm-2 col-md-2"></div>
          <div class="col-sm-8 col-md-8">
            <div class="form-group row">
              <label class="control-label col-sm-3">Descarga Planilla</label>
              <div class="col-xs-12">
                
                <button id="btn_descarga_planilla" class="btn btn-block btn-success">PLANILLA CONSOLIDADO FINAL SOLICITUD INTEGRAL DE INFORMACIÓN LABORAL.ods</button>        
              </div>
            </div>
          </div>
          <div class="col-sm-2 col-md-2"></div>
      </div>
      <br><br>


      



        
        



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

