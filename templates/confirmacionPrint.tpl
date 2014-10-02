<!DOCTYPE html>
<html>
<head>
    <title>Confirmación</title>
    <link href="{$template_url}/css/bootstrap.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Open+Sans:400,700" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="{$template_url}/css/confirmacion.css" /> 
    <link rel="stylesheet" type="text/css" href="{$template_url}/css/print.css" /> 
    <script src="{$template_url}/js/jquery.js"></script>
    <script src="{$template_url}/js/print.js"></script>  
</head>
<body>
<div class="row-fluid clearfix top_content_container">
    <div>
        <div class="main_content book-confirmation">
            <div class="book-confirmation-inner">
                <div class="row">
                    <div class="col-xs-12">
                        <h2><img height="50" src="{$template_url}/images/logo_b.png"></h2>
                    </div>
                    <div class="col-xs-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h5 class="panel-title">{#comprueba_los_datos#}</h5>
                            </div>
                            <div class="panel-body">
                                <address>
                                    <p><strong>{#numero_de_reserva#}: </strong> {$reserva->localizador}</p>
                                    <p><strong>{#entrada#}: </strong> {$inicio}</p>
                                    <p><strong>{#salida#}: </strong> {$salida}</p>
                                    <p><strong>{#noches#}: </strong> {$noches} noche{if $noches > 1}s{/if}</p>
                                    <p><strong>{#nombre_del_cliente#}: </strong> {$usuario->nombre} {$usuario->apellido}</p>
                                    <p><strong>{#email#}: </strong> {$usuario->email}</p>
                                    <p><strong>{#nombre_del_cliente#}: </strong> {$usuario->nombre} {$usuario->apellido}</p>
                                    {foreach from=$reserva->productos item=producto}
                                        <p><strong>{$producto->nombre}: </strong>
                                            {$reserva->moneda->simbolo} {$producto->precioUnitario|number_format:2:',':'.'}</p>
                                         {if $producto->pension}    
                                        <p>{$producto->pension}</p>
                                        {/if}
                                        {if $producto->condicion}    
                                        <p>{$producto->condicion}</p>
                                        {/if}
                                    {/foreach}
                                    <p><strong>{#precio_total#}: </strong> {$reserva->moneda->simbolo} {$reserva->total|number_format:2:',':'.'}</p>

                                    {if $reserva->peticionesEspeciales && strlen(trim($reserva->peticionesEspeciales))}
                                        <p>{#Peticiones_especiales#}: {$reserva->peticionesEspeciales}</p>
                                    {/if}

                                    {if $reserva->cart->apto->servicios}
                                        <p>
                                        {foreach from=$reserva->cart->apto->servicios item=servicio}
                                            {$servicio}<br>
                                        {/foreach}
                                        </p>
                                    {/if}

                                </address>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h5 class="panel-title">{$hotel->nombre}</h5>
                            </div>
                            <div class="panel-body">
                                <address>
                                    <p><strong>{#direccion#}: </strong> {$hotel->direccion->descripcion}</p>
                                    <p><strong>{#telefono#}: </strong> {$hotel->empresa->telefonoReservas}</p>
                                    <p><strong>{#correo_electronico#}: </strong> {$hotel->empresa->emailReservas}</p>
                                    <p><strong>{#informacion_para_el_viaje#}: </strong> Latitude {$hotel->direccion->lat}, Longitud {$hotel->direccion->lon}</p>
                                    <p><strong>{#alojamiento#}: </strong> {$apartamento->nombre}</p>
                                </address>
                            </div>
                        </div>
                    </div>
                </div>
           
                <!--<div class="row">
                    <div class="col-xs-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h5 class="panel-title">{#datos_de_la_empresa#}</h5>
                            </div>
                            <div class="panel-body">
                                <p><strong>{#nombre#}: </strong> {$hotel->empresa->nombreComercial}</p>
                                <p><strong>{#direccion#}: </strong> {$hotel->empresa->direccion->descripcion}</p>
                                <p><strong>{#telefono#}: </strong> {$hotel->empresa->telefonoReservas}</p>
                                <p><strong>{#correo_electronico#}: </strong> {$hotel->empresa->emailReservas}</p>
                            </div>
                        </div>
                    </div> 
                    <div class="col-xs-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h5 class="panel-title">{$hotel->distribuidor->nombreComercial}</h5>
                            </div>
                            <div class="panel-body">
                                <p><strong>{#direccion#}: </strong> {$hotel->distribuidor->direccion->descripcion}</p>
                                <p><strong>{#telefono#}: </strong> {$hotel->distribuidor->telefonoReservas}</p>
                                <p><strong>{#correo_electronico#}: </strong> {$hotel->distribuidor->emailReservas}</p>
                            </div>
                        </div>
                    </div>
                </div>-->
           
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h5 class="panel-title">{#informacion_del_pago#}</h5>
                            </div>
                            <div class="panel-body">
                                <h5>{if count($reserva->pagos)}{#cobramos_de_tu_tarjeta#} {$reserva->moneda->simbolo}{$reserva->pagos[0]->importe|number_format:2:",":''} {#en_concepto_de#}{else}{#en_tu_llegada_a_hotel#} {$hotel->nombre} {#pagaras#}{/if}:</h5>
                            {if $hotel->tipoReserva}
                            {assign var=$precio value=$apartamento->precioUnitario}
                            {/if}
                            <p><strong>{if $hotel->tipoReserva ne 'offline'}✓ {#garantia_de_tu_reserva#}{else} {/if} {$apartamento->nombre} {if $hotel->tipoReserva ne 'offline'}{$hotel->porcentageCobroAnticipado}%{/if} <span id="cobraremos-tarjeta">{$reserva->moneda->simbolo}{if $hotel->tipoReserva ne 'offline'}{($apartamento->precioUnitario*$hotel->porcentageCobroAnticipado/100)|number_format:2:',':''}{else}{$apartamento->precioUnitario|number_format:2:',':''}(Pagarás en tu llegada al hotel){/if}</span></strong></p>
                                    
                                    {if $reserva->extras}
                                        {foreach from=$reserva->extras item=exc}
                                            <!--<p id="cobrar_{$exc->id}">{if $exc->pagoOffline}✘{else}✓{/if} {$exc->nombre} {$exc->porcientoInicial}% <span>{$reserva->moneda->simbolo} {$exc->importeInicial|number_format:2:',':''} {if $exc->pagoOffline}(lo pagarás en recepción){/if}</span></p>-->
                                            <p id="cobrar_{$exc->id}">
                                            {if $exc->pagoOffline}
                                                {$exc->nombre} <span>{$reserva->moneda->simbolo}{$exc->precioUnitario|number_format:2:',':' '}(lo pagarás en {$exc->modoPagoOffline})</span>
                                            {else}
                                                ✓ {$exc->nombre} {$exc->porcientoInicial}% <span>{$reserva->moneda->simbolo}{$exc->importeInicial|number_format:2:',':''} {if $exc->porcientoInicial < 100}(pagarás el resto {$exc->modoPagoOffline}){/if}</span>
                                            {/if}
                                            </p>
                                        {/foreach}
                                    {/if}
<hr />
                                    <p>Si tienes alguna duda sobre tu reserva, contacta con {$hotel->emailReservas} o llamando a {$hotel->telefonoReservas}</p>
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
                    
                </div>
                <!--<div class="row">
                    <div class="col-xs-12">
                    <div class="row">
                    <div class="col-xs-12">
                        Consulta las condiciones de compra:
                         {if $hotel->condiciones}
                            {foreach from=$hotel->condiciones item=condicion}
                                <a href="{$vikahotel_url}/condiciones/id:{$condicion->id}">
                                    <strong>{if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}</strong>
                                </a><br>
                            {/foreach}
                        {/if}
                    </div>
                </div>
                </div>
                </div>-->
            </div>
        </div>
    </div>
</div>
</body>
</html>
