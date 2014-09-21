{extends file="index.tpl"}

{block "style_plugins_level" append}
    <link href="{$template_url}/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" media="screen">
    <link href="{$template_url}/assets/plugins/social/social-likes_classic.css" rel="stylesheet" media="screen">
    <link href="{$template_url}/assets/plugins/jquery-flexslider/flexslider.css" rel="stylesheet" media="screen">
    <link href="{$template_url}/assets/plugins/select2/select2_metro.css" rel="stylesheet" media="screen">
{/block}

{block "style_level" append}
    <link href="{$template_url}/newdesing/css/home.css" rel="stylesheet" media="screen">
{/block}

{block "script_plugins_level" append}
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.{$lang}.js"></script>
    <script src="{$template_url}/assets/plugins/jquery-nicescroll/jquery.nicescroll.min.js"></script>
    <script src="{$template_url}/assets/plugins/social/social-likes.min.js"></script>
    <script src="{$template_url}/assets/plugins/jquery-flexslider/jquery.flexslider-min.js"></script>
    <script src="{$template_url}/assets/plugins/select2/select2.min.js"></script>
    <script src="{$template_url}/assets/plugins/select2/select2_locale_{$lang}.js"></script>    
{/block}

{block "script_level" append}  
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script src="{$template_url}/newdesing/js/home.js" type="text/javascript"></script>
    <script src="{$template_url}/newdesing/js/contact.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            Home.init();
            $('#tab-map').click(function(){
                if($('.gm-style').length == 0)           
                    Home.handleMap();            
            });
        });
    </script>

    {*<script type="text/javascript" src="https://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>*}
{/block}

{block "lasted_load" append}
    <script src="http://www.jscache.com/wejs?wtype=selfserveprop&amp;uniq=273&amp;locationId=288566&amp;lang=es&amp;rating=true&amp;nreviews=4&amp;writereviewlink=true&amp;popIdx=true&amp;iswide=true&amp;border=false&amp;langversion=2"></script>
{/block}

{block name="main_content" append}
    <div class="row">
        <div class="col-md-3 col-sm-3">
            {include file="simple_search_form.tpl"}

            <div id="home-free-offer" class="well-white well-border-pink well-divider">
                <p>Con tu reserva, te regalamos:</p>
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="tmp/reserva-gratuita.png" alt="">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">Tour a pie de 2,5 horas</h4>
                        <p class="home-free-offer-price">Valorado en 35&euro;</p>
                        <a href="#" class="btn app-btn-pink pull-right">Reservar (35&euro;)</a>
                    </div>
                </div>
            </div>
            <div id="home-book-services" class="well-white well-border-pink well-divider well-left">
                <div class="title">
                    <h3>Reserva ahora</h3>
                    <h4>con nosotros y obtiene:</h4>
                </div>
                <ul class="list-dove-blue">
                    <li>WIFI gratis</li>
                    <li>Copa de bienvenida</li>
                    <li>Botella de agua</li>
                    <li>Early check-in</li>
                    <li>Early check-out</li>
                </ul>
            </div>
            {if $hotel->mostrarHotelesRelacionados && $hotel->relacionados && count($hotel->relacionados) && !$movile}
                {include file="hotel_prompt.tpl"}
            {/if}
        </div>
        <div class="col-md-9 col-sm-9 column-xs-divider">
            <section id="home-slider-hotel" class="slider">
                <div id="home-slider-hotel-slider" class="flexslider flexslider-scn-slider" data-sync="#home-slider-hotel-carousel">
                    {if $hotel->precioMinimo && !$movile}
                        <div class="slider-info">
                            <div class="info">
                                <p>{#disponible_desde#}</p>
                                <p><span>{$hotel->precioMinimo->precioMinimo|number_format:2:',':' '}</span>{$currency}</p>
                            </div>
                            <div class="background"></div>
                        </div>
                    {/if}
                    <ul class="slides">
                        {if $images} 
                            {for $i=0 to count($images) - 1}
                            <li>
                                <img src="{$images[$i]->ruta}" alt="Photo {$i}" title="{$images[0]->nombre}">
                            </li> 
                            {/for}
                        {else}
                            <li>
                                <img src="{$template_url}/imagenes/slider1.jpg" alt="Photo 1">
                            </li>
                        {/if} 
                        {if $imagesDestino}                         
                            {for $i=0 to count($imagesDestino) - 1}
                            <li>
                                <img src="{$imagesDestino[count($imagesDestino) - 1 - $i]->ruta}" alt="Photo destino {$i}">
                            </li>
                            {/for} 
                        {/if}                        
                    </ul>
                </div>
                <div id="home-slider-hotel-carousel" class="flexslider flexslider-scn-carousel hidden-xs" data-asnavfor="#home-slider-hotel-slider" data-itemwidth="80">
                    <ul class="slides">
                    {if $images}
                        {for $i=0 to count($images) - 1}
                            <li>
                                <img src="{$images[$i]->ruta}" alt="Photo {$i}" title="{$images[$i]->nombre}">
                            </li>
                        {/for}
                    {/if} 
                    {if $imagesDestino}                         
                        {for $i=0 to count($imagesDestino) - 1}
                        <li>
                            <img src="{$imagesDestino[count($imagesDestino) - 1 - $i]->ruta}" alt="Photo destino {$i}">
                        </li>
                        {/for} 
                    {/if}
                    </ul>
                    
                </div>
            </section>
            <!-- Begin tabs -->
            <ul class="nav nav-tabs app-tabs">
                <li class="active">
                    <a href="#details" data-toggle="tab">
                        <i class="glyphicon glyphicon-info-sign tooltips" data-original-title="{#detalles#|capitalize}"></i> <span class="hidden-xs">{#detalles#|capitalize}</span>
                    </a>
                </li>
                <li>
                    <a href="#conditions" data-toggle="tab">
                        <i class="glyphicon glyphicon-file tooltips" data-original-title="{#condiciones#|capitalize}"></i> <span class="hidden-xs">{#condiciones#|capitalize}</span>
                    </a>
                </li>
                <li>
                    <a href="#map" data-toggle="tab" id="tab-map">
                        <i class="glyphicon glyphicon-map-marker tooltips" data-original-title="{#localizacion#|capitalize}"></i> <span class="hidden-xs">{#localizacion#|capitalize}</span>
                    </a>
                </li>
                <li>
                    <a href="#opinions" data-toggle="tab">
                        <i class="glyphicon glyphicon-star tooltips" data-original-title="{#opiniones#|capitalize}"></i> <span class="hidden-xs">{#opiniones#|capitalize}</span>
                    </a>
                </li>
                <li>
                    <a href="#faqs" data-toggle="tab">
                        <i class="glyphicon glyphicon-info-sign tooltips" data-original-title="{#faqs#|capitalize}"></i> <span class="hidden-xs">{#faqs#|capitalize}</span>
                    </a>
                </li>
                <li>
                    <a href="#contact" data-toggle="tab">
                        <i class="glyphicon glyphicon-envelope tooltips" data-original-title="{#contacto#|capitalize}"></i> <span class="hidden-xs">{#contacto#|capitalize}</span>
                    </a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content app-tab-content">
                <div class="tab-pane active" id="details">
                    <div class="row">
                        <div class="col-md-10 col-sm-12 text">
                            {if $hotel->descripcionesLargas}
                                {if $lang}
                                    {$hotel->descripcionesLargas->$lang}
                                {else}
                                    {$hotel->descripcionesLargas->es}
                                {/if}
                            {else}
                                {$hotel->descripcionLarga}
                            {/if}

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>{#servicio#}</th>
                                        <th>{#descripcion#}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                {foreach from=$servicios key=c item=categoria}
                                    {if $categoria['categoria']->es != ''}
                                        <tr>
                                            <td>
                                                {if $lang}
                                                    {$categoria['categoria']->$lang}
                                                {else}
                                                    {$categoria['categoria']->es}
                                                {/if}
                                            </td>
                                            <td>
                                                {foreach from=$categoria['servicios'] item=s name=servicios}
                                                    {if $lang}
                                                        {$s->descripciones->$lang}
                                                    {else}
                                                        {$s->descripciones->es}
                                                    {/if}
                                                    {if not $smarty.foreach.servicios.last}, {/if}
                                                {/foreach}
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                                {if $lugares}
                                    <tr class="lugares_interes">
                                        <td>{#lugares_de_interes#}</td>
                                        <td>
                                            {foreach from=$lugares item=lugar}
                                                <span class="lugar_interes">{$lugar}</span>
                                            {/foreach}
                                        </td>
                                    </tr>
                                {/if}
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-2 col-sm-12">
                            <div class="tripadvisor-content">
                                <div id="TA_selfserveprop101" class="TA_selfserveprop">
                                    <ul id="cvs5VV0uMq" class="TA_links QV1zXzi">
                                        <li id="Wq2ABnzWdjHQ" class="bWPB9VjiwyC">
                                            <a target="_blank" href="http://www.tripadvisor.es/">
                                                <img src="http://www.tripadvisor.es/img/cdsi/img2/branding/150_logo-11900-2.png" alt="TripAdvisor"/>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="social-actions">
                                <a href="#">
                                    <i class="glyphicon glyphicon-envelope"></i> {#correo_electronico#}
                                </a>
                                <a href="#">
                                    <i class="glyphicon glyphicon-print"></i> {#imprimir#}
                                </a>
                                <div class="social-likes">
                                    <div class="facebook" title="{#comparte_este_link#} Facebook">{#me_gusta#}</div>
                                    <div class="twitter" title="{#comparte_este_link#} Twitter">{#twittear#}</div>
                                    <div class="plusone" title="{#comparte_este_link#} Google+">{#compartir#}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="conditions">
                    {if $condiciones && count($condiciones) > 0}
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>{#condicion#}</th>
                                    <th>{#descripcion#}</th>
                                </tr>
                            </thead>
                            <tbody>
                            {foreach from=$condiciones key=c item=categoria}
                                {if strlen(trim($categoria['categoria']->$lang)) || strlen(trim($categoria['categoria']->es))}
                                    {if $categoria['categoria']->es != 'Tarjetas aceptadas en este alojamiento'}
                                        <tr>
                                            <td>
                                                {if $lang}
                                                    {$categoria['categoria']->$lang}
                                                {else}
                                                    {$categoria['categoria']->es}
                                                {/if}
                                            </td>
                                            <td>
                                                {foreach from=$categoria['servicios'] item=s name=servicios}
                                                    {if $lang}
                                                        {$s->descripciones->$lang}
                                                    {else}
                                                        {$s->descripciones->es}
                                                    {/if}
                                                    {if not $smarty.foreach.servicios.last}, {/if}
                                                {/foreach}
                                            </td>
                                        </tr>
                                    {else}
                                        <tr>
                                            <td>{$categoria['categoria']->$lang}</td>
                                            <td>
                                                <ul class="list-inline">
                                                    <li><img src="{$template_url}/newdesing/images/visa.png"></li>
                                                    <li><img src="{$template_url}/newdesing/images/master-card.png"></li>
                                                </ul>
                                            </td>
                                        </tr>
                                    {/if}
                                {/if}
                            {/foreach}
                            </tbody>
                        </table>
                    {/if}
                </div>
                <div class="tab-pane" id="map">
                    <div id="gmap"></div>
                    <input type="hidden" name="lat" value="{$hotel->direccion->lat}">
                    <input type="hidden" name="lon" value="{$hotel->direccion->lon}">                    
                </div>
                <div class="tab-pane" id="opinions">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div id="TA_selfserveprop273" class="TA_selfserveprop">
                                <ul id="8n8wH28pXi" class="TA_links 19qElIAWMgP">
                                    <li id="stzcn0qrb" class="mE3OZ7X">
                                        <a target="_blank" href="http://www.tripadvisor.es/"><img src="http://www.tripadvisor.es/img/cdsi/img2/branding/150_logo-11900-2.png" alt="TripAdvisor"/></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane app-ajax-load" id="faqs" data-href="{$base_url}/{$lang}/faq{$end_url}">
                </div>
                <div class="tab-pane app-ajax-load" id="contact" data-href="{$base_url}/{$lang}/{#contacto_url#}{$end_url}">
                </div>
            </div>
            <!-- End tabs -->

            <!-- Begin excursions -->
            <div id="home-excursions" class="well-white well-divider">
                <h1 class="text-center">¿Qué hacer en mi visita?</h1>
                <div class="row list">
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="{$template_url}/tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="{$template_url}/tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="{$template_url}/tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="{$template_url}/tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                </div>
            </div>
            <!-- End excursions -->
        </div>
    </div>
{/block}

{block "extra_content" append}
    <!-- Begin booking modal -->
    <div id="search-best-prices-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <h1>{#buscando_su_mejor_tarifa#}</h1>
                    <img src="{$template_url}/newdesing/images/ajax-loading.gif">
                    <p>{#puede_tardar#}. {#disculpe_las_molestias#}.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- End booking modal -->
{/block}