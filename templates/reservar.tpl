{extends file="index.tpl"}

{block "style_plugins_level" append}
    <link href="{$template_url}/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" media="screen">
    <link href="{$template_url}/assets/plugins/select2/select2_metro.css" rel="stylesheet" media="screen">
{/block}

{block "style_level" append}
    <link href="{$template_url}/newdesing/css/booking.css" rel="stylesheet" media="screen">
{/block}

{*Este bloque deme eliminarse y dejar solo en nuevo diseño*}
{block name="style" append}
  {*<link rel="stylesheet" type="text/css" href="{$template_url}/css/reservar.css" />*}
{/block}

{block "script_plugins_level" append}
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.{$lang}.js"></script>
    <script src="{$template_url}/assets/plugins/select2/select2.min.js"></script>
    <script src="{$template_url}/assets/plugins/select2/select2_locale_{$lang}.js"></script>
    <script src="{$template_url}/js/jquery.creditCardValidator.js"></script>
{/block}

{block "script_level" append}
    <script src="{$template_url}/newdesing/js/booking.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            App.addI18n('mostrar_detalle', '{#mostrar_detalles_y_condiciones#}');
            App.addI18n('ocultar_detalle', '{#ocultar_detalles_y_condiciones#}');
            App.addI18n('invalid_cupon_msg', '{#codigo_de_cupon_no_valido#}');
            App.addI18n('fecha_text', '{#Fecha#}');
            App.addI18n('espere_text', '{#Espere_por_favor#}');
            App.set('error_msg', {if $error_msg}"{$error_msg}"{else}false{/if});
            App.set('pay_now', {if $pagar_ahora || $hotel->tipoReserva ne 'offline'}true{else}false{/if});
            App.set('months', ['{#enero#}', '{#febrero#}', '{#marzo#}', '{#abril#}', '{#mayo#}', '{#junio#}', '{#julio#}', '{#agosto#}', '{#septiembre#}', '{#octubre#}', '{#noviembre#}', '{#diciembre#}']);
            Booking.init({if $excursiones && count($excursiones)}2{else}3{/if});
        });
    </script>
{/block}

{*Este bloque debe eliminarse y dejar solo el nuevo diseño*}
{block name="script" append}
    {*<script src="{$template_url}/js/reservas.js"></script>*}
    <script type="text/javascript">
        var MOSTRAR_DETALLE = '{#mostrar_detalles_y_condiciones#}';
        var OCULTAR_DETALLE = '{#ocultar_detalles_y_condiciones#}';
    </script>

    <script>
        var MONTHS = ['{#enero#}', '{#febrero#}', '{#marzo#}', '{#abril#}', '{#mayo#}', '{#junio#}', '{#julio#}', '{#agosto#}', '{#septiembre#}', '{#octubre#}', '{#noviembre#}', '{#diciembre#}'];
        var pay_now = {if $pagar_ahora || $hotel->tipoReserva ne 'offline'}true{else}false{/if};
        var error_msg = {if $error_msg}"{$error_msg}"{else}false{/if};
        var invalid_cupon_msg = "{#codigo_de_cupon_no_valido#}";
        var FechaText = "{#Fecha#}";
        var EspereText = "{#Espere_por_favor#}";
    </script>
{/block}

{block "lasted_load" append}
    <script type="text/javascript" src="https://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
{/block}

