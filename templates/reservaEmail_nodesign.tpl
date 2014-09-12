<div style="font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; margin: 1.2em; font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15px; max-width: 800px;">

    <h2><img height="50" src="{$template_url}/images/logo_s.png"></h2>
    <p>New Booking <strong>{$reserva->localizador}</strong> [Contrato {$campania->localizador}]</p><br>
    
    <p>Datos del cliente: </p>
    <p>Nombre: <strong>{$usuario['nombre']} {$usuario['apellido']}</strong></p>
{if $reserva->usuario->pais}<p>País: <strong>{$reserva->usuario->pais->nombre}</strong></p>{/if}
<p>Telefono: <strong>{$usuario['telefono']}</strong></p>
<p>Email: <strong>{$usuario['email']}</strong></p><br>

<p><strong>En {$hotel->nombre}: </strong></p>
<p><strong>{$noches} noche{if $noches > 1}s{/if}</strong> en {$reserva->alojamiento[0]->nombre} <strong>{$reserva->moneda->simbolo}{$reserva->alojamiento[0]->precioUnitario|number_format:2:',':' '}</strong></p>

{if $reserva->alojamiento[0]->porcientoInicial && $reserva->alojamiento[0]->importeInicial}
    <p>Ha pagado un <strong>{$reserva->alojamiento[0]->porcientoInicial}%({$reserva->moneda->simbolo}{$reserva->alojamiento[0]->importeInicial|number_format:2:',':' '})</strong> de la reserva en concepto de comisiones, el resto lo pagará según las condiciones de pago preestablecidas por {$hotel->nombre}.</p>
{/if}

<p style="color:red;">Importe pendiente a cobrar por 
<strong>{$hotel->nombre} {$reserva->moneda->simbolo}
    {math equation="x - y" x=$reserva->alojamiento[0]->precioUnitario y=$reserva->alojamiento[0]->importeInicial format="%.2f"}
</strong>
</p>

{if $reserva->alojamiento[0]->pension}
    <p><b>{$reserva->alojamiento[0]->pension}</b></p>
{/if}
{if $reserva->alojamiento[0]->condicion}
    <p><b>{$reserva->alojamiento[0]->condicion}</b></p>
{/if}
{if $reserva->cart}
    <p>{#Pax#}: <strong>{$reserva->cart->apto->adultos} {#Adulto_s#} {if $reserva->cart->apto->ninios}{$reserva->cart->apto->ninios}+ {#niho_s#}{/if}</strong></p>
{/if}

<p>Entrada: <strong>{$entrada|date_format:"%e/%m/%Y"}</strong></p>
<p>Salida: <strong>{$salida|date_format:"%e/%m/%Y"}</strong></p>
{if $reserva->peticionesEspeciales && strlen(trim($reserva->peticionesEspeciales))}<p>{#Peticiones_especiales#}: {$reserva->peticionesEspeciales}</p>{/if}

{if $reserva->cart->apto->servicios}
    <p>
    {foreach from=$reserva->cart->apto->servicios item=servicio}
        {$servicio}<br>
    {/foreach}
    </p>
{/if}


<!--
{if $reserva->extras && count($reserva->extras) > 0}
    <p><strong>Servicios extras:</strong></p>
    {foreach from=$reserva->extras item=extra}
        <p>{$extra->nombre} <strong>{$reserva->moneda->simbolo}{$extra->precioUnitario|number_format:2:',':' '}{if $extra->pagoOffline}(lo pagara en recepción){/if}</strong></p>
        <p>{$extra->inicio|date_format:"%e/%m/%Y"}</p>
    {/foreach}
{/if}-->


<br><br>
<p>Si tiene alguna duda consulte con {$hotel->distribuidor->emailReservas} o llamando a {$hotel->distribuidor->telefonoReservas}</p>
<br>
<p>Puedes ver los detalles de esta reserva en <a href="{$reserva_url}">{$reserva_url}</a></p>

<div style="text-align: center; font-size: 10px; color: #cccccc;">
    <p>{#sistema_nombre#} system: {#empresa_nombre#} con CIF {#empresa_cif#} y con domicilio social en {#empresa_direccion#}. Contacto: <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a></p>
</div>

</div>