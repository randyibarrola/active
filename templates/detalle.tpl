

<div class="content" id="detalle-excursion">
    <div class="row-fluid">
        <div class="row-fluid">
            <img src="{$excursion->imagenes[0]->ruta}" alt="{$excursion->imagenes[0]->nombre}" width="100%">
        </div>
        <div class="row">
            <legend>{$excursion->nombre}</legend>
        </div>
        <div class="row">
            <ul>
                <li></li>
                <li>
                    <div class="icon-map-marker"></div>
                    <strong>{#destino#}</strong> {$excursion->direccion->descripcion}
                </li>
                <li>
                    <div class="icon-tag"></div>
                    <strong>{#de#} </strong> {$excursion->fechaInicio|date_format:"%e/%m/%Y"} <strong>{#a#}</strong> {$excursion->fechaFinal|date_format:"%e/%m/%Y"}
                </li>
                <li>
                    <div class="icon-tag"></div>
                    <strong>{#precio_a_partir_de#} <strong>{$excursion->precio->precio|number_format:2:',':'.'}{if $currency}{$currency}{else}&euro;{/if}</strong>
                </li>
                {if !$excursion->duracionIndefinida}
                <li>
                    <div class="icon-time"></div>
                    <strong>Duración</strong> {if $excursion->dias eq 0}{$excursion->duracion|date_format:"%H:%M"}hrs{else}{$excursion->dias}días{/if}
                </li>
                {/if}
            </ul>
            <legend>&nbsp;</legend>
        </div>
            <div class="row">
                <p>{if $excursion->sinopsis->$lang}{$excursion->sinopsis->$lang}{else}{$excursion->sinopsis->es}{/if}</p>
            </div>
    </div>
</div>
 