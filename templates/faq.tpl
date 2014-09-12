{extends file="index.tpl"}

{block name="style" append}
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/faq.css" />
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
      <div class="main_content">
        <div class="row-fluid clearfix">
          <div class="content-title">
            <h3>{#faqs#}</h3>
            <hr class="for_double">
            {$contenido}
          </div>
        </div>
      </div>
    </div>
  </div>
{/block}