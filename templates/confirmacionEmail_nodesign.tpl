<div
	style="font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; margin: 1.2em; font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15px; max-width: 800px;">
<h2><img height="50" src="{$template_url}/images/logo_s.png"></h2>
<p><strong>{#_Gracias_#} {$usuario['nombre']}!</strong> {#Tu_reserva_con_localizador#} {$reserva->localizador} {#esta#} {if $reserva->estado eq 'Aprobada'}{#confirmada#}{else}{#pendiente_de_confirmacion#}{/if}.</p>
<p><strong>{#tus_datos#}: </strong></p>
<p>{$usuario['nombre']} {$usuario['apellido']}</p>
<p><strong>{#tu_reserva#} {#en#} {$hotel->nombre}: </strong></p>
<p><strong>{$noches} {#noche_s#}</strong> {#en#} {$reserva->alojamiento[0]->nombre} <strong>{$reserva->moneda->simbolo}{$reserva->alojamiento[0]->precioUnitario|number_format:2:',':' '}</strong></p>

{if $reserva->alojamiento[0]->porcientoInicial && $reserva->alojamiento[0]->importeInicial}
    <p>{if $reserva->estado eq 'Aprobada'}{#Has_pagado#}{else}{#Pagaras#}{/if} {#un#} <strong>{$reserva->alojamiento[0]->porcientoInicial}%({$reserva->moneda->simbolo}{$reserva->alojamiento[0]->importeInicial|number_format:2:',':' '})</strong> {#de_la_reserva_en_c_d#}.</p>
{else}
    {if $hotel->tipoReserva ne 'online'}
    {#Pagaras_en_tu_llegada_al_hotel#}
    {/if}
{/if}

{if $reserva->alojamiento[0]->pension}
    <p><b>{$reserva->alojamiento[0]->pension}</b></p>
{/if}
{if $reserva->alojamiento[0]->condicion}
    <p><b>{$reserva->alojamiento[0]->condicion}</b></p>
{/if}
{if $reserva->cart}
    <p>{#Pax#}: <strong>{$reserva->cart->apto->adultos} {#Adulto_s#} {if $reserva->cart->apto->ninios}{$reserva->cart->apto->ninios}+ {#niho_s#}{/if}</strong></p>
{/if}
<p>{#entrada#}: <strong>{$entrada|date_format:"%e/%m/%Y"}</strong></p>
<p>{#salida#}: <strong>{$salida|date_format:"%e/%m/%Y"}</strong></p>
{if $reserva->peticionesEspeciales && strlen(trim($reserva->peticionesEspeciales))}<p>{#Peticiones_especiales#}: {$reserva->peticionesEspeciales}</p>{/if}

{if $reserva->cart->apto->servicios}
    <p>
    {foreach from=$reserva->cart->apto->servicios item=servicio}
        {$servicio}<br>
    {/foreach}
    </p>
{/if}



<p>{#Direccion_y_contacto#}:</p>
<p>{#telefono#}: <strong>{$hotel->telefonoReservas}</strong></p>
<p>{$hotel->direccion->descripcion}</p>
<p>{#latitud#} {$hotel->direccion->lat}, {#longitud#} {$hotel->direccion->lon}</p>
<p>
{if $hotel->informacionesCompra}
    {if $hotel->informacionesCompra->$lang}
        {$hotel->informacionesCompra->$lang}
    {else}
        {$hotel->informacionesCompra->es}
    {/if}
{/if}
</p>

{if $reserva->extras && count($reserva->extras) > 0}
<br />
    <p><strong>{#servicios_extras#}:</strong></p>

    {foreach from=$reserva->extras item=extra}
    <hr />
        <p> <strong>{$extra->inicio|date_format:"%e/%m/%Y"}</strong> {$extra->nombre} <strong>{$reserva->moneda->simbolo}{$extra->precioUnitario|number_format:2:',':' '}</strong></p>
    {if $extra->sesion && $extra->sesion|date_format:'%H:%M' ne '00:00'}{#Horario#}: <strong>{$extra->sesion|date_format:'%H:%M'}</strong>{/if}
        <p>{#localizador#}: <strong>{$extra->localizador}</strong></p>
        
        {if !$extra->pagoOffline}<p>{if $reserva->estado eq 'Aprobada'}{#Has_pagado#}{else}{#Pagaras#}{/if} ({$reserva->moneda->simbolo}{$extra->importeInicial|number_format:2:',':' '}) {#un#} {$extra->porcientoInicial}% {#de_la_reserva#} {if $extra->porcientoInicial < 100}({#Pagaras_el_resto#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}){/if}</p>{else}<p>{#Pagaras#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}</p>{/if}
        <p>{#telefono_de_contacto#}: <strong>{$extra->telefonoContacto}</strong></p>
        {if $extra->direccion && strlen($extra->direccion)}
            <p>{#direccion#}: {$extra->direccion}</p>
        {/if}
        
        {if $extra->eventoTpv}
            <p>{#Sugerencias_y_advertencias#}:</p>
            <p>{if $lang && $extra->eventoTpv->$lang}{$extra->eventoTpv->$lang}{else}{$extra->eventoTpv->es}{/if}</p>
        {/if}
    {/foreach}
<br />
{/if}

<p>{#Si_tienes_alguna_duda_sobre_tu_reserva_contacta_con#} {$hotel->emailReservas} {#o_llamando_a#} {$hotel->telefonoReservas}</p>

<p>{#ver_los_detalles_de_tu#}:<a href="{$vikahotel_url}/{$lang}/confirmacion/r_id:{$reserva->id}/mail:1{$end_url}">{$vikahotel_url}/{$lang}/confirmacion/r_id:{$reserva->id}/mail:1{$end_url}</a></p>
<div style="text-align: center; font-size: 10px; color: #cccccc;">
    <p>{#sistema_nombre#} system: {#empresa_nombre#} {#con_NIF#} {#empresa_cif#} {#y_con_domicilio_social_en#} {#empresa_direccion#} {#contacto#}: <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a></p>
</div>
</div>