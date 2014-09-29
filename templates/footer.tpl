<div class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 footer-contact text-center">
                    <p class="text-center">{#operado_por#} {$hotel->distribuidor->nombreComercial}:</p>
                    <p class="logo">
                        <img src="{$template_url}/newdesing/images/logo.png" class="" />
                    </p>
                    <address>
                        {#telefono#}: {if $hotel->webOficial}{$hotel->telefonoReservas}{else}{$hotel->distribuidor->telefonoReservas}{/if}<br/>
                        {#skype#}: madrid.active<br/>
                        C/Leitariegos, 12, Madrid
                    </address>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><img src="{$template_url}/newdesing/images/youtube.png" class="img-responsive" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="{$template_url}/newdesing/images/twitter.png" class="img-responsive" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="{$template_url}/newdesing/images/facebook.png" class="img-responsive" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="{$template_url}/newdesing/images/googleplus.png" class="img-responsive" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="{$template_url}/newdesing/images/f_tripadvisor.png" class="img-responsive" /></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-9 col-sm-9 footer-guaranty">
                    <h1 class="text-center">{#nuestras_garantias#}</h1>
                    <div class="row footer-guaranty-list">
                        <div class="col-md-3 col-sm-3 col-xs-6 text-center">
                            <img src="{$template_url}/newdesing/images/best-price.png" />
                            <h4>{#mejor_precio#}</h4>
                            <p>
                                {#mejor_precio_descripcion#}.
                            </p>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-6 text-center">
                            <img src="{$template_url}/newdesing/images/without-surprise.png" />
                            <h4>{#sin_sorpresas#}</h4>
                            <p>
                                {#sin_sorpresas_descripcion#}.
                            </p>
                        </div>
                        <div class="clearfix visible-xs"></div>
                        <div class="col-md-3 col-sm-3 col-xs-6 text-center">
                            <img src="{$template_url}/newdesing/images/discount.png" />
                            <h4>{#descuentos#}</h4>
                            <p>
                                {#descuentos_descripcion#}.
                            </p>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-6 text-center">
                            <img src="{$template_url}/newdesing/images/question.png" />
                            <h4>{#te_ayudamos#}</h4>
                            <p>
                                {#te_ayudamos_descripcion#}.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-12 certificates">
                    <ul class="list-inline">
                        <li>
                            <img src="{$template_url}/newdesing/images/visa.png" />
                        </li>
                        <li>
                            <img src="{$template_url}/newdesing/images/master-card.png" />
                        </li>
                        <li>
                            <img src="{$template_url}/newdesing/images/godaddy.png" />
                        </li>
                        <li>
                            <img src="{$template_url}/newdesing/images/certified.png" />
                        </li>
                        <li>
                            <img src="{$template_url}/newdesing/images/amadeus.png" />
                        </li>
                    </ul>
                </div>
                <div class="col-md-7 col-sm-12 menu">
                    <ul class="list-inline">
                        <li>
                            <a href="{$base_url}/{$lang}/index/{$end_url}">{#inicio#}</a>
                        </li>
                        <li>
                            <a href="{$base_url}/{$lang}/index#{#servicios#}{$end_url}">{#servicios#}</a>
                        </li>
                        <li>
                            <a href="{$base_url}/{$lang}/{#contacto_url#}{$end_url}">{#contacto#} & {#mapa#}</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" data-toggle="modal" data-target="#cookies_modal" data-content="cookies">{#politica_de_cookies#}</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" data-toggle="modal" data-target="#privacidad_modal" data-content="privacidad">{#politica_de_privacidad#}</a>
                        </li>
                        <li>
                            <a href="#" id="scroll-top" class="dropup"><i class="caret"></i> {#top#}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>