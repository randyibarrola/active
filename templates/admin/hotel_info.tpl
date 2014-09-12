<div class="hotel_item mix">
    <div>
        <div>
            
            <div class="hotel_item_description_container">
                <h3><a href="{if strpos($hotel->campania->subdominio, 'http') eq FALSE}http://{/if}{$hotel->campania->subdominio}">{$hotel->nombre} </a></h3>
                <h4>{if $hotel->destinoId}{$hotel->destino->nombre}{/if}</h4>
                <p>{if $hotel->descripcionesLargas->$lang}{$hotel->descripcionesLargas->$lang|truncate:180:'...'}{else}{$hotel->descripcionesLargas->es|truncate:180:'...':true}{/if}</p>
                <div>
                    {if $hotel->precioMinimo->precioMinimo}
                    <a class="hotel_desde" href="{if strtotime($hotel->precioMinimo->fin) > time()}{if strpos($hotel->campania->subdominio, 'http') eq FALSE}http://{/if}{$hotel->campania->subdominio}/disponibilidad?inicio={if strtotime($hotel->precioMinimo->inicio) > time()}{$hotel->precioMinimo->inicio|date_format:"%d-%m-%Y"}{else}{date("d-m-Y")}{/if}&salida={$hotel->precioMinimo->fin|date_format:"%d-%m-%Y"}{/if}">Desde {$hotel->moneda->simbolo}{$hotel->precioMinimo->precioMinimo}</a> 
                    {/if}
                    <a class="btn btn-warning btn-xs" href="{if strpos($hotel->campania->subdominio, 'http') eq FALSE}http://{/if}{$hotel->campania->subdominio}">Ver Hotel y reservar</a>
                </div>
            </div>
        </div>
    </div>
</div>