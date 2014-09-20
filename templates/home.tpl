{extends file="index.tpl"}

{block "style_plugins_level" append}
    <link href="{$template_url}/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" media="screen">
    <link href="{$template_url}/assets/plugins/social/social-likes_classic.css" rel="stylesheet" media="screen">
    <link href="{$template_url}/assets/plugins/jquery-flexslider/flexslider.css" rel="stylesheet" media="screen">
{/block}

{block "style_level" append}
    <link href="{$template_url}/newdesing/css/home.css" rel="stylesheet" media="screen">
{/block}

{block "script_plugins_level" append}
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="{$template_url}/assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.{$lang}.js"></script>
    <script src="{$template_url}/assets/plugins/jquery-nicescroll/jquery.nicescroll.min.js"></script>
    <script src="{$template_url}/assets/plugins/social/social-likes.min.js"></script>
    <script src="{$template_url}/assets/plugins/jquery-flexslider/jquery.flexslider-min.js"></script>
{/block}

{block "script_level" append}
    <script src="{$template_url}/newdesing/js/home.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            Home.init();
        });
    </script>
{/block}

{*Este se debe eliminar*}
{block name="script" append}
    <script src="{$template_url}/js/home.js"></script>
    <script type="text/javascript">
      var SERVICIO_ID = '{#servicios#}';
    </script>
{/block}

