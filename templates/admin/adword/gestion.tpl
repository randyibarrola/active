{extends file="admin/index.tpl"}

{block name="script" append}    
    <script type="text/javascript" src="{$template_url}/js/admin/adword-gestion.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/jquery-multi-select/js/jquery.quicksearch.js"></script>
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/admin/uniform.css">
    <link rel="stylesheet" href="{$template_url}/admin/assets/plugins/jquery-multi-select/css/multi-select.css">
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
                    <h3 class="page-title">Adwords					
                        <small>Gestión</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Adwords</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-adword-lista{$end_url}">Listado</a>

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
                            {$show_title = ($edit && $adword->id) ? $adword->nombreCampania : 'Nueva Campaña'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body">
                                    
                                    <form action="#" class="horizontal-form" id="adwordFrm">
                                    
                                    <h3 class="form-section">Datos de la Campaña</h3>
                                    <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="">Nombre de la Campaña</label>
                                                    <input class="form-control validate[required]" value="{$adword->nombreCampania}" name="nombreCampania">
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                    </div>
                                    <div class="row row-hotel-content">
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Presupuesto</label>
                                                    <input name="presupuesto" class="form-control validate[required, custom[number]]" value="{$adword->presupuesto}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Inicio</label>
                                                    <input name="inicio" class="form-control validate[required]" value="{$adword->inicio|date_format:"%d/%m/%Y"}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Fin</label>
                                                    <input name="fin" class="form-control validate[required]" value="{$adword->fin|date_format:"%d/%m/%Y"}">
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Palabras clave</label>
                                                    
                                                    <textarea class="form-control" name="palabrasClave" >{if $edit}{$adword->palabrasClave}{/if}</textarea>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                                
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Países</label>
                                                    
                                                    <select multiple="" class="form-control multiselect selectMultiples" name="paises[]" >
                                                        {foreach from=$paises item=pais}
                                                            <option value="{$pais->id}" {if $pais->selected}selected{/if} >{$pais->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                                
                                    </div>
                                    
                                    
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit && $adword->id}
                                            <input type="hidden" name="idAdword" value="{$adword->id}">
                                            {/if}
                                            <input id="saveBtn" type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-adword-lista" >Cancelar</a>
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