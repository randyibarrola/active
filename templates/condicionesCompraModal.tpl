<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title">{if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}</h4>
</div>
<div class="modal-body">
    {if $condicion->descripciones->$lang}{$condicion->descripciones->$lang}{else}{$condicion->descripciones->es}{/if}
</div>
<div class="modal-footer text-center">
    <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
    <a target="_blank" href="{$base_url}/condiciones/id:{$condicion->id}/print:1"{$end_url} class="btn btn-success">{#imprimir#}</a>
</div>