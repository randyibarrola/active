{extends file="index.tpl"}

{block "style_level" append}
    <link href="{$template_url}/newdesing/css/booking.css" rel="stylesheet" media="screen">
{/block}

{block name="main_content" append}
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div id="booking-content" class="well-white confirm-booking">
                <div class="jumbotron text-center">
                    <p>
                        <img src="{$template_url}/newdesing/images/cancel-booking.png" />
                    </p>
                    <h1>¡{#ok#}, {$usuario->nombre} {#tu_reserva_fue_cancelada#}.</h1>
                    <p>{#hemos_enviado_justificante_por_email#}.</p>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <dl class="dl-horizontal">
                            <dt>{#numero_de_reserva#}</dt>
                            <dd>{$reserva->localizador}</dd>
                            <dt>{#entrada#}</dt>
                            <dd>{$inicio}</dd>
                            <dt>{#salida#}</dt>
                            <dd>{$salida}</dd>
                            <dt>{#noches#}</dt>
                            <dd>{$noches}</dd>
                            <dt>{#Pax#}</dt>
                            <dd>{$cart->apto->adultos} {#Adulto_s#} {if $cart->apto->ninios}+ {$cart->apto->ninios} {#ninio_s#}{/if}</dd>
                        </dl>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <dl class="dl-horizontal">
                            <dt>{#nombre#}</dt>
                            <dd>{$usuario->nombre} {$usuario->apellido}</dd>
                            <dt>{#su_email#}</dt>
                            <dd>{$usuario->email}</dd>
                            <dt>{#habitacion#}</dt>
                            {foreach from=$reserva->productos item=producto}
                                <dd>{$producto->nombre} {$reserva->moneda->simbolo} {$producto->precioUnitario|number_format:2:',':'.'}</dd>
                            {/foreach}
                            <dt>{#precio_total#}</dt>
                            <dd>{$reserva->moneda->simbolo} {$reserva->total|number_format:2:',':'.'}</dd>
                        </dl>
                    </div>
                </div>
                {if $reserva->peticionesEspeciales && strlen(trim($reserva->peticionesEspeciales))}
                    <dl class="dl-horizontal">
                        <dt>{#Peticiones_especiales#}</dt>
                        <dd>{$reserva->peticionesEspeciales}</dd>
                    </dl>
                {/if}
                {if $reserva->cart->apto->servicios}
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            {foreach from=$reserva->cart->apto->servicios item=servicio}
                                <p>{str_replace('\n', '<br>', $servicio)}</p>
                            {/foreach}
                        </div>
                    </div>
                {/if}
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        {if $hotel->tipoReserva}
                            {assign var=$precio value=$apartamento->precioUnitario}
                        {/if}
                        <p><strong>{if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}✓ {#garantia_de_tu_reserva#}{else} {/if} {$apartamento->nombre} {if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}{$hotel->porcentageCobroAnticipado}%{/if} <span id="cobraremos-tarjeta">{$reserva->moneda->simbolo}{if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}{($apartamento->precioUnitario*$hotel->porcentageCobroAnticipado/100)|number_format:2:',':''}{else}{$apartamento->precioUnitario|number_format:2:',':''}{/if}</span></strong></p>

                        {if $reserva->extras}
                            {foreach from=$reserva->extras item=exc}
                                <!--<p id="cobrar_{$exc->id}">{if $exc->pagoOffline}{else}✓{/if} {$exc->nombre} {$exc->porcientoInicial}% <span>{$reserva->moneda->simbolo} {$exc->importeInicial|number_format:2:',':''} {if $exc->pagoOffline}(lo pagarás en recepción){/if}</span></p>-->
                                <p id="cobrar_{$exc->id}">
                                    {if $exc->pagoOffline}
                                        {$exc->nombre} <span>{$reserva->moneda->simbolo}{$exc->precioUnitario|number_format:2:',':' '}({#lo_pagaras#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}})</span>
                                    {else}
                                        ✓ {$exc->nombre} {$exc->porcientoInicial}% <span>{$reserva->moneda->simbolo}{$exc->importeInicial|number_format:2:',':''} {if $exc->porcientoInicial < 100}({#pagaras_el_resto#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}){/if}</span>
                                    {/if}
                                </p>
                            {/foreach}
                        {/if}
                        <p>{#Si_tienes_alguna_duda_sobre_tu_reserva_contacta_con#} {$hotel->emailReservas} {#o_llamando_a#} {$hotel->telefonoReservas}</p>
                        {if $hotel->informacionesCompra}
                            <p>
                                {if $hotel->informacionesCompra->$lang}
                                    {$hotel->informacionesCompra->$lang}
                                {else}
                                    {$hotel->informacionesCompra->es}
                                {/if}
                            </p>
                        {/if}
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        {#Consulta_las_condiciones_de_compra#}:</br>
                        {if $hotel->condiciones}
                            {foreach from=$hotel->condiciones item=condicion}
                                <a href="{$vikahotel_url}/condiciones/id:{dechex($condicion->id*9999)}/v:modal" data-toggle="modal" data-target="#condition-{dechex($condicion->id*9999)}-modal">
                                    <h3 class="title">{if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}</h3>
                                </a><br>
                                <div id="condition-{dechex($condicion->id*9999)}-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <img src="{$template_url}/newdesing/images/ajax-loading.gif" style="margin-left: 40%" />
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        {/if}
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                        <a href="{$base_url}/cancelacion/id:{$id}/print:1{$end_url}" class="btn btn-default" id="imprimirBtn" target="_blank">{#imprimir#}</a>
                        <a href="{$base_url}" class="btn btn-success">{#finalizar#}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}