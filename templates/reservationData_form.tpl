<body style="background-color: #fff;">
    <form role="form" id="frmDatos" action="{$vikahotel_url}/reservationForm/{$end_url}" method="post">
    <div class="col-sm-12">
    <div class="panel panel-success">
        <div class="panel-heading">
          <h3 class="panel-title">{#completa_tus_datos#}</h3>
        </div>
        <div class="panel-body">
          <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label for="nombre">{#nombre#}/s</label>
                                    <input type="text" name="nombre" class="form-control validate[required]" placeholder="Nombre/s" value="{$backData['nombre']}"/>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label for="apellido">{#apellido#}/s</label>
                                    <input type="text" name="apellido" class="form-control validate[required]" placeholder="Apellido/s" value="{$backData['apellido']}"/>
                                </div>
                            </div>
                            <div class="row">
                                 <div class="col-sm-6 form-group">
                                     <label for="email">{#correo_electronico#}</label>
                                     <input type="text" name="email" class="form-control validate[required], custom[email]]" placeholder="Correo electrónico" value="{$backData['email']}">
                                 </div>
                                 <div class="col-sm-6 form-group">
                                     <label for="repeatEmail">{#repita_el_correo_electronico#}</label>
                                     <input type="text" name="repeatEmail" class="form-control validate[required, custom[confirmationEmail]]" placeholder="Repita el correo electrónico" value="{$backData['email']}">
                                 </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label for="telefono">{#telefono_movil#}</label>
                                    <input type="text" name="telefono" class="form-control" placeholder="Teléfono móvil (para incidencias)" value="{$backData['telefono']}"/>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <label>{#pais_de_residencia#}</label>
                                    <select class="form-control" name="paisId">
                                        {foreach from=$paises item=pais}
                                            <option value="{$pais->id}" {if $backData && $backData['paisId']}{if $pais->id eq $backData['paisId']}selected=""{/if}{else}{if $pais->id eq 724}selected=""{/if}{/if}>{$pais->nombre}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label>Peticiones especiales</label>
                                        <textarea name="peticionesEspeciales" class="form-control" style="resize: none;">{$backData['peticionesEspeciales']}</textarea>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
        </div>
      </div>
      {if $pagar_ahora}  
      <div class="panel panel-success">
        <div class="panel-heading" id="panel_cobrar_tarjeta">
            <h3 class="panel-title">{#cobraremos_de_tu_tarjeta#} <span class="cobro_anticipado">{$cobro_anticipado}</span> {#en_concepto_de#}:</h3><p/>
            {if $hotel->tipoReserva ne 'offline'}
            <p>✓ {#garantia_de_tu_reserva#} {$apartamento->titulo} {$hotel->porcentageCobroAnticipado}% <span id="cobraremos-tarjeta">{$currency}{$cobro_anticipado_hotel}</span></p>
            {else}
            <p> {$apartamento->titulo} <span id="cobraremos-tarjeta">{$apartamento->precioTotal_format}(lo pagarás en tu llegada al hotel)</span></p>
            {/if}
            {if $reservas_excursiones}
                {foreach from=$reservas_excursiones item=exc}
                    {if $exc->forma_cobro == 'Online'}
                        <p id="cobrar_{$exc->timeId}">✓ {$exc->evento} {$exc->porcientoInicial}% <span>{$currency}{($exc->total * $exc->porcientoInicial / 100)|number_format:2:',':' '}</span></p>
                    {else}
                        <p id="cobrar_{$exc->timeId}">✘ {$exc->evento} (lo pagaras en recepción)</p>
                    {/if}
                {/foreach}
            {/if}
        </div>
        <div class="panel-body">
                    <div class="row datos-pago-content">

                        <div class="col-sm-12">
                            <div class="row datos-pago">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-12 form-group">
                                            <div class="col-sm-12">
                                                <ul class="cards">                                                                            
                                                        <li card="visa" title="Visa" class="visa off">Visa</li>                                                                            
                                                        <li title="MasterCard" card="mastercard" class="mastercard off">Master Card</li>                                                                            
                                                </ul>
                                            </div>
                                            <div class="col-sm-6 form-group">
                                                    <label>{#numero_de_tarjeta#}</label>
                                                    <input class="form-control validate[required, custom[customCreditCard]]" type=text name="tarjetaNumero" placeholder="{#numero_tarjeta_credito#}" />
                                                    <input type="hidden" name="tarjetaTipo">
                                            </div>
                                            <div class="col-sm-6 form-group">
                                                <label>{#nombre_del_titular_que_aparece_en_la_tarjeta#}</label>
                                                <input type="text" class="form-control validate[required]" name="titular"/>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="row">


                                        <div class="col-sm-6 form-group">
                                            <label class="display-block">{#fecha_de_vencimiento#}</label>
                                            <div class="col-sm-6">
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
                                            <div class="col-sm-6">
                                            <select class="form-control vencimiento-option inline" name="caducidadAnio">

                                                {for $i=2014 to 2040}
                                                    <option value="{$i}">{$i}</option>
                                                {/for}
                                            </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>CVV</label>
                                            <input type="text" class="form-control validate[required, custom[integer]]" maxlength="4" name="cvv">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            {else}
            <div class="row">
                <div class="col-sm-12">
                    <div class="alert alert-success" id="panel_cobrar_tarjeta">
                        <h3 class="panel-title">{#en_tu_llegada_a_hotel#} {$hotel->nombre} {#pagaras#} :</h3><p/>
                        <p>✓ {$apartamento->titulo} <span id="cobraremos-hotel">{$apartamento->precioTotal_format}</span></p>
                        {if $reservas_excursiones}
                            {foreach from=$reservas_excursiones item=exc}
                                <p id="cobrar_{$exc->timeId}">✓ {$exc->evento} <span>{$exc->total_format}</span></p>
                            {/foreach}
                        {/if}
                    </div>
                </div>
                    <div class="col-sm-12">
                        <div id="captchadiv"></div>
                    </div>
            </div>
            {/if}
        <div class="row">
            <div class="col-sm-12">
            <div class="bs-callout bs-callout-info">
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
            <input type="hidden" name="cartID" value="{$cart->id}">
            <input type="submit" class="btn btn-primary" value="Finalizar reserva">
        </div>                
    </div>
    </form>
</body>          
<link href='https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Open+Sans:400,700' rel='stylesheet' type='text/css'>
      <link href="{$template_url}/css/bootstrap.css" rel="stylesheet">
      <link href="{$template_url}/css/animate.css" rel="stylesheet">
      <link href="{$template_url}/css/style.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="{$template_url}/css/validationEngine.jquery.css" />
      <link rel="stylesheet" type="text/css" href="{$template_url}/css/toastr.css" />
      <link rel="stylesheet" type="text/css" href="{$template_url}/css/reservar.css" />
      <script>
      var BASE_URL = "{$base_url}";
      var END_URL = "{$end_url}";
      var LANG = "{$lang}";
      var CURRENCY = "{$currency}";
      //top.hideFrameBlocker();
      var error_msg = false;
      {if $error_msg}
          error_msg = "{$error_msg}";
      {/if}
      </script>
      
      <script src="{$template_url}/js/jquery.js"></script>
      <script src="{$template_url}/js/bootstrap.min.js"></script>
      <script src="{$template_url}/js/reservas.min.js"></script>
    <script src="{$template_url}/js/toastr.js"></script>
    <script src="{$template_url}/js/jquery.creditCardValidator.js"></script>
    <script src="{$template_url}/js/jquery.validationEngine.js"></script>
    <script src="{$template_url}/js/jquery.validationEngine-es.js"></script>
    
    {if !$pagar_ahora}
    <script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
    {/if}
      