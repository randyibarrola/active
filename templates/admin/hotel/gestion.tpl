{extends file="admin/index.tpl"}

{block name="script" append}
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script type="text/javascript" src="{$template_url}/js/jquery.geocomplete.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/hotel-gestion.js"></script>
    <script type="text/javascript" src="{$template_url}/js/colorpicker.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/colorbox.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/imagen_crop_logotipo.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/jquery.Jcrop.min.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/ajaxfileupload.js"></script>
{/block}

{block name="style" append}
    <link href="{$template_url}/admin/assets/plugins/dropzone/css/dropzone.css" rel="stylesheet"/>
    <link rel="stylesheet" href="{$template_url}/css/colorpicker.css" >
    <link rel="stylesheet" href="{$template_url}/css/admin/hotel-gestion.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/logo.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/uniform.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/colorbox.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/jquery.Jcrop.min.css">
    <link rel="stylesheet" href="{$template_url}/admin/assets/plugins/tagger/jquery.tagsinput.css"/>
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
                        <small>Gestión de Hotel</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-hotel-lista{$end_url}">Hoteles</a>

                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="javascript:void(0)">Gestión</a></li>


                    </ul>
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
                            {$show_title = ($edit && $hotel->id) ? $hotel->nombre : 'Nuevo Hotel'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            <div class="actions favorito"><a href="" title="{if $hotel->destacado}Desmarcar{else}Marcar{/if} como favorito"><img src="{$template_url}/images/icons/star-o{if $hotel->destacado}n{else}ff{/if}.png" width="22px"></a></div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body">
                                    
                                    <form action="#" class="horizontal-form" id="hotelFrm1">
                                        <div class="row hidden">
                                            <div class="row-fluid">
                                                <div class="col-md-12 text-right">
                                                    <label class="radio-inline"><input type="checkbox" name="destacado" value="1" {if $hotel->destacado}checked{/if}></label> <label class="form-label-stripped">Favorito</label>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    <h3 class="form-section">Campa&ntilde;a</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Escriba el nombre o localizador de la campaña</label>
                                                    <input type="text" id="campania" autocomplete="off" class="form-control validate[required]" {if $edit && $hotel->campaniaId}value="{$hotel->campania->localizador} - {$hotel->campania->nombre}"{/if}>
                                                    <input type="hidden" id="idCampania" name="campaniaId" {if $edit}value="{$hotel->campaniaId}"{/if}>
                                                </div>
                                            </div>
                                            
                                                <div class="delimiter"></div>
                                        </div>
                                    </div>
                                    <h3 class="form-section">Contrato</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Fecha de inicio del contrato</label>
                                                    <input type="text" name="inicioContrato" autocomplete="false" disabled="" class="form-control validate[required]" {if $edit}value="{$hotel->inicioContrato|date_format:"%d-%m-%Y"}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Fecha de finalización del contrato</label>
                                                    <input type="text" name="finContrato" autocomplete="false" disabled="" class="form-control validate[required]" {if $edit}value="{$hotel->finContrato|date_format:"%d-%m-%Y"}"{/if}>
                                                </div>
                                            </div>
                                                <div class="delimiter"></div>
                                        </div>
                                    </div>
                                    <h3 class="form-section">Idiomas</h3>
                                    <!--<div class="row">
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
                                    </div>-->
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Idioma por defecto</label>
                                                    <select name="idiomaId" class="form-control">
                                                        {foreach from=$idiomas item=idioma}
                                                            <option {if $idioma->default}selected="selected"{/if} value="{$idioma->id}" {if $hotel->idiomaId eq $idioma->id}selected{/if}>{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Monedas</h3>
                                    <!--<div class="row">
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
                                    </div>-->
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Moneda de reservas</label>
                                                    <select name="monedaId" class="form-control">
                                                        {foreach from=$monedas item=moneda}
                                                            <option {if $moneda->default}selected="selected"{/if} value="{$moneda->id}" {if $hotel->monedaId eq $moneda->id}selected{/if}>{$moneda->nombre} ({$moneda->codigo})</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Destino Turístico</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control validate[required]" id="destino" autocomplete="off" placeholder="Filtrar por destino turístico" {if $edit && $hotel->destinoId}value="{$hotel->destino->nombre}"{/if}>
                                                    <input type="hidden" name="destinoId" {if $edit && $hotel->destinoId}value="{$hotel->destinoId}"{/if}>
                                                </div>
                                            </div>
                                                        <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div id="lugares_container">
                                        <h4 class="form-section">Lugares de interes</h4>
                                        <div class="row">
                                            <div class="row-fluid">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input value="{if $edit}{$hotel->lugares}{/if}" type="text" id="lugares_input" name="lugares" class="form-control" placeholder="Aeropuerto..." autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <h3 class="form-section">Datos de Configuración</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-8">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="chat" value="1" {if $edit && $hotel->chat}checked{/if}></label> Activar chat
                                                    </div>
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="headerVikahotel" value="1" {if !$edit || $hotel->headerVikahotel}checked{/if}></label> Activar Header de {#sistema_nombre#}
                                                    </div>
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="mostrarHotelesRelacionados" value="1" {if !$edit || $hotel->mostrarHotelesRelacionados}checked{/if}></label> Mostrar Hoteles Relacionados
                                                    </div>
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="respetarCupo" value="1" {if $hotel->respetarCupo}checked{/if}></label> Respetar cupo de seguridad de booking.com
                                                    </div>
                                                    <div class="row-fluid">
                                                        <div class="form-group">
                                                            <label class="control-label">Configuración</label>
                                                            <select name="configuracionId" class="form-control" >
                                                                {foreach from=$configuraciones item=configuracion}
                                                                <option value="{$configuracion->id}" {if $configuracion->id eq $hotel->configuracionId}selected{/if}>{$configuracion->alias}</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>

                                                    
                                                    <div class="col-md-6 hidden">
                                                        <div class="form-group">
                                                            <label class="control-label">Empresa</label>
                                                            <select name="empresaId" class="form-control" >
                                                                {foreach from=$empresas item=empresa}
                                                                    <option value="{$empresa->id}" {if $edit && $hotel->empresaId eq $empresa->id}selected{/if}>{$empresa->nombreComercial}</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="row-fluid">


                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="control-label">Color del background</label>
                                                            <input type="text" autocomplete="off" name="backgroundColor" class="form-control validate[required]" placeholder="Color del Background" {if $hotel->backgroundColor}value="{$hotel->backgroundColor}"{else}value="e6e6e6"{/if}>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="control-label">Calidad</label>
                                                            <select name="calidad" class="form-control">
                                                                {for $i=0 to 5}
                                                                    <option value="{$i}" {if $hotel->calidad eq $i}selected{/if}>{$i} estrella{if $i > 1}s{/if}</option>
                                                                {/for}
                                                            </select>
                                                        </div>
                                                    </div>
                                                    {if !$hotel->id}
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="control-label">Clave de encriptación</label>
                                                            <input type="text" name="clave" class="form-control" placeholder="Clave" value="{$hotel->clave}">
                                                        </div>
                                                    </div>
                                                    {else}
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label class="control-label">Clave de encriptación</label>
                                                                <div class="row-fluid">
                                                                    <a class="btn btn-danger enviar-clave" href="javascript:void(0)">Recuperar</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    {/if} 
                                                    <div class="clearfix"></div>

                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="row-fluid">
                                                    <input type="hidden" id="x1" name="x1" />
                                                    <input type="hidden" id="y1" name="y1" />
                                                    <input type="hidden" id="x2" name="x2" />
                                                    <input type="hidden" id="y2" name="y2" />

                                                    <input type="hidden" id="mini_x1" name="mini_x1" />
                                                    <input type="hidden" id="mini_y1" name="mini_y1" />
                                                    <input type="hidden" id="mini_x2" name="mini_x2" />
                                                    <input type="hidden" id="mini_y2" name="mini_y2" />

                                                    <div class="file_uploader_container">
                                                        <div class="logotipo_container">
                                                            <span>Logotipo</span>
                                                            <input type="hidden" name="logoId" {if $edit && $hotel->logoId}value="{$hotel->logoId}"{/if}  />
                                                            {if $edit && $hotel->logo}
                                                                <img src="{$hotel->logo->ruta}" title="" alt="" class="" id="logo_image_file_png" />
                                                            {else}
                                                                <img src="" title="" alt="" class="" id="logo_image_file_png" style="" />
                                                            {/if}

                                                        </div> 

                                                        <input type="file" name="logo" class="logo" id="logo" />
                                                    </div>
                                                            <div class="clearfix"></div>
                                                    <div id="deleteLogoContainer">
                                                        <a href="" class="btn btn-danger">Eliminar</a>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Web oficial</label>
                                                    <select name="webOficial" class="form-control">
                                                        <option value="0" {if $edit && !$hotel->webOficial}selected{/if}>No</option>
                                                        <option value="1" {if $edit && $hotel->webOficial}selected{/if}>Sí</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Trip Advisor Script</label><div class="delimiter"></div>
                                                    <textarea name="tripAdvisor" class="form-control " placeholder="Trip Advisor">{if $edit}{$hotel->tripAdvisor|replace:'&quot;':'\"'}{/if}</textarea>
                                                    
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Contenido HTML adicional</label><div class="delimiter"></div>
                                                    <textarea name="contenidoHtml" class="form-control " placeholder="Contenido HTML adicional">{if $edit}{$hotel->contenidoHtml|replace:'&quot;':'\"'}{/if}</textarea>
                                                    
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                                        
                                        
                                        
                                        
                                    </div>
                                    <h3 class="form-section">TPV</h3>              
                                    <div class="row row-hotel-content">
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Idioma</label>
                                                    <select id="idiomaSelectSeo" class="form-control validate[required]"> 
                                                        {foreach from=$idiomas item=idioma}
                                                            <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                    </div>
                                    <!--
                                    <h3 class="form-section">SEO</h3>
                                    <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class=""><input type="checkbox" name="seo" value="1" {if $edit && $hotel->seo}checked{/if}> Activar SEO</label>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>-->
                                    <div class="row row-hotel-content">
                                        <!--
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Idioma</label>
                                                    <select id="idiomaSelectSeo" class="form-control validate[required]"> 
                                                        {foreach from=$idiomas item=idioma}
                                                            <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label">T&iacute;tulo SEO</label>
                                                    <input id="tituloSeo" class="form-control validate[required]" >
                                                    <input type="hidden" name="tituloSeo" {if $edit}value='{$hotel->tituloSeo}'{/if}>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Descripción SEO</label>
                                                    <textarea id="descripcionCorta" class="form-control" placeholder="Descripción SEO" style="resize: none;"></textarea>
                                                    <textarea style="display:none;" name="descripcionCorta" >{if $edit}{$hotel->descripcionCorta}{/if}</textarea>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Keywords SEO</label>
                                                    <textarea id="keywordsSeo" class="form-control" placeholder="Keywords SEO" style="resize: none;"></textarea>
                                                    <textarea name="keywordsSeo" class="hidden" >{if $edit}{$hotel->keywordsSeo}{/if}</textarea>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>-->
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Informaci&oacute;n de compra</label>
                                                    <textarea id="validarInfoCompra" style="width: 100%; height: 1px; visibility: hidden;"></textarea>
                                                    <textarea id="informacionCompra" class="form-control ckeditor" placeholder="Informaci&oacute;n de compra"></textarea>
                                                    <textarea style="display:none;" name="informacionCompra" >{if $edit}{$hotel->informacionCompra|replace:'&quot;':'\"'}{/if}</textarea>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                                
                                    </div>
                                                
                                    <h3 class="form-section">Adwords</h3>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <input type="text" id="adword" class="form-control" placeholder="Selecciona tu campaña Adwords" autocomplete="off" value="{$adword->nombreCampania}">
                                                <input type="hidden" name="idAdword" value="{$adword->id}">
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    
                                    <h3 class="form-section">Dominios</h3>
                                    
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label class="control-label">Dominio oficial de la campa&ntilde;a</label>
                                                <input type="text" name="dominioCampania" class="form-control" placeholder="mihotel.{#sistema_nombre_web#}" {if $edit} value="{$hotel->dominioCampania}" {/if}>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label class="control-label">Dominio oficial del hotel</label>
                                                <input type="text" name="dominioOficial" class="form-control validate[required]" placeholder="www.mihotel.com" value="{if $edit}{$hotel->dominioOficial}{else}{#sistema_web#}{/if}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label class="control-label">Dominio Adwords</label>
                                                <input type="text" name="adwords" class="form-control validate[required]" placeholder="www.mihotel.com-{#sistema_nombre_web#}" {if $hotel->adwords}value="{$hotel->adwords}"{else}value="{$hotel->dominioOficial}-{#sistema_nombre_web#}"{/if}>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                <a href="javascript:void(0)" class="btn btn-success" id="add-domain">Agregar dominio vika</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid" id="dominios">
                                            {if $edit && $hotel->dominios}
                                                {foreach from=$hotel->dominios item=dominio}
                                                    <div class="row-fluid">
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label>Dominio <a href="javascript:void(0)" title="Eliminar" class="delete-domain"><span class="fa fa-trash-o"></span></a></label>
                                                                <input type="text" class="form-control validate[required]" name="dominios[]" value="{$dominio->dominio}">
                                                            </div>
                                                        </div>
                                                        <div class="delimiter"></div>
                                                    </div>
                                                {/foreach}
                                            {/if}
                                        </div>
                                        
                                        <div id="dominio" class="row-fluid hidden">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label>Dominio <a href="javascript:void(0)" title="Eliminar" class="delete-domain"><span class="fa fa-trash-o"></span></a></label>
                                                    <input type="text" class="form-control validate[required]" name="dominios[]" disabled="">
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Condiciones</h3>
                                    <div class="row" id="condicionesContainer">
                                        
                                        <div class="row-fluid">
                                            {foreach from=$condiciones item=condicion}
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <div>
                                                            <label class="radio-inline">
                                                                <input type="checkbox" name="condiciones[]" value="{$condicion->id}" {if $condicion->condicionCategoriaId eq 1}disabled=""{/if} {if $condicion->selected || $condicion->condicionCategoriaId eq 1}checked{/if}> {if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}
                                                            </label>

                                                        </div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Ventas</h3>
                                    <div class="row">
                                                    
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Estancia m&iacute;nima</label>
                                                    <select name="estanciaMinima" class="form-control">
                                                        {for $i=1 to 15}
                                                            <option value="{$i}" {if $edit && $hotel->estanciaMinima eq $i}selected{/if}>{$i} día{if $i ne 1}s{/if}</option>
                                                        {/for}
                                                    </select>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    
                                                        <label>
                                                            Release
                                                        </label>
                                                        <select name="ventaAnticipada" class="form-control">
                                                            {for $i=0 to 30}
                                                                <option value="{$i}" {if $edit && $hotel->ventaAnticipada eq $i}selected{/if}>{$i} día{if $i ne 1}s{/if}</option>
                                                            {/for}
                                                        </select>
                                                    
                                                </div>
                                            </div>
                                            
                                            
                                                        <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Cobro de reserva</label>
                                                    
                                                    <input name="tipoReserva" readonly="true" class="form-control" value="cobro anticipado de comisiones" />
                                                    <!--<select name="tipoReserva" class="form-control">
                                                        <option value="online" {if $edit && $hotel->tipoReserva ne 'offline'}selected{/if}>Online</option>
                                                        
                                                        <option value="offline" {if $edit && $hotel->tipoReserva eq 'offline'}selected{/if}>Offline</option>

                                                        <option value="cobro anticipado de comisiones" {if $edit && $hotel->tipoReserva eq 'cobro anticipado de comisiones'}selected{/if}>Cobro anticipado de comisiones</option>
                                                    </select>
                                                    -->
                                                </div>
                                            </div>
                                            <div class="col-md-4" id="porcientoCobroAnticipado">
                                                <div class="form-group">
                                                    
                                                        <label>
                                                            Porcentaje de cobro anticipado
                                                        </label>
                                                        <input readonly="true" name="porcentageCobroAnticipado" class="form-control validate[required, custom[number]]" {if $hotel->tipoReserva eq 'offline'}disabled{/if} {if $edit}value="{$hotel->porcentageCobroAnticipado}"{/if} {if !$edit}value="15"{/if}>
                                                    
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4 " style="padding-top: 32px;">
                                                <div class="form-group">
                                                    <label class="radio-inline"><input type="checkbox" value="1" name="bookingOnrequest" {if $hotel->bookingOnrequest || !$edit}checked{/if}> Booking On Request</label> 
                                                </div>
                                            </div>
                                                 <div class="delimiter"></div>
                                        </div>

                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>
                                                        Email de reservas
                                                    </label>
                                                    <input type="text" name="emailReservas" class="form-control validate[required, custom[email]]" {if $edit}value="{$hotel->emailReservas}"{/if} >
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>
                                                        Email de contacto
                                                    </label>
                                                    <input type="text" name="emailContacto" class="form-control validate[required, custom[email]]" {if $edit}value="{$hotel->emailContacto}"{/if}
                                                    {if !$edit}value="info@vikahotel.com"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>
                                                        Teléfono de reservas
                                                    </label>
                                                    <input type="text" name="telefonoReservas" class="form-control validate[required]" {if $edit}value="{$hotel->telefonoReservas}"{/if}>
                                                </div>
                                            </div>
                                            <!-- 
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Clave de Google Analytics</label>
                                                    <input type="text" name="claveGoogleAnalytics" class="form-control" {if $edit}value="{$hotel->claveGoogleAnalytics}"{/if}>
                                                </div>
                                            </div>-->
                                                <div class="delimiter"></div>
                                        </div>
                                        
                                    </div>
                                                    
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
                                    <div class="row-fluid" id="promociones">
                                        {if $edit && $hotel->promociones}
                                        {foreach from=$hotel->promociones item=promo}
                                            <div class="promocion">
                                            
                                                <h3 class="form-section">&nbsp;</h3>
                                                <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>

                                                <div class="row-fluid ">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Descuento respecto a booking.com</label>
                                                            <input type="text" name="promociones[{$promo->id}][descuentoBooking]" class="form-control validate[required, custom[number]]" placeholder="Descuento" value="{$promo->descuentoBooking}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Tipo de descuento</label>
                                                            <select name="promociones[{$promo->id}][tipoDescuentoBooking]" class="form-control" >
                                                                <option value="%" {if $promo->tipoDescuentoBooking eq '%'}selected{/if}>Porcentaje (%)</option>
                                                                <!--<option value="€" {if $promo->tipoDescuentoBooking ne '%'}selected{/if}>Euros (&euro;)</option>-->
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Desde</label>
                                                            <input type="text" name="promociones[{$promo->id}][inicio]" class="form-control" placeholder="Desde" value="{$promo->inicio|date_format:"%d-%m-%Y"}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Hasta</label>
                                                            <input type="text" name="promociones[{$promo->id}][fin]" class="form-control" placeholder="Hasta" value="{$promo->fin|date_format:"%d-%m-%Y"}">
                                                        </div>
                                                    </div>
                                                    <div class="delimiter"></div>
                                                </div>
                                                <div class="row-fluid">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="radio-inline">
                                                                <input type="checkbox" name="promociones[{$promo->id}][condicionPagoOnline]" value="1" {if $promo->condicionPagoOnline}checked{/if}>
                                                                Condición de pago online
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Porciento de pago online</label>
                                                            <input type="text" name="promociones[{$promo->id}][pagoOnline]" class="form-control validate[required, custom[number]]" placeholder="Porciento de pago online" {if !$promo->condicionPagoOnline}disabled{else}value="{$promo->pagoOnline}"{/if} >
                                                        </div>
                                                    </div>
                                                        <div class="delimiter"></div>
                                                </div>
                                                <div class="row-fluid">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="control-label">Palabras clave</label>
                                                            <textarea name="promociones[{$promo->id}][palabras]" class="form-control" placeholder="Palabras clave">{$promo->palabras|replace:'&quot;':'\"'}</textarea>
                                                        </div>
                                                    </div>
                                                        <div class="delimiter"></div>
                                                </div>
                                                
                                            </div>
                                        {/foreach}
                                        {/if}                                     
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
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="radio-inline">
                                                        <input type="checkbox" name="[XX][condicionPagoOnline]" value="1" >
                                                        Condición de pago online
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Porciento de pago online</label>
                                                    <input type="text" name="promociones[XX][pagoOnline]" class="form-control validate[required, custom[number]]" placeholder="Porciento de pago online" disabled >
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Palabras clave</label>
                                                    <textarea name="promociones[XX][palabras]" class="form-control" placeholder="Palabras clave" disabled=""></textarea>
                                                </div>
                                            </div>
                                                <div class="delimiter"></div>
                                        </div>
                                        
                                    </div>
                                    
                                        <h3 class="form-section"><label class="radio-inline"><input type="checkbox" id="activarPrecioMinimo" name="activarPrecioMinimo" value="1" {if $hotel->precioMinimo}checked{/if}></label> Precio mínimo </h3>
                                    <!--<div class="row-fluid">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <a href="#" class="btn btn-success" id="add_precioMinimo">Agregar</a>
                                                    <label class="radio-inline">
                                                        Agregar precio mínimo por fecha
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>-->
                                    <div class="row-fluid" id="preciosMinimos">
                                        {if $edit && $hotel->precioMinimo}
                                        
                                            <div class="promocion">
                                                <!--
                                                <h3 class="form-section">&nbsp;</h3>
                                                <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>
                                                -->
                                                <div class="row-fluid ">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Precio mínimo</label>
                                                            <input type="text" name="precios[{$hotel->precioMinimo->id}][precioMinimo]" class="form-control validate[required, custom[number]]" placeholder="Precio mínimo" value="{$hotel->precioMinimo->precioMinimo}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Moneda</label>
                                                            <select name="precios[{$hotel->precioMinimo->id}][monedaId]" class="form-control" >
                                                                {foreach from=$monedas item=moneda}
                                                                    <option value="{$moneda->id}" {if $hotel->precioMinimo->monedaId eq $moneda->id}selected{/if}>{$moneda->nombre}({$moneda->codigo})</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Desde</label>
                                                            <input type="text" name="precios[{$hotel->precioMinimo->id}][inicio]" class="form-control" placeholder="Desde" value="{$hotel->precioMinimo->inicio|date_format:"%d-%m-%Y"}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Hasta</label>
                                                            <input type="text" name="precios[{$hotel->precioMinimo->id}][fin]" class="form-control" placeholder="Hasta" value="{$hotel->precioMinimo->fin|date_format:"%d-%m-%Y"}">
                                                        </div>
                                                    </div>
                                                        <div class="delimiter"></div>
                                                </div>                                                
                                            </div>
                                        
                                        {else}
                                            <div class="promocion">
                                            
                                                <div class="row-fluid ">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Precio mínimo</label>
                                                            <input type="text" name="precios[XX][precioMinimo]" class="form-control validate[required, custom[number]]" placeholder="Precio mínimo">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Moneda</label>
                                                            <select name="precios[XX][monedaId]" class="form-control">
                                                                {foreach from=$monedas item=moneda}
                                                                    <option value="{$moneda->id}">{$moneda->nombre}({$moneda->codigo})</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Desde</label>
                                                            <input type="text" name="precios[XX][inicio]" class="form-control" placeholder="Desde">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Hasta</label>
                                                            <input type="text" name="precios[XX][fin]" class="form-control" placeholder="Hasta">
                                                        </div>
                                                    </div>
                                                    <div class="delimiter"></div>
                                                </div>                                        

                                            </div>
                                        {/if}                                     
                                    </div>
                                                        
                                    <div class="promocion hidden" id="precioMinimo-hidden">
                                            
                                        <h3 class="form-section">&nbsp;</h3>
                                        <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>

                                        <div class="row-fluid ">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Precio mínimo</label>
                                                    <input type="text" name="precios[XX][precioMinimo]" class="form-control validate[required, custom[number]]" disabled="" placeholder="Precio mínimo">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Moneda</label>
                                                    <select name="precios[XX][monedaId]" class="form-control" disabled="">
                                                        {foreach from=$monedas item=moneda}
                                                            <option value="{$moneda->id}">{$moneda->nombre}({$moneda->codigo})</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Desde</label>
                                                    <input type="text" name="precios[XX][inicio]" class="form-control validate[required]" disabled="" placeholder="Desde">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Hasta</label>
                                                    <input type="text" name="precios[XX][fin]" class="form-control validate[required]" disabled="" placeholder="Hasta">
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>                                        
                                        
                                    </div>
                                    
                                    <h3 class="form-section">Parar ventas</h3>
                                    <div class="row" id="pararVentasContainer">
                                        <input name="detenerFechas" type="hidden" {if $edit && $hotel->fechas}value="[{foreach from=$hotel->fechas item=f name=fechas}{if !$smarty.foreach.fechas.first},{/if}'{$f->fecha|date_format:"%Y-%m-%d"}'{/foreach}]"{/if}>
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div id="calendario">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Lista Negra</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <a href="javascript:void(0)" class="btn btn-success" id="addBlacklistBtn">Agregar palabra</a>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <a href="javascript:void(0)" class="btn btn-success {if count($hoteles) eq 0}disabled{/if}" id="importBlacklistBtn">Importar</a>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row-fluid" id="blacklist">
                                            {foreach from=$hotel->blacklist item=blacklist}
                                                <div class="row-fluid blacklist-item">
                                                    <div class="col-md-12">
                                                        <span class="pull-right delete-blacklist-container"><a href=""><i class="fa fa-trash-o"></i></a></span>

                                                    </div>
                                                    <div class="row-fluid">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <select name="blacklist[{$blacklist->id}][ocultarResultado]" class="form-control">
                                                                    <option value="0" {if !$blacklist->ocultarResultado}selected{/if}>Ocultar palabra</option>
                                                                    <option value="1" {if $blacklist->ocultarResultado}selected{/if}>Ocultar resultado</option>
                                                                </select>
                                                            </div>

                                                        </div><div class="delimiter"></div>
                                                    </div>
                                                    <div class="row-fluid">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Palabra</label>
                                                                <input class="form-control validate[required]" name="blacklist[{$blacklist->id}][palabra]" value="{$blacklist->palabra}">
                                                            </div>

                                                        </div><div class="delimiter"></div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                        <div class="row-fluid hidden blacklist-item" id="blacklistHidden">
                                            <div class="col-md-12">
                                                <span class="pull-right delete-blacklist-container"><a href=""><i class="fa fa-trash-o"></i></a></span>
                                                
                                            </div>
                                            <div class="row-fluid">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <select name="blacklist[XX][ocultarResultado]" class="form-control" disabled="">
                                                            <option value="0">Ocultar palabra</option>
                                                            <option value="1">Ocultar resultado</option>
                                                        </select>
                                                    </div>
                                                    
                                                </div><div class="delimiter"></div>
                                            </div>
                                            <div class="row-fluid">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Palabra</label>
                                                        <input class="form-control validate[required]" name="blacklist[XX][palabra]" disabled="">
                                                    </div>
                                                    
                                                </div><div class="delimiter"></div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Contenido de booking.com</h3>
                                    <div class="row">
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Url</label><div class="delimiter"></div>
                                                    <div class="col-md-8" style="padding-left: 0;">
                                                        <input type="text" name="url" id="url" class="form-control validate[required, custom[url]]" placeholder="http://www.booking.com/hotel/es/mi-hotel.es.html" {if $edit}value="{$hotel->url}"{/if}>
                                                    </div>
                                                    <div class="col-md-4"><input type="submit" class="btn btn-success" value="Autorellenar" id="readBookingBtn"></div>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" id="nombre" name="nombre" class="form-control validate[required]" placeholder="Nombre" {if $edit}value='{$hotel->nombre}'{/if}>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Idioma</label>
                                                    <select id="idiomaSelect" class="form-control validate[required]"> 
                                                        {foreach from=$idiomas item=idioma}
                                                            <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>         
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Descripción larga</label>
                                                    <div style="width: 100%;">
                                                        <textarea id="descripcionLarga" rows="6" class="ckeditor form-control"></textarea>
                                                        <textarea style="display:none;" name="descripcionLarga" >{if $edit}{$hotel->descripcionLarga|replace:'&quot;':'\"'}{/if}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                                    
                                    </div>

                                    <h3 class="form-section">Dirección</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Descripción</label>
                                                <input type="text" name="descripcion" id="geocomplete" class="form-control" placeholder="Descripción"  {if $edit}value="{$hotel->direccion->descripcion}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="control-label">Latitud</label>
                                                <input type="text" name="lat" id="direccion_lat" class="form-control validate[custom[number]]" placeholder="Latitud"  {if $edit}value="{$hotel->direccion->lat}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="control-label">Longitud</label>
                                                <input type="text" name="lon" id="direccion_lon" class="form-control validate[custom[number]]" placeholder="Longitud" {if $edit}value="{$hotel->direccion->lon}"{/if}>
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
                                        <div class="col-md-12 text-center ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit && $hotel->id}
                                            <input type="hidden" name="idHotel" id="global_id_hotel" value="{$hotel->id}">
                                            {/if}
                                            <input id="saveBtn" type="submit" class="btn btn-success" value="Guardar">
                                        
                                            <a class="btn btn-default" href="{$base_url}/{if $edit && !$hotel->id}admin-contrato-lista{else}admin-hotel-lista{/if}" >Cancelar</a>
                                            {if $edit && $hotel->id}
                                                <a class="btn btn-warning" id="urlValidacionBtn">Enviar validación de reservas</a>
                                            {/if}
                                        </div>
                                    </div>
                                        
                                    </form>
                                    {if $edit}
                                        <h3 class="form-section">Imágenes <a href="javascript:void(0)" class="btn btn-success" id="readBookingImgBtn">Autorellenar</a></h3>
                                    <form action="{$base_url}/admin-ajax-hotel/idHotel:{$hotel->id}" class="dropzone" id="hotel-dropzone">
                                        
                                        <div class="fallback">
                                            <input name="file" type="file" multiple >
                                        </div>
                                    </form> 
                                    {/if}
                                    
                                    
                                    
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
<div class="hidden">
    <a id="crop_image_container_trigger" href="#crop_image_container"></a>
    <div class="crop_image_container" id="crop_image_container">
        <img id="imagen_preview">
        <div class="info hidden">
            <label>File size</label> <input type="text" id="filesize" name="filesize">
            <label>Type</label> <input type="text" id="filetype" name="filetype">
            <label>Image dimension</label> <input type="text" id="filedim" name="filedim">
            <label>W</label> <input type="text" id="w" name="w">
            <label>H</label> <input type="text" id="h" name="h">
        </div>
        <div class="actions_image_preview_container">
            <input type="checkbox" id="aspect_ratio" checked="checked">
            <label>Conservar relación de proporción.</label>
            <a class="cancelar_crop">Cancelar</a>
            <input class="submit_cartelera" id="submit_cartelera" type="submit" value="Finalizar">
        </div>
    </div>
</div>

<div class="modal fade" id="eliminar_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Eliminar</h4>
            </div>
            <div class="modal-body">
                <p>El logo será eliminado</p>
                <p>Desea continuar?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="aceptarEliminar">Aceptar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="importarbl_modal">
    <div class="modal-dialog">
        <form id="importBlacklistFrm" role="form">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Importar lista negra</h4>
            </div>
            <div class="modal-body">
                <ul id="hoteles-importar-bl">
                    {foreach from=$hoteles item=h}
                    <li>
                        <label class="radio-inline">
                            <input type="checkbox" name="hoteles[]" value="{$h->id}"> {$h->nombre}
                        </label>
                    </li>
                    {/foreach}
                </ul>
            </div>
            <div class="modal-footer">
                <input type="hidden" name="action" value="getBlacklist">
                <input type="submit" class="btn btn-success"  id="aceptarImportarBtn" value="Aceptar">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
        </form>
    </div>
</div>

{/block}