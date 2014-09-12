<div style="font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; margin: 1.2em; font-family: Helvetica, Arial, sans-serif; font-size: 12px; line-height: 15px">

    <p>New Booking <strong>{$excursion->localizador}</strong></p><br>
    
    <p>Evento: <strong>{$excursion->nombre}</strong></p>
    <p>Fecha: <strong>{$excursion->inicio|date_format:"%e/%m/%Y"}</strong></p>
    {if $excursion->sesion && $excursion->sesion|date_format:'%H:%M' ne '00:00'}
        <p>Horario: <strong>{$excursion->sesion|date_format:"%H:%M"}</strong></p>
    {/if}<br><br>
    
    {if $excursion->entradasList && count($excursion->entradasList)}
        <p>Tickets: <strong>{$excursion->tickets}</strong></p>
        {foreach from=$excursion->entradasList item=entrada}
        <p><strong>{$entrada->entrada}: {$entrada->entradas}</strong></p>
        {/foreach}
    {/if}
    
    <p>Total: {$currency}{$excursion->precioUnitario|number_format:2:',':' '}</p>
    {if $excursion->importeInicial}
        Se ha pagado <strong>{$excursion->porcientoInicial}% ({$currency}{$excursion->importeInicial|number_format:2:',':' '})</strong>(el resto se pagará {$excursion->modoPagoOffline})
    {else}
        <strong>Se pagará {$excursion->modoPagoOffline}</strong>
    {/if}<br>
    
    <p>Datos del cliente: </p>
    <p>Nombre: <strong>{$usuario['nombre']} {$usuario['apellido']}</strong></p>
    {if $reserva->usuario->pais}<p>País: <strong>{$reserva->usuario->pais->nombre}</strong></p>{/if}
    <p>Telefono: <strong>{$usuario['telefono']}</strong></p>
    <p>Email: <strong>{$usuario['email']}</strong></p><br>

    <p>Alojamiento: <strong>{$hotel->nombre}</strong></p>
    <p>Llegada: <strong>{$reserva->alojamiento[0]->inicio|date_format:"%e/%m/%Y"}</strong></p>
    <p>Teléfono: <strong>{$hotel->telefonoReservas}</strong></p>
    <p>{$hotel->direccion->descripcion}</p>
    <p>Latitud: {$hotel->direccion->lat}, Longitud: {$hotel->direccion->lon}</p>
    <br><br>

    <p>Si tienes alguna duda, consúltalo con {$hotel->emailReservas} o llamando a {$hotel->telefonoReservas}</p>

    <div style="text-align: center; font-size: 10px; color: #cccccc;">
        <p>{#sistema_nombre#} system: {#empresa_nombre#} {#con_NIF#} {#empresa_cif#} {#y_con_domicilio_social_en#} {#empresa_direccion#} {#contacto#}: <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a></p>
    </div>

</div>