{block name="main_content" append}
    <div class="row">
        <div class="col-md-9 col-sm-9 col-xs-12">
            <div id="booking-content" class="{if $excursiones && count($excursiones)}well-white{/if}">
                {if $excursiones && count($excursiones)}
                    <div class="booking-tour-content">
                        <div class="head">
                            <h1>{#por_reserva_superior_a#} {$regla_cupon->monto|number_format:2:',':' '}&euro; {#obtendras_un_cupon_por_un_valor_de#} <span>{if $regla_cupon->tipoDescuento eq '%'}{$regla_cupon->descuento}{else}{$regla_cupon->descuento|number_format:2:',':' '}{/if}{$regla_cupon->tipoDescuento}</span> {#para_excursiones_transfer_y_mas#}!" <span>{#tu#} <strong>{#codigo#}</strong> {#de_cupon_es#} : <b><strong class="lead">{$cupon->codigo|upper}</strong></b></span></h1>
                            <form id="booking-tour-form" role="form" action="#" method="get" class="pull-right">
                                <input type="hidden" name="tour[]" class="booking-tour-form-book" />
                                <input class="btn app-btn-pink" type="submit" value="{#finalizar_reserva#} >>" />
                            </form>
                        </div>
                        <div class="reserva-description">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="flexslider">
                                        <ul class="slides">
                                            {foreach from=$apartamento['imagenes'] item=imagen}
                                                <li class="slide">
                                                    <img src="{$imagen|replace:'http:':'https:'}" alt="{$apartamento['titulo']}">
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-9">
                                    <h3 class="text-primary">{$apartamento['titulo']}</h3>
                                    {if $cantidad > 1}<p class="text-muted">{#cantidad#}: {$cantidad}</p>{/if}
                                    <p class="text-muted">{#llegada#}: {$inicio} 15:00</p>
                                    <p class="text-muted">{#salida#}: {$salida} 12:00</p>
                                    <p class="text-muted">{$noches} {#noche_s#}</p>
                                    <p class="text-muted">{#Pax#}: {$apartamento['adultos']} {#Adulto_s#} {if $apartamento.ninios}+ {$apartamento.ninios} {#ninio_s#}{/if}</p>
                                    {if $apartamento['pension']}
                                        <p class="text-muted"><strong>{$apartamento['pension']}</strong></p>
                                    {/if}
                                    <p class="text-muted"><strong>{$apartamento['condicion']}</strong></p>
                                    <a class="btn btn-primary pull-right btn-xs" id="show-room-more-info">+ {#mostrar_detalles_y_condiciones#}</a>
                                </div>
                            </div>
                            <div class="row" id="room-more-info" style="display: none;">
                                <div class="col-sm-12">
                                    <h3 class="text-primary">{#descripcion_del_servicio#}:</h3>
                                    {foreach from=$cart->apartamentoObj->servicios item=servicio}
                                        <p>{$servicio}</p>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                        <form id="booking-search-tour" class="form-inline" role="form" action="#" method="post">
                            <fieldset>
                                <div class="well-gray">
                                    <label class="control-label">Tipo de actividad:</label>
                                    <select class="select2">
                                        <option value="Cualquiera" selected="selected">Cualquier actividad</option>
                                        <option value="Actividad 1">Actividad 1</option>
                                        <option value="Actividad 2">Actividad 2</option>
                                    </select>
                                    <label class="control-label">Rango de precio:</label>
                                    <select class="select2">
                                        <option value="Cualquier precio" selected="selected">Cualquier precio</option>
                                        <option value="2">Máximos</option>
                                        <option value="3">Mínimos</option>
                                        <option value="4">Medios</option>
                                    </select>
                                </div>
                            </fieldset>
                        </form>
                        <div id="search-tour-result" class="">
                            {foreach from=$excursiones item=excursion}
                                {assign var=descripcion_breve value=$excursion->descripcionBreve|json_decode:1}
                                {assign var=descripcion_extendida value=$excursion->descripcionExtendida|json_decode:1}
                                <div class="item">
                                    <div class="row">
                                        <div class="col-md-9 col-sm-12 col-xs-12">
                                            <h5 class="">{$excursion->nombre}</h5>
                                            <div class="media">
                                                <div class="pull-left">
                                                    <img class="media-object" src="{$service_url}{$excursion->fotos[0]->ruta|replace:'http://':'https://'}" class="reserva-img img-thumbnail" alt="{$excursion->nombre}">
                                                </div>
                                                <div class="media-body">                                                    
                                                    {$descripcion_breve[$lang]}
                                                    <a href="#">[Saber más]</a>
                                                    
                                                    {if $excursion->guias}
                                                    <div class="guide-languages">
                                                        <label><i class="glyphicon glyphicon-user"></i> Guía</label>
                                                        <ul class="list-inline flags">
                                                            {foreach from=$excursion->guias key=dd item=guia name=guias}{if !$smarty.foreach.guias.first}, {/if}<li><img src="{$template_url}/images/flags/{$dd}.png"></li> {$dd|upper}{/foreach}                                                            
                                                        </ul>
                                                    </div>
                                                    {/if}
                                                    <a href="#" class="more-info show-booking-tour-form" data-more="Mostrar detalles de la actividad" data-minus="Ocultar detalles de la actividad">
                                                        <span>Mostrar detalles de la actividad</span> <i class="glyphicon glyphicon-chevron-down"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-12 col-xs-12 booking-options">
                                            <div class="option">
                                                <h5>desde:</h5>
                                                <label class="current-price">{$excursion->precio_minimo}</label>
                                                <label class="old-price">17,20&euro;</label>
                                                <button class="btn app-btn-pink show-booking-tour-form">
                                                    {#mostrar_detalles#}
                                                </button>
                                                <p class="free-cancel">Cancelación GRATUITA</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="more-info-content" style="display: none;">
                                        <div class="well-gray well-divider">
                                            <form class="booking-add-tour-form form-inline" role="form" action="#" method="post">
                                                <fieldset>
                                                    <div class="">
                                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                                            <h4 style="margin-bottom: 0">Escoja una fecha:</h4>
                                                            <div class="datepicker" data-sync=".selected-date-1" data-start-date="today">
                                                                <input type="hidden" class="selected-date-1" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label label-hours">Escoge hora de salida:</label>
                                                                <select class="select2 form-control">
                                                                    <option value="11:30" selected="selected">11:30</option>
                                                                    <option value="14:30">14:30</option>
                                                                    <option value="16:30">16:30</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-12 text-right">
                                                            <h4 style="margin-bottom: 25px;">Completa los datos:</h4>
                                                            {foreach from=$excursion->tickets item=ticket name=tickets}
                                                                {assign var=ticket_nombre value=$ticket->nombre|json_decode:1}
                                                                <div class="form-group persons">
                                                                    <label class="control-label">{$ticket_nombre[$lang]}:</label>
                                                                    <select name="entradas[{$ticket->id}]" precio="{$ticket->total_plano}" class="select2 form-control adult-count">
                                                                        {foreach from=range(0,15) item=i}
                                                                        <option value="{$i}" {if $i eq 1}selected{/if}>{$i}</option> 
                                                                        {/foreach}

                                                                    </select>
                                                                    
                                                                    <input type="hidden" class="adult-price" value="12.50" />
                                                                    <label class="sub-price totalEntradas"><span>{$ticket->total}</span></label>
                                                                </div>
                                                            {/foreach}
                                                            
                                                            <h4 style="margin-top: 25px;">Introduce tu código descuento:</h4>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <input type="text" name="cupon" class="form-control discount-code" />
                                                                        <span class="input-group-btn">
                                                                            <button class="btn app-btn-blue app-upper-text btn-discount-code" type="button">Validar</button>
                                                                        </span>
                                                                </div>
                                                                <div class="discount-validate" style="display: none;">
                                                                    <label class="sub-price">0</label>
                                                                    <i class="glyphicon glyphicon-remove-circle tooltips" data-original-title="Quitar"></i>
                                                                </div>
                                                                <input type="hidden" class="discount" value="0" data-discount-type="percent" />
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="hidden" class="total-price" />
                                                                <label class="control-label">Total:</label>
                                                                <label class="total-price"><span>12,50</span>&euro;</label>
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="submit" class="btn app-btn-pink" value="Añadir reserva" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                {/if}

                <!-- Formulario de completar reserva -->
                <div class="booking-confirm-content" style="{if $excursiones && count($excursiones)}display: none{/if}">
                    <form id="booking-confirm-form" class="form-horizontal" role="form" action="{$base_url}/reservar{$end_url}" method="post">
                        <div class="well-white">
                            <div class="head">
                                <h1>
                                    {#datos_titular_habitacion#} <span>({#debe_ser_mayor_18#})</span>
                                    {if $excursiones && count($excursiones)}
                                        <button id="go-to-tour-list" type="button" class="btn app-btn-pink pull-right"><< {#reserva_actividades#}</button>
                                    {/if}
                                </h1>
                            </div>
                            <fieldset>
                                <p class="fieldset-info">
                                    <label>{$apartamento['titulo']}</label>
                                </p>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">{#nombre_de_contacto#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required]" placeholder="{#nombre_y_apellidos#}" name="nombre" value="{$backData['nombre']}" />
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">{#pais_origen#}</label>
                                        <select class="select2 form-control" name="pais">
                                            {foreach from=$paises item=pais key=key}
                                                <option value="{$key}" {if (!$backData && $key eq 'ES') || $backData['pais'] eq $key}selected=""{/if}>{$pais}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">{#direccion_correo_electronico#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required], custom[email]]" name="email" value="{$backData['email']}" />
                                        <div class="help-block">
                                            <span>{#compruebe_email#}.</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">{#numero_de_telefono#}</label>
                                        <input type="text" class="form-control" name="telefono" value="{$backData['telefono']}" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="recibir_ofertas">
                                                {#recibir_ofertas_promociones#}.
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="well-white well-divider">
                            <div class="head">
                                <h1>
                                    {#tus_datos_para_el_pago#}
                                    <div class="card-logos pull-right">
                                        <img src="{$template_url}/newdesing/images/visa-logos.png" />
                                        <img src="{$template_url}/newdesing/images/godaddy.png" />
                                    </div>
                                </h1>
                            </div>
                            <div class="well-green-light">
                                <label>{#requiere_tarjeta_de_credito#}</label>
                                Mercure Madrid Santo Domingo aplica las políticas de cobro según las <a href="#">condiciones de la tarifa seleccionada</a>.
                            </div>
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-5 col-sm-12 col-xs-12">
                                        <label class="control-label">{#numero_tarjeta_debito_credito#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required, custom[customCreditCard]]" name="tarjetaNumero" />
                                    </div>
                                    <div class="col-md-7 col-sm-12 col-xs-12">
                                        <label class="control-label">{#nombre_titular_de_la_tarjeta#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required]" name="titular" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-sm-6 col-xs-12">
                                        <label class="control-label">{#fecha_de_caducidad#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <div class="caducity-date">
                                            <select class="select2 form-control validate[required]" data-placeholder="{#mes#}" name="caducidadMes">
                                                <option value=""></option>
                                                <option value="01">01 - {#enero#}</option>
                                                <option value="02">02 - {#febrero#}</option>
                                                <option value="03">03 - {#marzo#}</option>
                                                <option value="04">04 - {#abril#}</option>
                                                <option value="05">05 - {#mayo#}</option>
                                                <option value="06">06 - {#junio#}</option>
                                                <option value="07">07 - {#julio#}</option>
                                                <option value="08">08 - {#agosto#}</option>
                                                <option value="09">09 - {#septiembre#}</option>
                                                <option value="10">10 - {#octubre#}</option>
                                                <option value="11">11 - {#noviembre#}</option>
                                                <option value="12">12 - {#diciembre#}</option>
                                            </select>
                                        </div>
                                        <div class="caducity-date">
                                            <select class="select2 form-control validate[required]" data-placeholder="{#anho#}" name="caducidadAnio">
                                                <option value=""></option>
                                                {for $i=$smarty.now|date_format:"%Y" to 2040}
                                                    <option value="{$i}">{$i}</option>
                                                {/for}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <label class="control-label">
                                            {#numero_identificacion_tarjeta#}
                                            <span class="required"><i class="glyphicon glyphicon-star"></i></span>
                                            <span class="tooltips" data-toggle="tooltip" title="{#cvv#}"><i class="glyphicon glyphicon-question-sign"></i></span>
                                        </label>
                                        <input type="text" class="form-control card-number validate[required, custom[integer]]" maxlength="4" name="cvv" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="well-white well-divider">
                            <div class="head">
                                <h1>{#politica_cancelacion_condiciones#}</h1>
                            </div>
                            <fieldset>
                                <p class="fieldset-info">
                                    <label>Tarifa especial no reembolsable</label><br/>
                                    Esta tarifa de descuento especial no es reembolsable. Si eliges cambiar o cancelar esta reserva, no se te reembolsará el pago.
                                </p>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label class="control-label">{#peticiones_especiales_o_comentacios_al_hotel#}</label>
                                        <textarea class="form-control" rows="3" name="peticionesEspeciales">{$backData['peticionesEspeciales']}</textarea>
                                    </div>
                                </div>
                                <div class="well-gray well-divider">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="" name="acepto" class="validate[required]"> <span class="required"><i class="glyphicon glyphicon-star"></i></span>
                                            {#declaro_acepto_pago#}
                                            <a href="#">{#normas_y_restricciones#} <i class="glyphicon glyphicon-new-window"></i></a>
                                            , {#los#} <a href="#">{#terminos_y_condiciones#} <i class="glyphicon glyphicon-new-window"></i></a>
                                            {#y_la#} <a href="#">{#politica_de_privacidad#} <i class="glyphicon glyphicon-new-window"></i></a>.
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-5 col-xs-6">
                                        <input type="submit" class="btn app-btn-pink" value="{#finalizar_reserva#}">
                                    </div>
                                </div>
                                <div class="row secure-data-info">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <p>
                                            <i class="glyphicon glyphicon-lock"></i>
                                            {#utilizamos_procesos_cifrados#}.
                                        </p>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-3 col-xs-12">
            <div id="booking-info" class="well-white">
                <div class="booking-info-step step-1">
                    <h4 class="title">{#selecciona_habitacion_1#}</h4>
                    <div class="content">
                        <p><label>{$apartamento['titulo']}</label></p>
                        <p>{#llegada#}: {$inicio}</p>
                        <p>{#salida#}: {$salida}</p>
                        <p>{$noches} {#noches#}</p>
                        <p>{#Pax#}: {$apartamento['adultos']} {#Adulto_s#} {if $apartamento.ninios}+ {$apartamento.ninios} {#ninio_s#}{/if}</p>
                        <p><label>{$apartamento['codicion']}</label></p>
                        <div class="pay text-right">
                            <p class="prepay block">
                                {$apartamento['precioTotal_format']}
                                <span class="saving">{#te_ahorras#} 6,50&euro;</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="booking-info-step step-2 {if $excursiones && count($excursiones)}active{/if}">
                    <h4 class="title">{#actividades_y_tours_2#}</h4>
                    <div class="content">
                        {if $excursiones && count($excursiones)}
                            <p><label>Tour Madrid Clásico (2H)</label></p>
                            <p>Pax: 2 Adulto(s)</p>
                            <div class="pay">
                                <p>Subtotal:</p>
                                <p>30,00&euro;</p>
                            </div>
                            <div class="pay">
                                <p>Código descuento:<br/>WELCOME_20</p>
                                <p>-20,00&euro;</p>
                            </div>
                            <div class="pay">
                                <p>Importe total:</p>
                                <p>10,00&euro;</p>
                            </div>
                            <div class="pay">
                                <p>Importe a pagar ahora 50%:</p>
                                <p class="prepay">5,00&euro;</p>
                            </div>
                        {else}
                            <p>{#no_has_anhadido_ninguna#}.</p>
                        {/if}
                    </div>
                </div>
                <div class="booking-info-step step-3 {if !$excursiones || !count($excursiones)}active{/if}">
                    <h4 class="title">{#confirmar_reserva_3#}</h4>
                    <div class="content">
                        <div class="pay">
                            <p>Importe total:</p>
                            <p>84,50&euro;</p>
                        </div>
                        <div class="pay">
                            <p>Importe total a pagar ahora:</p>
                            <p class="prepay">17,55&euro;</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}

{block "extra_content" append}
    <div id="send-confirm-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <h1>{#enviando_datos#}...</h1>
                    <img src="{$template_url}/newdesing/images/ajax-loading.gif">
                    <p>{#puede_tardar#}. {#disculpe_las_molestias#}.</p>
                </div>
            </div>
        </div>
    </div>
{/block}