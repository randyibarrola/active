<div class="well-white well-divider well-left">
    <div class="title">
        <h3>{#otros_hoteles_recomendados#}</h3>
    </div>
    <div id="home-prompt-scroll" class="scroll-content">
        {foreach from=$hotel->relacionados item=r name=r}
            {if $smarty.foreach.r.iteration <= 10}
                <div class="home-prompt-item">
                    <h3>{$r->nombre}</h3>
                    <div class="media">
                        <div class="pull-left">
                            <img class="media-object" src="{$r->logo->ruta}" width="110" height="60" alt="">
                            <div class="rating">
                                {for $i = 1 to 5 }
                                    <i class="glyphicon glyphicon-star {if $r->calidad >= $i}full{else}empty{/if}"></i>
                                {/for}
                            </div>
                        </div>
                        <div class="media-body">
                            {if $r->precioMinimo->precioMinimo}
                                <h4 class="media-heading">{#Desde#} {$currency} {$r->precioMinimo->precioMinimo}</h4>
                                <a href="{if strpos($r->campania->subdominio, 'http') eq FALSE}http://{/if}{$r->campania->subdominio}{if $r->precioMinimo->inicio && strtotime($r->precioMinimo->inicio) > time()}/{$lang}/{#disponibilidad_url#}{$end_url}?inicio={$r->precioMinimo->inicio|date_format:"%d-%m-%Y"}&salida={$r->precioMinimo->fin|date_format:"%d-%m-%Y"}{/if}" class="btn app-btn-blue">{#Ver_hotel#}</a>
                            {else}
                                <a href="{if strpos($r->campania->subdominio, 'http') eq FALSE}http://{/if}{$r->campania->subdominio}" class="btn app-btn-blue">{#Ver_hotel#}</a>
                            {/if}
                        </div>
                    </div>
                </div>
            {/if}
        {/foreach}
    </div>
</div>