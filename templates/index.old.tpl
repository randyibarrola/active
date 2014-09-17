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
        _gaq.push(['_setAccount', 'UA-47599454-42']);
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
    <style type="text/css">
    {if !$showSubPrice}
    {literal}
    .subprice{display: none;}
    {/literal}    
    {/if}
    </style>
  </head>

<body class="{if $hotel->logo && false}official{/if}" {if $hotel && $hotel->backgroundColor}style="background-color: #{$hotel->backgroundColor};"{/if}>
  <div id="blocker" style="display: none;">
    <div>{#buscando_disponibilidad#}...</div>
  </div>
  <div class="navbar-collapse" id="accept-cookies">
            <div>{#aceptar_cookies#} <a href="" id="accept-cookies-btn">{#Aceptar#}</a>
            <a href="" id="readCookiesBtn">{#leer_politica_de_cookies#}</a></div>
            
        </div>

    {include file="header.tpl"}

    <div class="theme-showcase" id="main-content-theme">
      {block "main_content"}{/block}
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

    {include file="footer.tpl"}
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
        var CURRENCY = "{$hotel->moneda->simbolo}";
        var TASA_DE_CAMBIO = {$moneda->tasaCambio}
        var CURRENCY_USUARIO = "{$currency}";
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
      <script src="{$template_url}/admin/assets/plugins/bootstrap/js/bootstrap2-typeahead.min.js" type="text/javascript"></script>
    {/block}
      <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
  </body>
</html>