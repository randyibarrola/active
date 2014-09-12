{extends file="admin/index.tpl"}

{block name="script" append}    
    <script type="text/javascript" src="{$template_url}/js/admin/seo-gestion.js"></script>
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/admin/uniform.css">
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
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body">
                                    
                                    <form action="#" class="horizontal-form" id="hotelFrm1">
                                    
                                    <h3 class="form-section">SEO</h3>
                                    <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class=""><input type="checkbox" name="seo" value="1" {if $edit && $hotel->seo}checked{/if}> Activar SEO</label>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                    </div>
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
                                                    <textarea style="display:none;" name="descripcionCorta" >{if $edit}{$hotel->descripcionCorta|replace:'&quot;':'\"'}{/if}</textarea>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Keywords SEO</label>
                                                    <textarea id="keywordsSeo" class="form-control" placeholder="Keywords SEO" style="resize: none;"></textarea>
                                                    <textarea name="keywordsSeo" class="hidden" >{if $edit}{$hotel->keywordsSeo|replace:'&quot;':'\"'}{/if}</textarea>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                        
                                        
                                                
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Clave de Google Analytics</label>
                                                <input type="text" name="claveGoogleAnalytics" class="form-control" {if $edit}value="{$hotel->claveGoogleAnalytics}"{/if}>
                                            </div>
                                        </div>
                                            <div class="clearfix"></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit && $hotel->id}
                                            <input type="hidden" name="idHotel" id="global_id_hotel" value="{$hotel->id}">
                                            {/if}
                                            <input id="saveBtn" type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/{if $edit && !$hotel->id}admin-contrato-lista{else}admin-hotel-lista{/if}" >Cancelar</a>
                                        </div>
                                    </div>
                                        
                                    </form>
                                    
                                    
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