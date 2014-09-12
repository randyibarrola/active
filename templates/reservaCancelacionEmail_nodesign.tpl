<div
	style="font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; margin: 1.2em; font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15px">
<h2><img height="50" src="{$template_url}/images/logo_s.png"></h2>
<p>La reserva con localizador {$reserva->localizador} fue cancelada.</p>
<p><strong>Datos: </strong></p>
<p>{$usuario->nombre} {$usuario->apellido}</p>
<p><strong>Reserva en {$hotel->nombre}: </strong></p>
<p>{$noches} {#noche_s#} {#en#} {$apartamento->nombre} {$currency}{$apartamento->precioUnitario|number_format:2:',':' '}</p>
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
<p><strong>{#Peticiones_especiales#}:</strong> {$reserva->peticionesEspeciales}</p>

<p><strong>{#Direccion_y_contacto#}:</strong></p>
<p>{#telefono#}: {$hotel->empresa->telefonoReservas}</p>
<p>{$hotel->direccion->descripcion}</p>
<p>{#latitud#} {$hotel->direccion->lat}, {#longitud#} {$hotel->direccion->lon}</p><!--
{if $reserva->extras && count($reserva->extras) > 0}
    <p><strong>Servicios extras:</strong></p>
    {foreach from=$reserva->extras item=extra}
        <p>{$extra->nombre} <strong>{$currency}{$extra->precioUnitario|number_format:2:',':' '}</strong></p>
        <p>{$extra->inicio|date_format:"%e/%m/%Y"}</p>
    {/foreach}
{/if}-->

<p><strong>Información del pago:</strong></p>
<p>Se ha pagado un {$hotel->porcentageCobroAnticipado}% de la reserva en concepto de comisiones, el resto lo pagaría en su llegada al hotel.</p>

<p>
{if $hotel->informacionesCompra}
    {if $hotel->informacionesCompra->$lang}
        {$hotel->informacionesCompra->$lang}
    {else}
        {$hotel->informacionesCompra->es}
    {/if}
{/if}
</p>

<br><br>
<div style="text-align: center; font-size: 10px; color: #cccccc;">
    <p>{#sistema_nombre#} system: {#empresa_nombre#} con CIF {#empresa_cif#} y con domicilio social en {#empresa_direccion#}. Contacto: <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a></p>
</div>
</div>

