{extends file="admin/login_template.tpl"}

{block name="style" append}
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/reservar.css" />
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/print.css" />
{/block}

{block name="script" append}
  
{/block}

{block name="main_content" append}
<div class="row-fluid">
  <div class="col-xs-12">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">{if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}<!--Condiciones generales de compra--></h3>
        </div>
        <div class="panel-body">
            {if $condicion->descripciones->$lang}{$condicion->descripciones->$lang}{else}{$condicion->descripciones->es}{/if}
            <div class="row hidden-print centered">
                <a href="{$base_url}" class="btn btn-default">Finalizar</a>
                <a href="{$base_url}/print:1" class="btn btn-success">Imprimir</a>
            </div>
        </div>
    </div>  
  </div>
</div>
{/block}