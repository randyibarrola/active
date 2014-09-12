<div
	style="font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; margin: 1.2em; font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15px">
    <h2><img height="50" src="{$template_url}/images/logo_s.png"></h2>
    <h3>{$usuario->nombre} {$usuario->apellido}</h3><br>
<p>{#Lamentamos_comunicarte#} {$reserva->localizador} {#ha_sido_cancelada#}.</p>

{if $reserva->motivoCancelacion}
    <p><strong>{#motivo_de_cancelacion#}:</strong></p>
    <p>{$reserva->motivoCancelacion}</p>
{/if}

<p><strong>{#tu_reserva#} {#en#} {$reserva->hotel->nombre}: </strong></p>
<p>{$noches} {#noche_s#} {#en#} {$apartamento->nombre} {$reserva->moneda->simbolo}{$apartamento->precioUnitario|number_format:2:',':' '}</p>
{if $apartamento->pension}
    <p><b>{$apartamento->pension}</b></p>
{/if}
{if $apartamento->condicion}
    <p><b>{$apartamento->condicion}</b></p>
{/if}
{if $reserva->cart}
    <p>{#Pax#}: <strong>{$reserva->cart->apto->adultos} {#Adulto_s#} {if $reserva->cart->apto->ninios}{$reserva->cart->apto->ninios}+ {#niho_s#}{/if}</strong></p>
{/if}
<p><strong>{#entrada#}:</strong> {$entrada|date_format:"%e/%m/%Y"}</p>
<p><strong>{#salida#}:</strong> {$salida|date_format:"%e/%m/%Y"}</p>


<p><strong>{#Direccion_y_contacto#}:</strong></p>
<p>{#telefono#}: {$reserva->hotel->empresa->telefonoReservas}</p>
<p>{$reserva->hotel->direccion->descripcion}</p>
<p>{#latitud#} {$reserva->hotel->direccion->lat}, {#longitud#} {$reserva->hotel->direccion->lon}</p>
{if $reserva->extras && count($reserva->extras) > 0}
    <p><strong>{#servicios_extras#}:</strong></p>
    {foreach from=$reserva->extras item=extra}
        {if !$extra->pagoOffline}<p>{#Has_pagado#} ({$reserva->moneda->simbolo}{$extra->importeInicial|number_format:2:',':' '}) {#un#} {$extra->porcientoInicial}% {#de_la_reserva#} {if $extra->porcientoInicial < 100}({#Pagaras_el_resto#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}){/if}</p>{else}<p>{#Pagaras#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}</p>{/if}
        <p>{$extra->inicio|date_format:"%e/%m/%Y"}</p>
        {if $extra->sesion && $extra->sesion|date_format:'%H:%M' ne '00:00'}{#Horario#}: <strong>{$extra->sesion|date_format:'%H:%M'}</strong>{/if}
    {/foreach}
{/if}

<!--
<p><strong>Información del pago:</strong></p>
<p>Has pagado un {$reserva->hotel->porcentageCobroAnticipado}% de la reserva para garantizarla, el resto lo pagaras en tu llegada al hotel.</p>
<br>
<p>
{if $reserva->hotel->informacionesCompra}
    {if $reserva->hotel->informacionesCompra->$lang}
        {$reserva->hotel->informacionesCompra->$lang}
    {else}
        {$reserva->hotel->informacionesCompra->es}
    {/if}
{/if}
</p>

<br>-->


<p>{#Si_tienes_alguna_duda_sobre_tu_reserva_contacta_con#} {$reserva->hotel->emailReservas} {#o_llamando_a#} {$reserva->hotel->telefonoReservas}</p>
<p>{#ver_los_detalles_de_tu#}:<a href="{$vikahotel_url}/{$lang}/cancelacion/id:{$reserva->id}/mail:1{$end_url}">{$vikahotel_url}/{$lang}/cancelacion/id:{$reserva->id}/mail:1{$end_url}</a></p>
<br>
<div style="text-align: center; font-size: 10px; color: #cccccc;">
    {#sistema_nombre#} system: {#empresa_nombre#} {#con_NIF#} {#empresa_cif#} {#y_con_domicilio_social_en#} {#empresa_direccion#} {#contacto#}: <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a>
</div>
</div>
