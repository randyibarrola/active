{extends file="index.tpl"}

{block name="script" append}
<script src="{$template_url}/js/home.js"></script>
<script type="text/javascript">
  var SERVICIO_ID = '{#servicios#}';
</script>
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/home.css">
{/block}

{block name="main_content" append}
  <div class="row-fluid clearfix top_content_container">
    <div class="col-md-3 formulario_left_top">  
    {include file="reserva_form.tpl"}
    {if $hotel->contenidoHtml && strlen(trim($hotel->contenidoHtml)) && !$movile}
        <div class="row-fluid visible-lg" id="contenidoExtra">
            {$hotel->contenidoHtml}
        </div>
    {/if}
    {include file="excursiones_sidebar.tpl"}
    </div>
    <div class="col-md-9">
      <div class="main_content content">  
      {if !$movile}
      <div class="row-fluid content_boxes clearfix">
                
                <div class="col-md-6 box">
                    
                    <h4><span class="glyphicon glyphicon-bullhorn"></span> {#menos_que#} </h4>
                    <div class="box_exc">
                       {#obten_la_mejor_tarifa_del_mercado#}, <strong>{#garantizado#}</strong>.
                    </div>
                </div>
                
                
                <div class="col-md-6 box">
                    <h4>
                    <span class="glyphicon glyphicon-gift"></span> {#cupones_promocionales#}</h4>
                    <div class="box_exc">
                        {#por_tu_reserva_recibe_ex#}
                    </div>
                </div>
                
                {if $hotel->config->atencionPersonalizada}
                <div class="col-md-6 box">
                    <h4><span class="glyphicon glyphicon-bell"></span> {#atencion_personalizada#}</h4>
                    <div class="box_exc">
                       {#telefono#}: {$hotel->telefonoReservas} <br />
                       {#email#}: {$hotel->emailReservas}
                    </div>
                </div>
                {/if}
                {if $hotel->config->pagoFlexible}
                <div class="col-md-6 box">
                    <h4>
                    <span class="glyphicon glyphicon-shopping-cart"></span> {#pago_flexible#}</h4>
                    <div class="box_exc">
                        {#paga_con_tarjeta_de_credito_o_paypal#}
                    </div>
                </div>
                {/if}
            </div>
        {/if}
       <section class="slider description-slider-main" {if !$hotel->tripAdvisor || $movile}style="width:100%; margin-top: 5px;"{/if}>
        <!-- carousel -->
            <div>
            {if $hotel->precioMinimo && !$movile}
                <div class="outlet_price_container">
                  {if $hotel->precioMinimo->inicio && strtotime($hotel->precioMinimo->inicio) > time()}
                  <a href="{$base_url}/{$lang}/{#disponibilidad_url#}{$end_url}?inicio={$hotel->precioMinimo->inicio|date_format:"%d-%m-%Y"}&salida={$hotel->precioMinimo->fin|date_format:"%d-%m-%Y"}">
                  {/if}
                  <span class="outlet_price_label">{#disponible_desde#}</span>
                  <span class="outlet_price">{$currency}{$hotel->precioMinimo->precioMinimo}</span>
                  {if $hotel->precioMinimo->inicio && strtotime($hotel->precioMinimo->inicio) > time()}
                  </a>
                  {/if}
                </div>
                <div class="outlet_price_background"></div>
            {/if}
            <div id="parthenon-slider" class="carousel slide {if !$hotel->tripAdvisor}no-trip-advisor{/if}">
                <div class="carousel-inner detalle_carousel_inner">
                    {if $images}
                    {for $i=0 to count($images) - 1}
                    <div class="item {if $i eq 0}active{/if}">
                        <img src="{$images[$i]->ruta}" alt="Photo {$i}" title="{$images[$i]->nombre}">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    {/for}
                    {else}
                        <div class="item active">
                            <img src="{$template_url}/imagenes/slider1.jpg" alt="Photo 1">
                            <div class="carousel-caption">

                            </div>
                        </div>
                    {/if}
                    {if $imagesDestino}
                    {for $i=0 to count($imagesDestino) - 1}
                    <div class="item">
                        <img src="{$imagesDestino[count($imagesDestino) - 1 - $i]->ruta}" alt="Photo destino {$i}">
                        <div class="carousel-caption">

                        </div>
                    </div>
                    {/for}
                    {/if}

                </div>
                <div class="back-images layer-1"></div>
                <div class="back-images layer-2"></div>

                <a class="left carousel-control" href="#parthenon-slider" data-slide="prev">
                    <span class="icon-prev"></span>
                </a>
                <a class="right carousel-control" href="#parthenon-slider" data-slide="next">
                    <span class="icon-next"></span>
                </a>
            </div>
        
            <!--<h2 class="promotion">Reserve on our web site, and enjoy the best price guaranteed</h2>-->
            {if !$movile}
            <div class="flexslider {if !$hotel->tripAdvisor}no-trip-advisor{/if}" id="flex-slider">
                <ul class="slides">
                   {for $i=0 to count($images) - 1}                                   
                      <li data-thumb="{$images[$i]->ruta}">
                          <img src="{$images[$i]->ruta}" alt="{$hotel->nombre}" title="{$images[$i]->nombre}">
                      </li>
                    {/for}
                    {if $imagesDestino}
                    {for $i=0 to count($imagesDestino) - 1}
                    <li data-thumb="{$imagesDestino[count($imagesDestino) - 1 - $i]->ruta}">
                        <img src="{$imagesDestino[count($imagesDestino) - 1 - $i]->ruta}" alt="{$hotel->destino->nombre}">
                    </li>
                    {/for}
                    {/if}
                </ul>
              </div>
            {/if}
            </div>
        </section>
{if !$movile}
<div class="hidden-xs hidden-sm hidden-md">
{if $hotel->tripAdvisor}
    {$hotel->tripAdvisor}
{/if}
</div>
{/if}
<br class="clear" />
        <div class="clearfix" id="{#servicios#}">
        <h2 class="text-center">{#servicios_de#} {$hotel->nombre}</h2>
        <hr />
        
               <div id="servicio">
                {if $hotel->descripcionesLargas}
                    {if $lang}
                        {$hotel->descripcionesLargas->$lang}
                    {else}
                        {$hotel->descripcionesLargas->es}
                    {/if}
                {else}
                    {$hotel->descripcionLarga}
                {/if}
               <div >
        
        <table class="table">
          <thead>
            <tr>
              <th>{#servicio#}</th>
              <th>{#descripcion#}</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$servicios key=c item=categoria}  
              {if $categoria['categoria']->es != ''} 
              <tr>
                <td>{if $lang}{$categoria['categoria']->$lang}{else}{$categoria['categoria']->es}{/if}</td>
                <td>
                  {foreach from=$categoria['servicios'] item=s name=servicios}
                    {if $lang}{$s->descripciones->$lang}{else}{$s->descripciones->es}{/if} {if not $smarty.foreach.servicios.last}, {/if} 
                  {/foreach}
                </td>
              </tr>
              {/if}
            {/foreach}            
              {if $lugares}
              <tr class="lugares_interes">
                <td>{#lugares_de_interes#}</td>
                <td>
                  {foreach from=$lugares item=lugar}
                  <span class="lugar_interes">{$lugar}</span>
                  {/foreach}  
                </td>
              </tr>
              {/if}
          </tbody>
        </table>
       </div>
       </div>
          
        </div>
        {if $condiciones && count($condiciones) > 0}
        <div class="clearfix" id="{#condiciones#}">
        <h2 class="text-center">{#condiciones_de#} {$hotel->nombre}</h2>
        
        
        <div id="servicio">

            <div >

                <table class="table">
                  <thead>
                    <tr>
                      <th>{#condicion#}</th>
                      <th>{#descripcion#}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach from=$condiciones key=c item=categoria}   
                    {if strlen(trim($categoria['categoria']->$lang)) || strlen(trim($categoria['categoria']->es))}
                      {if $categoria['categoria']->es != 'Tarjetas aceptadas en este alojamiento' }
                      <tr>
                        <td>
                        {if $lang}{$categoria['categoria']->$lang}{else}{$categoria['categoria']->es}{/if}
                        </td>
                        <td>
                          {foreach from=$categoria['servicios'] item=s name=servicios}
                            {if $lang}{$s->descripciones->$lang}{else}{$s->descripciones->es}{/if} {if not $smarty.foreach.servicios.last}, {/if} 
                          {/foreach}
                        </td>
                      </tr>
                      {else}
                      <tr>
                        <td>{$categoria['categoria']->$lang}</td>
                        <td>
                          <ul class="accepted-secure-list">
                            <li><img src="{$template_url}/images/visa_icon.png"></li>
                            <li><img src="{$template_url}/images/master_icon.png"></li>
                          </ul>
                        </td>
                      </tr>
                      {/if}
                    {/if}
                    {/foreach}            
                  </tbody>
                </table>
           </div>
       </div>
          
        </div>
        {/if}

        {if $hotel->destinoId}
        <div class="row-fluid" style="overflow:hidden;">
            <h2 class="text-center">{$hotel->destino->nombre}</h2>
            <hr />
        
            <div id="servicio">
             {if $hotel->destino->descripcion}
                 
                 {if $hotel->destino->descripciones->$lang}
                     {$hotel->destino->descripciones->$lang}
                 {else}
                     {$hotel->destino->descripciones->es}
                 {/if}
             
             {/if}
            </div>
        </div>
        {/if}
      </div>     
    </div>
  
          <div class="col-md-3" id="excursiones-sidebar-movil">
              {include file="excursiones_sidebar.tpl"}
          </div>
  </div>
  <div class="division_main">
    
  </div>
          
          

{/block}