
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="shortcut icon" href="ico/favicon.png">-->

    <title>Admin</title>
    
      <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="{$template_url}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/select2/select2_metro.css" />
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
        <link rel="stylesheet" href="{$template_url}/admin/assets/plugins/data-tables/DT_bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-datepicker/css/datepicker.css" />
	    <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-timepicker/compiled/timepicker.css" />
        <link href="{$template_url}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/toastr.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	    <link href="{$template_url}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
        <link href="{$template_url}/admin/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
	    <link href="{$template_url}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/toastr.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/print.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->

        <!-- END PAGE LEVEL STYLES -->
        <link rel="shortcut icon" href="favicon.ico" />
        <link rel="stylesheet" href="{$template_url}/css/admin/reserva-gestion.css" />


  </head>
  <body class="page-header-fixed page-sidebar-closed">
      <div id="blocker">
           <div>Cargando...</div>
       </div>
    <div class="clearfix"></div>
    
    <div class="">
<!-- BEGIN CONTAINER -->
<div class=" row-fluid">
    
    <!-- BEGIN PAGE -->
    <div class="">
        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <!-- BEGIN PAGE CONTAINER-->        
        <div class="container-fluid">
            
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="row-fluid responsive" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title hidden-print">
                            
                            <div class="caption"><i class="fa fa-reorder"></i>Reserva {$reserva->localizador}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="reservaFrm">
                                <div class="form-body">
                                    <h3 class="form-section">Datos de Reserva</h3>
                                    <div class="row row-hotel-content">
                                        {if $edit}
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Localizador</label>
                                                    <input type="text" id="usuario" disabled="" class="form-control" value="{$reserva->localizador}">
                                                </div>
                                            </div>
                                             <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Referencia de contrato</label>
                                                    <input type="text" id="usuario" disabled="" class="form-control" value="{$campania->localizador}">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Fecha de creaci&oacute;n</label>
                                                    <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$reserva->tiempoCreacion|date_format:"%e/%m/%Y"}">
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        {/if}
                                        <div class="row-fluid">
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <label class="">Hotel</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Hotel" {if $edit}value="{$reserva->hotel->nombre}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <label class="">Pax</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Pax" {if $edit}value="{$reserva->cart->apto->adultos} Adultos {if $reserva->cart->apto->ninios}+ {$reserva->cart->apto->ninios} Niños{/if}"{/if}>
                                                </div>
                                            </div>
                                                <div class="clearfix"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Nombre del cliente</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Usuario" {if $edit}value="{$reserva->usuario->nombre} {$reserva->usuario->apellido}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Email del cliente</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Usuario" {if $edit}value="{$reserva->usuario->email}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Teléfono del cliente</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Usuario" {if $edit}value="{$reserva->usuario->telefono}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Nacionalidad</label>
                                                    <input type="text" id="usuario" readonly="" class="form-control" placeholder="Nacionalidad" {if $edit}value="{$pais->nombre}"{/if}>
                                                </div>
                                            </div>
                                            
                                            <div class="delimiter"></div>
                                        </div>
                                        {if $reserva->peticionesEspeciales}
                                        <div class="row-fluid">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="">Peticiones especiales</label>
                                                    <div class="form-control delimiter" readonly="" style="height: auto;">{if $edit}{$reserva->peticionesEspeciales}{/if}</div>
                                                </div>
                                            </div>
                                        <div class="delimiter"></div>
                                        </div>
                                        {/if}
                                    </div>

                                    <h3 class="form-section">Productos de Reserva</h3>
                                    <div class="row">
                                    {foreach from=$reserva->productos item=producto name=productos}
                                    <div class="row-fluid">
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label class="">Nombre</label>
                                                
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->nombre}">
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="form-group">
                                                <label class="">Tipo</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->tipo}">
                                            </div>
                                        </div>
                                        {if $producto->cantidad}
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="">Cantidad</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->cantidad}">
                                            </div>
                                        </div>
                                        {/if}
                                        {if $producto->pension}
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="">Pensión</label>
                                                <input type="text"  class="form-control" readonly="" placeholder="Pensión" value="{$producto->pension}">
                                            </div>
                                        </div>
                                        {/if}
                                        {if $producto->condicion}
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="">Condición</label>
                                                <input type="text"  class="form-control" readonly="" placeholder="Condición" value="{$producto->condicion}">
                                            </div>
                                        </div>
                                        {/if}
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="">Precio</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$reserva->moneda->simbolo}{$producto->precioUnitario|number_format:2:',':''}">
                                            </div>
                                        </div>
                                    
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="">{if $producto->tipo eq 'apartamento'}Fecha de Entrada{else}Fecha de consumo{/if}</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->inicio|date_format:"%d-%m-%Y"}">
                                            </div>
                                        </div>
                                        {if $producto->tipo eq 'apartamento'}
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="">Fecha de Salida</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->final|date_format:"%d-%m-%Y"}">
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="">Noches</label>
                                                <input type="text" id="noches" class="form-control" readonly="" placeholder="Noches" value="{$producto->noches}">
                                            </div>
                                        </div>
                                        {else if $producto->sesion && $producto->sesion|date_format:"%H:%M" ne "00:00"}
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label class="">Hora</label>
                                                <input type="text" id="sesion" class="form-control" readonly="" placeholder="Hora" value="{$producto->sesion|date_format:"%H:%M"}">
                                            </div>
                                        </div>    
                                        {/if}
                                        <div class="delimiter"></div>
                                    </div>
                                    <!--{if $logged_user->usuarioGrupoId ne 2}
                                    <div class="row-fluid">                                        
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Forma de pago</label>
                                                <input class="form-control" disabled="" value="{if !$producto->pagoOffline}Online{else}Offline{/if}">
                                                </select>
                                            </div>
                                        </div>
                                       {if !$producto->pagoOffline}
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Porciento de adelanto</label>
                                                <input type="text" class="form-control" readonly="" value="{$producto->porcientoInicial}%">
                                            </div>
                                        </div>
                                                
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Importe de adelanto</label>
                                                <input type="text" class="form-control" readonly="" value="{$reserva->moneda->simbolo}{$producto->importeInicial|number_format:2:',':' '}">
                                            </div>
                                        </div>
                                        {/if} 
                                                <div class="delimiter"></div>
                                    </div>
                                    {/if}-->
                                    {if !$smarty.foreach.productos.last}
                                    <div class="row-fluid">
                                        <div class="col-xs-12"><h3 class="form-section">&nbsp;</h3></div>
                                    </div>
                                    {/if}      
                                    
                                    {/foreach}
                                    </div>

                                    <!--<h3 class="form-section">Pagos de Reserva</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Agregar pago</label>
                                                    <select class="form-control" id="tipoPago" >
                                                        <option value="tarjeta">Tarjeta de Cr&eacute;dito</option>
                                                        <option value="efectivo">Efectivo</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                
                                                    <input type="submit" id="add_pago" class="btn btn-success pull-left" value="Agregar">
                                                
                                            </div>
                                        </div>
                                    </div>-->
                                    {if $reserva->pagos && count($reserva->pagos) && ($reserva->pagos[0]->importe || !$reserva->productos[0]->pagoOffline)}
                                    <h3 class="form-section">Pagos de la reserva {if $reserva->cardData}<a href="javascript:void(0)" class="btn btn-success hidden-print" id="showCardDataBtn">Mostrar datos de las tarjetas</a>{/if}</h3>
                                    <div class="row pagos-update" id="pagosCont">
                                    {foreach from=$reserva->pagos item=pago}
                                        
                                    <div class="pago">
                                        <!--<div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>-->
                                        <input type="hidden" name="pagoUpdate[{$pago->id}][idPago]" value="{$pago->id}">
                                        <input type="hidden" name="pagoUpdate[{$pago->id}][formaPago]" value="{$pago->formaPago}">
                                    {if $pago->formaPago eq 'tarjeta'}   
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Tipo de tarjeta</label>
                                                    
                                                    <input type="text" name="pagoUpdate[{$pago->id}][tarjetaTipo]" class="form-control validate[required]" placeholder="Tipo" value="{$pago->tarjetaTipo}" readonly="">

                                                    <!--<select class="form-control" name="pagoUpdate[{$pago->id}][tarjetaTipo]" value="{$pago->tarjetaTipo}">
                                                        <option value="Visa">Visa</option>
                                                        <option value="Master Card">Master Card</option>
                                                    </select>-->
                                                </div>
                                            </div>
                                            {if $logged_user->usuarioGrupoId ne 2}       
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Importe pendiente de pago</label>
                                                    <input readonly="" type="text" class="form-control validate[required]" placeholder="Importe" value="{$reserva->moneda->simbolo} {$pago->importe|number_format:2:',':' '}">
                                                    <input name="pagoUpdate[{$pago->id}][importe]" value="{$pago->importe}" type="hidden">
                                                </div>
                                            </div>
                                            {/if}
                                            <div class="delimiter"></div>
                                                        
                                            
                                        </div>
                                        {if $pago->tarjetaNumero}
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Numero de tarjeta</label>
                                                    <input type="text" name="pagoUpdate[{$pago->id}][tarjetaNumero]" class="form-control validate[required]" placeholder="Numero" value="{$pago->tarjetaNumero}" readonly="">
                                                </div>
                                            </div>
                                                
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Titular</label>
                                                    <input type="text" name="pagoUpdate[{$pago->id}][titular]" class="form-control validate[required]" placeholder="Titular" value="{$pago->titular}" readonly="">
                                                </div>
                                            </div>
                                                
                                            <div class="col-xs-1">
                                                <div class="form-group">
                                                    <label class="">CVV</label>
                                                    <input type="text" name="pagoUpdate[{$pago->id}][cvv]" class="form-control validate[required]" placeholder="CVV" value="{$pago->cvv}" readonly="">
                                                </div>
                                            </div>
                                                
                                            <div class="col-xs-2">
                                                <div class="form-group">
                                                    <label class="">Mes de caducidad</label>
                                                    
                                                    <input type="text" name="pagoUpdate[{$pago->id}][caducidadMes]" class="form-control validate[required]" placeholder="Mes" value="{$pago->caducidadMes}" readonly="">

                                                    <!--<select name="pagoUpdate[{$pago->id}][caducidadMes]" class="form-control" placeholder="Fecha">
                                                        {for $i=1 to 12}
                                                            <option value="{$i}" {if $pago->caducidadMes eq $i}selected{/if}>{$i} - {$meses[$i - 1]}</option>
                                                        {/for}
                                                    </select>-->
                                                </div>
                                            </div>
                                            <div class="col-xs-2">
                                                <div class="form-group">
                                                    <label class="">A&ntilde;o de caducidad</label>
                                                    
                                                    <input type="text" name="pagoUpdate[{$pago->id}][caducidadAnio]" class="form-control validate[required]" placeholder="Año" value="{$pago->caducidadAnio}" readonly="">

                                                    <!--<select  name="pagoUpdate[{$pago->id}][caducidadAnio]" class="form-control" placeholder="Fecha">
                                                        {for $i=2014 to 2040}
                                                            <option value="{$i}" {if $pago->caducidadAnio eq $i}selected{/if}>{$i}</option>
                                                        {/for}
                                                    </select>-->
                                                </div>
                                            </div>
                                            
                                        </div>
                                        {/if}
                                        
                                    {/if}
                                    {if $pago->formaPago eq 'efectivo' && $logged_user->usuarioGrupoId ne 2}
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Importe</label>
                                                    <input type="hidden" name="pagoUpdate[{$pago->id}][formaPago]" value="efectivo" disabled="">
                                                    <input type="text" name="pagoUpdate[{$pago->id}][importe]" class="form-control validate[required, custom[number]]" placeholder="Importe" value="{$reserva->moneda->simbolo} {$pago->importe|number_format:2:',':''}">
                                                </div>
                                            </div>
                                        </div>
                                                    <div class="delimiter"></div>
                                    {/if}
                                    
                                    </div>
                                    {/foreach}
                                    </div>
                                    {/if}
                                    <div class="row pagos-add">
                                    </div>
                                    <div id="pago_tarjeta">
                                        <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Tipo de tarjeta</label>
                                                    <input type="hidden" name="pagoUpdate[XX][formaPago]" value="tarjeta" disabled="">
                                                    <select class="form-control" name="pagoUpdate[XX][tarjetaTipo]" disabled="">
                                                        <option value="Visa">Visa</option>
                                                        <option value="Master Card">Master Card</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Numero de tarjeta</label>
                                                    <input type="text" name="pagoUpdate[XX][tarjetaNumero]" class="form-control validate[required]" placeholder="Numero" disabled="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Mes de caducidad</label>
                                                    
                                                    <select name="pagoUpdate[XX][caducidadMes]" class="form-control" disabled="" >
                                                        {for $i=1 to 12}
                                                            <option value="{$i}">{$i} - {$meses[$i - 1]}</option>
                                                        {/for}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">A&ntilde;o de caducidad</label>
                                                    <select name="pagoUpdate[XX][caducidadAnio]" class="form-control" disabled="">
                                                        {for $i=2014 to 2040}
                                                            <option value="{$i}">{$i}</option>
                                                        {/for}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">CVV</label>
                                                    <input type="text" name="pagoUpdate[XX][cvv]" maxlength="4" class="form-control validate[required]" placeholder="CVV" disabled="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Importe</label>
                                                    <input type="text" name="pagoUpdate[XX][importe]" class="form-control validate[required, custom[number]]" placeholder="Importe" disabled="">
                                                </div>
                                            </div>
                                                    <div class="delimiter"></div>
                                        </div>
                                                    
                                    </div>
                                    <div id="pago_efectivo">
                                        <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Importe</label>
                                                    <input type="hidden" name="pagoUpdate[XX][formaPago]" value="efectivo" disabled="">
                                                    <input type="text" name="pagoUpdate[XX][importe]" class="form-control validate[required, custom[number]]" placeholder="Importe" disabled="">
                                                </div>
                                            </div>
                                        </div>
                                                    <div class="delimiter"></div>
                                    </div>
                                    <div class="row hidden-print">
                                        <div class="col-xs-12 centered">
                                            <input type="hidden" name="action" value="update">
                                            {if $reserva->id}
                                                <input type="hidden" name="idReserva" value="{$reserva->id}">
                                            {/if}
                                            
                                            <a target="_blank" href="{$base_url}/admin-reserva-gestion/id:{$reserva->id}/print:1/login_code:{$smarty.request.login_code}/rloc:{$smarty.request.rloc}"  class="btn btn-warning">Imprimir</a>
                                            <a href="{$base_url}" class="btn btn-default">Cerrar</a>
                                        </div>
                                    </div>
                                    <!--
                                    <div class="row hidden-print">
                                        <div class="col-xs-12 centered">
                                            <input type="hidden" name="action" value="update">
                                            {if $reserva->id}
                                                <input type="hidden" name="idReserva" value="{$reserva->id}">
                                            {/if}
                                            <input type="submit" class="btn btn-success" value="Guardar">
                                            <a target="_blank" href="{$base_url}/admin-reserva-gestion/id:{$reserva->id}/print:1"  class="btn btn-warning">Imprimir</a>
                                            <a href="{$base_url}/admin-reserva-lista{$end_url}" class="btn btn-default">Cancelar</a>
                                        </div>
                                    </div>
                                    -->
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
<!-- END PAGE -->

