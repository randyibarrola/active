<div class="header">
    <div class="header-top">
        <div class="container">
            <ul class="pull-right list-inline">
                <li>
                    <a href="#" id="display-global-search">
                        <img src="{$template_url}/newdesing/images/icon-search.png" role="button" />
                    </a>
                </li>
                <li class="dropdown app-dropdown-choice">
                    {#moneda#}
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="dropdown-selected">{$currency}</span> <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu pull-right" role="menu">
                        {foreach from = $monedas item = moneda}
                            {if $moneda->codigo ne $money}
                                {if substr_count($actual_url, '/reservar/') > 0}
                                    <li data-selected="{$moneda->simbolo}">
                                        <a href="{$base_url}/{$lang}/{#disponibilidad_url#}/m:{$moneda->codigo}?inicio={$inicio|date_format:"%d-%m-%Y"}&salida={$salida|date_format:"%d-%m-%Y"}">
                                            {$moneda->codigo} {$moneda->simbolo}
                                        </a>
                                    </li>
                                {else}
                                    <li data-selected="{$moneda->simbolo}">
                                        <a href="{$base_url}/{$lang}/{$action_controller}/m:{$moneda->codigo}{$end_actual_url}">
                                            {$moneda->codigo} {$moneda->simbolo}
                                        </a>
                                    </li>
                                {/if}
                            {else}
                                <li data-selected="{$moneda->simbolo}" class="disabled"><a href="#">{$moneda->codigo} {$moneda->simbolo}</a></li>
                            {/if}
                        {/foreach}
                    </ul>
                </li>
                <li class="dropdown app-dropdown-choice">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="dropdown-selected"><img src="{$template_url}/assets/images/flags/{$lang|lower}.png"> {$lang|upper}</span> <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu pull-right" role="menu">
                        {foreach from = $hotel->idiomas item = idioma}
                            {if $idioma->codigo ne $lang}
                                {if substr_count($actual_url, '/reservar/') > 0}
                                    <li data-selected="{'<img src="'|htmlspecialchars}{$template_url}{'/assets/images/flags/'}{$idioma->codigo|lower}{'.png">'|htmlspecialchars} {$idioma->codigo|upper}">
                                        <a href="{$base_url}/{$idioma->codigo}/{#disponibilidad_url#}{if $money}/m:{$money}{/if}?inicio={$inicio|date_format:"%d-%m-%Y"}&salida={$salida|date_format:"%d-%m-%Y"}">
                                            <img src="{$template_url}/assets/images/flags/{$idioma->codigo|lower}.png">
                                            {$idioma->codigo|upper}
                                        </a>
                                    </li>
                                {else}
                                    <li data-selected="{'<img src="'|htmlspecialchars}{$template_url}{'/assets/images/flags/'}{$idioma->codigo|lower}{'.png">'|htmlspecialchars} {$idioma->codigo|upper}">
                                        <a href="{$base_url}/{$idioma->codigo}/{$action_controller}{if $money}/m:{$money}{/if}{$end_actual_url}">
                                            <img src="{$template_url}/assets/images/flags/{$idioma->codigo|lower}.png">
                                            {$idioma->codigo|upper}
                                        </a>
                                    </li>
                                {/if}
                            {else}
                                <li data-selected="{$idioma->codigo}" class="disabled">
                                    <a href="{$base_url}/{$idioma->codigo}">
                                        <img src="{$template_url}/assets/images/flags/{$idioma->codigo|lower}.png">
                                        {$idioma->codigo|upper}
                                    </a>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="logo pull-left logo-hotel">
                <img src="{$template_url}/newdesing/images/logo-mini.png" />
                {*<h1>{if $hotel->webOficial}{$hotel->nombre}{else}{$hotel->distribuidor->nombreComercial}{/if}</h1>*}
                <h1>{$hotel->nombre} </h1>
                <div class="rating">
                    {for $i=1 to 5}
                        <i class="glyphicon glyphicon-star {if $hotel->calidad >= $i}full{else}empty{/if}"></i>
                    {/for}
                </div>
                <span>{$hotel->destino->nombre}</span>
            </div>
            <address class="pull-right">
                <span>{#reserva_online_text#}:</span><br/>
                <span>{if $hotel->webOficial}{$hotel->telefonoReservas}{else}{$hotel->distribuidor->telefonoReservas}{/if}</span><br/>
                {#o#} <a href="mailto:{if $hotel->webOficial}{$hotel->emailReservas}{else}{#empresa_contacto#}{/if}">{#escribenos_un_email#}</a>
            </address>
            <div class="global-search pull-right text-right">
                <form id="global-search-form" class="form-inline" role="form" action="#" method="post" style="display: none">
                    <div class="input-group">
                        <input type="text" class="form-control typeahead" autocomplete="off" data-noresult="{#no_se_encontraron_elementos#}"  />
                            <span class="input-group-btn">
                                <button class="btn app-btn-blue" type="submit">{#buscar#}</button>
                            </span>
                    </div>
                    <input type="hidden" class="selected-item" value="" />
                </form>
            </div>
        </div>
    </div>
</div>