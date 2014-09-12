<!DOCTYPE html>
<html>
<head>
    <title>Reservación</title>
    <link href="{$template_url}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="{$template_url}/admin/assets/plugins/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="{$template_url}/css/admin/reserva-gestion.css" />
    <link rel="stylesheet" href="{$template_url}/css/admin/reserva-gestion-print.css" />
    <script type="text/javascript">
        window.print();
    </script>
</head>
<body>
<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <!-- BEGIN PAGE CONTAINER-->        
        <div class="container-fluid">
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="col-xs-12 responsive" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="reservaFrm">
                                <div class="form-body">
                                    <h5 class="form-section">Datos de Reserva ({$reserva->estado})</h5>
                                    <div class="row row-hotel-content">
                                        {if $edit}
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Localizador</label>
                                                    <input type="text" id="usuario" disabled="" class="form-control" value="{$reserva->localizador}">
                                                </div>
                                            </div>
                                             <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Contrato</label>
                                                    <input type="text" id="usuario" disabled="" class="form-control" value="{$campania->localizador}">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Fecha de creaci&oacute;n</label>
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
                                                    <label class="control-label">Nombre del cliente</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Usuario" {if $edit}value="{$reserva->usuario->nombre} {$reserva->usuario->apellido}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Email del cliente</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Usuario" {if $edit}value="{$reserva->usuario->email}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Teléfono del cliente</label>
                                                    <input type="text" readonly="" class="form-control" placeholder="Usuario" {if $edit}value="{$reserva->usuario->telefono}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Nacionalidad</label>
                                                    <input type="text" id="usuario" readonly="" class="form-control" placeholder="Nacionalidad" {if $edit}value="{$pais->nombre}"{/if}>
                                                </div>
                                            </div>
                                            
                                            <div class="delimiter"></div>
                                        </div>
                                        {if $reserva->peticionesEspeciales}
                                        <div class="row-fluid">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label">Peticiones especiales</label>
                                                    <div class="form-control delimiter" readonly="" style="height: auto;">{if $edit}{$reserva->nombre} {$reserva->peticionesEspeciales}{/if}</div>
                                                </div>
                                            </div>
                                        <div class="delimiter"></div>
                                        </div>
                                        {/if}
                                    </div>

                                    <h5 class="form-section">Productos de Reserva</h5>
                                    <div class="row">
                                    {foreach from=$reserva->productos item=producto name=productos}
                                    <div class="row-fluid">
                                        <div class="col-xs-6">
                                            <div class="form-group">
                                                <label class="control-label">Nombre</label>
                                                
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->nombre}">
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="control-label">Tipo</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->tipo}">
                                            </div>
                                        </div>
                                    
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <label class="control-label">Cantidad</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->cantidad}">
                                            </div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label class="control-label">Precio</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="&euro;{$producto->precioUnitario|number_format:2:',':''}">
                                            </div>
                                        </div>
                                    
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label class="control-label">{if $producto->tipo eq 'apartamento'}Fecha de Entrada{else}Fecha de consumo{/if}</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->inicio|date_format:"%d-%m-%Y"}">
                                            </div>
                                        </div>
                                        {if $producto->tipo eq 'apartamento'}
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label class="control-label">Fecha de Salida</label>
                                                <input type="text" id="fecha" class="form-control" readonly="" placeholder="Fecha" value="{$producto->final|date_format:"%d-%m-%Y"}">
                                            </div>
                                        </div>
                                        {/if}
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Forma de pago</label>
                                                <input class="form-control" disabled="" value="{if !$producto->pagoOffline}Online{else}Offline{/if}">
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
                                                <input type="text" class="form-control" readonly="" value="{$currency}{$producto->importeInicial|number_format:2:',':' '}">
                                            </div>
                                        </div>
                                        {/if}    
                                                <div class="delimiter"></div>
                                    </div>
                                    {if !$smarty.foreach.productos.last}
                                    <hr />
                                    {/if}      
                                    
                                    {/foreach}
                                    </div>
                                    <div class="row pagos-update" id="pagosCont">
                                    {foreach from=$reserva->pagos item=pago}
                                    <div class="pago">
                                        <input type="hidden" name="pagoUpdate[{$pago->id}][idPago]" value="{$pago->id}">
                                        <input type="hidden" name="pagoUpdate[{$pago->id}][formaPago]" value="{$pago->formaPago}">
                                    {if $pago->formaPago eq 'tarjeta'}   
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Tipo de tarjeta</label>
                                                    
                                                    <input type="text" name="pagoUpdate[{$pago->id}][tarjetaTipo]" class="form-control validate[required]" placeholder="Tipo" value="{$pago->tarjetaTipo}" readonly="">
                                                </div>
                                            </div>
                                                        
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Importe</label>
                                                    <input readonly="" type="text" class="form-control validate[required]" placeholder="Importe" value="{$pago->importe|number_format:2:',':' '}">
                                                    <input name="pagoUpdate[{$pago->id}][importe]" value="{$pago->importe}" type="hidden">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Estado</label>
                                                    <strong>{$pago->estado}</strong>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                                        
                                            
                                        </div>
                                        {if $pago->tarjetaNumero}
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Numero de tarjeta</label>
                                                    <input type="text" name="pagoUpdate[{$pago->id}][tarjetaNumero]" class="form-control validate[required]" placeholder="Numero" value="{$pago->tarjetaNumero}" readonly="">
                                                </div>
                                            </div>
                                                
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">CVV</label>
                                                    <input type="text" name="pagoUpdate[{$pago->id}][cvv]" class="form-control validate[required]" placeholder="CVV" value="{$pago->cvv}" readonly="">
                                                </div>
                                            </div>
                                                
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Mes de caducidad</label>
                                                    
                                                    <input type="text" name="pagoUpdate[{$pago->id}][caducidadMes]" class="form-control validate[required]" placeholder="Mes" value="{$pago->caducidadMes}" readonly="">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">A&ntilde;o de caducidad</label>
                                                    
                                                    <input type="text" name="pagoUpdate[{$pago->id}][caducidadAnio]" class="form-control validate[required]" placeholder="Año" value="{$pago->caducidadAnio}" readonly="">
                                                </div>
                                            </div>
                                            
                                        </div>
                                        {/if}
                                        
                                    {/if}
                                    {if $pago->formaPago eq 'efectivo'}
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Importe</label>
                                                    <input type="hidden" name="pagoUpdate[{$pago->id}][formaPago]" value="efectivo" disabled="">
                                                    <input type="text" name="pagoUpdate[{$pago->id}][importe]" class="form-control validate[required, custom[number]]" placeholder="Importe" value="{$pago->importe}">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="control-label">Estado</label>
                                                    <strong>{$pago->estado}</strong>
                                                </div>
                                            </div>
                                        </div>
                                                    <div class="delimiter"></div>
                                    {/if}
                                    
                                    </div>
                                    {/foreach}
                                    </div>
                                    <div class="row pagos-add">
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
<!-- END PAGE -->
</body>
</html>