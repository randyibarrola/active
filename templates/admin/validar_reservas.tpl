{foreach from=$reservas item=reserva}
<tr class="odd gradeX">
    <td><label><input type="checkbox" name="reservas[]" value="{$reserva.id}" class="checkboxes"></label></td>
    <td>{$reserva.localizador}</td>
    <td>
       {$reserva.usuario.nombre} {$reserva.usuario.apellido}
    </td>
    <td>{$reserva.producto.nombre}</td>
    <td>{$reserva.producto.inicio|date_format:"%d/%m/%Y"}</td>
    <td>{$reserva.producto.final|date_format:"%d/%m/%Y"}</td>
    <td>{intval((strtotime($reserva.producto.final) - strtotime($reserva.producto.inicio))/(60*60*24))}</td>
    <td>{$reserva.producto.adultos} {#Adulto_s#}{if $reserva.producto.ninios} + {$reserva.producto.ninios} {#niho_s#}{/if}</td>
    <td class="importe centered">
        <p class="hidden">{$reserva.moneda.simbolo} {$reserva.producto.precioUnitario|number_format:2:',':' '}</p>
        {$reserva.moneda.simbolo} <input type="text" name="importe[{$reserva.id}]" maxlength="8" value="{$reserva.producto.precioUnitario|number_format:2:',':' '}">
    </td>
    <td class="comision">
        {$reserva.moneda.simbolo} <span  comision="{$hotel->distribuidor->porcentajeBeneficio}">{$reserva.producto.comision}</span>
    </td>
    <td class="estado">
        Stayed
    </td>

</tr>
{/foreach}