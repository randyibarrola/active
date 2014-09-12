{extends file="index.tpl"}

{block name="style" append}
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/apartamentos.css" />
  <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/css/pages/hoteles.css" />
  <link href="{$template_url}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
{/block}

{block name="script" append}
  <!--<script src="{$template_url}/js/jquery.mixitup.min.js"></script>-->
  <script src="{$template_url}/js/apartamentos.js"></script>
  <script src="{$template_url}/admin/assets/plugins/bootstrap-paginator/bootstrap-paginator.min.js" type="text/javascript"></script>
  <script type="text/javascript">
    var MOSTRAR_DETALLE = '{#mostrar_detalle#}';
    var CALCULANDO_TARIFA = '{#calculando_tarifa#}';
    var OCULTAR_DETALLE = '{#ocultar_detalle#}';
    var BUSCANDO_DISPONIBILIDAD = '{#buscando_disponibilidad#}';
    var DESTINO = '{$hotel->destino->nombre}';
  </script>
{/block}

{block name="main_content" append}
  <div class="row-fluid clearfix top_content_container">
      <div class="col-md-3 formulario_left_top">
        {include file="reserva_form.tpl"}
        {if $hotel->contenidoHtml && strlen(trim($hotel->contenidoHtml)) && !$movile}
            <div class="row-fluid visible-lg" id="contenidoExtra">
                {$hotel->contenidoHtml}
            </div>
        {/if}
        {include file="excursiones_sidebar.tpl"}
        
      </div>
      <div class="col-md-9">
    <div class="main_content content">
      
      <div id="apartamentos_container">
          <h1 class="text-center">{#alojamientos#}</h1>
      <div class="bubblingG">
<span id="bubblingG_1">
</span>
<span id="bubblingG_2">
</span>
<span id="bubblingG_3">
</span>
</div>
      </div>
    </div>
    </div>
        <div class="col-md-3" id="excursiones-sidebar-movil">
            {include file="excursiones_sidebar.tpl"}
        </div>
  </div>
{/block}