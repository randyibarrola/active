{extends file="admin/login_template.tpl"}

{block name="style" append}
    <link href="{$template_url}/admin/assets/css/pages/validar.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="{$template_url}/admin/assets/plugins/data-tables/DT_bootstrap.css" />
{/block}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/validar.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="{$template_url}/js/autoNumeric.js"></script>
{/block}

{block name="main_content" append}
<!-- BEGIN LOGIN FORM -->
<div class="content validar">
<form class="validation-form" action="{$base_url}/admin-valid" method="post">
        <h3 class="form-title">Valida tus reservas</h3>
        <div>
            <table class="table table-striped table-bordered table-hover" id="table_reservas">
                <thead>
                    <tr>
                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#table_reservas .checkboxes" /></th>
                        <th>Código</th>
                        <th>Cliente</th>
                        <th>Apartamento</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Noches</th>
                        <th>Pax</th>  
                        <th class="hidden-480">Total</th>
                        <th>Comisión</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    {if $reservas && count($reservas)}
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
                            <td class="importe">
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
                        {/if}
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="row-fluid">
                <div class="col-md-12 text-center">
                    <input type="hidden" name="action" value="validar">
                    <input type="hidden" name="hotelId" value="{$hotel->id}">
                    <a class="btn btn-default">Cancelar</a>
                    <input type="submit" class="btn btn-success {if !$reservas || !count($reservas)}disabled{/if}" value="Validar">
                    
                </div>
            </div>
        </div>
</form>
</div>
<!-- END LOGIN FORM -->
{/block}