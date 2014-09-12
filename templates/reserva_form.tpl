      <form role="form" action="{$base_url}/{$lang}/{#disponibilidad_url#}{$end_url}">
          <div id="formSearch">
            <h3 class="text-center">{#reserva_online#}</h3>
             <div class="form-inline row clearfix">
                <div class="form-group col-md-6">
                  <label for="inicio">{#fecha_de_llegada#}</label>
                  <input id="date-start" type="text" class="form-control datepicker" readonly value="{$inicio|date_format:"%d-%m-%Y"}" name="inicio" placeholder="dd-mm-yyyy" />
                </div>
                <div class="form-group col-md-6">
                  <label for="inicio">{#fecha_de_salida#}</label>
                  <input id="date-end" type="text" class="form-control datepicker" readonly value="{$salida|date_format:"%d-%m-%Y"}" name="salida" placeholder="dd-mm-yyyy" />
                </div>
              </div>
              <p id="noches_label"></p>
              {if $hotel->config->comparacionBooking}
              <div class="checkbox">
                <label>
                  <input checked="checked" disabled="disabled" type="checkbox"> {#acepto_comparativa_con#} booking.com
                </label>
              </div>
              {/if}
              <div class="text-center">
                <button id="buscar_disponibilidad_btn" type="submit" data-loading-text="{#buscando#}" class="btn btn-success">{#buscar#}</button>  
              </div>
        </div>
        {if $hotel->mostrarHotelesRelacionados && $hotel->relacionados && count($hotel->relacionados) && !$movile}
        <div class="relacionadosContainer">
            <h3 class="text-center">{#Quiza_te_pueda_interesar#}</h3>
            <div class="row-fluid relacionados">
            {foreach from=$hotel->relacionados item=r name=r}
                {if $smarty.foreach.r.iteration <= 10}
                <div class="row-fluid">
                    <h4>
                        {$r->nombre}
                        {if $r->calidad}
                            {for $c=1 to $r->calidad}
                                <span class="glyphicon glyphicon-star"></span>
                            {/for}
                        {/if}
                    </h4>
                    <p>
                        {if $r->precioMinimo->precioMinimo}
                        <a href="{if strpos($r->campania->subdominio, 'http') eq FALSE}http://{/if}{$r->campania->subdominio}{if $r->precioMinimo->inicio && strtotime($r->precioMinimo->inicio) > time()}/{$lang}/{#disponibilidad_url#}{$end_url}?inicio={$r->precioMinimo->inicio|date_format:"%d-%m-%Y"}&salida={$r->precioMinimo->fin|date_format:"%d-%m-%Y"}{/if}">{#Desde#} {$currency} {$r->precioMinimo->precioMinimo}</a>  |  
                        {/if}
                        <a href="{if strpos($r->campania->subdominio, 'http') eq FALSE}http://{/if}{$r->campania->subdominio}">{#Ver_hotel#}!</a>
                    </p>
                </div>
                {/if}
            {/foreach}
            </div>
            <h4 class="text-center">{$hotel->destino->nombre}</h4>
        </div>
        {/if}
        
      </form>