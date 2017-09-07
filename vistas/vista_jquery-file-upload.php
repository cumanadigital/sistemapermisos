<?php
require_once('../apiv3.0/funciones/funciones3.0.php');
//ver_arreglo($_POST);



// se debe consultar si el estudiante ya tiene alguna solicitud activa en en periodo actual
// mostrar una tabla con el historial de solicitudes de cada año... ordenada de modo descendente
//  boton para ver detalle - estatus de cada solicitud
// boton para realizar una nueva solicitud
$foto_user = "media/carnet/" . $_SESSION['sesion_userfoto'].".jpg";
if (!file_exists($foto_user)) {
    $foto_actualizada = false;
    $foto_user = "media/carnet/mituxvenezuela_opt.png";
    $foto_user = "media/carnet/personal.png";
}
  

?>

<link rel="stylesheet" href="apiv3.0/plugins/jQuery-File-Upload-9.11.2/css/jquery.fileupload.css">

<div class="row">
    <div class="col-sm-12 col-md-12">
        
        
        <div class="box box-primary" >
            <div class="box-header with-border">
                <h3 class="box-title"><strong>Solicitud de Preparador Dcocente - Departamento de <?php echo $_POST['dptouser'];?></strong></h3>
            </div><!-- /.box-header -->
            <?php
            //Array
            //(
            //    [dptouser] => Administración
            //    [cargouser] => Estudiante
            //    [userestatus] => activo
            //    [token1] => Fdf?D?9Fb07:A73D24¡3
            //)
            $estatus = $_POST['userestatus'];
            $departamento = $_POST['dptouser'];
            ?>
            
            
            <?php if ($estatus!='activo') { ?>
                    
                    <div class="box-body">
                        <div class="col-sm-12 col-md-12" >
                            <div class="row">
                                <div class="col-sm-2 col-md-2" ></div>
                                <div class="col-sm-8 col-md-8" >
                                    <div class="box box-solid box-warning">
                                        <div class="box-header with-border">
                                          <h3 class="box-title">¿Usuario bloqueado o inactivo?</h3>
                                        </div><!-- /.box-header -->
                                        <div class="box-body">
                                            <p>La aplicación en linea inactivará a los usuarios que no ingresen periódicamente al sistema.</p>
                                            <p>Esta medida se implementa con el fin de garantizar calidad e integridad de la información.</p>
                                            <p>Adicionalmente, si un usuario intenta tres veces ingresar a la aplicación con información errada será bloqueado como medida preventiva ante una posible suplantación de identidad.</p>
                                            </p>Si  el usuario se encuentra inactivo o bloqueado se podrá gestionar la activación del usuario por medio de los siguientes casos:</p>
                                            <ul>
                                                <li>Contactarse con el Administrador del Departamento para la activación  del usuario.</li>
                                            </ul>
                                        </div><!-- /.box-body -->
                                        <div class="box-footer">
                                          The footer of the box
                                        </div><!-- box-footer -->
                                      </div><!-- /.box -->
                                    </div>
                                    <div class="col-sm-2 col-md-2" ></div>
                                
                                </div>
                            </div>
                        </div>
                    </div>
            <?php }else{ ?>
            
            
            <!-- form start -->
            <!--class="form-horizontal"-->
            <!--<form role="form" >-->
            <!--<form id="fileupload" action="//jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">   -->
            <div class="box-body">
                <!--CONTENIDO BODY-->
                    

                
                            

                <div class="col-sm-12 col-md-12" >
                    <div class="row">
                        
                        <div class="col-sm-9 col-md-9">
                            
                            
                            <span class="btn btn-success fileinput-button">
                                <i class="glyphicon glyphicon-plus"></i>
                                <span>Add files...</span>
                                <!-- The file input field used as target for the file upload widget -->
                                <input id="fileupload" type="file" name="files[]" >
                            </span>
                            <br>
                            <br>
                            <!-- The global progress bar -->
                            <div id="progress" class="progress">
                                <div class="progress-bar progress-bar-success"></div>
                            </div>
                            <!-- The container for the uploaded files -->
                            <div id="files" class="files"></div>
                            <br>
                            
                        </div>
                        
                        
                        <div class="col-sm-3 col-md-3">
                            
                            
                        </div>
                        <!--<div class="col-sm-4 col-md-4"> </div>-->
                        
                    </div>
                </div>
                
                <!--<div class="col-sm-12 col-md-12" >-->
                <!--    <div class="row">-->
                <!--        -->
                <!--        <div class="col-sm-4 col-md-4"> ..</div>-->
                <!--        <div class="col-sm-4 col-md-4"> ..</div>-->
                <!--        <div class="col-sm-4 col-md-4"> ..</div>-->
                <!--        -->
                <!--    </div>-->
                <!--</div>-->
                    
        
            </div><!-- /.box-body -->
                
            <div class="box-footer ">

            </div>
       
       
        <!--</form>-->
            
                
            <?php } ?>
            
    
    
            
            
        </div><!-- /.box -->
        
    
    </div>
