<div style="width: 500px; font-size: 11px;">
    <img height="55" src="{$template_url}/images/logo_m.png" ><br>
    <div style="padding: 10px 0 0 30px;">
        <table style="border: none; width: 80%; color: #3D89CD; font-size: 12px;">
            <tr>
                <td style="width: 40%;">
                    {#Datos_del_cliente#}
                </td>
                <td style="width: 60%;">
                    {#factura#} {$numero}
                </td>
            </tr>
            <tr>
                <td>
                    {#nombre#}: {$reserva->usuario->nombre} <br>
                    {#apellido#}: {$reserva->usuario->apellido} <br>
                    {#email#}: {$reserva->usuario->email} <br>
                    {#telefono#}: {$reserva->usuario->telefono} <br>
                    {#pais_de_residencia#}: {$reserva->usuario->pais->nombre}
                </td>
                <td>
                    {#Empresa#}: {$hotel->distribuidor->nombreFiscal} <br>
                    {#CIF#}: {$hotel->distribuidor->numeroFiscal} <br>
                    {#email#}: {$hotel->distribuidor->emailReservas} <br>
                    {#telefono#}: {$hotel->distribuidor->telefonoReservas} <br>
                </td>
            </tr>
        </table>
        <h1 style="color: #333333; margin: 0;padding-top:10px;margin-top:10px;">{#localizador#} {$reserva->localizador}</h1>
        <h3 style="color: #3D89CD; border-bottom: 1px dashed #333333; margin: 0; font-size: 12px;padding-bottom:10px;">{#Cargos_facturados#}</h3>
        <div style="padding: 0; font-size: 12px;padding-bottom:10px;">
            <table style="border: none; width: 100%; color: #3D89CD; border-top: 1px dashed #333333;">
                <tr>
                    <td style="width: 70%;">
                        {#garantia_de_tu_reserva#} {$hotel->nombre}
                    </td>
                    <td rowspan="2">
                        {$reserva->moneda->simbolo} {if $negativo}-{/if}{$reserva->alojamiento[0]->importeInicial|number_format:2:',':' '}
                    </td>
                </tr>
                <tr>
                    <td>
                        {$noches} {#noche_s#} {#en#} {$reserva->alojamiento[0]->nombre} 
                    </td>

                </tr>
            </table>
            <p style="color: #3D89CD;">
                {if $reserva->alojamiento[0]->pension}
                    {$reserva->alojamiento[0]->pension}<br>
                {/if}
                {if $reserva->alojamiento[0]->condicion}
                    {$reserva->alojamiento[0]->condicion}<br>
                {/if}
                {if $reserva->cart}
                    {#Pax#}: {$reserva->cart->apto->adultos} {#Adulto_s#} {if $reserva->cart->apto->ninios}{$reserva->cart->apto->ninios}+ {#niho_s#}{/if}<br>
                {/if}
                {#entrada#}: {$reserva->alojamiento[0]->inicio|date_format:"%d/%m/%Y"}<br>
                {#salida#}: {$reserva->alojamiento[0]->final|date_format:"%d/%m/%Y"}<br>
            </p>
            {if !$negativo}
            <div style="font-size: 11px; color: #333333;  width: 80%;">
                {if $reserva->estado eq 'Aprobada'}{#Has_pagado#}{else}{#Pagaras#}{/if} {#un#} <strong>{$reserva->alojamiento[0]->porcientoInicial}%({$reserva->moneda->simbolo} {$reserva->alojamiento[0]->importeInicial|number_format:2:',':' '})</strong> {#de_la_reserva_en_c_d#}
            </div>
            {/if}
            {if $reserva->extras && count($reserva->extras) > 0}
                <br />
                <h3 style="color: #3D89CD; margin: 0; font-size: 12px;padding-bottom:10px;">{#servicios_extras#}:</h3>
                <table style="border: none;width: 100%;color: #3D89CD;font-size: 12px;border-top: 1px dashed #333333;">
                {foreach from=$reserva->extras item=extra}
                    <tr>
                        <td style="width:70%;">
                            {$extra->inicio|date_format:"%e/%m/%Y"}  {$extra->nombre}
                        </td> 
                        <td rowspan="2">
                            {$reserva->moneda->simbolo} {if $negativo}-{/if}{$extra->precioUnitario|number_format:2:',':' '}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding: 0 0 10px 0;">                
                            {#localizador#}: <strong>{$extra->localizador}</strong><br>

                            {if !$extra->pagoOffline}{if $reserva->estado eq 'Aprobada'}{#Has_pagado#}{else}{#Pagaras#}{/if} ({$reserva->moneda->simbolo} {if $negativo}-{/if}{$extra->importeInicial|number_format:2:',':' '}) {#un#} {$extra->porcientoInicial}% {#de_la_reserva#} {if $extra->porcientoInicial < 100}({#Pagaras_el_resto#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}){/if}{else}{#Pagaras#} {$smarty.config.{$exc->modoPagoOffline|replace:' ':'_'|replace:'í':'i'|replace:'ó':'o'}}{/if}<br>
                            {#telefono_de_contacto#}: {$extra->telefonoContacto}<br>
                            {if $extra->direccion && strlen($extra->direccion)}
                                {#direccion#}: {$extra->direccion}<br>
                            {/if}

                            
                        </td>
                    </tr>
                {/foreach}
                </table>
            {/if}
        </div>
        <table style="border: none; border-top: 1px solid #333333; width: 80%;padding-top:0px;margin:0px;">
            <tr>
                <td style="width:100%;">
                    <h1 style="color: #333333;text-align: right;padding-top:5px;margin:0;">{#total#} {$reserva->moneda->simbolo} {if $negativo}-{/if}{$reserva->alojamiento[0]->importeInicial|number_format:2:',':' '}</h1>
                </td>
            </tr>
        </table>
                <p style="font-size: 10px; color: #333333;">
            {#Si_tienes_alguna_duda_sobre_tu_reserva_contacta_con#} :<br />{$hotel->emailReservas} {#o_llamando_a#} {$hotel->telefonoReservas}
        </p>

        <p style="font-size: 10px; color: #333333;">
            {#ver_los_detalles_de_tu#}:<a href="{$vikahotel_url}/{$lang}/confirmacion/r_id:{$reserva->id}/mail:1{$end_url}">{$vikahotel_url}/{$lang}/confirmacion/r_id:{$reserva->id}/mail:1{$end_url}</a>
        </p>
        <div style="text-align: center; font-size: 10px; color: #cccccc;">
            <p>{#sistema_nombre#} system: {#empresa_nombre#} con CIF {#empresa_cif#} y con domicilio social en {#empresa_direccion#}. Contacto: <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a></p>
        </div>
    </div>
</div>