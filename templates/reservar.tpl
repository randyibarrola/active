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
                            <h1>Reserva tu actividad ahora. <span>-20% dto.</span></h1>
                            <form id="booking-tour-form" role="form" action="#" method="get" class="pull-right">
                                <input type="hidden" name="tour[]" class="booking-tour-form-book" />
                                <input class="btn app-btn-pink" type="submit" value="Proceder al pago >>" />
                            </form>
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
                        <div class="item">
                            <div class="row">
                                <div class="col-md-9 col-sm-12 col-xs-12">
                                    <h5 class="">Excursión Segway</h5>
                                    <div class="media">
                                        <div class="pull-left">
                                            <img class="media-object" src="{$template_url}/newdesing/tmp/excursion.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p class="description">
                                                Ten la experiencia del surf durante tus vacaciones en Fuerteventura!
                                                Protest surfschool ofrece clases.
                                                <a href="#">[Saber más]</a>
                                            </p>
                                            <div class="guide-languages">
                                                <label><i class="glyphicon glyphicon-user"></i> Guía</label>
                                                <ul class="list-inline flags">
                                                    <li>
                                                        <img src="{$template_url}/assets/images/flags/es.png">
                                                    </li>
                                                    <li>
                                                        <img src="{$template_url}/assets/images/flags/gb.png">
                                                    </li>
                                                </ul>
                                            </div>
                                            <a href="#" class="more-info show-booking-tour-form" data-more="Mostrar detalles de la actividad" data-minus="Ocultar detalles de la actividad">
                                                <span>Mostrar detalles de la actividad</span> <i class="glyphicon glyphicon-chevron-down"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12 booking-options">
                                    <div class="option">
                                        <h5>desde:</h5>
                                        <label class="current-price">12,50&euro;</label>
                                        <label class="old-price">17,20&euro;</label>
                                        <button class="btn app-btn-pink show-booking-tour-form">
                                            Lo quiero
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
                                                    <div class="form-group persons">
                                                        <label class="control-label">Adultos:</label>
                                                        <select class="select2 form-control adult-count">
                                                            <option value="1" selected="selected">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                        </select>
                                                        <input type="hidden" class="adult-price" value="12.50" />
                                                        <label class="sub-price"><span>12,50</span>&euro;</label>
                                                    </div>
                                                    <div class="form-group persons">
                                                        <label class="control-label">Niños:</label>
                                                        <select class="select2 form-control child-count">
                                                            <option value="0" selected="selected">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                        </select>
                                                        <input type="hidden" class="child-price" value="5" />
                                                        <label class="sub-price"><span>0</span>&euro;</label>
                                                    </div>
                                                    <h4 style="margin-top: 25px;">Introduce tu código descuento:</h4>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control discount-code" />
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
                        <div class="item">
                            <div class="row">
                                <div class="col-md-9 col-sm-12 col-xs-12">
                                    <h5 class="">Excursión Segway</h5>
                                    <div class="media">
                                        <div class="pull-left">
                                            <img class="media-object" src="{$template_url}/newdesing/tmp/excursion.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p class="description">
                                                Ten la experiencia del surf durante tus vacaciones en Fuerteventura!
                                                Protest surfschool ofrece clases.
                                                <a href="#">[Saber más]</a>
                                            </p>
                                            <div class="guide-languages">
                                                <label><i class="glyphicon glyphicon-user"></i> Guía</label>
                                                <ul class="list-inline flags">
                                                    <li>
                                                        <img src="{$template_url}/assets/images/flags/es.png">
                                                    </li>
                                                    <li>
                                                        <img src="{$template_url}/assets/images/flags/gb.png">
                                                    </li>
                                                </ul>
                                            </div>
                                            <a href="#" class="more-info show-booking-tour-form" data-more="Mostrar detalles de la actividad" data-minus="Ocultar detalles de la actividad">
                                                <span>Mostrar detalles de la actividad</span> <i class="glyphicon glyphicon-chevron-down"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12 booking-options">
                                    <div class="option">
                                        <h5>desde:</h5>
                                        <label class="current-price">12,50&euro;</label>
                                        <label class="old-price">17,20&euro;</label>
                                        <button class="btn app-btn-pink show-booking-tour-form">
                                            Lo quiero
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
                                                    <div class="datepicker" data-sync=".selected-date-2" data-start-date="today">
                                                        <input type="hidden" class="selected-date-2" />
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
                                                    <div class="form-group persons">
                                                        <label class="control-label">Adultos:</label>
                                                        <select class="select2 form-control adult-count">
                                                            <option value="1" selected="selected">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                        </select>
                                                        <input type="hidden" class="adult-price" value="12.50" />
                                                        <label class="sub-price"><span>12,50</span>&euro;</label>
                                                    </div>
                                                    <div class="form-group persons">
                                                        <label class="control-label">Niños:</label>
                                                        <select class="select2 form-control child-count">
                                                            <option value="0" selected="selected">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                        </select>
                                                        <input type="hidden" class="child-price" value="5" />
                                                        <label class="sub-price"><span>0</span>&euro;</label>
                                                    </div>
                                                    <h4 style="margin-top: 25px;">Introduce tu código descuento:</h4>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control discount-code" />
                                                                                            <span class="input-group-btn">
                                                                                                <button class="btn app-btn-blue app-upper-text btn-discount-code" type="button">Validar</button>
                                                                                            </span>
                                                        </div>
                                                        <div class="discount-validate" style="display: none;">
                                                            <label class="sub-price">0</label>
                                                            <i class="glyphicon glyphicon-remove-circle tooltips" data-original-title="Quitar"></i>
                                                        </div>
                                                        <input type="hidden" class="discount" value="0" data-discount-type="number" />
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
                        </div>
                    </div>
                {/if}

                <!-- Formulario de completar reserva -->
                <div class="booking-confirm-content" style="{if $excursiones && count($excursiones)}display: none{/if}">
                    <form id="booking-confirm-form" class="form-horizontal" role="form" action="#" method="post">
                        <div class="well-white">
                            <div class="head">
                                <h1>Datos del titular de la habitación <span>(Debe ser mayor de 18 años)</span></h1>
                            </div>
                            <fieldset>
                                <p class="fieldset-info">
                                    <label>Habitación 1:</label> 2 adultos, 1 cama individual
                                </p>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">Nombre de contacto <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control" placeholder="Nombre y apellidos" />
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">País de origen</label>
                                        <select class="select2 form-control">
                                            <option value="AFG">Afganistán</option>
                                            <option value="CUB">Cuba</option>
                                            <option value="ESP" selected="selected">España</option>
                                            <option value="KOR">Korea</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">Dirección de correo electrónico <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control" />
                                        <div class="help-block">
                                            <span>Compruébelo, le enviaremos los detalles de su reserva.</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label class="control-label">Número de teléfono <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="">
                                                Selecciona esta casilla si no quiere recibir correos electrónico con ofertas especiales, promociones y otra información.
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="well-white well-divider">
                            <div class="head">
                                <h1>
                                    Tus datos para el pago
                                    <div class="card-logos pull-right">
                                        <img src="{$template_url}/newdesing/images/visa-logos.png" />
                                        <img src="{$template_url}/newdesing/images/godaddy.png" />
                                    </div>
                                </h1>
                            </div>
                            <div class="well-green-light">
                                <label>¡Sin cargos de gestión! Tu tarjeta de crédito solo es necesaria porque garantiza tu reserva</label>
                                Mercure Madrid Santo Domingo aplica las políticas de cobro según las <a href="#">condiciones de la tarifa seleccionada</a>.
                            </div>
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-5 col-sm-12 col-xs-12">
                                        <label class="control-label">Número de tarjeta de débito/crédito <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control" />
                                    </div>
                                    <div class="col-md-7 col-sm-12 col-xs-12">
                                        <label class="control-label">Nombre del titular de la tarjeta de crédito <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-sm-6 col-xs-12">
                                        <label class="control-label">Fecha de caducidad <span class="required"><i class="glyphicon glyphicon-star"></i></span></label>
                                        <div class="caducity-date">
                                            <select class="select2 form-control" data-placeholder="Mes">
                                                <option value=""></option>
                                                <option value="Ene">Ene</option>
                                                <option value="Feb">Feb</option>
                                                <option value="Mar">Mar</option>
                                                <option value="Abr">Abr</option>
                                                <option value="May">May</option>
                                                <option value="Jun">Jun</option>
                                                <option value="Jul">Jul</option>
                                                <option value="Ago">Ago</option>
                                                <option value="Sep">Sep</option>
                                                <option value="Oct">Oct</option>
                                                <option value="Nov">Nov</option>
                                                <option value="Dic">Dic</option>
                                            </select>
                                        </div>
                                        <div class="caducity-date">
                                            <select class="select2 form-control" data-placeholder="Año">
                                                <option value=""></option>
                                                <option value="2014">2014</option>
                                                <option value="2015">2015</option>
                                                <option value="2016">2016</option>
                                                <option value="2017">2017</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <label class="control-label">
                                            Número de identificación de tarjeta
                                            <span class="required"><i class="glyphicon glyphicon-star"></i></span>
                                            <span class="tooltips" data-toggle="tooltip" title="Texto de información"><i class="glyphicon glyphicon-question-sign"></i></span>
                                        </label>
                                        <input type="text" class="form-control card-number" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="well-white well-divider">
                            <div class="head">
                                <h1>Política de cancelación y condiciones</h1>
                            </div>
                            <fieldset>
                                <p class="fieldset-info">
                                    <label>Tarifa especial no reembolsable</label><br/>
                                    Esta tarifa de descuento especial no es reembolsable. Si eliges cambiar o cancelar esta reserva, no se te reembolsará el pago.
                                </p>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label class="control-label">Peticiones especiales o comentarios para el hotel</label>
                                        <textarea class="form-control" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="well-gray well-divider">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value=""> <span class="required"><i class="glyphicon glyphicon-star"></i></span>
                                            Declaro que acepto el compromiso de pago y que he leido y acepto
                                            <a href="#">normas y restricciones <i class="glyphicon glyphicon-new-window"></i></a>
                                            , los <a href="#">términos y condiciones <i class="glyphicon glyphicon-new-window"></i></a>
                                            y la <a href="#">política de provacidad <i class="glyphicon glyphicon-new-window"></i></a>.
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-5 col-xs-6">
                                        <input type="submit" class="btn app-btn-pink" value="Finalizar reserva">
                                    </div>
                                </div>
                                <div class="row secure-data-info">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <p>
                                            <i class="glyphicon glyphicon-lock"></i>
                                            Utilizamos procesos de almacenamientos cifrados y transmisión segura para proteger tus datos personales.
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
                    <h4 class="title">1. Selecciona habitación</h4>
                    <div class="content">
                        <p><label>Habitación Doble - 1 o 2 camas</label></p>
                        <p>Llegada: jueves, 16-10-2014</p>
                        <p>Salida: miércoles, 22-10-2014</p>
                        <p>6 Noches</p>
                        <p>Pax: 2 Adulto(s)</p>
                        <p><label>Solo alojamiento</label></p>
                        <div class="pay text-right">
                            <p class="prepay block">
                                74,50&euro;
                                <span class="saving">Te ahorras 6,50&euro;</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="booking-info-step step-2 active">
                    <h4 class="title">2. Actividades y tours</h4>
                    <div class="content">
                        <p>No has añadido ninguna.</p>
                    </div>
                </div>
                <div class="booking-info-step step-3">
                    <h4 class="title">3. Confirmar reserva</h4>
                    <div class="content">
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}