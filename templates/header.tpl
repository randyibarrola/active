<div class="navbar navbar-inverse">
    {if $hotel->headerVikahotel && !$movile}
    <div id="header_vikahotel" >
        <div class="row-fluid">
            <div class="col-md-3 vikahotel">
            <a class="navbar-brand" href="http://{#sistema_web#}">
                <label class="vikahotel-logo">
                    <img src="{$template_url}/images/logo_s.png">
                </label>        
            </a>
            <!--<p>{#vikahotel_promo#}</p>   -->
            <div class="clearfix"></div>
            </div>
            <div class="col-md-5">
                <div class="form-group hotelCompleteContainer">
                    <input type="text" autocomplete="off" id="hotelComplete" class="form-control" placeholder="{#buscar_mi_hotel_ideal#}">
                </div>
            </div>
            <div class="col-md-4 distribuidor">
                <label>{#empresa_contacto#} - {$hotel->distribuidor->telefonoReservas}</label>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    {/if}
    <div class="navbar-header">
      <div class="navbar-brand-container hotel-logo-movil">
        <a class="navbar-brand" href="{$base_url}/{$lang}/index{$end_url}">
        {if !$movile && (!$hotel->headerVikahotel || $hotel->logo)}
          <img src="{if $hotel->logo}{$hotel->logo->ruta|replace:'http:':'https:'}{else}{$template_url}/images/logo.png{/if}" alt="{$hotel->nombre}" />  
        {/if}
          <span>{$hotel->nombre}</span>
        </a>
        {if !$movile}<div class="calidad" data-score="{$hotel->calidad}"></div>{/if}
      </div>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="navbar-collapse collapse">
    <div class="navbar-brand-container hotel-logo-nomovil">
        <a class="navbar-brand" href="{$base_url}/{$lang}/index{$end_url}">
        {if !$movile && (!$hotel->headerVikahotel || $hotel->logo)}
          <img src="{if $hotel->logo}{$hotel->logo->ruta|replace:'http:':'https:'}{else}{$template_url}/images/logo.png{/if}" alt="{$hotel->nombre}" />  
        {/if}
        </a>
        {if !$hotel->logo}<a class="hotel_name" href="{$base_url}/{$lang}/index{$end_url}">{$hotel->nombre}</a>{/if}
        {if !$movile}<div class="calidad" data-score="{$hotel->calidad}"></div>{/if}
      </div>
      <ul class="nav navbar-nav">
        <li {if $active_menu eq 'home'}class="active"{/if}><a id="inicio_scroll" class="to_scroll" href="{$base_url}/{$lang}/index{$end_url}">{#inicio#}</a></li>
        <li><a id="servicios_scroll" class="to_scroll" href="{$base_url}/{$lang}/index#!{#servicios#}{$end_url}">{#servicios#}</a></li>
        <li {if $active_menu eq 'apartamentos'}class="active"{/if}><a href="{$base_url}/{$lang}/{#disponibilidad_url#}{$end_url}">{#alojamientos#}</a></li>
        <li {if $active_menu eq 'contacto'}class="active"{/if}><a href="{$base_url}/{$lang}/{#contacto_url#}{$end_url}">{#contacto#} & {#mapa#}</a></li>
        
        <li {if $active_menu eq 'faq'}class="active"{/if}><a href="{$base_url}/{$lang}/faq{$end_url}">{#faqs#}</a></li>

        <li class="dropdown">
            
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="{$template_url}/images/flags/{$lang|lower}.png"> {$lang|upper} <b class="caret"></b></a>
          {if $hotel->idiomas && count($hotel->idiomas) > 1}    
          <ul class="dropdown-menu">
            {foreach from=$hotel->idiomas item=idioma}
                {if $idioma->codigo ne $lang}
                    {if substr_count($actual_url, '/reservar/') > 0}
                        <li><a href="{$base_url}/{$idioma->codigo}/{#disponibilidad_url#}{if $money}/m:{$money}{/if}?inicio={$inicio|date_format:"%d-%m-%Y"}&salida={$salida|date_format:"%d-%m-%Y"}">
                                <img src="{$template_url}/images/flags/{$idioma->codigo|lower}.png">
                                {$idioma->codigo|upper}
                            </a>
                        </li>
                    {else}
                        <li>
                            <a href="{$base_url}/{$idioma->codigo}/{$action_controller}{if $money}/m:{$money}{/if}{$end_actual_url}">
                                <img src="{$template_url}/images/flags/{$idioma->codigo|lower}.png">
                                {$idioma->codigo|upper}
                            </a>
                        </li>
                    {/if}
                {/if}
            {/foreach}
          </ul>
          {/if}
        </li>
        <li class="dropdown {$money}">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">{$money} {$currency} <b class="caret"></b></a>
              
          {if $monedas && count($monedas) > 1}
          <ul class="dropdown-menu">
            {foreach from=$monedas item=moneda}
              {if $moneda->codigo ne $money}   
                {if substr_count($actual_url, '/reservar/') > 0}
                    <li><a href="{$base_url}/{$lang}/{#disponibilidad_url#}/m:{$moneda->codigo}?inicio={$inicio|date_format:"%d-%m-%Y"}&salida={$salida|date_format:"%d-%m-%Y"}">{$moneda->codigo} {$moneda->simbolo}</a></li>
                {else}
                    <li><a href="{$base_url}/{$lang}/{$action_controller}/m:{$moneda->codigo}{$end_actual_url}">{$moneda->codigo} {$moneda->simbolo}</a></li>
                {/if}
              {/if}
            {/foreach}
          </ul>
          {/if}
        </li>
      </ul>
    </div>
</div>