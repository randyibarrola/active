{if $apartamentos|@count gt 0}
    <div class="row-fluid">
        <div class="row-fluid filtros_list">           
            <div class="col-md-7">
                <h2 class="text-center">{#filtra_segun_tu_criterio#}</h2>
                <p class="text-center legend">{#los_filtros_te_ayudaran#}</p>
            {if count($paxes) > 1}
            <div class="item_filtros">
                <div class="form-group">
                    <select class="form-control apto-filter" id="pax">
                        <option value="0">{#Filtra_por_Pax#}</option>
                        {foreach from=$paxes item=pax}                            
                            <option>{$pax['adultos']} {#Adulto_s#} {if $pax['ninios']}+ {$pax['ninios']} {#niho_s#}{/if}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            {/if}
            {if count($pensiones) > 1}
            <div class="item_filtros">
                <div class="form-group">
                    <select class="form-control apto-filter" id="pension">
                        <option value="0">{#Filtra_por_Pensiones#}</option>
                        {foreach from=$pensiones item=pension}
                            <option>{$pension}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            {/if}
            {if count($condiciones) > 1}
            <!--<div class="item_filtros">
                <div class="form-group">
                    <select class="form-control apto-filter" id="condicion">
                        <option value="0">{#Filtra_por_Condiciones#}</option>
                        {foreach from=$condiciones item=condicion}
                            <option>{$condicion}</option>
                        {/foreach}
                    </select>
                </div>
            </div>-->
            {/if}
            <div class="clearfix"></div>
            </div>
            <div class="col-md-5">
                <h2 class="text-center">{#no_encuentras_lo_que_buscas#}</h2>
                <p class="text-center legend">{#dejanos_tu_email_y_te_ayudaremos#}</p>
                <div class="row-fluid text-center">
                    <a href="{$base_url}/{$lang}/{#contacto_url#}" class="btn btn-warning">{#contacta_con_nosotros#} ❯</a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
                <h1 class="text-center">{#alojamientos#}</h1>
    
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
        <h5>{$apartamento['condicion']}</h5>
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
                        <span data-html="true" data-container="body" data-placement="left" data-toggle="popover" data-content="{foreach from=$monedas item=moneda}{if $apartamento['precios'][$moneda->codigo]}<p>{$moneda->codigo} {$apartamento['precios'][$moneda->codigo]}</p>{/if}{/foreach}" class="glyphicon glyphicon-info-sign"></span><span>{$apartamento['precio_moneda_seleccionada']}</span>
                        
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
        <h5>{$apartamento['condicion']}</h5>
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
  <!--Otras opciones de busqueda-->
  {if $hotel->destinoId && !$hotel->webOficial}
  <hr />
  <div class="row-fluid hotel_container hotel_container_big">
      <p style="font-size: 18px;font-weight: bold;padding-bottom: 15px;" class="text-center">{#En#} {$hotel->destino->nombre} {#tenemos_otras_ofertas_que_te_pueden_interesar#}</p>
      <div class="hotel_list" startitem="{$hoteles.start}" hotel="{$hotel->id}" itemsbypage="{$hoteles.limit}" totalitems="{$hoteles.count}" >
          {foreach from=$hoteles item=h}
          {if is_array($h) && $h.id}
          <div class="hotel_item mix" data-hotel="{$h.nombre}" data-destino="{$h.destino.nombre}" data-lat="{$h.lat}" data-lon="{$h.lon}">
              <div>
                  <div>
                      <div class="hotel_item_image_container">
                          <a href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}"><img src="{$h.archivo.ruta}"></a>
                          <p class="rating"><span>{for $i=1 to $h.calidad}<span class="glyphicon glyphicon-star"></span>{/for}</span></p>
                      </div>
                      <div class="hotel_item_description_container">
                          <h3><a href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}">{$h.nombre} </a></h3>
                          <h4>{if $h.destino.id}{$h.destino.nombre}{/if}</h4>
                          <p>{if $h.descripcion->$lang}{$h.descripcion->$lang|truncate:180:'...'}{else}{$h.descripcion->es|truncate:180:'...':true}{/if}</p>
                          <div>
                              {if $h.precio.precioMinimo}
                              <a class="hotel_desde" href="{if strtotime($h.precio.fin) > time()}{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}/disponibilidad?inicio={if strtotime($h.precio.inicio) > time()}{$h.precio.inicio|date_format:"%d-%m-%Y"}{else}{date("d-m-Y")}{/if}&salida={$h.precio.fin|date_format:"%d-%m-%Y"}{/if}">Desde {$h.moneda.simbolo}{$h.precio.precioMinimo}</a> 
                              {/if}
                              <a class="btn btn-warning btn-xs" href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}">Ver Hotel y reservar</a>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          {/if}
          {/foreach}
      </div>
  </div>
  {/if}


<input type="hidden" id="reglas" value='{$reglas}'>
{else}
<p class="text-center">{#lo_sentimos_en_las_fechas_que_has_buscado#} <strong>{$hotel->nombre}</strong> {#no_tiene_disponibilidad#}</p>
<div class="row hotel_container dontfind">
    <div class="row-fluid">
        <div class="col-sm-7">
            <h2 class="text-center">{#no_encuentras_lo_que_buscas#}</h2>
                <p class="text-center legend">{#dejanos_tu_email_y_te_ayudaremos#}</p>
                
        </div>
        <div class="col-sm-5">
            <div class="row-fluid text-center">
                    <a href="{$base_url}/{$lang}/{#contacto_url#}" class="btn btn-warning">{#contacta_con_nosotros#} ❯</a>
                </div>
        </div>
                <div class="clearfix"></div>
    </div>
</div>
{if $hotel->destinoId}
<div class="row-fluid hotel_container">
    <p class="text-center">{#En#} {$hotel->destino->nombre} {#tenemos_otras_ofertas_que_te_pueden_interesar#}</p>
    <div class="hotel_list" startitem="{$hoteles.start}" hotel="{$hotel->id}" itemsbypage="{$hoteles.limit}" totalitems="{$hoteles.count}" >
        {foreach from=$hoteles item=h}
        {if is_array($h) && $h.id}
        <div class="hotel_item mix" data-hotel="{$h.nombre}" data-destino="{$h.destino.nombre}" data-lat="{$h.lat}" data-lon="{$h.lon}">
            <div>
                <div>
                    <div class="hotel_item_image_container">
                        <a href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}"><img src="{$h.archivo.ruta}"></a>
                        <p class="rating"><span>{for $i=1 to $h.calidad}<span class="glyphicon glyphicon-star"></span>{/for}</span></p>
                    </div>
                    <div class="hotel_item_description_container">
                        <h3><a href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}">{$h.nombre} </a></h3>
                        <h4>{if $h.destino.id}{$h.destino.nombre}{/if}</h4>
                        <p>{if $h.descripcion->$lang}{$h.descripcion->$lang|truncate:180:'...'}{else}{$h.descripcion->es|truncate:180:'...':true}{/if}</p>
                        <div>
                            {if $h.precio.precioMinimo}
                            <a class="hotel_desde" href="{if strtotime($h.precio.fin) > time()}{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}/disponibilidad?inicio={if strtotime($h.precio.inicio) > time()}{$h.precio.inicio|date_format:"%d-%m-%Y"}{else}{date("d-m-Y")}{/if}&salida={$h.precio.fin|date_format:"%d-%m-%Y"}{/if}">Desde {$h.moneda.simbolo}{$h.precio.precioMinimo}</a> 
                            {/if}
                            <a class="btn btn-warning btn-xs" href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}">Ver Hotel y reservar</a>
                        </div>
                    </div>
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
{else}
<p class="text-center" style="padding: 0 30px;">{#te_recomendamos_que_busques_en_otras_fechas#}</p><br>
<p class="text-center">{#Tambien_puedes_escribirnos_a#} <strong><a href="mailto:{$hotel->emailReservas}">{$hotel->emailReservas}</a></strong> {#o_llamarnos_al#} <strong>{$hotel->telefonoReservas}</strong></p><br>
<p class="text-center">{#Perdon_por_las_molestias#}</p>
<p class="text-center">{#gracias#}</p>
<p class="text-center"><strong>{$hotel->nombre} & {$hotel->distribuidor->nombreComercial}</strong></p>
{/if}
{/if}