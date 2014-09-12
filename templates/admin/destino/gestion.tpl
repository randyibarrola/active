{extends file="admin/index.tpl"}

{block name="script" append}
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script type="text/javascript" src="{$template_url}/js/jquery.geocomplete.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/destino-gestion.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/ajaxfileupload.js"></script>
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/admin/empresa-gestion.css" >
    <link href="{$template_url}/admin/assets/plugins/dropzone/css/dropzone.css" rel="stylesheet"/>
    <link href="{$template_url}/admin/assets/plugins/tagger/jquery.tagsinput.css" rel="stylesheet"/>
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
                    <h3 class="page-title">Destinos Turísticos					
                        <small>Gestión de Destinos Turísticos</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-destino-lista{$end_url}">Destinos Turísticos</a>

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
                            {$show_title = ($edit) ? $destino->nombre : 'Nuevo Destino Turístico'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="destinoFrm">
                                <div class="form-body">
                                    
                                    <h3 class="form-section">Datos del Destino</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" name="nombre" id="nombre" class="form-control validate[required]" placeholder="Nombre" value="{$destino->nombre}">
                                                </div>
                                            </div>
                                                <div class="clearfix"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Idioma de la descripción</label>
                                                    <select type="text" id="idioma" class="form-control">
                                                        {foreach from=$idiomas item=idioma}
                                                            <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                                <div class="clearfix"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Descripcion</label>
                                                    <textarea id="descripcion" class="form-control ckeditor"></textarea>
                                                    <textarea name="descripcion" class="hidden">{$destino->descripcion|replace:'&quot;':'\"'}</textarea>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>                                        
                                        </div>
                                    </div> 
                                    <h3 class="form-section">Lugares de interes</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input value="{if $edit}{$destino->lugares}{/if}" type="text" id="lugares_input" name="lugares" class="form-control" placeholder="Aeropuerto..." autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                    </div>            
                                    <h3 class="form-section">Dirección</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label">Descripción</label>
                                                <input type="text" name="direccion[descripcion]" id="geocomplete" class="form-control" placeholder="Descripción"  {if $edit}value="{$destino->direccion->descripcion}"{/if}>
                                            </div>
                                        </div>                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Latitud</label>
                                                <input type="text" name="direccion[lat]" id="direccion_lat" class="form-control validate[custom[number]]" placeholder="Latitud"  {if $edit}value="{$destino->direccion->lat}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Longitud</label>
                                                <input type="text" name="direccion[lon]" id="direccion_lon" class="form-control validate[custom[number]]" placeholder="Longitud" {if $edit}value="{$destino->direccion->lon}"{/if}>
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
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit}
                                                <input type="hidden" name="idDestino" value="{$destino->id}">
                                            {/if}
                                            <input type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-destino-lista{$end_url}" >Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            {if $edit}
                                <div class="form-body">
                                    <h3 class="form-section">Imágenes</h3>
                                    <form action="{$base_url}/admin-ajax-destino/idDestino:{$destino->id}" class="dropzone" id="hotel-dropzone">

                                        <div class="fallback">
                                            <input name="file" type="file" multiple >
                                        </div>
                                    </form> 
                                </div>
                            {/if}
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