{extends file="index.tpl"}

{block name="style" append}
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/reservar.css" />
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/toastr.css" />
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/validationEngine.jquery.css" />
{/block}

{block name="script" append}
<script src="{$template_url}/js/reservas.js"></script>
<script src="{$template_url}/js/toastr.js"></script>
<script src="{$template_url}/js/jquery.creditCardValidator.js"></script>
<script src="{$template_url}/js/jquery.validationEngine.js"></script>
<script src="{$template_url}/js/jquery.validationEngine-es.js"></script>
<script type="text/javascript">
var MOSTRAR_DETALLE = '{#mostrar_detalles_y_condiciones#}';
var OCULTAR_DETALLE = '{#ocultar_detalles_y_condiciones#}';
</script>

<script type="text/javascript" src="https://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
<script>
    var MONTHS = ['{#enero#}', '{#febrero#}', '{#marzo#}', '{#abril#}', '{#mayo#}', '{#junio#}', '{#julio#}', '{#agosto#}', '{#septiembre#}', '{#octubre#}', '{#noviembre#}', '{#diciembre#}'];
    var pay_now = {if $pagar_ahora || $hotel->tipoReserva ne 'offline'}true{else}false{/if};
    var error_msg = {if $error_msg}"{$error_msg}"{else}false{/if};
    var invalid_cupon_msg = "{#codigo_de_cupon_no_valido#}";
    var FechaText = "{#Fecha#}";
    var EspereText = "{#Espere_por_favor#}";
</script>
{/block}

