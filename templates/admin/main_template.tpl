<!DOCTYPE HTML>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    {if $hotel->seo}
    <meta name="description" content="{if $hotel->descripcionesCortas->$lang}{$hotel->descripcionesCortas->$lang}{else}{$hotel->descripcionesCortas->es}{/if}">
    <meta name="keywords" content="{if $hotel->jkeywordsSeo->$lang}{$hotel->jkeywordsSeo->$lang}{else}{$hotel->jkeywordsS->es}{/if}">
    {else}
    <meta name="robots" content="noindex,nofollow">
    {/if}
    <title>{if $hotel->seo}{if $hotel->titulosSeo->$lang}{$hotel->titulosSeo->$lang}{else}{$hotel->titulosSeo->es}{/if}{/if}</title>
    {block "style"}
      <link href="{$template_url}/css/bootstrap.css" rel="stylesheet">
      <link href="{$template_url}/css/flexslider.css" rel="stylesheet">
      <link href="{$template_url}/css/datepicker.css" rel="stylesheet">
      <link href="{$template_url}/css/style.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="{$template_url}/css/validationEngine.jquery.css" />
      <link rel="stylesheet" type="text/css" href="{$template_url}/css/toastr.css" />
      <link href="{$template_url}/css/print.css" rel="stylesheet" type="text/css"/>
    {/block}
    <link href='https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
     <!--[if IE 8]>
        <script src="{$template_url}/js/html5shiv.js"></script>
        <script src="{$template_url}/js/respond.min.js"></script>
    <![endif]-->

    {if $hotel->claveGoogleAnalytics}
      <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '{$hotel->claveGoogleAnalytics}']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      </script>
    {/if}
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-47599454-41']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      </script>
    {if $hotel->chat}
    {literal}    
    <script type="text/javascript">
    window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
    d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
    _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');
    $.src='//v2.zopim.com/?1suHH2NopXnrAB3IrfQ0SKYy5LomQJWo';z.t=+new Date;$.
    type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
    </script>    
    {/literal}
    {/if}
  </head>

