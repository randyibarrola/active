<form id="booking-room-form" role="form" action="#" method="get">
    <input type="hidden" name="room" class="booking-room-form-room" />
    <input type="hidden" name="count" class="booking-room-form-count" />
    <input type="hidden" name="type" class="booking-room-form-type" />
</form>
<div id="search-room-filter" class="well-gray">
    {if count($pensiones) > 1}
        <label class="control-label">{#tipo_pension#}:</label>
        <select class="select2">
            <option value="0" selected="selected">{#cualquiera#}</option>
            {foreach from=$pensiones item=pension}
                <option value="{$pension}">{$pension}</option>
            {/foreach}
        </select>
    {/if}
    {if count($paxes) > 1}
        <label class="control-label">{#cantidad_de_personas#}:</label>
        <select class="select2">
            <option value="0" selected="selected">{#cualquiera#}</option>
            {foreach from=$paxes item=pax}
                <option value="{$pax['adultos']} {#Adulto_s#} {if $pax['ninios']}+ {$pax['ninios']} {#niho_s#}{/if}">
                    {$pax['adultos']} {#Adulto_s#} {if $pax['ninios']}+ {$pax['ninios']} {#niho_s#}{/if}
                </option>
            {/foreach}
        </select>
    {/if}
</div>
<div id="search-room-result" class="">    
    {assign var="apto_descripcion" value=""}
    {foreach from=$apartamentos key=k item=apartamento name=aptos}
        {if $apartamento['descripcion']}     
        <div class="item">
            <div class="row">
                <div class="col-md-7 col-sm-12 col-xs-12">
                    <h5 class="available">¡Solo nos queda 1!</h5>
                    <div class="media">
                        <div class="pull-left">
                            {*<img class="media-object" src="tmp/habitacion.jpg" alt="">*}
                            {*<div class="flexslider">
                                <ul class="slides">
                                {foreach from=$apartamento['imagenes'] item=imagen}
                                  <li class="slide">
                                      <img class="media-object" src="{$imagen}" alt="{$apartamento['titulo']}">
                                      <img src="{$imagen}" alt="{$apartamento['titulo']}">  
                                  </li>
                                {/foreach}
                                </ul>
                            </div>*}
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                {$apartamento['titulo']}
                                <span>1 cama de matrimonio o Dos camas</span>
                            </h4>
                            <p class="max-persons">
                                <label>Ocupación máxima:</label>
                                {#Max#}: {$apartamento['adultos']}  huespedes
                            </p>

                            <a href="#" class="more-info" data-more="Mostrar los datos de la habitación" data-minus="Ocultar los datos de la habitación">
                                <span>Mostrar los datos de la habitación</span> <i class="glyphicon glyphicon-chevron-down"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-sm-12 col-xs-12 booking-options">
                    <div class="option">
                        {if $apartamento['pension'] && $apartamento['pension'] != ''}
                                <h5>{$apartamento['pension']}</h5>
                        {else}
                                <h5 class="free-cancel">{#solo_alojamiento#}</h5>
                        {/if}                    
                        <label class="current-price">{$apartamento['precio_moneda_seleccionada']}</label>
                        <label class="old-price">78,20&euro;</label>
                        <button class="btn app-btn-pink pull-right show-booking-room-modal" data-stock="1" data-title="Habitación estándar sin desayuno" data-current-price="71.50" data-old-price="78.20" data-room="1" data-type="1">
                            Reservar
                        </button>
                    </div>
                    {assign var="subs" value="sub_apartamentos[$k]"}
                    {foreach from=subs key=i item=apt name=apts}
                        <div class="option">
                            {if $apt['pension'] && $apt['pension'] != ''}
                                    <h5>{$apt['pension']}</h5>
                            {else}
                                    <h5 class="free-cancel">{#solo_alojamiento#}</h5>
                            {/if}                    
                            <label class="current-price">{$apt['precio_moneda_seleccionada']}</label>
                            <label class="old-price">78,20&euro;</label>
                            <button class="btn app-btn-pink pull-right show-booking-room-modal" data-stock="1" data-title="Habitación estándar sin desayuno" data-current-price="71.50" data-old-price="78.20" data-room="1" data-type="1">
                                Reservar
                            </button>
                        </div>                        
                    {/foreach}
                </div>
            </div>
            <div class="more-info-content" style="display: none;">
                <dl>      
                    {if $apartamento['condicion'] != ''}
                        <dt>{$apartamento['condicion']}</dt>
                    {/if}
                    <dd>{$apartamento['descripcion']}</dd>
                    <dt>{#descripcion_del_servicio#}</dt>
                    <table class="table table-striped table-hover descripcion_table">                 
                      <tbody>
                        {foreach from=$apartamento['servicios'] item=servicio}
                          <tr>
                            <td>{$servicio}</td>
                          </tr>
                        {/foreach}
                      </tbody>
                    </table>
                </dl>
                <div>
                    <a href="#" class="btn app-btn-blue">Ver ficha de habitación</a>
                </div>
            </div>
        </div>
        {/if}
    {/foreach}    

</div>