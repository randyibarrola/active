
{foreach from=$reserva->pagos item=pago}

<div class="pago">
    <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>
    <input type="hidden" name="pagoUpdate[{$pago->id}][idPago]" value="{$pago->id}">
    <input type="hidden" name="pagoUpdate[{$pago->id}][formaPago]" value="{$pago->formaPago}">
{if $pago->formaPago eq 'tarjeta'}   
    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Tipo de tarjeta</label>

                <input type="text" name="pagoUpdate[{$pago->id}][tarjetaTipo]" class="form-control validate[required]" placeholder="Tipo" value="{$pago->tarjetaTipo}" readonly="">

                <!--<select class="form-control" name="pagoUpdate[{$pago->id}][tarjetaTipo]" value="{$pago->tarjetaTipo}">
                    <option value="Visa">Visa</option>
                    <option value="Master Card">Master Card</option>
                </select>-->
            </div>
        </div>
        {if $logged_user->usuarioGrupoId ne 2}
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Importe</label>
                <input readonly="" type="text" name="pagoUpdate[{$pago->id}][importe]" class="form-control validate[required]" placeholder="Importe" value="{$reserva->moneda->simbolo} {$pago->importe|number_format:2:',':' '}">
                <input name="pagoUpdate[{$pago->id}][importe]" value="{$pago->importe}" type="hidden">
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Estado</label>
                <select id="fecha" class="form-control" name="pagoUpdate[{$pago->id}][estado]" {if $smarty.request.disabled}disabled{/if}>
                    {foreach from=$estadosPago item=estado}
                        <option value="{$estado}" {if $pago->estado eq $estado}selected{/if}>{$estado}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        {/if}
        <div class="delimiter"></div>


    </div>
    {if $pago->tarjetaNumero}
    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Titular</label>
                <input type="text" name="pagoUpdate[{$pago->id}][titular]" class="form-control validate[required]" placeholder="Numero" value="{$pago->titular}" readonly="">
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Número de tarjeta</label>
                <input type="text" name="pagoUpdate[{$pago->id}][tarjetaNumero]" class="form-control validate[required]" placeholder="Numero" value="{$pago->tarjetaNumero}" readonly="">
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Mes de caducidad</label>
                <input type="text" name="pagoUpdate[{$pago->id}][caducidadMes]" class="form-control validate[required]" placeholder="Mes" value="{$pago->caducidadMes}" readonly="">
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">A&ntilde;o de caducidad</label>

                <input type="text" name="pagoUpdate[{$pago->id}][caducidadAnio]" class="form-control validate[required]" placeholder="Año" value="{$pago->caducidadAnio}" readonly="">
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">CVV</label>
                <input type="text" name="pagoUpdate[{$pago->id}][cvv]" class="form-control validate[required]" placeholder="CVV" value="{$pago->cvv}" readonly="">
            </div>
        </div>

            
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Nº de operación</label>
                <input type="text" name="pagoUpdate[{$pago->id}][op]" class="form-control validate[required]" placeholder="OP" value="{$pago->op}">
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Nº de operación de devolución</label>
                <input type="text" name="pagoUpdate[{$pago->id}][opDevolucion]" class="form-control" placeholder="OP devolución" value="{$pago->opDevolucion}">
            </div>
        </div>

    </div>
    {/if}

{/if}
{if $pago->formaPago eq 'efectivo' && $logged_user->usuarioGrupoId ne 2}
    <div class="row-fluid">
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Importe</label>
                <input type="hidden" name="pagoUpdate[{$pago->id}][formaPago]" value="efectivo" disabled="">
                <input type="text" name="pagoUpdate[{$pago->id}][importe]" class="form-control validate[required, custom[number]]" placeholder="Importe" value="{$reserva->moneda->simbolo} {$pago->importe|number_format:2:',':''}">
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Estado</label>
                <select id="fecha" class="form-control" name="pagoUpdate[{$pago->id}][estado]">
                    {foreach from=$estadosPago item=estado}
                        <option value="{$estado}" {if $pago->estado eq $estado}selected{/if}>{$estado}</option>
                    {/foreach}
                </select>
            </div>
        </div>
    </div>
                <div class="delimiter"></div>
{/if}

</div>
{/foreach}