<body class="{if $hotel->logo && false}official{/if}" style="background-color: #F5F5F4;">
  <div id="blocker" style="display: none;">
    <div>Loading...</div>
  </div>
  <div class="navbar-collapse" id="accept-cookies">
            <div>{#aceptar_cookies#} <a href="" id="accept-cookies-btn">{#Aceptar#}</a>
            <a href="" id="readCookiesBtn">{#leer_politica_de_cookies#}</a></div>
            
        </div>

    <div class="navbar navbar-inverse">
        
        <div id="header_vikahotel" >
            <div class="row-fluid">
                <div class="col-md-6 vikahotel">
                <a class="navbar-brand" href="http://{#sistema_web#}">
                    <label class="vikahotel-logo">
                        <!--<span>Vika</span><span>Hotel.com</span>-->
                        <img src="{$template_url}/images/logo_s.png">
                    </label>                
                </a>
                </div>
                <div class="col-md-6 distribuidor">
                    <label></label>
                </div>
                    <div class="clearfix"></div>
            </div>
        </div>
        
        <div class="navbar-header">
          <div class="navbar-brand-container hotel-logo-movil">
            <h3>Hoteles, Apartamentos, Villas, Hostales y mas...</h3>
          </div>
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse">
        <div class="navbar-brand-container hotel-logo-nomovil">
            <h3>{#Hoteles_Apartamentos_Villas_Hostales_y_mas#}</h3>
          </div>
          <ul class="nav navbar-nav">
            <li>      
              <a class="pull-right contacto_modal" href="javascript:void(0)">{#Contactar#}</a>
            </li>
            <li>
              <a class="pull-right recuperar_reserva_modal" href="javascript:void(0)">{#Recuperar_reserva#}</a>
            </li>
            <li>
              <a class="pull-right inicio" href="{$base_url}/admin-login">{#Ingresar#}</a>
            </li>
            <li class="dropdown">
            
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="{$template_url}/images/flags/{$lang|lower}.png"> {$lang|upper} <b class="caret"></b></a>
                {if $idiomas && count($idiomas)}    
                <ul class="dropdown-menu">
                  {foreach from=$idiomas item=idioma}
                      {if $idioma->codigo ne $lang}
                          {if substr_count($actual_url, '/reservar/') > 0}
                              <li><a href="{$base_url}/{$idioma->codigo}/{#disponibilidad_url#}{if $money}/m:{$money}{/if}?inicio={$inicio|date_format:"%d-%m-%Y"}&salida={$salida|date_format:"%d-%m-%Y"}">
                                      <img src="{$template_url}/images/flags/{$idioma->codigo|lower}.png">
                                      {$idioma->codigo|upper}
                                  </a>
                              </li>
                          {else}
                              <li>
                                  <a href="{$base_url}/{$idioma->codigo}/{$action_controller}{if $money}/m:{$money}{/if}{$end_actual_url}">
                                      <img src="{$template_url}/images/flags/{$idioma->codigo|lower}.png">
                                      {$idioma->codigo|upper}
                                  </a>
                              </li>
                          {/if}
                      {/if}
                  {/foreach}
                </ul>
                {/if}
              </li>
          </ul>
        </div>
    </div>

    <div class="theme-showcase" id="main-content-theme">
      {block "main_content"}{/block}
    </div> 
<div class="modal fade" id="ley_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#ley_proteccion_datos#}</h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:ley/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>
                        
        <div class="modal fade" id="terminos_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#terminos_y_condiciones#}</h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:terminos/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>
                        
        <div class="modal fade" id="privacidad_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#politica_privacidad#}</h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:privacidad/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>
                    
        <div class="modal fade" id="cookies_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#politica_de_cookies#}</h4>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:cookies/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="contacto_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#contactanos#}</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                          <address>
                              <strong>{#email#}:</strong>
                              <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a><br />
                              <strong>{#telefono#}:</strong>
                              <span>{#empresa_telefono#}</span><br />
                              <!--<strong style="width: 65px;
height: 20px;
display: block;
float: left;clear:both;">&nbsp;</strong>
                              <span>0034 638 30 29 84</span><br />
                              <strong  style="width: 65px;
height: 20px;
display: block;
float: left;clear:both;">&nbsp;</strong>
                              <span>0034 622 00 94 67</span>-->
                            </address>
                          <form id="contact-form">
                              <div class="row-fluid">
                                  <div class="row">
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <input class="form-control validate[required]" type="text" name="nombre" placeholder="{#nombre_completo#}">
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <input class="form-control validate[required, custom[email]]" type="text" name="email" placeholder="{#correo_electronico#}">
                                    </div>
                                  </div>
                                  </div>
                                    
                                  <div class="row">
                                  <div class="col-md-12">
                                    <div class="form-group">
                                      <textarea rows="5" class="form-control validate[required]" name="mensaje" placeholder="{#mensaje#}"></textarea>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="captchaContainer"></div>
                                        </div>
                                          <div class="clearfix"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input type="submit" class="btn btn-success pull-right" value="{#enviar#}">
                                        </div>
                                    </div>
                                    
                                  </div>
                                  </div>
                              </div>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="recuperar_reserva_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#Recupera_tu_reserva#}</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                      <form id="recover-form">
                          <div class="row-fluid">
                              <div class="row">
                                  <div class="col-md-12">
                                    <div class="form-group">
                                      <input class="form-control validate[required, custom[email]]" type="text" name="email" placeholder="{#correo_electronico#}">
                                    </div>
                                      <input type="hidden" name="action" value="recuperar">
                                    <input type="submit" class="btn btn-success pull-right" value="{#enviar#}">
                                  </div>
                              </div>
                          </div>
                      </form>
                  </div>
                    </div>
                </div>
            </div>
        </div>


    <div class="modal fade" id="detalle_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{#detalles_del_servicio#}</h4>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>

    <div class="modal fade" id="cookies_modal">
      <div class="modal-dialog">
          <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title">{#politica_de_cookies#}</h4>
              </div>
              <div class="modal-body">

              </div>
              <div class="modal-footer">
                  <a href="{$base_url}/ajax-popup/id:cookies/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                  <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
              </div>
          </div>
        </div>
    </div>
    {block "script"}
      <script type="text/javascript">
        var BASE_URL = "{$base_url}";
        var END_URL = "{$end_url}";
        var LANG = "{$lang}";
        var CURRENCY = "{$currency}";
        var FECHAS_DETENER_VENTAS = new Array({if $hotel->fechas}{foreach from=$hotel->fechas item=f name=f}{if !$smarty.foreach.f.first},{/if}'{$f->fecha|date_format:"%Y-%m-%d"}'{/foreach}{/if});
        var ESTANCIA_MINIMA = {if $hotel->estanciaMinima}{$hotel->estanciaMinima}{else}1{/if};
        var VENTA_ANTICIPADA = {if $hotel->ventaAnticipada}{$hotel->ventaAnticipada}{else}0{/if};
        var END_DATE_CONTRATO = {if $hotel->finContrato}"{$hotel->finContrato|date_format:"%Y-%m-%d"}"{else}false{/if};
        var label_noches="{#noche_s#}";
        var su_reserva_sera_de = "{#su_reserva_sera_de#}";
      </script>
      <script src="{$template_url}/js/jquery.js"></script>
      <script src="{$template_url}/js/bootstrap.min.js"></script>
      <script src="{$template_url}/js/holder.js"></script>
      <script src="{$template_url}/js/bootstrap-datepicker.js"></script>
      <script type="text/javascript" src="{$template_url}/js/jquery.flexslider-min.js"></script>
      <script type="text/javascript" src="{$template_url}/js/jquery.raty.min.js"></script>
      <script src="{$template_url}/js/main.js"></script>
      <script src="{$template_url}/js/bootstrap-datepicker.{$lang}.js"></script>
      <script src="{$template_url}/js/jquery.validationEngine-es.js"></script>
      <script src="{$template_url}/js/jquery.validationEngine.js"></script>
      <script src="{$template_url}/js/toastr.js"></script>
      
      <script src="{$template_url}/js/admin/vikahotel.js" type="text/javascript"></script>  
    {/block}
      <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
  </body>
</html>