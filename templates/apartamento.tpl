{if $apartamentos|@count gt 0}
    <label class="search-title">{#filtra_segun_tu_criterio#}:</label>
    <p class="text-center legend">{#los_filtros_te_ayudaran#}</p>
    <div id="search-room-filter" class="well-gray">
        {if count($pensiones) > 1}
            <label class="control-label">{#tipo_pension#}:</label>
            <select class="select2" id="pension">
                <option value="0" selected="selected">{#cualquiera#}</option>
                {foreach from=$pensiones item=pension}
                    <option value="{$pension}">{$pension}</option>
                {/foreach}
            </select>
        {/if}
        {if count($paxes) > 1}
            <label class="control-label">{#cantidad_de_personas#}:</label>
            <select class="select2" id="pax">
                <option value="0" selected="selected">{#cualquiera#}</option>
                {foreach from=$paxes item=pax}
                    <option value="{$pax['adultos']} {#Adulto_s#} {if $pax['ninios']}+ {$pax['ninios']} {#niho_s#}{/if}">
                        {$pax['adultos']} {#Adulto_s#} {if $pax['ninios']}+ {$pax['ninios']} {#niho_s#}{/if}
                    </option>
                {/foreach}
            </select>
        {/if}
    </div>

    {foreach from=$apartamentos key=k item=apartamento name=aptos}
        {if $apartamento['descripcion']}
            {if !$smarty.foreach.aptos.first}
                </div>
            {/if}
            <div class="one-apartment">
            <div class="room_container has_description">
                <h3>{$apartamento['titulo']}</h3>
                <div class="row room_info_container">
                    <div class="col-md-3">
                        <div class="flexslider">
                            <ul class="slides">
                                {foreach from=$apartamento['imagenes'] item=imagen}
                                    <li class="slide">
                                        <img src="{$imagen}" alt="{$apartamento['titulo']}">
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <p>{$apartamento['descripcion']}</p>
                        <p><a type="button" class="btn btn-primary btn-xs pull-left toggle_detalles">+ {#mostrar_detalle#}</a></p>
                        <br class="clear" />
                        <table class="table table-striped table-hover descripcion_table">
                            <thead>
                            <tr>
                                <th>{#descripcion_del_servicio#}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$apartamento['servicios'] item=servicio}
                                <tr>
                                    <td>{$servicio}</td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="room_container hasnt_description">
                <input type="hidden" name="condicion" value="{$apartamento['condicion']}">
                <input type="hidden" name="pension" value="{$apartamento['pension']}">
                <input type="hidden" name="pax" value="{$apartamento['adultos']} {#Adulto_s#} {if $apartamento['ninios']}+ {$apartamento['ninios']} {#niho_s#}{/if}">
                <div class="row room_info_container">
                    <div class="col-md-6">
                        {if $apartamento['pension'] && $apartamento['pension'] != ''}
                            <h5>{$apartamento['pension']}</h5>
                        {else}
                            <h5>{#solo_alojamiento#}</h5>
                        {/if}
                        <p class="pax">
                            {#Max#}: {$apartamento['adultos']} {#Adulto_s#} {if $apartamento['ninios']}+ {$apartamento['ninios']} {#niho_s#}{/if}
                        </p>
                        {if $apartamento['condicion'] != ''}
                            <h5 class="free-cancel">{$apartamento['condicion']}</h5>
                        {/if}
                        {if $apartamento.descuento}
                            <div class="publicitary-text">
                                <p class="text-left by_this_booking">{#descuento_promocional_de#} {$apartamento.descuento}{if $apartamento.tipoDescuento eq '%'}%{else}{$currency}{/if}  {if $apartamento.condicionOnline}({#condicion_de_pago_online#} {if $apartamento.pagoOnline}{$apartamento.pagoOnline}%{/if}){/if}</p>
                            </div>
                        {/if}
                        <div class="publicitary-text">
                            <p class="text-left by_this_booking cupon">✓ {#por_esta_reserva_superior_a#} <span class="monto_regla"><strong>{$apartamento['precio']}</strong></span> {#obtendras_un_cupon_por_un_valor_de#} <strong><span class="descuento_regla">20,00€</span> </strong>{#para_excursiones_Trasfer_y_mas#}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="text-right form">
                            <span class="precio_total" style="display: none;"><span>{$apartamento['precio']}</span></span>
                            <form action="{$base_url}/buy{$end_url}/id:{$k}">
                                <div class="comparison-content">
                                    <div class="oasis-comparison">
                                        <div class="">
                                            <img src="{if $hotel->logo}{$hotel->logo->ruta}{else}{$template_url}/images/logo.png{/if}" alt="{$hotel->nombre}" />
                                            {if $hotel->config->comparacionBooking}
                                                {$hotel->dominioOficial|replace:"www.":""}
                                            {/if}
                                        </div>
                                        <div class="per-night">

                                            <button type="submit">
                                                <span data-html="true" data-container="body" data-placement="left" data-toggle="popover" data-content="{foreach from=$monedas item=moneda}{if $apartamento['precios'][$moneda->codigo]}<p>{$moneda->codigo} {$apartamento['precios'][$moneda->codigo]}</p>{/if}{/foreach}" class="glyphicon glyphicon-info-sign"></span><span>{$apartamento['precio_moneda_seleccionada']}{$apartamento['precio_moneda_seleccionada_especulado']}</span>

                                                <small>{#por#} {$noches} {#noche_s#}</small>
                                            </button>
                                        </div>
                                    </div>


                                    {if $hotel->config->comparacionBooking}
                                        <div class="booking-comparison">
                                            <div class="">booking.com</div>
                                            <div class="per-night" data-html="true" data-container="body" data-placement="left" data-toggle="popover" data-content="{foreach from=$monedas item=moneda}{if $apartamento['precios_sin_descuento'][$moneda->codigo]}<p>{$moneda->codigo} {$apartamento['precios_sin_descuento'][$moneda->codigo]}</p>{/if}{/foreach}">
                                                <span title="sin descuento">{$apartamento['precio_sin_descuento']}</span>
                                                <small>{#por#} {$noches} {#noche_s#}</small>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        {else}
            <div class="room_container hasnt_description">
                <input type="hidden" name="condicion" value="{$apartamento['condicion']}">
                <input type="hidden" name="pension" value="{$apartamento['pension']}">
                <input type="hidden" name="pax" value="{$apartamento['adultos']} {#Adulto_s#} {if $apartamento['ninios']}+ {$apartamento['ninios']} {#niho_s#}{/if}">
                <div class="row room_info_container">
                    <div class="col-md-6">
                        {if $apartamento['pension'] && $apartamento['pension'] != ''}
                            <h5>{$apartamento['pension']}</h5>
                        {/if}
                        <p class="pax">
                            {#Max#}: {$apartamento['adultos']} {#Adulto_s#} {if $apartamento['ninios']}+ {$apartamento['ninios']} {#niho_s#}{/if}
                        </p>
                        {if $apartamento['condicion'] != ''}
                            <h5 class="free-cancel">{$apartamento['condicion']}</h5>
                        {/if}
                        {if $apartamento.descuento}
                            <div class="publicitary-text promotion-text">
                                <p class="text-left by_this_booking">{#descuento_promocional_de#} {$apartamento.descuento}{if $apartamento.tipoDescuento eq '%'}%{else}{$currency}{/if}  {if $apartamento.condicionOnline}({#condicion_de_pago_online#} {if $apartamento.pagoOnline}{$apartamento.pagoOnline}%{/if}){/if}</p>
                            </div>
                        {/if}
                        <div class="publicitary-text" style="display:none;">
                            <p class="text-left by_this_booking cupon">✓ {#por_esta_reserva_superior_a#} <span class="monto_regla"><strong>{$apartamento['precio']}</strong></span> {#obtendras_un_cupon_por_un_valor_de#} <strong><span class="descuento_regla">20,00€</span> </strong>{#para_excursiones_Trasfer_y_mas#}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="text-right form">
                            <span class="precio_total" style="display: none;"><span>{$apartamento['precio']}</span></span>
                            <form action="{$base_url}/{$lang}/buy{$end_url}/id:{$k}">
                                <div class="comparison-content">
                                    <div class="oasis-comparison">
                                        <div class="">
                                            <img src="{if $hotel->logo}{$hotel->logo->ruta}{else}{$template_url}/images/logo.png{/if}" alt="{$hotel->nombre}" /> {if $hotel->config->comparacionBooking}
                                                {$hotel->dominio|replace:"www.":""}
                                            {/if}
                                        </div>
                                        <div class="per-night">
                                            <button type="submit" type="submit">
                                                <span data-html="true" data-container="body" data-placement="left" data-toggle="popover" data-content="{foreach from=$monedas item=moneda}{if $apartamento['precios'][$moneda->codigo]}<p>{$moneda->codigo} {$apartamento['precios'][$moneda->codigo]}</p>{/if}{/foreach}" class="glyphicon glyphicon-info-sign"></span><span>{$apartamento['precio_moneda_seleccionada']}</span>

                                                <small>{#por#} {$noches} {#noche_s#}</small>
                                            </button>
                                        </div>
                                    </div>

                                    {if $hotel->config->comparacionBooking}
                                        <div class="booking-comparison">
                                            <div class="">booking.com</div>
                                            <div class="per-night" data-html="true" data-container="body" data-placement="left" data-toggle="popover" data-content="{foreach from=$monedas item=moneda}{if $apartamento['precios_sin_descuento'][$moneda->codigo]}<p>{$moneda->codigo} {$apartamento['precios_sin_descuento'][$moneda->codigo]}</p>{/if}{/foreach}">
                                                <span>{$apartamento['precio_sin_descuento']}</span>
                                                <small>{#por#} {$noches} {#noche_s#}</small>
                                            </div>
                                        </div>
                                    {/if}
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        {if $smarty.foreach.aptos.last}
            </div>
        {/if}
    {/foreach}
    <input type="hidden" id="reglas" value='{$reglas}'>
    <div id="contact" class="well-gray" data-href="{$base_url}/{$lang}/{#contacto_url#}{$end_url}">
    </div>
{else}
    {*<p class="text-center">{#lo_sentimos_en_las_fechas_que_has_buscado#} <strong>{$hotel->nombre}</strong> {#no_tiene_disponibilidad#}</p>*}
    {*<div class="row hotel_container dontfind">*}
        {*<div class="row-fluid">*}
            {*<div class="col-sm-7">*}
                {*<h2 class="text-center">{#no_encuentras_lo_que_buscas#}</h2>*}
                {*<p class="text-center legend">{#dejanos_tu_email_y_te_ayudaremos#}</p>*}

            {*</div>*}
            {*<div class="col-sm-5">*}
                {*<div class="row-fluid text-center">*}
                    {*<a href="{$base_url}/{$lang}/{#contacto_url#}" class="btn btn-warning">{#contacta_con_nosotros#} ❯</a>*}
                {*</div>*}
            {*</div>*}
            {*<div class="clearfix"></div>*}
        {*</div>*}
    {*</div>*}
{/if}
{if $hotel->destinoId}
    <div id="recommendation-hotels" class="well-white well-divider">
        <div class="title">
            <h3>{#otros_hoteles_recomendados_zona#}</h3>
        </div>
        <div id="recommendation-hotels-list" class="row booking-prompt" startitem="{$hoteles.start}" hotel="{$hotel->id}" itemsbypage="{$hoteles.limit}" totalitems="{$hoteles.count}">
            {foreach from=$hoteles item=h}
                {if is_array($h) && $h.id}
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 booking-prompt-item mix">
                        <h3>{$h.nombre}</h3>
                        <div class="media">
                            <div class="pull-left">
                                <img class="media-object" src="{$h.archivo.ruta}" alt="{$h.nombre}">
                                <div class="rating">
                                    {for $i = 1 to 5}
                                        <i class="glyphicon glyphicon-star {if $h->calidad >= $i}full{else}empty{/if}"></i>
                                    {/for}
                                </div>
                            </div>
                            <div class="media-body">
                                {if $h.precio.precioMinimo}
                                    <h4 class="media-heading">{#Desde#} {$h.precio.precioMinimo}{$h.moneda.simbolo}</h4>
                                    <a href="{if strtotime($h.precio.fin) > time()}{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}/disponibilidad?inicio={if strtotime($h.precio.inicio) > time()}{$h.precio.inicio|date_format:"%d-%m-%Y"}{else}{date("d-m-Y")}{/if}&salida={$h.precio.fin|date_format:"%d-%m-%Y"}{/if}" class="btn app-btn-pink">
                                        {#reservar#|capitalize}
                                    </a>
                                {else}
                                    <a href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}" class="btn app-btn-pink">{#reservar#|capitalize}</a>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
            {/foreach}
        </div>
        <div class="" {if ($hoteles.start + count($hoteles) - 3) == $hoteles.count}style="display:none;"{/if}>
            <div id="pagination"></div>
        </div>
    </div>
{/if}