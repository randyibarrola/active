<footer class="bs-footer">
    <div class="footer-top">
        <div class="row">
            <!-- <h3 class="text-center">Outlet Rooms S.L.</h3>
            <p class="text-center">Booking Now 902 000 999</p> -->
            <div class="col-md-4">
                <h3>{#contactanos#}</h3>
                <ul class="contact">
                    <li class="phone">{if $hotel->webOficial}{$hotel->telefonoReservas}{else}{$hotel->distribuidor->telefonoReservas}{/if}</li>
                    <li class="address">{if $hotel->webOficial}{$hotel->nombre}{else}{$hotel->distribuidor->nombreComercial}{/if}</li>
                    <li class="email"><a href="mailto:{if $hotel->webOficial}{$hotel->emailReservas}{else}{#empresa_contacto#}{/if}">{if $hotel->webOficial}{$hotel->emailReservas}{else}{#empresa_contacto#}{/if}</a></li>
                </ul>
                <p class="contacto_dominio"><!--{$hotel->empresa->nombreComercial}--><br>{#sistema_web#}</p>
                <div class="clearfix"></div>    
            </div>
            <div class="col-md-4">
                <h3>{#siguenos#}</h3>
                <div class="footer_social">
                    <a href="#" class="icon-facebook">Facebook</a> 
                    <a href="#" class="icon-twitter">Twitter</a>
                    <a href="#" class="icon-vimeo">Vimeo</a>
                    <a href="#" class="icon-rss">RSS</a>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-4">
                <form id="suscribe-form">
                <h3>{#suscribete#}</h3>
                <div class="newsletter form-group">
                    <label>{#correo_electronico#}</label>
                    <input name="email" type="text" class="form-control validate[required, custom[email]]" />
                </div>
                    <div class="text-right"><input type="submit" class="btn btn-newsletter" value="{#suscribete#}"></div>
                </form>
            </div>
        </div>
    </div>
</footer>
<footer class="footer-bottom-container">
    <div class="footer-bottom">
        <div class="row">
            <div class="col-md-6">
                <ul class="footer-secure-list">
                    <li><img src="{$template_url}/images/visa_icon.png"></li>
                    <li><img src="{$template_url}/images/master_icon.png"></li>
                    <li><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=GYXVmcV1zSFO0ewxdrrMYEd9oSBPeFYMpJ4mT8NT8To48V7SvEB"></script></span></li>
                    <li><a target="_blank" class="certified_rate" href="http://www.infini-trvl.co.jp/english/"><img src="{$template_url}/images/certified_rate.png"></a></li>
                    <li><a class="footer_item_amadeus" target="_blank" href="http://www.amadeus.com/web/amadeus/en_US-US/Hotels/Solutions-&-services/1319576564603-Page-AMAD_SolServIndustrySubsegmentPpal?industrySegment=1259068355773
"><img src="{$template_url}/images/amadeus.png"></a></li>
                </ul>
            </div>
            <div class="col-md-6">
                <ul class="nav navbar-nav">
                    <li><a class="to_scroll" href="{$base_url}/{$lang}/index/{$end_url}">{#inicio#}</a></li>
                    <li><a class="to_scroll" href="{$base_url}/{$lang}/index#{#servicios#}{$end_url}">{#servicios#}</a></li>
                    <li><a href="{$base_url}/{$lang}/{#disponibilidad_url#}{$end_url}">{#apartamentos#}</a></li>
                    <li><a href="{$base_url}/{$lang}/{#contacto_url#}{$end_url}">{#contacto#} & {#mapa#}</a></li>
                    <li><a href="javascript:void(0)" id="cookies_link">{#politica_de_cookies#}</a></li>
                    <li><a href="javascript:void(0)" id="privacidad_link">{#politica_de_privacidad#}</a></li>
                    <li><a href="#" class="to_scroll_top"><span class="caret caret-inverse"></span>{#top#}</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>            
                    
<div class="modal fade" id="cookies_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{#politica_de_cookies#}</h4>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                <a href="{$base_url}/ajax-popup/id:cookies/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>
            
<div class="modal fade" id="privacidad_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{#politica_de_privacidad#}</h4>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                <a href="{$base_url}/ajax-popup/id:privacidad/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>