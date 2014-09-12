<div
	style="font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; margin: 1.2em; font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15px">

    <h3 style="color:#428BCA">Tus datos</h3><br>
<strong>Nombre: </strong>{$usuario->nombre} {$usuario->apellido}<br>
<strong>Email: </strong>{$usuario->email}<br><br>

<h3 style="color:#428BCA">Tus reservas</h3><hr>
{foreach from=$reservas item=reserva name=r}
<p><h4 style="color:#428BCA">reserva con localizador {$reserva->localizador} registrada el {$reserva->tiempoCreacion|date_format:"%d/%m/%Y"}</h4></p>
<p>{$noches} noche{if $noches > 1}s{/if} en {$reserva->alojamiento[0]->nombre} {$reserva->moneda->simbolo}{$reserva->alojamiento[0]->precioUnitario|number_format:2:',':' '}</p>
{if $reserva->alojamiento[0]->porcientoInicial}
<p>Has pagado un {$reserva->alojamiento[0]->porcientoInicial}%({$reserva->moneda->simbolo}{$reserva->alojamiento[0]->importeInicial|number_format:2:',':' '}) de la reserva del hotel para garantizarla, el resto lo pagarás en tu llegada al hotel.</p>
{else}
<p>Pagarás en tu llegada al hotel.</p>
{/if}
<p><strong>Entrada:</strong> {$entrada|date_format}</p>
<p><strong>Salida:</strong> {$salida|date_format}</p>
<p><strong>Peticiones especiales:</strong> {$reserva->peticionesEspeciales}</p>

{if $reserva->extras && count($reserva->extras) > 0}
    <p><strong>Servicios extras:</strong></p>
    {foreach from=$reserva->extras item=extra}
        <div style="width: 50%;"><hr></div>
        <p> {$extra->inicio|date_format:"%e/%m/%Y"} {$extra->nombre} <strong>{$reserva->moneda->simbolo}{$extra->precioUnitario|number_format:2:',':' '}</strong></p>
        <p>Localizador {$extra->localizador}</p>
        {if !$extra->pagoOffline}<p>Has pagado ({$reserva->moneda->simbolo}{$extra->importeInicial|number_format:2:',':' '}) un {$extra->porcientoInicial}% de la reserva {if $extra->porcientoInicial < 100}(Pagarás el resto {$extra->modoPagoOffline}){/if}</p>{else}<p>Pagarás {$extra->modoPagoOffline}</p>{/if}
        <p>Teléfono de contacto {$extra->telefonoContacto}</p>
    {/foreach}
{/if}
<br />
<p><strong>Estado: {$reserva->estado}</strong></p>
<p>Realizada desde <a href="{$reserva->urlOrigen}">{$reserva->urlOrigen}</a></p>
<p>puede consultar los detalles en <a href="{$vikahotel_url}/confirmacion/id:{dechex($reserva->id * 9999)}">{$vikahotel_url}/confirmacion/id:{dechex($reserva->id * 9999)}</a></p>
{if !$smarty.foreach.r.last}<hr><br><br>{/if}
{/foreach}<br><br>

<div style="text-align: center; font-size: 10px; color: #cccccc;">
    <p>{#sistema_nombre#} system: {#empresa_nombre#} con CIF {#empresa_cif#} y con domicilio social en {#empresa_direccion#}. Contacto: <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a></p>
</div>
</div>