{if $un_hotel}
<div class="hotel_item mix el-hotel" data-hotel="{$un_hotel.nombre}" data-destino="{$un_hotel.destino.nombre}" data-lat="{$un_hotel.lat}" data-lon="{$un_hotel.lon}">
    <div>
        <div>
            <div class="hotel_item_image_container">
                <a href="{if strpos($un_hotel.dominio, 'http') eq FALSE}http://{/if}{$un_hotel.dominio}"><img src="{$un_hotel.archivo.ruta}"></a>
                <p class="rating"><span>{for $i=1 to $un_hotel.calidad}<span class="glyphicon glyphicon-star"></span>{/for}</span></p>
            </div>
            <div class="hotel_item_description_container">
                <h3><a href="{if strpos($un_hotel.dominio, 'http') eq FALSE}http://{/if}{$un_hotel.dominio}">{$un_hotel.nombre} </a></h3>
                <h4>{if $un_hotel.destino.id}{$un_hotel.destino.nombre}{/if}</h4>
                <p>{if $un_hotel.descripcion->$lang}{$un_hotel.descripcion->$lang|truncate:180:'...'}{else}{$un_hotel.descripcion->es|truncate:180:'...':true}{/if}</p>
                <div>
                    {if $un_hotel.precio.precioMinimo}
                    <a class="hotel_desde" href="{if strtotime($un_hotel.precio.fin) > time()}{if strpos($un_hotel.dominio, 'http') eq FALSE}http://{/if}{$un_hotel.dominio}/disponibilidad?inicio={if strtotime($un_hotel.precio.inicio) > time()}{$un_hotel.precio.inicio|date_format:"%d-%m-%Y"}{else}{date("d-m-Y")}{/if}&salida={$un_hotel.precio.fin|date_format:"%d-%m-%Y"}{/if}">Desde {$un_hotel.moneda.simbolo}{$un_hotel.precio.precioMinimo}</a> 
                    {/if}
                    <a class="btn btn-warning btn-xs" href="{if strpos($un_hotel.dominio, 'http') eq FALSE}http://{/if}{$un_hotel.dominio}">Ver Hotel y reservar</a>
                </div>
            </div>
        </div>
    </div>
</div>
{if $hoteles && count($hoteles) > 3}                
<h3 class="text-center" style="padding: 0 30px;">{#hay_mas_opciones_para_ti#} {$un_hotel.destino.nombre}</h3><br>
{/if}
{/if}

{foreach from=$hoteles item=h}
{if is_array($h) && $h.id}
<div class="hotel_item mix" data-calidad="{$h.calidad}" data-hotel="{$h.nombre}" data-destino="{$h.destino.nombre}" data-lat="{$h.lat}" data-lon="{$h.lon}">
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
