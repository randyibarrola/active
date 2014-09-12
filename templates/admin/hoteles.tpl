{extends file="admin/main_template.tpl"}

{block name="style" append}
    <link href="{$template_url}/admin/assets/css/pages/hoteles.css" rel="stylesheet" type="text/css"/>
    <link href="{$template_url}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
{/block}

{block name="script" append}    
    <script type="text/javascript" src="{$template_url}/admin/assets/scripts/hoteles.js"></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap/js/bootstrap2-typeahead.min.js" type="text/javascript"></script>
    
    <script src="{$template_url}/admin/assets/plugins/bootstrap-paginator/bootstrap-paginator.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var NO_ELEMENTOS_LABEL = '{#no_se_encontraron_elementos#}';
        var startItem = {$hoteles.start};
        var itemsByPage = {$hoteles.limit};
        var totalItems = {$hoteles.count};
        var LOCATIONS = {$locations};
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
{/block}

{block name="main_content" append}
<div class="hotel_container">
	
        <div id="hoteles_container">
            <form role="form" class="hotel_search_form">
                <div class="col-md-6">
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
                    <div class="clearfix"></div>
                </div>
                <div class="form-group col-md-6">
                  <label for="search">{#Encuentra_tu_alojamiento_perfecto#}</label>
                  <input type="text" class="form-control" id="search"  placeholder="{#Mi_hotel_o_destino_favorito#}" autocomplete="off">

                </div>
                <div class="clearfix"></div>
            </form>
            <div class="col-md-6">
                <div class="row-fluid">
                    <div class="col-md-6">
                        <div class="form-group">
                            <select id="precios" class="form-control">
                                <option value="0">{#Filtrar_por_precio#}</option>
                                {foreach from=$precios item=precio}
                                    <option value="{$precio.precio}">{#Hasta#} {$precio.simbolo} {$precio.precio|number_format:2:',':''}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    {if $estrellas}
                    <div class="col-md-6">
                        <div class="form-group">
                            <select id="estrellas" class="form-control">
                                <option value="0">{#Filtrar_por_estrellas#}</option>
                                {foreach from=$estrellas item=estrella}
                                    <option value="{$estrella.calidad}">{$estrella.calidad} {#estrellas#}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    {/if}
                    <div class="clearfix"></div>
                </div>
                <div class="row-fluid">
                    <div id="mapa"></div>
                </div>
            </div>
            <div class="col-md-6">
                    <div class="hotel_list">
                        {foreach from=$hoteles item=h}
                        {if is_array($h) && $h.id}
                        <div class="hotel_item mix" data-hotel="{$h.nombre}" data-destino="{$h.destino.nombre}" data-lat="{$h.lat}" data-lon="{$h.lon}">
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
                    </div>
                    <div class="" {if ($hoteles.start + count($hoteles) - 3) == $hoteles.count}style="display:none;"{/if}>
                        {if ($hoteles.start + count($hoteles) - 2) < $hoteles.count}
                        <!--
                        <div class="dataTables_paginate paging_bootstrap text-center">
                            <ul class="pagination">
                                <li class="prev disabled">
                                    <a title="Prev" href="#">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                </li>
                                <li class="active">
                                    <a href="#">1</a>
                                </li>
                                <li class="next disabled">
                                    <a title="Next" href="#">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        -->                        
                        {/if}
                        <div id="pagination"></div>
                    </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
</div>
{/block}