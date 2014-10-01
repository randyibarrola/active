{extends file="index.tpl"}

{block "style_plugins_level" append}
    <link href="{$template_url}/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" media="screen">
    <link href="{$template_url}/assets/plugins/select2/select2_metro.css" rel="stylesheet" media="screen">
{/block}

{block "style_level" append}
    <link href="{$template_url}/newdesing/css/booking.tmp.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="{$template_url}/css/apartamentos.css" />
    <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/css/pages/hoteles.css" />
{/block}

{block "script_plugins_level" append}
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.{$lang}.js"></script>
    <script src="{$template_url}/assets/plugins/select2/select2.min.js"></script>
    <script src="{$template_url}/assets/plugins/select2/select2_locale_{$lang}.js"></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-paginator/bootstrap-paginator.min.js" type="text/javascript"></script>
{/block}

{block "script_level" append}
    <script src="{$template_url}/newdesing/js/booking.tmp.js" type="text/javascript"></script>
    <script src="{$template_url}/newdesing/js/contact.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            App.addI18n('mostrar_detalle', '{#mostrar_detalle#}');
            App.addI18n('calculando_tarifa', '{#calculando_tarifa#}');
            App.addI18n('ocultar_detalle', '{#ocultar_detalle#}');
            App.addI18n('buscando_disponibilidad', '{#buscando_disponibilidad#}');
            App.addI18n('buscando_su_mejor_tarifa', '{#buscando_su_mejor_tarifa#}');
            App.set('destino', '{$hotel->destino->nombre}');
            Booking.init(1);
        });
    </script>
{/block}