</div>  
    

<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.iframe-transport.js"></script>
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.fileupload.js"></script>

<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>-->
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<!--<script src="js/vendor/jquery.ui.widget.js"></script>-->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/vendor/jquery.ui.widget.js"></script>

<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<!--<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>-->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/vendor/load-image.all.min.js"></script>


<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<!--<script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>-->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/vendor/canvas-to-blob.min.js"></script>


<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<!--<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>-->

<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="apiv3.0/plugins/jQuery-File-Upload-9.11.2/js/jquery.fileupload-validate.js"></script>
<script>
/*jslint unparam: true, regexp: true */
/*global window, $ */

//var url = window.location.hostname === 'blueimp.github.io' ?
                //'//jquery-file-upload.appspot.com/' : 'apiv3.0/plugins/jQuery-File-Upload-9.11.2/server/php/',
//var url = 'apiv3.0/plugins/jQuery-File-Upload-9.11.2/server/php/',
//sistemaudo/media/carnet
$(function () {
    'use strict';
    // Change this to the location of your server-side upload handler:
    var url = 'apiv3.0/plugins/jQuery-File-Upload-9.11.2/server/php/',
        uploadButton = $('<button/>')
            .addClass('btn btn-primary')
            .prop('disabled', true)
            .text('Processing...')
            .on('click', function () {
                var $this = $(this),
                    data = $this.data();
                $this
                    .off('click')
                    .text('Abort')
                    .on('click', function () {
                        $this.remove();
                        data.abort();
                    });
                data.submit().always(function () {
                    $this.remove();
                });
            });
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        autoUpload: false,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxFileSize: 999000,
        // Enable image resizing, except for Android and Opera,
        // which actually support image resizing, but fail to
        // send Blob objects via XHR requests:
        disableImageResize: /Android(?!.*Chrome)|Opera/
            .test(window.navigator.userAgent),
        previewMaxWidth: 100,
        previewMaxHeight: 100,
        previewCrop: true
    }).on('fileuploadadd', function (e, data) {
        data.context = $('<div/>').appendTo('#files');
        $.each(data.files, function (index, file) {
            var node = $('<p/>')
                    .append($('<span/>').text(file.name));
            if (!index) {
                node
                    .append('<br>')
                    .append(uploadButton.clone(true).data(data));
            }
            node.appendTo(data.context);
        });
    }).on('fileuploadprocessalways', function (e, data) {
        var index = data.index,
            file = data.files[index],
            node = $(data.context.children()[index]);
        if (file.preview) {
            node
                .prepend('<br>')
                .prepend(file.preview);
        }
        if (file.error) {
            node
                .append('<br>')
                .append($('<span class="text-danger"/>').text(file.error));
        }
        if (index + 1 === data.files.length) {
            data.context.find('button')
                .text('Upload')
                .prop('disabled', !!data.files.error);
        }
    }).on('fileuploadprogressall', function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .progress-bar').css(
            'width',
            progress + '%'
        );
    }).on('fileuploaddone', function (e, data) {
        $.each(data.result.files, function (index, file) {
            if (file.url) {
                var link = $('<a>')
                    .attr('target', '_blank')
                    .prop('href', file.url);
                $(data.context.children()[index])
                    .wrap(link);
            } else if (file.error) {
                var error = $('<span class="text-danger"/>').text(file.error);
                $(data.context.children()[index])
                    .append('<br>')
                    .append(error);
            }
        });
    }).on('fileuploadfail', function (e, data) {
        $.each(data.files, function (index) {
            var error = $('<span class="text-danger"/>').text('File upload failed.');
            $(data.context.children()[index])
                .append('<br>')
                .append(error);
        });
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
});
</script>
