<form action="#" id="contact-form" class="form-horizontal" role="form" method="post">
    <fieldset>
        <h1 class="text-center">{#no_encuentras_lo_que_buscas#}</h1>
        <p class="text-center">{#dejanos_tu_email_y_te_ayudaremos#}.</p>
        <div class="row">
            <div class="col-md-4 col-sm-12 col-xs-12">
                <label for="contactFormNombre" class="control-label">{#nombre#}: <span class="required">(*)</span></label>
                <input type="text" class="form-control validate[required]" name="nombre" id="contactFormNombre" />
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <label for="contactFormEmail" class="control-label">{#email#}: <span class="required">(*)</span></label>
                <input type="text" class="form-control validate[required, custom[email]]" name="email" id="contactFormEmail" />
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <label for="contactFormTelefono" class="control-label">{#telefono#}:</label>
                <input type="text" class="form-control" name="telefono" id="contactFormTelefono" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-sm-12 col-xs-12">
                <label for="contactFormAsunto" class="control-label">{#asunto#}:</label>
                <select id="contactFormAsunto" class="form-control select2" name="asunto">
                    {foreach from=$asuntos item=asunto name=asuntos}
                        <option value="{$smarty.foreach.asuntos.iteration - 1}">{$smarty.config.$asunto}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="row" id="subjectBookingGroup">
            <div class="col-md-2 col-sm-6 col-xs-6">
                <label for="contactFormLlegada" class="control-label">{#fecha_llegada#}:</label>
                <input type="text" class="form-control datepicker" id="contactFormLlegada" readonly="readonly" name="inicio" data-date="today" />
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                <label for="contactFormSalida" class="control-label">{#fecha_salida#}:</label>
                <input type="text" class="form-control datepicker" id="contactFormSalida" readonly="readonly" name="final" data-start-date="today" />
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                <label for="contactFormAdultos" class="control-label">{#Adulto_s#}: </label>
                <select class="form-control select2" name="adultos" id="contactFormAdultos">
                    {for $i=1 to 15}
                        <option value="{$i}">{$i}</option>
                    {/for}
                </select>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                <label for="contactFormNinos" class="control-label">{#niho_s#}: </label>
                <select class="form-control select2" name="ninios" id="contactFormNinos">
                    {for $i=0 to 15}
                        <option value="{$i}">{$i}</option>
                    {/for}
                </select>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <div class="checkbox" id="contactFormFechasFlaxibles">
                    <label>
                        <input type="checkbox" value="" name="fechasFlexibles" />
                        {#mis_fechas_son_flexibles#}.
                    </label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-sm-12 col-xs-12">
                <label for="contactFormComentario" class="control-label">{#comentarios#}: <span class="required">(*)</span></label>
                <textarea class="form-control validate[required]" id="contactFormComentario" rows="3" name="mensaje"></textarea>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
                <input type="submit" class="btn app-btn-blue" value="{#recibir_presupuesto#}" />
                <div class="checkbox" id="">
                    <label>
                        <input type="checkbox" value="" name="acepto" checked="checked" class="validate[required]">
                        <a href="javascript:void(0);" data-toggle="modal" data-target="#privacidad_modal" data-content="privacidad">{#acepto_politica_privacidad_y_datos#}.</a> <span class="required">(*)</span>
                    </label>
                </div>
            </div>
        </div>
    </fieldset>
</form>