{block name="main_content" append}
    <div class="row">
        <div class="col-md-9 col-sm-9 col-xs-12">
            <div id="booking-content" class="well-white">
                <form id="booking-search-room" class="form-inline" role="form" action="{$base_url}/{$lang}/{#disponibilidad_url#}{$end_url}" method="get">
                    <fieldset>
                        <div class="head">
                            <div class="head-text">
                                <label class="search-title">{#busqueda#}:</label>
                                <span class="search-text-date">{$inicio|date_format:"%a, %d %b %Y"} {#Hasta#|lower} {$salida|date_format:"%a, %d %b %Y"}</span>
                            </div>
                            <div class="head-dates">
                                <button type="button" class="btn app-btn-blue toggle-dates">
                                    {#cambiar_las_fechas#}
                                </button>
                                <div class="dropdown-menu toggle-dates-menu" role="menu">
                                    <div>
                                        <label for="bookingSearchRommDateStart" class="control-label">{#llegada#}</label>
                                        <input type="text" class="form-control app-booking-date-start" id="bookingSearchRommDateStart" readonly="readonly" value="{$inicio|date_format:"%d-%m-%Y"}" name="inicio" placeholder="dd-mm-yyyy" />
                                    </div>
                                    <div>
                                        <label for="bookingSearchRommDateEnd" class="control-label">{#salida#}</label>
                                        <input type="text" class="form-control app-booking-date-end" id="bookingSearchRommDateEnd" readonly="readonly" value="{$salida|date_format:"%d-%m-%Y"}" name="salida" placeholder="dd-mm-yyyy" />
                                    </div>
                                    <p class="info">
                                        {#su_reserva_sera_de#} <span id="bookingSearchRommDiff" class="app-booking-date-diff">1</span> {#noche_s#}.
                                    </p>
                                    {if $hotel->config->comparacionBooking}
                                        <div class="checkbox">
                                            <label>
                                                <input checked="checked" disabled="disabled" type="checkbox"> {#acepto_comparativa_con#} booking.com
                                            </label>
                                        </div>
                                    {/if}
                                    <input type="submit" class="btn app-btn-pink app-upper-text col-md-12 col-sm-12 col-xs-12" value="{#buscar_ofertas#}" />
                                </div>
                            </div>
                        </div>
                        <div class="jumbotron text-center" style="display: none;">
                            <h1>{#lo_lamentamos#},</h1>
                            <p>{#no_disponibilidad_en_fechas#}.</p>
                        </div>
                    </fieldset>
                </form>
                <div id="search-room-container">
                    <div id="search-room-load" class="text-center">
                        <h1>{#buscando_su_mejor_tarifa#}</h1>
                        <img src="{$template_url}/newdesing/images/ajax-loading.gif">
                        <p>{#puede_tardar#}. {#disculpe_las_molestias#}.</p>
                    </div>
                </div>
                {*<div id="contact" class="well-gray" data-href="{$base_url}/{$lang}/{#contacto_url#}{$end_url}">*}
                {*</div>*}
                {*{if $hotel->destinoId}*}
                    {*<div id="recommendation-hotels" class="well-white well-divider">*}
                        {*<div class="title">*}
                            {*<h3>{#otros_hoteles_recomendados_zona#}</h3>*}
                        {*</div>*}
                        {*<div class="row booking-prompt">*}
                            {*{foreach from=$hoteles item=h}*}
                                {*{if is_array($h) && $h.id}*}
                                    {*<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 booking-prompt-item">*}
                                        {*<h3>{$h.nombre}</h3>*}
                                        {*<div class="media">*}
                                            {*<div class="pull-left">*}
                                                {*<img class="media-object" src="{$h.archivo.ruta}" alt="{$h.nombre}">*}
                                                {*<div class="rating">*}
                                                    {*{for $i = 1 to 5}*}
                                                        {*<i class="glyphicon glyphicon-star {if $h->calidad >= $i}full{else}empty{/if}"></i>*}
                                                    {*{/for}*}
                                                {*</div>*}
                                            {*</div>*}
                                            {*<div class="media-body">*}
                                                {*{if $h.precio.precioMinimo}*}
                                                    {*<h4 class="media-heading">{#Desde#} {$h.precio.precioMinimo}{$h.moneda.simbolo}</h4>*}
                                                    {*<a href="{if strtotime($h.precio.fin) > time()}{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}/disponibilidad?inicio={if strtotime($h.precio.inicio) > time()}{$h.precio.inicio|date_format:"%d-%m-%Y"}{else}{date("d-m-Y")}{/if}&salida={$h.precio.fin|date_format:"%d-%m-%Y"}{/if}" class="btn app-btn-pink">*}
                                                        {*{#reservar#|capitalize}*}
                                                    {*</a>*}
                                                {*{else}*}
                                                    {*<a href="{if strpos($h.dominio, 'http') eq FALSE}http://{/if}{$h.dominio}" class="btn app-btn-pink">{#reservar#|capitalize}</a>*}
                                                {*{/if}*}
                                            {*</div>*}
                                        {*</div>*}
                                    {*</div>*}
                                {*{/if}*}
                            {*{/foreach}*}
                        {*</div>*}
                    {*</div>*}
                {*{/if}*}
            </div>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-12 column-xs-divider">
            <div id="booking-info" class="well-white">
                <div class="booking-info-step step-1 active">
                    <h4 class="title">1. {#selecciona_tu_alojamiento#}</h4>
                    <div class="content">
                        <p>{#no_has_anhadido_alojamiento#}.</p>
                    </div>
                </div>
                {if $excursiones && count($excursiones)}
                <div class="booking-info-step step-2">
                    <h4 class="title">2. {#actividades_y_tours_2#}</h4>
                    <div class="content">
                    </div>
                </div>
                {/if}
                <div class="booking-info-step step-3">
                    {if $excursiones && count($excursiones)}
                        <h4 class="title">3. {#confirmar_reserva_3#}</h4>
                    {else}
                        <h4 class="title">2. {#confirmar_reserva_3#}</h4>
                    {/if}
                    <div class="content">
                    </div>
                </div>
            </div>
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
    <!-- Begin booking modal -->
    <div id="booking-room-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div>
                        <p>{#has_seleccionado#}:</p>
                        <p>
                            <label class="room-title">Habitación doble sin desayuno</label>
                        </p>
                        <p>
                            <label>Sáb 16 de ago de 2014 hasta Dom, 17 de ago de 2014</label>
                        </p>
                        <p>
                            <label>3 noches</label>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                    <div class="app-widget-count" id="booking-room-modal-widget-count">
                        <div class="">
                            <div class="title">
                                N<sup>o</sup> {#de_habitaciones#}:
                            </div>
                            <div class="widget">
                                <i class="glyphicon glyphicon-minus-sign widget-minus" data-stop="1"></i>
                                <span class="text-center widget-text">1</span>
                                <i class="glyphicon glyphicon-plus-sign widget-plus" data-stop="99"></i>
                                <input type="hidden" class="widget-value" value="1" data-sync=".booking-room-form-count" />
                            </div>
                        </div>
                    </div>
                    <div class="prices">
                        <p>
                            <label><span class="current-price" data-basic-price="74.50">74,50</span>&euro;</label>
                            <label><span class="old-price" data-basic-price="78.20">78,20</span>&euro;</label>
                        </p>
                        <button class="btn app-btn-pink app-upper-text">{#anhadir_reserva#}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End booking modal -->
{/block}