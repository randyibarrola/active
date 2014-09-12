{extends file="admin/login_template.tpl"}

{block name="style" append}
    <link href="{$template_url}/admin/assets/css/pages/validar.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="{$template_url}/admin/assets/plugins/data-tables/DT_bootstrap.css" />
{/block}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/facturacion.js"></script>
{/block}

{block name="main_content" append}
<!-- BEGIN LOGIN FORM -->
<div class="content validar">
<form class="validation-form" action="{$base_url}/admin-valid" method="post">
        <h3 class="form-title">Facturación</h3>
        <div class="row">
            <div class="row-fluid">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>No Factura</label>
                        <input class="form-control" disabled="" value="{$factura->id}">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Fecha de creación</label>
                        <input class="form-control" disabled="" value="{$factura->tiempoCreacion|date_format:"%d/%m/%Y"}">
                    </div>
                </div>
                    <div class="clearfix"></div>
            </div>
        </div>
        <div class="row">
            <div class="row-fluid">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Hotel</label>
                        <input class="form-control" disabled="" value="{$hotel->nombre}">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Empresa</label>
                        <input class="form-control" disabled="" value="{$hotel->empresa->nombreFiscal}">
                    </div>
                </div>
                    <div class="clearfix"></div>
            </div>
        </div>
        <h3>Resumen</h3>
        <div>
            <table class="table table-striped table-bordered table-hover" id="table_reservas">
                <thead>
                    <tr>
                        <th>Reservas validadas</th>
                        <th>Total</th>
                        <th>Comisión</th>
                    </tr>
                </thead>
                <tbody>
                        <tr class="odd gradeX">
                            <td>{count($reservas)}</td>
                            <td>{$hotel->moneda->simbolo}{$totalFacturado|number_format:2:',':''}</td>
                            <td>{$hotel->moneda->simbolo}{$totalComisiones|number_format:2:',':''}</td>
                            
                            
                        </tr>
                </tbody>
            </table>
        </div>
                            
        <h3>Detalles</h3>
        <div>
            <table class="table table-striped table-bordered table-hover" id="table_reservas">
                <thead>
                    <tr>
                        
                        <th>Código</th>
                        <th>Cliente</th>
                        <th>Apartamento</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Noches</th>
                        <th>Pax</th>  
                        <th class="hidden-480">Total</th>
                        <th>Comisión</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$reservas item=reserva}
                        <tr class="odd gradeX">
                            
                            <td>{$reserva->localizador}</td>
                            <td>
                               {$reserva->usuario->nombre} {$reserva->usuario->apellido}
                            </td>
                            <td>{$reserva->alojamiento[0]->nombre}</td>
                            <td>{$reserva->alojamiento[0]->inicio|date_format:"%d/%m/%Y"}</td>
                            <td>{$reserva->alojamiento[0]->final|date_format:"%d/%m/%Y"}</td>
                            <td>{intval((strtotime($reserva->alojamiento[0]->final) - strtotime($reserva->alojamiento[0]->inicio))/(60*60*24))}</td>
                            <td>{$reserva->alojamiento[0]->adultos} {#Adulto_s#}{if $reserva->alojamiento[0]->ninios} + {$reserva->alojamiento[0]->ninios} {#niho_s#}{/if}</td>
                            <td class="importe">
                                {$reserva->moneda->simbolo} {$reserva->alojamiento[0]->precioUnitario|number_format:2:',':' '}
                            </td>
                            <td class="comision">
                                {$reserva->moneda->simbolo} {$reserva->alojamiento[0]->comision|number_format:2:',':' '}</span>
                            </td>
                            
                        </tr>
                        {/foreach}
                        <tr>
                            <td colspan="8" style="text-align: right; font-size: 16px; border: none;">
                                <strong>Total facturado:</strong>
                            </td>
                            <td style="font-size: 16px; border: none;">
                                {$hotel->moneda->simbolo}{$totalFacturado|number_format:2:',':''}
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8" style="text-align: right; font-size: 16px; border: none;">
                                <strong>Total comisiones:</strong>
                            </td>
                            <td style="font-size: 16px; border: none;">
                               {$hotel->moneda->simbolo}{$totalComisiones|number_format:2:',':''}
                            </td>
                        </tr>
                </tbody>
            </table>
        </div>
        <div class="row hidden-print">
            <div class="row-fluid">
                <div class="col-md-12 text-center">
                    <a class="btn btn-default" href="{$base_url}">Inicio</a>
                    <a class="btn btn-success" id="printBtn">Imprimir</a>
                    
                </div>
            </div>
        </div>
</form>
</div>
<!-- END LOGIN FORM -->
{/block}