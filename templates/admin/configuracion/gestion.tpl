{extends file="admin/index.tpl"}

{block name="script" append}
    
    <script type="text/javascript" src="{$template_url}/js/admin/configuracion-gestion.js"></script>
{/block}

{block name="style" append}
    
    <link rel="stylesheet" href="{$template_url}/css/admin/empresa-gestion.css" >
    <link rel="stylesheet" href="{$template_url}/css/admin/hotel-gestion.css" >
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
                    <h3 class="page-title">Configuraci&oacute;n					
                        <small>Gestión de Configuraci&oacute;n</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-configuracion-lista{$end_url}">Configuraci&oacute;n</a>

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
                            {$show_title = ($edit) ? $empresa->nombreFiscal : 'Nueva Configuraci&oacute;n'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="configFrm">
                                <div class="form-body">   
                                    <h3 class="form-section">Configuraci&oacute;n</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    
                                                        <label>
                                                            Alias
                                                        </label>
                                                    <input type="text" name="alias" class="form-control validate[required]" maxlength="200" {if $edit}value="{$configuracion->alias}"{/if}>
                                                    
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="radio-inline">
                                                            <input type="checkbox" id="estado_activo" name="atencionPersonalizada" value="1"  {if $configuracion->atencionPersonalizada}checked{/if}> Atenci&oacute;n personalizada
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="radio-inline">
                                                            <input type="checkbox" id="estado_activo" name="pagoFlexible" value="1"  {if $configuracion->pagoFlexible}checked{/if}> Pago flexible
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="radio-inline">
                                                            <input type="checkbox" id="estado_activo" name="comparacionBooking" value="1"  {if $configuracion->comparacionBooking}checked{/if}> Activar comparación con <a hrer="#">booking.com</a>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        
                                        <!--<div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="radio-inline">
                                                            <input type="checkbox" id="estado_activo" name="sincronizacionVika" value="1"  {if $configuracion->sincronizacionVika}checked{/if}> Activar sincronización con <a href="http://www.vikatickets.com">vikatickets.com</a>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>                                                        
                                            <div class="delimiter"></div>
                                        </div>     -->                                   
                                    </div>
                                                        
                                    <!--<h3 class="form-section">Configuraci&oacute;n de sincronización con <a href="http://www.vikatickets.com">vikatickets.com</a></h3>
                                    <div class="row row-hotel-content">
                                        
                                        <div class="row-fluid ">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Email</label>
                                                    <input type="text" name="vikaEmail" id="nombre" class="form-control validate[required, custom[email]]" placeholder="Email" value="{$configuracion->vikaEmail}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Password</label>
                                                    <input type="password" name="vikaPassword" id="apellido" class="form-control {if !$configuracion}validate[required]{/if}" placeholder="Password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Empresa</label>
                                                    <input type="text" name="vikaEmpresa" id="email" class="form-control validate[required, custom[integer]]" placeholder="Empresa" value="{$configuracion->vikaEmpresa}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Canal</label>
                                                    <input type="text" name="vikaCanal" id="email" class="form-control validate[required]" placeholder="Canal" value="{$configuracion->vikaCanal}">
                                                </div>
                                            </div>
                                                                                    
                                        </div>
                                        
                                    </div>-->
                                                
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div>
                                                        <label class="radio-inline">
                                                            <input type="checkbox" id="estado_activo" name="cuponPromocional" value="1"  {if $configuracion->cuponPromocional}checked{/if}> Cupones promocionales
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>                                                        
                                            <div class="delimiter"></div>
                                        </div>
                                    </div>
                                                        
                                    <div class="row-fluid" id="cuponesPromocionales">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div>
                                                    <a href="#" class="btn btn-success" id="add_regla">Agregar</a>
                                                    <label class="radio-inline">
                                                        Agregar reglas de descuento
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>

                                    <div class="row" id="reglas">
                                        {if $edit && $configuracion->reglas}
                                        {foreach from=$configuracion->reglas item=regla}
                                            <div class="regla-descuento">
                                                <h3 class="form-section">&nbsp;</h3>
                                                <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>
                                                <div class="row-fluid">
                                                    <div class="col-md-3">
                                                        <input type="hidden" name="reglas[{$regla->id}][id]" value="{$regla->id}" />
                                                        <div class="form-group">
                                                            <label class="control-label">Para reservas superiores a</label>
                                                            <input type="text" name="reglas[{$regla->id}][monto]" id="nombre" class="form-control validate[required, custom[number]]" placeholder="Descuento" {if $edit}value="{$regla->monto}"{/if}>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">Generar cupón con descuento</label>
                                                            <input type="text" name="reglas[{$regla->id}][descuento]" id="nombre" class="form-control validate[required, custom[number]]" placeholder="Descuento" {if $edit}value="{$regla->descuento}"{/if}>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">&nbsp;</label>
                                                            <select name="reglas[{$regla->id}][tipoDescuento]" id="nombre" class="form-control">
                                                                <option value="%" {if $regla->tipoDescuento eq '%'}selected{/if}>Porcentaje (%)</option>
                                                                <option {if $regla->tipoDescuento eq '€'}selected{/if} value="€">Euros (&euro;)</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label class="control-label">&nbsp;</label>
                                                            <a class="btn btn-primary generar_cupones" href="#cupones_modal" name="{$regla->id}">Mostrar cupones ({$regla->cupones|@count})</a>
                                                        </div>
                                                    </div>
                                                    <div class="delimiter"></div>
                                                </div>
                                            </div>
                                        {/foreach}
                                        {/if}                                     
                                    </div>
                                                        
                                    <div class="regla-descuento" id="regla-descuento-hidden">
                                        <h3 class="form-section">&nbsp;</h3>
                                        <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>

                                        <div class="row-fluid">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Para reservas superiores a</label>
                                                    <input type="text" name="reglas[XX][monto]" id="nombre" class="form-control validate[required, custom[number]]" disabled="" placeholder="Monto">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Generar cupón con descuento</label>
                                                    <input type="text" name="reglas[XX][descuento]" id="nombre" class="form-control validate[required, custom[number]]" disabled="" placeholder="Descuento">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">&nbsp;</label>
                                                    <select name="reglas[XX][tipoDescuento]" id="nombre" class="form-control" disabled="">
                                                        <option value="%">Porcentaje (%)</option>
                                                        <option value="€">Euros (&euro;)</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Cantidad de cupones</label>
                                                    <input value="1" name="reglas[XX][cupones]" type="text" class="form-control" disabled=""/>
                                                    <!--<a name="XX" class="btn btn-primary bt-small generar_cupones" href="#cupones_modal">Generar cupones</a>-->
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                    </div>

                                    <h3 class="form-section">Asignar producto</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                            <table class="table table-striped table-bordered table-hover" id="table_producto">
                                                <thead>
                                                    <tr>
                                                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#table_producto .checkboxes" /></th>
                                                        <th>Nombre</th> 
                                                        <th>Localizador del contrato</th>
                                                        <th>Vigencia del contrato</th>
                                                        <th>Email de reservas</th>
                                                        <th>Teléfono de reservas</th>
                                                        <th>Favorito</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {foreach from=$productos item=producto}
                                                    <tr class="odd gradeX">
                                                        <td><input type="checkbox" name="productos[]" class="checkboxes" value="{$producto->id}" {if $producto->selected}checked{/if} /></td>
                                                        <td><span>{$producto->nombre}</span></td>
                                                        <td><span>{$producto->campania->localizador}</span></td>
                                                        <td><span class="label label-info">{$producto->campania->inicio|date_format:"%e/%m/%Y"} - {$producto->campania->fin|date_format:"%e/%m/%Y"}</span></td>
                                                        <td><span>{$producto->emailReservas}</span>
                                                        <td><span>{$producto->telefonoReservas}</span></td>
                                                        <td><input type="checkbox" name="favoritos[]" class="checkboxes" value="{$producto->id}" {if $producto->favorito}checked{/if} /></td>
                                                    </tr>
                                                    {/foreach}
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                    </div>
                                   
                                                        
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit}
                                                <input type="hidden" name="idConfiguracion" value="{$configuracion->id}">
                                            {/if}
                                            <input type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-configuracion-lista{$end_url}" >Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
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

<div class="modal fade" id="cupones_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Cupones generados</h4>
            </div>
            <div class="modal-body" id="cupones_body"></div>
            <div class="modal-footer">
                <a class="btn btn-success" data-dismiss="modal">Aceptar</a>
            </div>
        </div>
    </div>
</div>

<!-- END PAGE -->
{/block}