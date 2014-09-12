{if !$movile && $excursiones}
<div class="row-fluid excursion_container hidden-xs hidden-sm">
	<h3>{#servicios_extras#}</h3>
	{foreach from=$excursiones item=excursion}
	    <h4>{$excursion->nombre} </h4>
            <img src="{$excursion->fotos[0]->ruta|replace:'http://www.vikatickets':'https://tickets.vikahotel'}" class="img-thumbnail" alt="{$excursion->nombre}">
            <div class="row-fluid">
                <ul>
                    {if $excursion->precio_minimo}
                    <li>
                        <div class="icon-tag"></div>
                        <strong>{#precio_a_partir_de#}: </strong>{$excursion->precio_minimo|number_format:2:',':'.'}{if $currency}{$currency}{else}&euro;{/if}
                    </li>
                    {/if}
                    {if $excursion->duracion != '00:00'}
                    <li>
                        <div class="icon-time"></div>
                        <strong>{#Duracion#}: </strong> {$excursion->duracion}
                    </li>
                    {/if}
                    
                    <li>
                    {assign var=descripcion value=$excursion->descripcionBreve|json_decode:1}

                    {if $descripcion[$lang]}
                        <div class="icon-time"></div>
                        <p>{$descripcion[$lang]}</p>
                    {else}
                        <div class="icon-time"></div>
                        <p>{$descripcion['es']}</p>
                    {/if}

                    </li>
                </ul>
            </div>
	{/foreach}
</div>
{/if}