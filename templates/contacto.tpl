{extends file="index.tpl"}

{block name="style" append}
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/contacto.css" />
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/validationEngine.jquery.css" />
  <link rel="stylesheet" type="text/css" href="{$template_url}/css/toastr.css" />
{/block}

{block name="script" append}
<script src="{$template_url}/js/contacto.js"></script>
<script src="{$template_url}/js/jquery.validationEngine.js"></script>
<script src="{$template_url}/js/jquery.validationEngine-es.js"></script>
<script src="{$template_url}/js/toastr.js"></script>
<script type="text/javascript" src="https://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
{/block}

{block name="main_content" append}
    <div class="row-fluid clearfix top_content_container">
        <div class="col-md-3 formulario_left_top">  

            {include file="reserva_form.tpl"}
            {if $hotel->contenidoHtml && strlen(trim($hotel->contenidoHtml)) && !$movile}
              <div class="row-fluid visible-lg" id="contenidoExtra">
                  {$hotel->contenidoHtml}
              </div>
            {/if}
            {include file="excursiones_sidebar.tpl"}
        </div>
        <div class="col-md-9">
            <div class="main_content">
                <div class="row-fluid clearfix">
                  <div class="col-md-8">
                      <form id="contact-form">
                          <div class="row-fluid">
                              <div class="content-title">
                                  <h3>{#contactanos#}</h3>
                                  <hr class="for_double">
                              </div>
                              <div class="row">
                              <div class="col-md-6">
                                <div class="form-group">
                                  <input class="form-control validate[required]" type="text" name="nombre" placeholder="{#nombre_completo#}" />
                                </div>
                              </div>

                              <div class="col-md-6">
                                <div class="form-group">
                                  <input class="form-control validate[required, custom[email]]" type="text" name="email" placeholder="{#correo_electronico#}" />
                                </div>
                              </div>
                              </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <select id="asunto_select" class="form-control" name="asunto">
                                                {foreach from=$asuntos item=asunto name=asuntos}
                                                    <option value="{$smarty.foreach.asuntos.iteration - 1}">{$smarty.config.$asunto}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row contacto_label vikahotel_form">
                                    <div class="row-fluid">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="contacto_label_string">{#fecha_de_llegada#}</label>
                                                <input type="text" class="form-control date-start datepicker" readonly="" name="inicio" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="contacto_label_string">{#fecha_de_salida#}</label>
                                                <input type="text" class="form-control date-end datepicker" readonly="" name="final" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="contacto_label_string">{#Adulto_s#}</label>
                                                <select class="form-control" name="adultos" >
                                                    {for $i=1 to 15}
                                                        <option value="{$i}">{$i}</option>
                                                    {/for}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="contacto_label_string">{#niho_s#}</label>
                                                <select class="form-control" name="ninios" >
                                                    {for $i=0 to 15}
                                                        <option value="{$i}">{$i}</option>
                                                    {/for}
                                                </select>
                                            </div>
                                        </div>
                                                <div class="clearfix"></div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label><input type="checkbox" name="fechasFlexibles"> {#mis_fechas_son_flexibles#}</label>
                                                    </div>
                                                </div>
                                    </div>
                                </div>
                              <div class="row">
                                <div class="col-md-12">
                                  <div class="form-group">
                                    <textarea rows="5" class="form-control validate[required]" name="mensaje" placeholder="{#mensaje#}"></textarea>
                                  </div>
                                </div>
                                  <div class="clearfix"></div>
                              </div>
                              <div class="row">
                                <div class="col-md-12">
                                    <div id="captchaContainer"></div>
                                </div>
                                  <div class="clearfix"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-12" style="margin-top:10px;">
                                <input type="submit" class="btn btn-warning left" value="{#enviar#} ❯" />
                              </div>
                              </div>
                          </div>
                      </form>
                  </div>
                  <div class="col-md-4 boletin_direccion_container">
                      <div class="content-title">
                          <h3>{#boletin_informativo#}</h3>
                          <hr class="for_double">
                      </div>
                      <div class="news_suscribe row-fluid">
                          <p>{#suscribete_a_nuestro_boletin_ahora_para_estar_actualizado_con_las_novedades#}</p>
                          <form id="subscribe_form" class="form row clearfix">
                            <div class="form-group col-md-12">
                              <input type="text" id="email" name="email" placeholder="{#correo_electronico#}" class="form-control validate[required, custom[email]]">
                            </div>
                            <div class="col-md-12">
                              <input type="submit" class="btn btn-success" value="{#enviar#}" />
                            </div>

                          </form>
                      </div>
                      <div class="content-title">
                          <h3>{#direccion#}</h3>
                          <hr class="for_double">
                      </div>
                      <div class="pull-right">
                        <address>
                          <!--<strong>{$hotel->empresa->nombreComercial}</strong><br>-->
                          {$hotel->direccion->descripcion}<br>
                          <abbr title="Phone">{#telefono#}:</abbr> {$hotel->telefonoReservas}
                        </address>
                      </div>
                  </div>
                  </div>
                <br />
                <div class="row-fluid clearfix">
                  <div class="col-md-12">
                      <div class="content-title">
                          <h3>{#localizacion#}</h3>
                          <hr class="for_double">
                      </div>
                    <div id="contact-map" class="img-thumbnail"></div>
                    <input type="hidden" name="lat" value="{$hotel->direccion->lat}">
                    <input type="hidden" name="lon" value="{$hotel->direccion->lon}">
                  </div>
                </div>
            </div>
        </div>      
    </div>    
    
{/block}