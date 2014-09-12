
{foreach from=$hoteles item=hotel}
<tr class="odd gradeX">
    <td><input type="checkbox" class="checkboxes" value="{$hotel->id}" /></td>
    <td><input type="text" name="edit[{$hotel->id}][nombre]" value="{$hotel->nombre}"></td>
    <td>
        {$hotel->campania->subdominio}<br/>
        {$hotel->dominioOficial}<br/>
        {if $hotel->dominios}
            {foreach from=$hotel->dominios item=d name=d}
                {$d->dominio}{if !$smarty.foreach.d.last}<br/>{/if}
            {/foreach}
        {/if}
    </td>
    <td>
    <span class="label label-info">{$hotel->campania->inicio|date_format:"%e/%m/%Y"} - {$hotel->campania->fin|date_format:"%e/%m/%Y"}</span>
    </td>
    <td><input type="text" name="edit[{$hotel->id}][emailReservas]" value="{$hotel->emailReservas}"></td>
    <td><input type="text" name="edit[{$hotel->id}][telefonoReservas]" value="{$hotel->telefonoReservas}"></td>
    <td class="acciones-td">
        <a target="_blank" href="{if strpos($hotel->campania->subdominio, 'http://') eq FALSE}http://{/if}{$hotel->campania->subdominio}" title="Web oficial"><span class="fa fa-home"></span></a>
        <a href="{$base_url}/admin-reserva-lista/id:{$hotel->id}{$end_url}" title="Reservas"><span class="fa fa-file-text"></span></a>
        <a href="{$base_url}/admin-hotel-gestion/id:{$hotel->id}{$end_url}" title="Editar"><span class="fa fa-pencil"></span></a>
        <a hotel-id="{$hotel->id}" class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
    </td>
</tr>
{/foreach}