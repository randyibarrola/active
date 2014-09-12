{if $pagar_ahora && !($hotel->tipoReserva eq 'cobro anticipado de comisiones')}     
    <h3 class="panel-title">{#cobraremos_de_tu_tarjeta#} <span class="cobro_anticipado">{$cobro_anticipado}</span> {#en_concepto_de#}:</h3><p/>
    {if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}
    <p>✓ {#garantia_de_tu_reserva#} {$apartamento->titulo} {$hotel->porcentageCobroAnticipado}% <span id="cobraremos-tarjeta">{$currencyHotel}{$cobro_anticipado_hotel}</span></p>
    {else}
    <p> {$apartamento->titulo} <span id="cobraremos-tarjeta">{$apartamento->precio}({#lo_pagaras_en_tu_llegada_al_hotel#})</span></p>
    {/if}
    {if $reservas_excursiones}
        {foreach from=$reservas_excursiones item=exc}
            {if $exc['forma_cobro'] eq 'online'}
                <p id="cobrar_{$exc['time-id']}">✓ {#garantia_de_tu_reserva#} {$exc['evento']} {$exc['porcientoInicial']}%  <span>{$exc['totalInicial']}</span></p>
            {else}
                <p id="cobrar_{$exc['time-id']}"> {$exc['evento']} ({#lo_pagaras#} {$exc['forma_cobro_offline']})</p>
            {/if}
        {/foreach}
    {/if}
{else}
    {if $hotel->tipoReserva eq 'offline'}
        <h3 class="panel-title">{#en_tu_llegada_a_hotel#} {$hotel->nombre} {#pagaras#} :</h3><p/>
        <p>✓ {$apartamento->titulo} <span id="cobraremos-hotel">{$apartamento->precioTotal_format}</span></p>
        {if $reservas_excursiones}
            {foreach from=$reservas_excursiones item=exc}
                <p id="cobrar_{$exc['time-id']}">✓ {$exc['evento']} <span>{$exc['total_format']} ({#lo_pagaras#} {$exc->forma_cobro_offline})</span></p>
            {/foreach}
        {/if}   
    {else}
        <h3 class="panel-title">{#requiere_tarjeta_de_credito#}</h3>
        <p>{#pago_se_realizara#} {$hotel->nombre} {#durante_tu_estancia#}</p>
        {if $reservas_excursiones}
        {foreach from=$reservas_excursiones item=exc}
            {if $exc['forma_cobro'] eq 'online'}
                <p id="cobrar_{$exc['time-id']}">✓ {#garantia_de_tu_reserva#} {$exc['evento']} {$exc['porcientoInicial']}%  <span>{$exc['totalInicial']}</span></p>
            {else}
                <p id="cobrar_{$exc['time-id']}"> {$exc['evento']} ({#lo_pagaras#} {$exc['forma_cobro_offline']})</p>
            {/if}
        {/foreach}
    {/if}
    {/if}
{/if}