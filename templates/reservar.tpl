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
            {if $excursiones && count($excursiones)}
                <div id="booking-tour-head">
                    <h1>{#por_reserva_superior_a#} {$regla_cupon->monto|number_format:2:',':' '}&euro; {#obtendras_un_cupon_por_un_valor_de#} <span>{if $regla_cupon->tipoDescuento eq '%'}{$regla_cupon->descuento}{else}{$regla_cupon->descuento|number_format:2:',':' '}{/if}{$regla_cupon->tipoDescuento}</span> {#para_excursiones_transfer_y_mas#}!"</br> <span>{#tu#} <strong>{#codigo#}</strong> {#de_cupon_es#} : <b><strong class="lead">{$cupon->codigo|upper}</strong></b></span></h1>
                    <form id="booking-tour-form" role="form" action="#" method="get" class="pull-right">
                        <input type="hidden" name="tour[]" class="booking-tour-form-book" />
                        <input class="btn app-btn-pink" type="submit" value="{#finalizar_reserva#} >>" />
                    </form>
                </div>
            {/if}
            {*<div id="booking-content" class="{if $excursiones && count($excursiones)}well-white{/if}">*}
            <div id="booking-content" class="well-white">
                <div class="reserva-description {if !$excursiones || !count($excursiones)}well-white{/if}">
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
                {if $excursiones && count($excursiones)}
                    <div class="booking-tour-content">
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
                                                <input type="hidden" name="precio_apartamento" value="{$apartamento['precioTotal_format']}">
                                                <input type="hidden" name="tarifaId">
                                                <input type="hidden" name="eventoId" value="{$excursion->id}">
                                                <input type="hidden" name="fecha">
                                                <input type="hidden" name="fechasTarifas" value='[{foreach from=$excursion->tickets item=ticket name=tickets}{foreach from=$ticket->fechas item=fecha name=fechas}{if !$smarty.foreach.tickets.first || !$smarty.foreach.fechas.first},{/if}"{$fecha->fecha|date_format:"%e/%m/%Y"}->{$ticket->id}"{/foreach}{/foreach}]'>
                                                {foreach from=$excursion->tickets item=ticket}
                                                <input type="hidden" id="tarifa_{$ticket->id}" value='{$ticket->horarios_json}'>
                                                {/foreach}
                                                <fieldset>
                                                    <div class="">
                                                        <div class="col-md-5 col-sm-12 col-xs-12">
                                                            <h4 style="margin-bottom: 0">Escoja una fecha:</h4>
                                                            <div class="datepicker" data-sync=".selected-date-1" data-start-date="today">
                                                                <input type="hidden" class="selected-date-1" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label label-hours">Escoge hora de salida:</label>
                                                                <select class="select2 form-control que_hora" placeholder="HH:mm" name="sesion">
                                                                    {foreach from=$excursion->horarios item=horario}
                                                                        <option value="{$horario|date_format:'%H:%M'}">{$horario|date_format:"%H:%M"}</option>
                                                                    {/foreach}                                                                    
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-7 col-sm-12 col-xs-12 text-right">
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
                                                                    <input type="hidden" class="adult-price" value="{$ticket->total_plano}" />
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
                                                                <label class="total-price"><span>0</span></label>
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
                                    Booking Online | {#completa_tus_datos#} <span>({#debe_ser_mayor_18#})</span>
                                    {if $excursiones && count($excursiones)}
                                        <button id="go-to-tour-list" type="button" class="btn app-btn-pink pull-right" style="margin-bottom: 2px;"><< {#actividades#}</button>
                                    {/if}
                                </h1>
                            </div>
                            <fieldset>
                                {*<p class="fieldset-info">*}
                                    {*<label>{$apartamento['titulo']}</label>*}
                                {*</p>*}
                                <div class="row">
                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                        <label class="control-label">{#nombre#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required]" name="nombre" value="{$backData['nombre']}" />
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                        <label class="control-label">{#apellido#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required]" name="apellido" value="{$backData['apellido']}" />
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                        <label class="control-label">{#pais_de_residencia#}</label>
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
                                        <label class="control-label">{#telefono_movil#}</label>
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
                                    {#tu_garantia_de_reserva#}
                                    <div class="card-logos pull-right">
                                        <img src="{$template_url}/newdesing/images/master-card.png" />
                                        <img src="{$template_url}/newdesing/images/visa.png" />
                                        <script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=GYXVmcV1zSFO0ewxdrrMYEd9oSBPeFYMpJ4mT8NT8To48V7SvEB"></script>
                                    </div>
                                </h1>
                            </div>
                            <div class="well-green-light">
                                <label>{#requiere_tarjeta_de_credito#}</label>
                                {$hotel->nombre} {#aplica_politicas_segun_tarifa#}.
                            </div>
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-5 col-sm-12 col-xs-12">
                                        <label class="control-label">{#numero_tarjeta#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required, custom[customCreditCard]]" name="tarjetaNumero" />
                                        <input type="hidden" name="tarjetaTipo">
                                    </div>
                                    <div class="col-md-7 col-sm-12 col-xs-12">
                                        <label class="control-label">{#nombre_del_titular#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control validate[required]" name="titular" readonly="" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-sm-6 col-xs-12">
                                        <label class="control-label">{#fecha_de_vencimiento#} <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
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
                                            {#cvv#}
                                            <span class="required"><i class="glyphicon glyphicon-star"></i></span>
                                            <span class="tooltips" data-toggle="tooltip" title="{#cvv#}"><i class="glyphicon glyphicon-question-sign"></i></span>
                                        </label>
                                        <input type="text" class="form-control card-number validate[required, custom[integer]]" maxlength="4" name="cvv" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="well-white well-divider">
                            <fieldset>
                                <label>{#te_enviaremos_tu_reserva_por_mail_a#}:</label> <span id="send-email">{$backData['email']}</span>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label class="control-label">{#Peticiones_especiales#}</label>
                                        <textarea class="form-control" rows="3" name="peticionesEspeciales">{$backData['peticionesEspeciales']}</textarea>
                                    </div>
                                </div>
                                <div class="well-gray well-divider">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="" name="acepto" class="validate[required]"> <span class="required"><i class="glyphicon glyphicon-star"></i></span>
                                            {#entiendo_y_acepto_las#}
                                            <a href="javascript:void(0);" data-toggle="modal" data-target="#privacy_policies_modal">{#politicas_de_privacidad#} <i class="glyphicon glyphicon-new-window"></i></a>
                                            {#y_las#} <a href="javascript:void(0);" data-toggle="modal" data-target="#book_conditions_modal">{#condiciones_de_reserva#} <i class="glyphicon glyphicon-new-window"></i></a>.
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-5 col-xs-6">
                                        <input type="hidden" id="porcentageCobroAnticipado" value="{$hotel->porcentageCobroAnticipado}">
                                        <input type="hidden" name="idApartamento" value="{$apartamento['id']}">
                                        <input type="hidden" name="cantidad" value="{$cantidad}">
                                        <input type="hidden" name="cartID" value="{$cart->id}">
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
                <div class="booking-info-step step-1 active">
                    <h4 class="title text-center">{#resumen_de_tu_reserva#}</h4>
                    <div class="content">
                        <p><label>{$apartamento['titulo']}</label></p>
                        <p>{#llegada#}: {$inicio}</p>
                        <p>{#salida#}: {$salida}</p>
                        <p>{$noches} {#noches#}</p>
                        <p>{#Pax#}: {$apartamento['adultos']} {#Adulto_s#} {if $apartamento.ninios}+ {$apartamento.ninios} {#ninio_s#}{/if}</p>
                        {if $apartamento['codicion']}
                            <p><label>{$apartamento['codicion']}</label></p>
                        {/if}
                        <div class="pay text-right">
                            <p class="block">
                                {$apartamento['precioTotal_format']}
                            </p>
                        </div>
                    </div>
                </div>
                {if $excursiones && count($excursiones)}
                {*<div class="booking-info-step step-2">*}
                    {*<div class="content">*}
                        {*{if $excursiones && count($excursiones)}*}
                            {*<p><label>Tour Madrid Clásico (2H)</label></p>*}
                            {*<p>Pax: 2 Adulto(s)</p>*}
                            {*<div class="pay">*}
                                {*<p>Subtotal:</p>*}
                                {*<p>30,00&euro;</p>*}
                            {*</div>*}
                            {*<div class="pay">*}
                                {*<p>Código descuento:<br/>WELCOME_20</p>*}
                                {*<p>-20,00&euro;</p>*}
                            {*</div>*}
                            {*<div class="pay">*}
                                {*<p>Importe total:</p>*}
                                {*<p>10,00&euro;</p>*}
                            {*</div>*}
                            {*<div class="pay">*}
                                {*<p>Importe a pagar ahora 50%:</p>*}
                                {*<p class="prepay">5,00&euro;</p>*}
                            {*</div>*}
                        {*{else}*}
                            {*<p>{#no_has_anhadido_ninguna#}.</p>*}
                        {*{/if}*}
                    {*</div>*}
                {*</div>*}
                {/if}
                <div class="booking-info-step step-3">
                    <h4 class="title"></h4>
                    <div class="content">
                        <div class="pay">
                            <p class="prepay block">{#Total#}: <span>{$apartamento['precioTotal_format']}</span></p>
                        </div>
                        <div class="text-right">{#impuestos_incluidos#}</div>
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
    <div class="modal fade" id="privacy_policies_modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">{#politicas_de_privacidad#}</h4>
                </div>
                <div class="modal-body">
                    <div style="overflow-y: auto; max-height: 400px">

                        <p>
                            <b>POLÍTICA DE PRIVACIDAD</b>
                        </p>
                        <p>
                            <b>Nuestro compromiso por cumplir la Ley</b>
                        </p>
                        <p>
                            Esta Política de Privacidad afecta a aquellos datos que aportes a VikaHotel, bien a través de los formularios, bien a través de cualquier otro medio a tu disposición (teléfono, correo electrónico, etc). Al aceptar esta Política de Privacidad, das tu consentimiento para que VikaHotel trate tus datos personales con los fines que se indican a continuación.</p>
                        <p>
                            <b>¿Qué información recopilaremos y para qué la usamos?</b>
                        </p>
                        <p>
                            Te pediremos tu nombre y tu correo electrónico en caso de que quieras preguntarnos o comentarnos algo. Sólo lo usaremos para tramitar tus consultas.</p><p>También recopilaremos la información necesaria para gestionar tus reservas y para mantenerte informado del estado de las mismas; en general, para operar como intermediario entre tú y el Establecimiento Turístico. Te pediremos tu nombre y apellidos, dirección, correo electrónico, número de teléfono, datos de la tarjeta de crédito y algunos otros datos que puedan resultar necesarios para dicha finalidad.</p><p>Accederemos y podremos tratar aquellos datos que nos hayas proporcionado en los formularios y en el uso que hagas de la Página web para los fines dispuestos en esta Política de Privacidad.</p><p>Además, por el uso que hagas de la Página podrás ir aportando diversa información personal, que utilizaremos de manera disociada para elaborar estadísticas. Con ello, pretendemos mejorar nuestros servicios y ofrecerte una navegación personalizada.
                        </p>
                        <p>
                            Siempre que nos lo hayas permitido de forma previa, te enviaremos ofertas relacionadas con nuestros servicios, especialmente a través de correo electrónico. Dichas ofertas pueden incluir publicidad de terceros ajenos a VikaHotel o al Establecimiento Turístico, pero estarán relacionados con los servicios que contrataste (por ejemplo, vuelos, transporte, otros destinos, alquileres de coches, etc). Si no deseas recibir este tipo de comunicaciones comerciales, marca la casilla para no otorgar tu consentimiento o escríbenos a [<span>CORREO</span>] en cualquier momento.
                        </p>
                        <p>
                            <b>Tus datos y el Establecimiento</b>
                        </p>
                        <p>Al hacer una reserva, estás dando tus datos a VikaHotel. No obstante, dado que el servicio es prestado por un Establecimiento Turístico y, en caso de que hayas contratado servicios adicionales, por terceros, VikaHotel necesita proporcionarles tus datos. A pesar de que no es necesario que nos otorgues tu consentimiento para ello, te informamos de que cederemos tus datos al Establecimiento Turístico en que hayas realizado una reserva y, en su caso, a aquéllas empresas a las que hayas contratado a través de la Página para la prestación de otros servicios adicionales.</p>
                        <p>
                            <b>Seguridad de los datos</b>
                        </p>
                        <p>Toda la parte de reserva en VikaHotel estará protegida mediante un protocolo de seguridad SSL, para que tus datos estén seguros. Tratamos de evitar que terceras personas puedan acceder a ellos poniendo todos los esfuerzos razonables para ello.</p>
                        <p><br>
                        </p>
                        <p>
                            <b>Tus derechos</b>
                        </p>
                        <p>
                            Puedes ejercer tus derechos de acceso, rectificación, cancelación y oposición según la ley enviándonos una petición escrita a BOOKING DETEATROS, S.L., Urbanización las Margaritas 43, 35660 Corralejo (Fuerteventura). Habrás de acompañar una fotocopia de tu DNI u otro documento oficial que te identifique, pues tenemos que comprobar que eres tú para no dar tus datos a otra persona, por ejemplo.
                        </p>
                        <p>
                            <b>Idioma</b>
                        </p>
                        <p>
                            El idioma aplicable a esta Política de Privacidad es el español. Si se te han ofrecido versiones de esta Política de Privacidad en otros idiomas, ha sido para tu comodidad y aceptas expresamente que las mismas se regirán siempre por la versión en español.
                        </p>
                        <p>
                            Si hay alguna contradicción entre lo que dice la versión en español de esta Política de Privacidad y lo que dice la traducción, en todo caso prevalecerá la versión en español.
                        </p>
                        <p>
                            <b>Dudas y consultas</b>
                        </p>
                        <p>Por supuesto, si tienes dudas o consultas sobre la protección de tus datos en VikaHotel, podrás enviarnos un email a [<span>CORREO</span>]. Trataremos de solucionarte lo antes posible tus dudas.
                        </p>


                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="book_conditions_modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">{#condiciones_de_reserva#}</h4>
                </div>
                <div class="modal-body">
                    <div style="overflow-y: auto; max-height: 400px">
                        {foreach from=$hotel->condiciones item=condicion}
                            <h4>{if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}</h4>
                            <p>
                                {if $condicion->descripciones->$lang}{$condicion->descripciones->$lang}{else}{$condicion->descripciones->es}{/if}
                            </p>
                        {/foreach}
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                </div>
            </div>
        </div>
    </div>
{/block}