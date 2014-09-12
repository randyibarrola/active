{extends file="admin/index.tpl"}

{block name="script" append}
    
    <script type="text/javascript" src="{$template_url}/js/admin/blacklist-gestion.js"></script>
{/block}

{block name="style" append}
    
    
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
                    <h3 class="page-title">Lista Negra					
                        <small>Gestión de Palabras</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-blacklist-lista{$end_url}">Lista Negra</a>

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
                            {$show_title = ($edit) ? 'Editar palabra' : 'Nueva palabra'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body">
                                    
                                    <form action="#" class="horizontal-form" id="blacklistFrm">
                                    <h3 class="form-section">Palabra</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Palabra</label>
                                                    <input type="text" name="palabra" class="form-control validate[required]" {if $edit}value="{$palabra->palabra}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label"><input type="radio" value="0" name="ocultarResultado" {if !$palabra->ocultarResultado}checked{/if}> Ocultar palabra </label>
                                                    <label class="control-label"><input type="radio" value="1" name="ocultarResultado" {if $palabra->ocultarResultado}checked{/if}> Ocultar resultado </label>
                                                </div>
                                            </div>
                                                <div class="delimiter"></div>
                                        </div>
                                        
                                        
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit && $palabra->id}
                                            <input type="hidden" name="idPalabra" id="global_id_apartamento" value="{$palabra->id}">
                                            {/if}
                                            <input type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-blacklist-lista{$end_url}" >Cancelar</a>
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