{block name="main_content" append}
<div class="main_content content">
    <div class="row-fluid">
        <div class="row">
            <div class="col-md-8 reserva-left-side">
                    {if $excursiones && count($excursiones) && !$movile}
                    <ul class="nav nav-tabs breadcrumb-custom bread-2" id="reservation_tabs">
                        <li class="active bread-row">
                            <a href="#reservation_step" data-toggle="tab">
                                <div class="bread-number">1</div>
                                <div class="bread-text">{#tab_extras#}</div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                        <li class="bread-row data_step">
                            <a href="#data_step" data-toggle="tab">
                                <div class="bread-number">2</div>
                                <div class="bread-text">{#tab_completa_tus_datos#}</div>
                                <div class="clearfix"></div>
                            </a>
                        </li>
                    </ul>
                    {/if}
                    <!-- TAB CONTENT -->
                    <div class="row reservas-list-main {if $excursiones && count($excursiones)}tab-content{/if}">
                        <!-- reservation_step -->
                        <div class="col-md-12">
                                <div class="table-responsive">
                                    <div class="row-fluid clearfix">
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
                                        <div class="reserva-description col-sm-9">
                                            <h3 class="text-primary">{$apartamento['titulo']}</h3>
                                            {if $cantidad > 1}<p class="text-muted">{#cantidad#}: {$cantidad}</p>{/if}
                                            <p class="text-muted">{#llegada#}: {$inicio} 15:00</p>
                                            <p class="text-muted">{#salida#}: {$salida} 12:00</p>
                                            <p class="text-muted">{$noches} {#noche#}(s)</p>
                                            <p class="text-muted">{#Pax#}: {$apartamento['adultos']} {#Adulto_s#} {if $apartamento.ninios}+ {$apartamento.ninios} {#ninio_s#}{/if}</p>
                                            {if $apartamento['pension']}
                                                <p class="text-muted"><strong>{$apartamento['pension']}</strong></p>
                                            {/if}
                                            <p class="text-muted"><strong>{$apartamento['condicion']}</strong></p>
                                            <a class="btn btn-primary pull-right btn-xs" id="showServices">+ {#mostrar_detalles_y_condiciones#}</a>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="row-fluid" id="showServicesContainer">
                                <div class="col-sm-12">
                                    <h3 class="text-primary">{#descripcion_del_servicio#}:</h3>
                                    {foreach from=$cart->apartamentoObj->servicios item=servicio}
                                        <p>{$servicio}</p>
                                    {/foreach}
                                </div>
                            </div>
                        <div {if $excursiones && count($excursiones) && !$movile}class="tab-pane active"{/if} id="reservation_step">
                            
                            {if $excursiones && count($excursiones) && !$movile}
                            <!-- SEGUROS SECTION -->
                            <div class="col-md-12">
                                <h3>{#completa_tu_viaje_con_nuestras_ofertas_exclusivas_para_ti#}</h3>
                            </div>
                            {foreach from=$excursiones item=excursion}
                            <div class="col-md-12 panel-content tours_container">
                                <div class="panel-body">                                
                                    <div class="row">
                                        <div class="col-sm-3"><img src="{$service_url}{$excursion->fotos[0]->ruta|replace:'http://':'https://'}" class="reserva-img img-thumbnail" height="100" alt="{$excursion->nombre}"></div>
                                        <div class="col-sm-9">
                                            <div class="row">
                                                <div class="col-xs-11">
                                                    <p class="text-primary font-w-bold excursion-title">{$excursion->nombre}</p>

                                                    <ul class="parthenon-caption">
                                                        {if $excursion->precio_minimo}
                                                        <li>
                                                            <div class="icon-tag"></div>
                                                            <strong>{#precio_a_partir_de#}: </strong>{$excursion->precio_minimo}
                                                            <span class="subprice">({$excursion->precio_minimo_custom})</span>
                                                        </li>
                                                        {/if}

                                                        {if $excursion->duracion != '00:00'}
                                                        <li>
                                                            <div class="icon-time"></div>
                                                            <strong>{#Duracion#}: </strong> {$excursion->duracion}
                                                        </li>
                                                        {/if}

                                                         {if $excursion->guias}
                                                            <li>
                                                                <div class="icon-person"></div>
                                                                <strong>{#idioma_guia#}:</strong> {foreach from=$excursion->guias key=dd item=guia name=guias}{if !$smarty.foreach.guias.first}, {/if}<img src="{$template_url}/images/flags/{$dd}.png"> {$dd|upper}{/foreach}
                                                            </li>
                                                        {/if}
                                                    </ul>

                                                    {assign var=descripcion_breve value=$excursion->descripcionBreve|json_decode:1}
                                                    {assign var=descripcion_extendida value=$excursion->descripcionExtendida|json_decode:1}

                                                    <div class="producto_descripcion_breve">{$descripcion_breve[$lang]}</div>
                                                    <div style="display:none;" class="producto_descripcion_extendida">{$descripcion_extendida[$lang]}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-8 puntuation-container">
                                        {if count($excursion->opiniones)}<span><strong>{#puntuacion#}</strong></span> <span class="puntuation-val">{$excursion->rating}</span> <a class="ver-opiniones" href="">{#ver_las#} {count($excursion->opiniones)} {#opiniones#}</a>{/if}
                                        </div>
                                        <div class="col-sm-4 text-right">
                                            <a href="" class="btn btn-xs btn-primary i_wanna_it">{#mostrar_detalles#}</a>
                                        </div>
                                    </div>
                                    {if count($excursion->opiniones)}
                                    <div class="row opinions-list">
                                        
                                        <ul>
                                            {foreach from=$excursion->opiniones item=opinion}
                                            <li>
                                                <div class="pull-left">
                                                    <span class="opinion-val">{$opinion->puntuacion}</span>
                                                    <p class="pull-left">{$opinion->opinion}</p>
                                                </div>
                                            </li>
                                            {/foreach}
                                            
                                        </ul>
                                        
                                        <div class="clearfix"></div>
                                    </div>
                                    {/if}
                                    <form class="frmExcursion" role="form" >
                                    <div class="tarifas-table-main" style="display: none;">
                                        
                                        <div class="row add-cart-content">
                                            <div class="col-md-5">
                                                <div class="when-you-go-date" data-date-format="dd-mm-yyyy" data-date-week-start="1">
                                                    <input type="hidden" name="precio_apartamento" value="{$apartamento['precioTotal_format']}">
                                                    <input type="hidden" name="tarifaId">
                                                    <input type="hidden" name="eventoId" value="{$excursion->id}">
                                                    <input type="hidden" name="fecha">
                                                    <input type="hidden" name="fechasTarifas" value='[{foreach from=$excursion->tickets item=ticket name=tickets}{foreach from=$ticket->fechas item=fecha name=fechas}{if !$smarty.foreach.tickets.first || !$smarty.foreach.fechas.first},{/if}"{$fecha->fecha|date_format:"%e/%m/%Y"}->{$ticket->id}"{/foreach}{/foreach}]'>
                                                    {foreach from=$excursion->tickets item=ticket}
                                                    <input type="hidden" id="tarifa_{$ticket->id}" value='{$ticket->horarios_json}'>
                                                    {/foreach}
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <div class="when-you-go-content">
                                                    <p><strong>{#cuando_quieres_ir#}</strong></p>
                                                    <p class="set-when-you-go"></p>
                                                    <p class="a-que-hora">{#a_que_hora#}
                                                        <select class="form-control que_hora" placeholder="HH:mm" name="sesion">
                                                            {foreach from=$excursion->horarios item=horario}
                                                                <option value="{$horario|date_format:'%H:%M'}">{$horario|date_format:"%H:%M"}</option>
                                                            {/foreach}
                                                        </select>
                                                    </p>
                                                    <p class="completa-datos">{#ahora_completa_tus_datos_y_finaliza_tu_reserva#}</p>
                                                </div>
                                            </div>
                                        </div>
                                      
                                        <div class="row tarifas-table">
                                            <div class="col-md-12" id="tarifas-table">
                                                {foreach from=$excursion->tickets item=ticket name=tickets}
                                                
                                                <div class="tarifa_container entrada-selected" tarifa-id="{$ticket->id}">
                                                    
                                                    <!--<div class="select-tickets {if $excursion->ventaSimultaneaTickets}hidden{/if}">
                                                        <input type="radio" name="ticket{if $excursion->ventaSimultaneaTickets}_{$tarifa->id}_{$zona->id}{/if}" value="1" {if $excursion->ventaSimultaneaTickets}checked=""{/if}>
                                                    </div>-->
                                                    {assign var=ticket_nombre value=$ticket->nombre|json_decode:1}

                                                    <div class="text-right">
                                                        <label class="precio"><!--[{$ticket->nombre}] -->
                                                            <strong>{$ticket_nombre[$lang]}</strong>
                                                        </label>
                                                    </div>
                                                    <div class="select-cell no-padding">
                                                        <select name="entradas[{$ticket->id}]" precio="{$ticket->total_plano}" class="form-control" style="width:82px">
                                                            {foreach from=range(0,15) item=i}
                                                            <option value="{$i}" {if $i eq 1}selected{/if}>{$i}</option> 
                                                            {/foreach}
                                                            
                                                        </select>
                                                    </div>
                                                    <div class="subtotal-cell no-padding text-center">
                                                        <label class="totalEntradas"><strong>{$ticket->total}</strong>
                                                            <span class="subprice">({$ticket->total_custom})</span>
                                                        </label>
                                                        <input type="hidden" class="totalEntradasHidden" value="{$ticket->total_plano}">
                                                    </div>
                                                </div>
                                                
                                                {/foreach}
                                                
                                                
                                            </div>
                                            <div class="col-md-12">
                                                <div class="cupon-total-content hidden">
                                                    <div class="cupon-container">
                                                        <div>
                                                            <div>
                                                                <div class="text-right"><label class="cupon">{#tienes_un_cupon_promocional#}</label></div>
                                                                <div class="select-cell text-right no-padding"><input style="display: inline-block;margin: 0; width: 90px; padding: 7px 4px;" class="form-control" type="text" name="cupon"><input type="hidden" name="xdec"><input type="hidden" name="xtype"></div>
                                                                <div class="subtotal-cell text-center no-padding"><a class="validar_cupon btn btn-warning notHover" href="#">{#validar#}</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="cupon-total">
                                                        <div class="text-right no-padding">
                                                            <div>
                                                                <div>&nbsp;</div>
                                                                <div class="select-cell"><label>{#total#}: </label></div>
                                                                <div class="subtotal-cell text-center">
                                                                    <input type="hidden" name="total_format">
                                                                    <input type="hidden" name="total">
                                                                    <label class="precio_total"></label>
                                                                    <div><small>{#impuestos_incluidos#}</small></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row text-right">
                                            <div class="col-md-12">
                                                <a href="#" class="cancel_this_booking btn btn-primary">{#cerrar#}</a>
                                                <input type="submit" class="btn btn-primary" value="{#Anadir_a_mi_reserva#}">
                                            </div>
                                        </div>
                                    
                                    </div>
                                </form>
                                </div>
                            </div>                            
                            {/foreach}
                            {/if}
                           
                        </div>
                        <!-- end reservation_step -->

                        <!-- data_step -->
                        <div {if $excursiones && count($excursiones) && !$movile}class="tab-pane"{/if} id="data_step">
                            <form role="form" id="frmDatos" action="{$base_url}/reservar{$end_url}" method="post">
                            <div class="col-md-12">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                  <h3 class="panel-title">{#completa_tus_datos#}</h3>
                                </div>
                                <div class="panel-body">
                                  <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label for="nombre">{#nombre#}</label>
                                                            <input type="text" name="nombre" class="form-control validate[required]" placeholder="{#nombre#}" value="{$backData['nombre']}"/>
                                                        </div>
                                                        <div class="col-sm-6 form-group">
                                                            <label for="apellido">{#apellido#}</label>
                                                            <input type="text" name="apellido" class="form-control validate[required]" placeholder="{#apellido#}" value="{$backData['apellido']}"/>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                         <div class="col-sm-6 form-group">
                                                             <label for="email">{#correo_electronico#}</label>
                                                             <input type="text" name="email" class="form-control validate[required], custom[email]]" placeholder="{#correo_electronico#}" value="{$backData['email']}">
                                                         </div>
                                                         <div class="col-sm-6 form-group">
                                                             <label for="repeatEmail">{#repita_el_correo_electronico#}</label>
                                                             <input type="text" name="repeatEmail" class="form-control validate[required, custom[confirmationEmail]]" placeholder="{#repita_el_correo_electronico#}" value="{$backData['email']}">
                                                         </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label for="telefono">{#telefono_movil#}</label>
                                                            <input type="text" name="telefono" class="form-control" placeholder="{#telefono_movil#}" value="{$backData['telefono']}"/>
                                                        </div>
                                                        <div class="col-sm-6 form-group">
                                                            <label>{#pais_de_residencia#}</label>
                                                            <select class="form-control" name="pais">
                                                                {foreach from=$paises item=pais key=key}
                                                                    <option value="{$key}" {if (!$backData && $key eq 'ES') || $backData['pais'] eq $key}selected=""{/if}>{$pais}</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>{#Peticiones_especiales#}</label>
                                                                <textarea name="peticionesEspeciales" class="form-control" placeholder="{#Peticiones_especiales#}">{$backData['peticionesEspeciales']}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                        
                                                </div>
                                            </div>
                                </div>
                              </div>
                            
                            <div class="panel panel-success" id="pagar_reserva" {if !$pagar_ahora && $hotel->tipoReserva eq 'offline'}style="display:none;"{/if}>
                                <div class="panel-heading" id="panel_cobrar_tarjeta">
                                
                                    {if $pagar_ahora && !($hotel->tipoReserva eq 'cobro anticipado de comisiones')}
                                        <h3 class="panel-title">{#cobraremos_de_tu_tarjeta#} <span class="cobro_anticipado">{$cobro_anticipado}</span> {#en_concepto_de#}:</h3><p/>
                                        {if $hotel->tipoReserva eq 'online' && $hotel->porcentageCobroAnticipado > 0}
                                        <p>✓ {#garantia_de_tu_reserva#} {$apartamento['titulo']} {$hotel->porcentageCobroAnticipado}% <span id="cobraremos-tarjeta">{$currencyHotel}{$cobro_anticipado_hotel}</span></p>
                                        {else}
                                        <p> {$apartamento['titulo']} <span id="cobraremos-tarjeta">{$apartamento['precioTotal_format']}({#lo_pagaras_en_tu_llegada_al_hotel#})</span></p>
                                        {/if}
                                        {if $reservas_excursiones}
                                            {foreach from=$reservas_excursiones item=exc}
                                                {if $exc->forma_cobro == 'Online'}
                                                    <p id="cobrar_{$exc->timeId}">✓ {$exc->evento} {$exc->porcientoInicial}% <span>{$currencyHotel}{($exc->total * $exc->porcientoInicial / 100)|number_format:2:',':' '}</span></p>
                                                {else}
                                                    <p id="cobrar_{$exc->time-id}"> {$exc->evento} ({#lo_pagaras#} {$exc->forma_cobro_offline})</p>
                                                {/if}
                                            {/foreach}
                                        {/if}
                                    {else}
                                        <h3 class="panel-title">{#requiere_tarjeta_de_credito#}</h3>
                                        <p>{#pago_se_realizara#} {$hotel->nombre} {#durante_tu_estancia#}</p>
                                        {if $reservas_excursiones}
                                            {foreach from=$reservas_excursiones item=exc}
                                                {if $exc->forma_cobro eq 'online'}
                                                    <p id="cobrar_{$exc->time-id}">✓ {#garantia_de_tu_reserva#} {$exc->evento} {$exc->porcientoInicial}%  <span>{$currencyHotel}{($exc->total * $exc->porcientoInicial / 100)|number_format:2:',':' '}</span></p>
                                                {else}
                                                    <p id="cobrar_{$exc->time-id}"> {$exc->evento} ({#lo_pagaras#} {$exc->forma_cobro_offline})</p>
                                                {/if}
                                            {/foreach}
                                        {/if}
                                    {/if}
                                    
                                </div>
                                <div class="panel-body" id="tpvContainer">
                                            <div class="row datos-pago-content">
                                                <div class="col-sm-12">
                                                    <div class="row datos-pago">
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-12 form-group">
                                                                    <div class="col-md-12">
                                                                        <ul class="cards">                                                                            
                                                                                <li card="visa" title="Visa" class="visa off">Visa</li>                                                                            
                                                                                <li title="MasterCard" card="mastercard" class="mastercard off">Master Card</li>  
                                                                                <!--<li title="American Express" card="amex" class="amex off">American Express</li>-->
                                                                        </ul>
                                                                    </div>
                                                                    <div class="col-md-6 form-group">
                                                                            <label>{#numero_de_tarjeta#}</label>
                                                                            <input class="form-control validate[required, custom[customCreditCard]]" type=text name="tarjetaNumero" placeholder="{#numero_de_tarjeta#}" />
                                                                            <input type="hidden" name="tarjetaTipo">
                                                                    </div>
                                                                    <div class="col-md-6 form-group">
                                                                        <label>{#nombre_del_titular_que_aparece_en_la_tarjeta#}</label>
                                                                        <input type="text" class="form-control validate[required]" name="titular" placeholder="{#nombre_del_titular_que_aparece_en_la_tarjeta#}" readonly=""/>
                                                                    </div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                <div class="col-md-6 form-group">
                                                                    <label class="display-block">{#fecha_de_vencimiento#}</label>
                                                                    <div class="row">
                                                                    <div class="col-md-6">
                                                                    <select class="form-control vencimiento-option inline" name="caducidadMes">
                                                                        
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
                                                                    <div class="col-md-6">
                                                                    <select class="form-control vencimiento-option inline" name="caducidadAnio">
                                                                        
                                                                        {for $i=2014 to 2040}
                                                                            <option value="{$i}">{$i}</option>
                                                                        {/for}
                                                                    </select>
                                                                    </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3 form-group">
                                                                    <label>{#cvv#}</label>
                                                                    <input type="text" class="form-control validate[required, custom[integer]]" maxlength="4" name="cvv" placeholder="{#cvv#}">
                                                                </div>
                                                                <div class="col-md-3 ssl_seal_container">
                                                                <span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=GYXVmcV1zSFO0ewxdrrMYEd9oSBPeFYMpJ4mT8NT8To48V7SvEB"></script></span>
                                                                </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="row" id="panel_con_captcha" {if $pagar_ahora || $hotel->tipoReserva ne 'offline'}style="display:none;"{/if}>
                                        <div class="col-md-12">
                                            <div class="alert alert-success" id="panel_cobrar_tarjeta_captcha">
                                                <h3 class="panel-title">{#en_tu_llegada_a_hotel#}:</h3><p/>
                                                <p>✓ {$apartamento['titulo']} <span id="cobraremos-hotel">{$apartamento['precioTotal_format']}</span></p>
                                                {if $reservas_excursiones}
                                                    {foreach from=$reservas_excursiones item=exc}
                                                        <p id="cobrar_{$exc->timeId}">✓ {$exc->evento} <span>{$exc->total_format} ({#lo_pagaras#} {$exc->forma_cobro_offline})</span></p>
                                                    {/foreach}
                                                {/if}
                                            </div>
                                        </div>
                                            <div class="col-md-12">
                                                <div id="captchadiv"></div>
                                            </div>
                                    </div>
                                    
                                <div class="row">
                                    <div class="col-md-12">
                                    <div  class="bs-callout bs-callout-info">
                                      <h4>{#informacion_adicional#}</h4>
                                      <p>{#te_enviaremos_tu_reserva_por_mail_a#}: <span id="enviaremos-a-email"></span></p>
                                            <p>{if $hotel->informacionesCompra}
                                                    {if $hotel->informacionesCompra->$lang}
                                                        {$hotel->informacionesCompra->$lang}
                                                    {else}
                                                        {$hotel->informacionesCompra->es}
                                                    {/if}
                                                {else}
                                                {#es_imprescindible_que_lleves_contigo_el#} DNI, NIE {#o_pasaporte_para_identificarte_en_la_entrada_al_barco#}.{#tu_billete_no_es_transferible_a_otra_persona#}
                                                {/if}
                                            </p>
                                             <div class="form-group row">
                                <div class="col-lg-12">
                                   <div class="checkbox">
                                       <input type="checkbox" name="aceptoPoliticas" class="validate[required]">
                                       {#entiendo_y_acepto_las#} <a id="privacy_policies" href="javascript:void(0)">{#politicas_de_privacidad#}</a> {#y_las#} <a id="book_conditions" href="javascript:void(0)">{#condiciones_de_reserva#}</a>
                                   </div>
                                </div>
                            </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <input type="hidden" id="porcentageCobroAnticipado" value="{$hotel->porcentageCobroAnticipado}">
                                    <input type="hidden" name="idApartamento" value="{$apartamento['id']}">
                                    <input type="hidden" name="cantidad" value="{$cantidad}">
                                    <input type="hidden" name="cartID" value="{$cart->id}">
                                    <input type="submit" class="btn btn-primary" value="{#finalizar_reserva#}">
                                </div>                
                            </div>
                            </form>
                        </div>
                        <!-- end data_step -->
                        {if $excursiones && count($excursiones) && !$movile}
                        <!-- pay_step -->
                        <div class="tab-pane" id="pay_step">
                            <form role="form" class="">
                            <div class="col-md-12">        
                                <div class="row panel-content">
                                    <div class="col-md-12">
                                        <div class="panel-heading">
                                            <h4 class="text-primary">{#total_a_pagar#}</h4>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row total-bottom-content">
                                                <p><strong>{#total_a_pagar#}</strong></p>
                                                <p class="text-primary font-s24">155,00€</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <a href="#" class="btn btn-primary pay_booking">{#pagar_reserva#}</a>
                                </div>                                                        
                            </div>
                            </form>
                        </div>
                        <!-- end pay_step -->
                        {/if}
                    </div>
                
            </div>
            <div class="col-md-4 reserva-right-side">
                <div class="reservacion-list-content-main" style="margin-top: 0px;">
                    <div class="reservacion-list-content">
                        <div class="row-fluid reservacion-list bs-callout-info" style="padding-bottom: 1px;">
                            <div><h3>{#resumen_de_tu_reserva#}</h3></div>
                            <div>
                                <div class="row">
                                    <div class="reserva-description col-sm-12">
                                        <h4 class="text-primary">{$apartamento['titulo']}</h4>
                                        {if $cantidad > 1}<p class="text-muted">{#cantidad#}: {$cantidad}</p>{/if}
                                        <p class="text-muted">{#llegada#}: {$inicio}</p>
                                        <p class="text-muted">{#salida#}: {$salida}</p>

                                        <p class="text-muted">{$noches} {#noches#}</p>
                                         <p class="text-muted">{#Pax#}: {$apartamento['adultos']} {#Adulto_s#} {if $apartamento.ninios}+ {$apartamento.ninios} {#ninio_s#}{/if}</p>                                        
                                        <p class="text-muted"><strong>{$apartamento['codicion']}</strong></p>
                                        <p class="text-info lead"><strong>{$apartamento['precioTotal_format']} <span class="subprice">({$apartamento['precioTotal_format_usuario']})</span></strong></p>
                                    </div>
                                </div>
                                <div class="row" id="resumen-reserva-otros">
                                    <div class="reserva-description col-sm-12 hidden">
                                        <h4 class="text-primary excursion-nombre"></h4>
                                        <p class="text-muted excursion-fecha"></p> 
                                        <div class="entradas">
                                        <p class="text-muted excursion-entradas"><strong></strong></p>
                                        </div>
                                        <p class="text-info lead excursion-precio"><strong></strong></p>
                                        <div class="eliminar-excursion"><a href="#"><img src="{$template_url}/images/icons/delete-icon-on.png" alt="Delete" height="18" alt="delete"></a></div>
                                    </div>
                                    {if $reservas_excursiones}
                                    {foreach from=$reservas_excursiones item=reserva_exc}
                                        <div class="reserva-description col-sm-12" id="{$reserva_exc->timeId}">
                                            <h4 class="text-primary excursion-nombre">{$reserva_exc->evento}</h4>
                                            <p class="text-muted excursion-fecha">Fecha {$reserva_exc->fecha|date_format:"%e/%m/%Y"} {$reserva_exc->hora}</p> 
                                            <div class="entradas">
                                            {foreach from=$reserva_exc->entradas item=reserva_ent}
                                                <p class="text-muted excursion-entradas"><strong>{$reserva_ent->descripcion}</strong></p>
                                            {/foreach}
                                            </div>
                                            <p class="text-info lead excursion-precio"><strong>{$reserva_exc->total_format}</strong></p>
                                            <div class="eliminar-excursion"><a href="#"><img src="{$template_url}/images/icons/delete-icon-on.png" alt="Delete" height="18" alt="delete"></a></div>
                                        </div>
                                    {/foreach}
                                    {/if}
                                </div>
                            </div>
                            <div>
                                <p class="text-info lead">
                                    <strong class="pull-left">{#Total#} </strong> <strong class="pull-right" id="precio-total-label">{$precio_total} {if $precio_total_moneda}<span class="subprice">({$precio_total_moneda})</span>{/if} </strong>
                                </p>
                                <p class="impuestos_incluidos_label">
                                    <small>{#impuestos_incluidos#}</small>
                                </p>
                                <div class="text-right continuar_container">
                                    {if $excursiones && count($excursiones)}<a href="#" class="btn btn-primary go-step-2">{#continuar#}</a>{/if}
                                </div>
                            </div>
                            {if !$pagar_ahora}
                                <p class="pago_informacion_carrito">{#pago_se_realizara#} {$hotel->nombre} {#durante_tu_estancia#}</p>
                            {/if}

                        </div>
                    </div>
                    <br />
                    {if $excursiones && count($excursiones) && !$movile}
                        {if $regla_cupon && $cupon}
                        <div class="alert alert-success">
                            <p>{#por_reserva_superior_a#} {$regla_cupon->monto|number_format:2:',':' '}&euro; {#obtendras_un_cupon_por_un_valor_de#} {if $regla_cupon->tipoDescuento eq '%'}{$regla_cupon->descuento}{else}{$regla_cupon->descuento|number_format:2:',':' '}{/if}{$regla_cupon->tipoDescuento} {#para_excursiones_transfer_y_mas#}!"</p>
                            <p class="cupon-text">{#tu#} <strong>{#codigo#}</strong> {#de_cupon_es#} : <b><strong class="lead">{$cupon->codigo|upper}</strong></b></p>
                        </div>
                        {/if}
                    {/if}
                </div>
                <br />
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