{extends file="admin/index.tpl"}

{block name="script" append}
    
    <script type="text/javascript" src="{$template_url}/js/admin/promocion-gestion.js"></script>
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
                    <h3 class="page-title">Promociones					
                        <small>Gestión de Promociones</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-promocion-lista{$end_url}">Lista Negra</a>

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
                            {$show_title = ($edit) ? 'Editar promoción' : 'Nueva promoción'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body">
                                    
                                    <form action="#" class="horizontal-form" id="promocionFrm">
                                    <h3 class="form-section">Palabra</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Palabras clave (sepáralas por coma)</label>
                                                    <textarea name="palabras" class="form-control validate[required]" rows="10">{if $edit}{$promocion->palabras}{/if}</textarea>
                                                </div>
                                            </div>
                                            
                                                <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Descuento</label>
                                                    <input type="text" name="descuento" class="form-control validate[required, custom[number]]" {if $edit}value="{$promocion->descuento}"{/if}> 
                                                </div>
                                            </div>
                                            <!--
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Tipo de descuento</label>
                                                    <select name="tipoDescuento" class="form-control">
                                                        <option value="%" {if $edit && $promocion->tipoDescuento eq '%'}selected{/if}>Porciento (%)</option>
                                                        <option value="€" {if $edit && $promocion->tipoDescuento ne '%'}selected{/if}>Euros (€)</option>
                                                    </select>
                                                </div>
                                            </div>
                                            -->
                                            <div class="delimiter"></div>
                                        </div>                                        
                                    </div>
                                    
                                    <h3 class="form-section">Hoteles</h3>
                                    <div class="row" style="margin-bottom: 30px;">
                                        {foreach from=$hoteles item=hotel}
                                            <div class="col-md-3">
                                                <label class="radio-inline"><input type="checkbox" name="hoteles[]" value="{$hotel->id}" {if $hotel->selected}checked{/if}> {$hotel->nombres->es} </label>
                                            </div>
                                        {/foreach}
                                    </div>
                                                    
                                    <div class="row">
                                        <div class="col-md-12 centered ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit && $promocion->id}
                                                <input type="hidden" name="idPromocion" id="global_id_apartamento" value="{$promocion->id}">
                                                <input type="hidden" name="usuarioId" value="{$promocion->usuarioId}">
                                            {else}
                                                <input type="hidden" name="usuarioId" value="{$usuarioId}">
                                            {/if}
                                            <input type="submit" class="btn btn-success" value="Guardar">
                                        
                                            <a class="btn btn-default" href="{$base_url}/admin-promocion-lista{$end_url}" >Cancelar</a>
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