{*Este se debe eliminar*}
{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/home.css">
{/block}

{block name="main_content" append}
    <div class="row">
        <div class="col-md-3 col-sm-3">
            {include file="simple_search_form.tpl"}

            <div id="home-free-offer" class="well-white well-border-pink well-divider">
                <p>Con tu reserva, te regalamos:</p>
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="tmp/reserva-gratuita.png" alt="">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">Tour a pie de 2,5 horas</h4>
                        <p class="home-free-offer-price">Valorado en 35&euro;</p>
                        <a href="#" class="btn app-btn-pink pull-right">Reservar (35&euro;)</a>
                    </div>
                </div>
            </div>
            <div id="home-book-services" class="well-white well-border-pink well-divider well-left">
                <div class="title">
                    <h3>Reserva ahora</h3>
                    <h4>con nosotros y obtiene:</h4>
                </div>
                <ul class="list-dove-blue">
                    <li>WIFI gratis</li>
                    <li>Copa de bienvenida</li>
                    <li>Botella de agua</li>
                    <li>Early check-in</li>
                    <li>Early check-out</li>
                </ul>
            </div>
            {if $hotel->mostrarHotelesRelacionados && $hotel->relacionados && count($hotel->relacionados) && !$movile}
                {include file="hotel_prompt.tpl"}
            {/if}
        </div>
        <div class="col-md-9 col-sm-9 column-xs-divider">
            <section id="home-slider-hotel" class="slider">
                <div id="home-slider-hotel-slider" class="flexslider flexslider-scn-slider" data-sync="#home-slider-hotel-carousel">
                    {if $hotel->precioMinimo && !$movile}
                        <div class="slider-info">
                            <div class="info">
                                <p>{#disponible_desde#}</p>
                                <p><span>{$hotel->precioMinimo->precioMinimo|number_format:2:',':' '}</span>{$currency}</p>
                            </div>
                            <div class="background"></div>
                        </div>
                    {/if}
                    <ul class="slides">
                        {if $images} 
                            {for $i=0 to count($images) - 1}
                            <li>
                                <img src="{$images[$i]->ruta}" alt="Photo {$i}" title="{$images[0]->nombre}">
                            </li> 
                            {/for}
                        {else}
                            <li>
                                <img src="{$template_url}/imagenes/slider1.jpg" alt="Photo 1">
                            </li>
                        {/if} 
                        {if $imagesDestino}                         
                            {for $i=0 to count($imagesDestino) - 1}
                            <li>
                                <img src="{$imagesDestino[count($imagesDestino) - 1 - $i]->ruta}" alt="Photo destino {$i}">
                            </li>
                            {/for} 
                        {/if}                        
                    </ul>
                </div>
                <div id="home-slider-hotel-carousel" class="flexslider flexslider-scn-carousel hidden-xs" data-asnavfor="#home-slider-hotel-slider" data-itemwidth="80">
                    <ul class="slides">
                    {if $images}
                        {for $i=0 to count($images) - 1}
                            <li>
                                <img src="{$images[$i]->ruta}" alt="Photo {$i}" title="{$images[$i]->nombre}">
                            </li>
                        {/for}
                    {/if} 
                    {if $imagesDestino}                         
                        {for $i=0 to count($imagesDestino) - 1}
                        <li>
                            <img src="{$imagesDestino[count($imagesDestino) - 1 - $i]->ruta}" alt="Photo destino {$i}">
                        </li>
                        {/for} 
                    {/if}
                    </ul>
                    
                </div>
            </section>
            <!-- Begin tabs -->
            <ul class="nav nav-tabs app-tabs">
                <li class="active">
                    <a href="#details" data-toggle="tab">
                        <i class="glyphicon glyphicon-info-sign tooltips" data-original-title="Detalles"></i> <span class="hidden-xs">Detalles</span>
                    </a>
                </li>
                <li>
                    <a href="#conditions" data-toggle="tab">
                        <i class="glyphicon glyphicon-file tooltips" data-original-title="Condiciones"></i> <span class="hidden-xs">Condiciones</span>
                    </a>
                </li>
                <li>
                    <a href="#map" data-toggle="tab">
                        <i class="glyphicon glyphicon-map-marker tooltips" data-original-title="Localización"></i> <span class="hidden-xs">Localización</span>
                    </a>
                </li>
                <li>
                    <a href="#opinions" data-toggle="tab">
                        <i class="glyphicon glyphicon-star tooltips" data-original-title="Opiniones"></i> <span class="hidden-xs">Opiniones</span>
                    </a>
                </li>
                <li>
                    <a href="#faqs" data-toggle="tab">
                        <i class="glyphicon glyphicon-info-sign tooltips" data-original-title="FAQS"></i> <span class="hidden-xs">FAQS</span>
                    </a>
                </li>
                <li>
                    <a href="#contact" data-toggle="tab">
                        <i class="glyphicon glyphicon-envelope tooltips" data-original-title="Contacto"></i> <span class="hidden-xs">Contacto</span>
                    </a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content app-tab-content">
                <!--<div class="tab-pane active app-ajax-load" data-href="tab-detalles.html" id="details">-->
                <!--</div>-->
                <div class="tab-pane active" id="details">
                    <div class="row">
                        <div class="col-md-10 col-sm-12 text">
                            <p>
                                El establecimiento Villas Alicia está situado en Caletas de Fuste, cerca del campo de golf de Fuerteventura. Ofrece villas modernas y elegantes equipadas con una piscina y un jardín privados, conexión Wi-Fi gratuita y una TV de pantalla plana.
                            </p>
                            <p>
                                Las luminosas villas del Villas Alicia cuentan con un dormitorio con una cama doble y un dormitorio con 2 camas individuales con vistas al jardín. Disponen además de una amplia sala de estar y comedor con un reproductor de DVD y un sofá grande.
                            </p>
                            <p>
                                La cocina cuenta con fogones, microondas, cafetera, lavavajillas y lavadora. El jardín privado incluye un solárium con una barbacoa y una piscina y ofrece vistas al océano Atlántico.
                            </p>
                            <p>
                                Este moderno complejo de villas está a solo 600 metros de la playa y a 8 km del aeropuerto de Fuerteventura. En Caleta de Fuste hay varios cines y un casino.
                            </p>
                        </div>
                        <div class="col-md-2 col-sm-12">
                            <div class="tripadvisor-content">
                                <div id="TA_selfserveprop101" class="TA_selfserveprop">
                                    <ul id="cvs5VV0uMq" class="TA_links QV1zXzi">
                                        <li id="Wq2ABnzWdjHQ" class="bWPB9VjiwyC">
                                            <a target="_blank" href="http://www.tripadvisor.es/">
                                                <img src="http://www.tripadvisor.es/img/cdsi/img2/branding/150_logo-11900-2.png" alt="TripAdvisor"/>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="social-actions">
                                <a href="#">
                                    <i class="glyphicon glyphicon-envelope"></i> Correo electrónico
                                </a>
                                <a href="#">
                                    <i class="glyphicon glyphicon-print"></i> Imprimir
                                </a>
                                <div class="social-likes">
                                    <div class="facebook" title="Comparte este link en Facebook">Me gusta</div>
                                    <div class="twitter" title="Comparte este link en Twitter">Twittear</div>
                                    <div class="plusone" title="Comparte este link en Google+">Compartir</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="conditions">...</div>
                <div class="tab-pane" id="map">
                    <iframe id="gmap" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;geocode=+&amp;ie=UTF8&amp;hq=&amp;ll=21.1619080,-86.8515280&amp;t=m&amp;z=14&amp;output=embed"></iframe>
                </div>
                <div class="tab-pane" id="opinions">
                </div>
                <div class="tab-pane" id="faqs">
                    <p>
                        <strong><em>¿Qué es Madrid Active?</em></strong>
                        Madrid Active es una agencia OnLine de intermediación turística, que te ayuda a reservar tu hotel ideal de forma fácil y segura.
                        Además te ofrecemos la mejor selección de actividades para descubrir tu destino.
                        Las excursiones han sido seleccionadas cuidadosamente para poder asegurar una gran calidad en el servicio.
                        Madrid Active te ayuda a vivir días inolvidables durante tus vacaciones.
                    </p>
                </div>
                <div class="tab-pane" id="contact">
                    <form action="#" id="contact-form" class="form-horizontal" role="form" method="post">
                        <fieldset>
                            <h1 class="text-center">¿No encuentras lo que buscas?</h1>
                            <p class="text-center">Déjanos tu email y un operador te ofrecerá la mejor opción disponible según tu búsqueda.</p>
                            <div class="row">
                                <div class="col-md-4 col-sm-12 col-xs-12">
                                    <label for="contactFormNombre" class="control-label">Nombre: <span class="required">(*)</span></label>
                                    <input type="text" class="form-control" id="contactFormNombre" />
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12">
                                    <label for="contactFormEmail" class="control-label">Email: <span class="required">(*)</span></label>
                                    <input type="text" class="form-control" id="contactFormEmail" />
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12">
                                    <label for="contactFormtelefono" class="control-label">Teléfono:</label>
                                    <input type="text" class="form-control" id="contactFormtelefono" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2 col-sm-6 col-xs-6">
                                    <label for="contactFormLlegada" class="control-label">Fecha llegada: </label>
                                    <input type="text" class="form-control datepicker" id="contactFormLlegada" readonly="readonly" />
                                </div>
                                <div class="col-md-2 col-sm-6 col-xs-6">
                                    <label for="contactFormSalida" class="control-label">Fecha salida: </label>
                                    <input type="text" class="form-control datepicker" id="contactFormSalida" readonly="readonly" />
                                </div>
                                <div class="col-md-2 col-sm-6 col-xs-6">
                                    <label for="contactFormAdultos" class="control-label">Adultos: </label>
                                    <input type="text" class="form-control" id="contactFormAdultos" />
                                </div>
                                <div class="col-md-2 col-sm-6 col-xs-6">
                                    <label for="contactFormNinos" class="control-label">Niños: </label>
                                    <input type="text" class="form-control" id="contactFormNinos" />
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12">
                                    <div class="checkbox" id="contactFormFechasFlaxibles">
                                        <label>
                                            <input type="checkbox" value="">
                                            Mis fechas son flexibles.
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-sm-12 col-xs-12">
                                    <label for="contactFormComentario" class="control-label">Comentarios: </label>
                                    <textarea class="form-control" id="contactFormComentario" rows="3"></textarea>
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12">
                                    <input type="submit" class="btn app-btn-blue" value="Recibir presupuesto" />
                                    <div class="checkbox" id="">
                                        <label>
                                            <input type="checkbox" value="">
                                            Acepto la política de privacidad y datos.
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
            <!-- End tabs -->

            <!-- Begin excursions -->
            <div id="home-excursions" class="well-white well-divider">
                <h1 class="text-center">¿Qué hacer en mi visita?</h1>
                <div class="row list">
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 item">
                        <p class="title">Excursión Segway</p>
                        <img src="tmp/excursion.jpg" class="img-responsive" />
                        <p class="price">Desde 27&euro;</p>
                        <p class="saving">Te ahorras 5&euro;</p>
                        <p class="text-center">
                            <a href="#" class="btn app-btn-pink">Reservar</a>
                        </p>
                    </div>
                </div>
            </div>
            <!-- End excursions -->
        </div>
    </div>
{/block}

{block "extra_content" append}
    <!-- Begin booking modal -->
    <div id="search-best-prices-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <h1>{#buscando_su_mejor_tarifa#}</h1>
                    <img src="{$template_url}/newdesing/images/ajax-loading.gif">
                    <p>{#puede_tardar#}. {#disculpe_las_molestias#}.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- End booking modal -->
{/block}