<div class="modal fade" id="cardData_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Mostrar Datos de las tarjetas</h4>
            </div>
            <div class="modal-body">
                <form id="cardDataForm">
                <div class="form-group">
                    <label>Introduzca la clave de encriptación</label>
                    <input type="text" name="clave" class="form-control validate[required]">
                </div>
                <input type="hidden" name="id" value="{$reserva->id}">
                <input type="hidden" name="action" value="cardData">
                <input type="hidden" name="disabled" value="1">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="aceptar">{#aceptar#}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>

</div> 


    
  </body>
  <script type="text/javascript">
          var BASE_URL = "{$base_url}";
          var END_URL = "{$end_url}";
        </script>
        
        <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-47599454-40']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
        </script>

        <script src="{$template_url}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>     
    <script src="{$template_url}/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap/js/bootstrap2-typeahead.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
    <script src="{$template_url}/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
        
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/fuelux/js/spinner.min.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/ckeditor/ckeditor.js"></script> 
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
        
    <script src="{$template_url}/admin/assets/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript" ></script>
        
    <script src="{$template_url}/js/toastr.js"></script>  
    <script src="{$template_url}/js/jquery.validationEngine.js"></script>
    <script src="{$template_url}/js/jquery.validationEngine-es.js"></script>
    
    <script type="text/javascript" src="{$template_url}/js/admin/reserva-gestion.js"></script>
    
        
</html>