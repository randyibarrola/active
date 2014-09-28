<div class="well-white">
    <form id="simple-search-offers" class="form-horizontal" role="form" action="{$base_url}/{$lang}/{#disponibilidad_url#}{$end_url}" method="get">
        <fieldset>
            <legend>
                <span>{#reserva_online#}</span>
                {#mejor_precio_garantizado#}
            </legend>
            <div class="row">
                <div class="col-md-6 col-sm-12 col-xs-6">
                    <label for="simpleSearchOffersDateStart" class="control-label">{#llegada#}</label>
                    <input type="text" class="form-control app-booking-date-start" id="simpleSearchOffersDateStart" readonly="readonly" value="{$inicio|date_format:"%d-%m-%Y"}" name="inicio" placeholder="dd-mm-yyyy" />
                </div>
                <div class="col-md-6 col-sm-12 col-xs-6">
                    <label for="simpleSearchOffersDateEnd" class="control-label">{#salida#}</label>
                    <input type="text" class="form-control app-booking-date-end" id="simpleSearchOffersDateEnd" readonly="readonly" value="{$salida|date_format:"%d-%m-%Y"}" name="salida" placeholder="dd-mm-yyyy" />
                </div>
            </div>
            <p class="info">
                {#su_reserva_sera_de#} <span id="simpleSearchOffersDiff" class="app-booking-date-diff">1</span> {#noche_s#}.
            </p>
            {if $hotel->config->comparacionBooking}
                <div class="checkbox">
                    <label>
                        <input checked="checked" disabled="disabled" type="checkbox"> {#acepto_comparativa_con#} booking.com
                    </label>
                </div>
            {/if}
            <div class="row">
                <div class="col-md-12">
                    <input type="submit" class="btn app-btn-pink app-upper-text col-md-12 col-sm-12 col-xs-12" value="{#buscar_ofertas#}" />
                </div>
            </div>
        </fieldset>
    </form>
</div>