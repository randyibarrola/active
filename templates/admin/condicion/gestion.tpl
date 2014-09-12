{extends file="admin/index.tpl"}

{block name="script" append}
    
    <script type="text/javascript" src="{$template_url}/js/admin/condicion-gestion.js"></script>
{/block}

{block name="style" append}
    
    <link rel="stylesheet" href="{$template_url}/css/admin/hotel-gestion.css">
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
                    <h3 class="page-title">Condiciones					
                        <small>Gestión de Condiciones</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-condicion-lista{$end_url}">Condiciones</a>

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
                            {$show_title = ($edit) ? (($lang) ? $condicion->nombres->$lang : $condicion->nombres->es) : 'Nueva Condici&oacute;n'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body">
                                    
                                    <form action="#" class="horizontal-form" id="condicionFrm">
                                    <h3 class="form-section">Datos</h3>
                                    <div class="row row-hotel-content">
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
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" id="nombre" class="form-control validate[required]" placeholder="Nombre">
                                                    <input type="hidden" name="nombre" {if $edit}value='{$condicion->nombre}'{/if}>
                                                </div>
                                            </div>
                                                <div class="delimiter"></div>
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Descripción</label>
                                                    <textarea id="descripcion" class="form-control ckeditor" placeholder="Descripción" style="resize: none; height: 400px;"></textarea>
                                                    <textarea style="display:none;" name="descripcion" >{if $edit}{$condicion->descripcion}{/if}</textarea>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit && $condicion->id}
                                            <input type="hidden" name="idCondicion" id="global_id_apartamento" value="{$condicion->id}">
                                            {/if}
                                            <input type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-condicion-lista{$end_url}" >Cancelar</a>
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