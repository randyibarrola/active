
{foreach from=$campanias item=campania}
<tr class="odd gradeX">
    <td><input type="checkbox" class="checkboxes" value="{$campania->id}" /></td>
    <td>{$campania->localizador}</td>
    <td>{$campania->nombreHotel}</td>
    <td>{if $campania->hotel}{if $campania->hotel->tipoReserva eq 'offline'}Offline{else}Online {$campania->hotel->porcentageCobroAnticipado}%{/if}{else}Online 0%{/if}</td>
    <td>
        <span class="label label-info">{$campania->inicio|date_format:"%e/%m/%Y"} - {$campania->fin|date_format:"%e/%m/%Y"}</span>
    </td>

    <td>{$campania->empresaDistribuidora->nombreComercial}</td>

    <td><span class="label label-success {if $campania->estado ne 'Pendiente'}estado-campania{/if}" campania-id="{$campania->id}"><span class="estado-label">{$campania->estado}</span> {if $campania->estado ne 'Pendiente'}<i class="fa fa-pencil"></i>{/if}</span></td>
    <td class="acciones-td">
        <a target="_blank" href="{if strpos($campania->subdominio, 'http://') eq FALSE}http://{/if}{$campania->subdominio}" title="Web oficial"><span class="fa fa-home"></span></a>
        {if $campania->estado ne 'Pendiente'}<a href="{$base_url}/admin-contrato-ver/id:{$campania->id}{$end_url}" title="Ver contrato"><i class="fa fa-file"></i></a>
        {/if}
        <a campania-id="{$campania->id}" class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
        {if $campania->estado eq 'Aprobada'}
            {if $campania->tipo eq 'hotel'}
            <a href="{$base_url}/admin-hotel-gestion/{if $campania->hotel->id}id:{$campania->hotel->id}{else}c:{$campania->id}{/if}" title="{if $campania->hotel->id}Editar{else}Crear{/if} hotel"><span class="fa fa-building-o"></span></a>
            {/if}
            {if $campania->tipo eq 'evento'}
            <a href="{$base_url}/admin-evento-gestion/c:{$campania->id}" title="Crear evento"><span class="fa fa-calendar"></span></a>
            {/if}
            <a href="{$base_url}/admin-reserva-lista/id:{$campania->hotel->id}{$end_url}" title="Reservas"><span class="fa fa-file-text"></span></a>
        {/if}
    </td>
</tr>
{/foreach}