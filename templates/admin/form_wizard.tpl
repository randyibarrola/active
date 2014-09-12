{extends file="admin/index.tpl"}

{block name="script" append}
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script type="text/javascript" src="{$template_url}/js/jquery.geocomplete.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/form_wizard.js"></script>
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/admin/form_wizard.css" >
    <link href="{$template_url}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
{/block}

{block name="main_content" append}
  
<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">
    
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <!-- BEGIN PAGE CONTAINER-->        
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->			
                    <h3 class="page-title">Hoteles					
                        <small>Gestione su campaña</small>
                    </h3>
                    
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="col-md-12 responsive" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            
                            <div class="caption">
                                <i class="fa fa-reorder"></i>
                                <span class="step-title">
                                        Paso 1 de 4
                                </span>
                            </div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body form-wizard">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li class="active">
                                                <a href="#contratoDiv" data-toggle="tab" class="step">
                                                <span class="number">
                                                        1
                                                </span>
                                                <span class="desc">
                                                        <i class="fa fa-check"></i> Contrato
                                                </span>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="#idiomasDiv" data-toggle="tab" class="step">
                                                <span class="number">
                                                        2
                                                </span>
                                                <span class="desc">
                                                        <i class="fa fa-check"></i> Idiomas
                                                </span>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="#monedasDiv" data-toggle="tab" class="step active">
                                                <span class="number">
                                                        3
                                                </span>
                                                <span class="desc">
                                                        <i class="fa fa-check"></i> Monedas
                                                </span>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="#promocionesDiv" data-toggle="tab" class="step">
                                                <span class="number">
                                                        4
                                                </span>
                                                <span class="desc">
                                                        <i class="fa fa-check"></i> Promociones
                                                </span>
                                                </a>
                                        </li>
                                        <li>
                                                <a href="#empresaDiv" data-toggle="tab" class="step">
                                                <span class="number">
                                                        5
                                                </span>
                                                <span class="desc">
                                                        <i class="fa fa-check"></i> Empresa
                                                </span>
                                                </a>
                                        </li>
                                </ul>
                                <div id="bar" class="progress progress-striped" role="progressbar">
                                        <div class="progress-bar progress-bar-success">
                                        </div>
                                </div>
                                    <div id="contratoDiv">
                                        <form id="formWizardContrato">
                                        <h3 class="form-section">Contrato</h3>
                                        <div class="row">
                                            <div class="row-fluid">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Fecha de inicio del contrato</label>
                                                        <input type="text" name="inicioContrato" autocomplete="false" class="form-control validate[required]" {if $edit}value="{$hotel->inicioContrato|date_format:"%d-%m-%Y"}"{/if}>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Fecha de finalización del contrato</label>
                                                        <input type="text" name="finContrato" autocomplete="false" class="form-control validate[required]" {if $edit}value="{$hotel->finContrato|date_format:"%d-%m-%Y"}"{/if}>
                                                    </div>
                                                </div>
                                                    <div class="delimiter"></div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 centered">

                                                <a href="#idiomasDiv" class="btn btn-success">Siguiente</a>
                                            </div>
                                            
                                        </div>
                                        </form>
                                    </div>
                                    <div id="idiomasDiv">
                                        <form id="formWizardIdiomas">
                                        <h3 class="form-section">Idiomas</h3>
                                        <div class="row">
                                            <div class="row-fluid">
                                                {foreach from=$idiomas item=idioma}
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <div>
                                                                <label class="radio-inline">
                                                                    <input type="checkbox" name="idiomas[]" value="{$idioma->id}"  {if $idioma->selected}checked{/if}> {$idioma->nombre} ({$idioma->codigo})
                                                                </label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                {/foreach}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 centered">
                                                <a href="#contratoDiv" class="btn btn-default ">Anterior</a>
                                                <a href="#monedasDiv" class="btn btn-success ">Siguiente</a>
                                            </div>
                                            
                                        </div>
                                        </form>
                                    </div> 
                                    <div id="monedasDiv">
                                        <form id="formWizardMonedas">
                                        <h3 class="form-section">Monedas</h3>
                                        <div class="row">
                                            <div class="row-fluid">
                                                {foreach from=$monedas item=moneda}
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <div>
                                                                <label class="radio-inline">
                                                                    <input type="checkbox" name="monedas[]" value="{$moneda->id}"  {if $moneda->selected}checked{/if}> {$moneda->nombre} ({$moneda->codigo})
                                                                </label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                {/foreach}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 centered">
                                                <a href="#idiomasDiv" class="btn btn-default ">Anterior</a>
                                                <a href="#promocionesDiv" class="btn btn-success ">Siguiente</a>
                                            </div>
                                            
                                        </div>
                                        </form>
                                    </div>
                                    <div id="promocionesDiv">
                                        <form id="formWizardPromociones">
                                        <h3 class="form-section">Promociones</h3>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div>
                                                        <a href="#" class="btn btn-success" id="add_promo">Agregar</a>
                                                        <label class="radio-inline">
                                                            Agregar promoción
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid delimiter" id="promociones">

                                        </div>

                                        <div class="promocion hidden" id="promocion-hidden">

                                            <h3 class="form-section">&nbsp;</h3>
                                            <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>

                                            <div class="row-fluid ">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Descuento respecto a booking.com</label>
                                                        <input type="text" name="promociones[XX][descuentoBooking]" class="form-control validate[required, custom[number]]" disabled="" placeholder="Descuento">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Tipo de descuento</label>
                                                        <select name="promociones[XX][tipoDescuentoBooking]" class="form-control" disabled="">
                                                            <option value="%">Porcentaje (%)</option>
                                                            <!--<option value="€">Euros (&euro;)</option>-->
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Desde</label>
                                                        <input type="text" name="promociones[XX][inicio]" class="form-control validate[required]" disabled="" placeholder="Desde">
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Hasta</label>
                                                        <input type="text" name="promociones[XX][fin]" class="form-control validate[required]" disabled="" placeholder="Hasta">
                                                    </div>
                                                </div>
                                                    <div class="delimiter"></div>
                                            </div>

                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-12 centered">
                                                <a href="#monedasDiv" class="btn btn-default ">Anterior</a>
                                                <a href="#empresaDiv" class="btn btn-success ">Siguiente</a>
                                            </div>
                                            
                                        </div>
                                        </form>
                                    </div>
                                    <div id="empresaDiv">
                                        <form id="formWizardEmpresa">
                                        <h3 class="form-section">Datos de la Empresa</h3>
                                        <div class="row row-hotel-content">
                                            <div class="row-fluid">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Nombre Comercial</label>
                                                        <input type="text" name="nombreComercial" id="nombre" class="form-control validate[required]" placeholder="Nombre Comercial" value="{$empresa->nombreComercial}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Nombre Fiscal</label>
                                                        <input type="text" name="nombreFiscal" id="apellido" class="form-control validate[required]" placeholder="Nombre Fiscal" value="{$empresa->nombreFiscal}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">N&uacute;mero Fiscal</label>
                                                        <input type="text" name="numeroFiscal" id="email" class="form-control validate[required]" placeholder="N&uacute;mero Fiscal" value="{$empresa->numeroFiscal}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Tel&eacute;fono(s) de Reservas</label>
                                                        <input type="text" name="telefonoReservas" id="telefono" class="form-control " placeholder="Tel&eacute;fono(s)" value="{$empresa->telefonoReservas}">
                                                    </div>
                                                </div>                                        
                                            </div>
                                            <div class="row-fluid">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Email(s) de Reservas</label>
                                                        <input type="text" name="emailReservas" id="email" class="form-control validate[required]" placeholder="Email(s)" value="{$empresa->emailReservas}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Destino Tur&iacute;stico</label>
                                                        <input type="text" name="destinoTuristico" id="telefono" class="form-control " placeholder="Destino Tur&iacute;stico" value="{$empresa->destinoTuristico}">
                                                    </div>
                                                </div>                                        
                                            </div>

                                        </div> 

                                        <h3 class="form-section">Persona de Contacto</h3>
                                        <div class="row row-hotel-content">
                                            <div class="row-fluid">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Nombre</label>
                                                        <input type="text" name="contactoNombre" id="nombre" class="form-control validate[required]" placeholder="Nombre" value="{$empresa->contactoNombre}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Apellidos</label>
                                                        <input type="text" name="contactoApellidos" id="apellido" class="form-control validate[required]" placeholder="Apellidos" value="{$empresa->contactoApellido}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row-fluid">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Email</label>
                                                        <input type="text" name="contactoEmail" id="email" class="form-control validate[required]" placeholder="Email" value="{$empresa->contactoEmail}">
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                        <h3 class="form-section">Dirección</h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Descripción</label>
                                                    <input type="text" name="descripcion" id="geocomplete" class="form-control" placeholder="Descripción" value="{$empresa->direccion->descripcion}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Calle</label>
                                                    <input type="text" name="calle" id="direccion_calle" class="form-control" placeholder="Calle"  value="{$empresa->direccion->calle}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Código postal</label>
                                                    <input type="text" name="codigoPostal" id="direccion_cp" class="form-control  validate[custom[integer]]" placeholder="Código postal"  value="{$empresa->direccion->codigoPostal}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Latitud</label>
                                                    <input type="text" name="lat" id="direccion_lat" class="form-control validate[custom[number]]" placeholder="Latitud"  {if $empresa->direccion->lat}value="{$empresa->direccion->lat}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Longitud</label>
                                                    <input type="text" name="lon" id="direccion_lon" class="form-control validate[custom[number]]" placeholder="Longitud" {if $empresa->direccion->lon}value="{$empresa->direccion->lon}"{/if}>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group" id="mapa">
                                                </div>
                                            </div> 
                                            <div style="clear: both"></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 centered ">
                                                <a class="btn btn-default" href="#promocionesDiv" >Anterior</a>
                                                <input type="submit" class="btn btn-success" value="Finalizar">
                                            
                                                
                                            </div>
                                        </div>
                                    </form>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>

            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </div>
    <!-- END PAGE CONTAINER-->
</div>
<!-- END PAGE -->

{/block}