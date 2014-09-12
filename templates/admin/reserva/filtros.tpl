{if !empty($reservas)}
    {foreach from=$reservas item=reserva}
    <tr class="odd gradeX">
        <td><input type="checkbox" class="checkboxes" value="{$reserva->id}" /></td>
        <td>{$reserva->localizador}</td>
        <td>
           <!--{foreach from=$reserva->alojamiento item=producto}{$producto->nombre}{/foreach} -->
           {$reserva->usuario->nombre} {$reserva->usuario->apellido}
        </td>
        <td>{$reserva->hotel->nombre}</td>
        <td>{foreach from=$reserva->extras item=producto}{$producto->nombre}<br/>{/foreach}</td>
        <td><i>{strtotime($reserva->alojamiento[0]->inicio)}</i>{$reserva->alojamiento[0]->inicio|date_format:"%d/%m/%Y"}</td>
        <td><i>{strtotime($reserva->alojamiento[0]->final)}</i>{$reserva->alojamiento[0]->final|date_format:"%d/%m/%Y"}</td>
        <td><i>{strtotime($reserva->tiempoCreacion)}</i> {$reserva->tiempoCreacion|date_format:"%d/%m/%Y"}</td>
        <td class=""><span class="label label-success">{$currency} {$reserva->total|number_format:2:',':' '}</span></td>
        <td>
            <label class="estado" reserva-id="{$reserva->id}">{if $reserva->estado}{$reserva->estado}{else}Pendiente{/if}</label>
            
        </td>
        <td class="acciones-td">
            <a href="{$base_url}/admin-reserva-gestion/id:{$reserva->id}{$end_url}"><span class="fa fa-pencil"></span></a>
            {if $logged_user->usuarioGrupoId ne 2}
            <a reserva-id="{$reserva->id}" class="delete" href="#"><span class="fa fa-trash-o"></span></a>
            {/if}
        </td>
    </tr>
    {/foreach}
{/if}