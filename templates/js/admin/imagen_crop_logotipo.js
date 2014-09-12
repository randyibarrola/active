/**
 *
 * HTML5 Image uploader with Jcrop
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2012, Script Tutorials
 * http://www.script-tutorials.com/
 */

// convert bytes into friendly format
function bytesToSize(bytes) {
    var sizes = ['Bytes', 'KB', 'MB'];
    if (bytes == 0)
        return 'n/a';
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
}
;

// check for selected crop region
function checkForm() {
    if (parseInt($('#w').val()))
        return true;
    toastr.options = {positionClass: "toast-top-center"};
    toastr.error(msgErrorArea, textImagenes);
    //$('.error_upload').html('Por favor, primero seleccione un área y luego de click en "Subir".').show();
    return false;
}
// clear info by cropping (onRelease event handler)
function clearInfo() {
    $('.info #w').val('');
    $('.info #h').val('');
}
var jcrop_api, boundx, boundy;

function fileSelectHandler() {
    $('.preview-container').width(180).height(130);
    var oFile = $('#logo')[0].files[0];
    $('.error_upload').hide();
    var rFilter = /^(image\/jpeg|image\/png)$/i;
    if (!rFilter.test(oFile.type)) {
        toastr.options = {positionClass: "toast-top-center"};
        //toastr.error(msgErrorSoloImg, textImgLogotipo);
        $('.error_upload').html('Por favor, seleccione un foto válida (solo png y jpg son permitidas).').show();
        return;
    }

    /*if (oFile.size > 600 * 1024) {
        toastr.options = {positionClass: "toast-top-center"};
        toastr.error(msgErrorFileLarge, textImgLogotipo);
        //$('.error_upload').html('El archivo es demasiado grande, por favor seleccione uno más chico.').show();
        return;
    }*/

    // preview element
    var oImage = document.getElementById('imagen_preview');

    // prepare HTML5 FileReader
    var oReader = new FileReader();

    oReader.onload = function(e) {
        // e.target.result contains the DataURL which we can use as a source of the image
        oImage.src = e.target.result;
        $('.jcrop-preview').attr('src', e.target.result);
        oImage.onload = function() { // onload event handler

            // display step 2
            

            // display some basic image info
            /*
            var sResultFileSize = bytesToSize(oFile.size);
            $('#filesize').val(sResultFileSize);
            $('#filetype').val(oFile.type);
            $('#filedim').val(oImage.naturalWidth + ' x ' + oImage.naturalHeight);*/

         /*   $preview = $('#preview-pane'),
                    $pcnt = $('#preview-pane .preview-container'),
                    $pimg = $('#preview-pane .preview-container img'),
                    xsize = $pcnt.width(),
                    ysize = $pcnt.height();
*/
            


            // Create variables (in this scope) to hold the Jcrop API and image size


            // destroy Jcrop if it is existed

            
            // initialize Jcrop
            

                // use the Jcrop API to get the real image size
                
                    
                        dt = {action: 'uploadLogo'};
                        if($('input[name=idHotel]').val())
                            dt.idHotel = $('input[name=idHotel]').val();
                        $.ajaxFileUpload({
                            url: BASE_URL + "/admin-ajax-hotel",
                            secureuri: false,
                            fileElementId: 'logo',
                            dataType: 'json',
                            data: dt,
                            success: function(data, status)
                            {
                                //console.log(data, status);
                                
                                if (data.msg == 'ok')
                                {
                                    
                                    $('#logo_image_file_png').prop('src', data.data).show();
                                    $('input[name=logoId]').val(data.idLogo);

                                    $('#logo').off('change').on('change', function() {
                                        fileSelectHandler();
                                    });
                                }
                                mostrarDeleteLogo();
                            },
                            error: function(data, status, e)
                            {
                                
                            }
                        });
                
                

                // Store the Jcrop API in the jcrop_api variable
                jcrop_api = this;
// Move the preview into the jcrop container for css positioning
               // $preview.appendTo(jcrop_api.ui.holder);
               

            
        };
    };

    // read selected file as DataURL
    oReader.readAsDataURL(oFile);
}