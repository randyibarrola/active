{extends file="admin/login_template.tpl"}

{block name="style" append}
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/confirmacion.css" />
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/style.css" />
{/block}

{block name="script" append}
    <script src="{$template_url}/js/confirmacion.js"></script>
{/block}

{block name="main_content" append}
<div class="row-fluid clearfix">
    <div class="col-md-12">
        <div class="main_content book-confirmation">
            <div class="book-confirmation-inner">
                <div class="row">
                    <div class="col-md-12">
                    <h2 class="text-primary red">{#tu_reserva_fue_cancelada#}</h2>
                        <ul class="checklist">
                            <li><p>{#te_hemos_enviado_un_email_a#} {$usuario->email}</p></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">{#tus_datos#}</h3>
                            </div>
                            <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6"><p><strong>{#numero_de_reserva#}</strong></p></div>
                                        <div class="col-md-6"><p>{$reserva->localizador}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><p><strong>{#entrada#}</strong></p></div>
                                        <div class="col-md-6"><p>{$inicio}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><p><strong>{#salida#}</strong></p></div>
                                        <div class="col-md-6"><p>{$salida}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><p><strong>{#noches#}</strong></p></div>
                                        <div class="col-md-6"><p>{$noches} {#noche_s#}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><p><strong>{#Pax#}</strong></p></div>
                                        <div class="col-md-6"><p>{$cart->apto->adultos} {#Adulto_s#} {if $cart->apto->ninios}+ {$cart->apto->ninios} {#ninio_s#}{/if}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6"><p><strong>{#nombre_del_cliente#}</strong></p></div>
                                        <div class="col-md-6"><p>{$usuario->nombre} {$usuario->apellido}</p></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6"><p><strong>{#Email_del_cliente#}</strong></p></div>
                                        <div class="col-md-6"><p>{$usuario->email}</p></div>
                                    </div>

                                    {foreach from=$reserva->productos item=producto}
                                    <div class="row">
                                        <div class="col-md-6"><strong>{$producto->nombre}</strong></p></div>
                                        <div class="col-md-6"><p>{$reserva->moneda->simbolo} {$producto->precioUnitario|number_format:2:',':'.'}</p></div>
                                    </div>
                                    {if $producto->pension}
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p>
                                                <strong>{#servicio#}</strong> 
                                            </p>
                                        </div>
                                        
                                        <div class="col-md-6"><p>{$producto->pension}</p></div>
                                    </div>
                                    {/if}
                                    {if $producto->condicion}
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p>
                                                <strong>{#condiciones_de_reserva#}</strong> 
                                            </p>
                                        </div>
                                        
                                        <div class="col-md-6"><p>{$producto->condicion}</p></div>
                                    </div>
                                    {/if}
                                    {/foreach}

                                    <div class="row">
                                        <div class="col-md-6"><h4 class="text-primary"><strong>{#precio_total#}</strong></h4></div>
                                        <div class="col-md-6"><p><strong>{$reserva->moneda->simbolo} {$reserva->total|number_format:2:',':'.'}</strong></p><p class="text-info"></p></div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">{$hotel->nombre}</h3>
                            </div>
                            <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#direccion#}</strong></p></div>
                                        <div class="col-md-9">
                                            <p>{$hotel->direccion->descripcion}</p>                                        
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#telefono#}</strong></p></div>
                                        <div class="col-md-9"><p>{$hotel->telefonoReservas}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#correo_electronico#}</strong></p></div>
                                        <div class="col-md-9"><p>{$hotel->emailReservas}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#informacion_para_el_viaje#}</strong></p></div>
                                        <div class="col-md-9">
                                            <p>Latitude {$hotel->direccion->lat}, Longitud {$hotel->direccion->lon}</p>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--<div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">{$hotel->empresa->nombreComercial}</h3>
                            </div>
                            <div class="panel-body">                                    
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#direccion#}</strong></p></div>
                                        <div class="col-md-9">
                                            <p>{$hotel->empresa->direccion->descripcion}</p>                                        
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#telefono#}</strong></p></div>
                                        <div class="col-md-9"><p>{$hotel->empresa->telefonoReservas}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#correo_electronico#}</strong></p></div>
                                        <div class="col-md-9"><p>{$hotel->empresa->emailReservas}</p></div>
                                    </div>
                                    
                            </div>
                        </div>
                    </div> 
                    <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">{$hotel->distribuidor->nombreComercial}</h3>
                            </div>
                            <div class="panel-body">                                    
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#direccion#}</strong></p></div>
                                        <div class="col-md-9">
                                            <p>{$hotel->distribuidor->direccion->descripcion}</p>                                        
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#telefono#}</strong></p></div>
                                        <div class="col-md-9"><p>{$hotel->distribuidor->telefonoReservas}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"><p><strong>{#correo_electronico#}</strong></p></div>
                                        <div class="col-md-9"><p>{$hotel->distribuidor->emailReservas}</p></div>
                                    </div>
                                    
                            </div>
                        </div>
                    </div>
                </div>-->
           
              <!--  <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title">{#informacion_del_pago#}</h3>
                            </div>
                            <div class="panel-body">
                                
                              
                            <h3>{if count($reserva->pagos) && $reserva->pagos[0]->importe}{#cobramos_de_tu_tarjeta#} {$reserva->moneda->simbolo}{$reserva->pagos[0]->importe|number_format:2:",":''} {#en_concepto_de#}{else}{#en_tu_llegada_a_hotel#} {$hotel->nombre} {#pagarias#}{/if}:</h3>
                            {if $hotel->tipoReserva}
                            {assign var=$precio value=$apartamento->precioUnitario}
                            {/if}
                            <p><strong>{if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}✓ {#garantia_de_tu_reserva#}{else}{/if} {$apartamento->nombre} {if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}{$hotel->porcentageCobroAnticipado}%{/if} <span id="cobraremos-tarjeta">{$reserva->moneda->simbolo}{if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}{($apartamento->precioUnitario*$hotel->porcentageCobroAnticipado/100)|number_format:2:',':''}{else}{$apartamento->precioUnitario|number_format:2:',':''}({#Pagarias_en_tu_llegada_al_hotel#}){/if}</span></strong></p>
                                    
                                    {if $reserva->extras}
                                        {foreach from=$reserva->extras item=exc}
                                            <p id="cobrar_{$exc->id}">
                                            {if $exc->pagoOffline}
                                                {$exc->nombre} <span>{$reserva->moneda->simbolo}{$exc->precioUnitario|number_format:2:',':' '}({#lo_pagarias#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}})</span>
                                            {else}
                                                ✓ {$exc->nombre} {$exc->porcientoInicial}% <span>{$reserva->moneda->simbolo}{$exc->importeInicial|number_format:2:',':''} {if $exc->porcientoInicial < 100}({#pagarias_el_resto#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}){/if}</span>
                                            {/if}
                                            </p>
                                        {/foreach}
                                    {/if}
<hr />
                                    <p>
                                    {if $hotel->informacionesCompra}
                                        {if $hotel->informacionesCompra->$lang}
                                            {$hotel->informacionesCompra->$lang}
                                        {else}
                                            {$hotel->informacionesCompra->es}
                                        {/if}
                                    {/if}
                                </p>
                            </div>
                        </div>
                    </div>
                    
                </div>-->
                <div class="row">
                    <div class="col-md-12">
                    <div class="row">
                    <div class="col-md-12">
                        {#consulta_condiciones_de_compra#}:<br>
                         {if $hotel->condiciones}
                            {foreach from=$hotel->condiciones item=condicion}
                                <a href="{$vikahotel_url}/condiciones/id:{dechex($condicion->id*9999)}">
                                    <strong>{if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}</strong>
                                </a><br>
                            {/foreach}
                        {/if}
                    </div>
                </div>
                </div>
                </div>
                <br />
                 <div class="row" style="text-align: center;">
                    <a href="{$base_url}/cancelacion/id:{$id}/print:1{$end_url}" class="btn btn-default" id="imprimirBtn" target="_blank">{#imprimir#}</a>
                    <a href="{$base_url}" class="btn btn-success">{#finalizar#}</a>
                </div>
            </div>
        </div>
    </div>
</div>
                    
                    
<div class="modal fade" id="cancelar_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{#cancelar_reserva#}</h4>
            </div>
            <div class="modal-body">
                {#desea_cancelar_su_reserva#}
                <input type="hidden" id="idCancelar" value="{$reserva->id}">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="aceptarCancelar">{#aceptar#}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>
{/block}