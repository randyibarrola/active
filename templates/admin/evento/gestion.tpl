{extends file="admin/index.tpl"}

{block name="script" append}
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script type="text/javascript" src="{$template_url}/js/jquery.geocomplete.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/evento-gestion.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/ajaxfileupload.js"></script>
{/block}

{block name="style" append}
    <link href="{$template_url}/admin/assets/plugins/dropzone/css/dropzone.css" rel="stylesheet"/>
    <link rel="stylesheet" href="{$template_url}/css/colorpicker.css" >
    <link rel="stylesheet" href="{$template_url}/css/admin/hotel-gestion.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/logo.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/uniform.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/colorbox.css">
    <link rel="stylesheet" href="{$template_url}/css/admin/jquery.Jcrop.min.css">
{/block}

{block name="main_content" append}
  
<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <!-- BEGIN PAGE CONTAINER-->        
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->			
                    <h3 class="page-title">Eventos					
                        <small>Gestión de Evento</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-evento-lista{$end_url}">Eventos</a>

                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="javascript:void(0)">Gestión</a></li>


                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="col-md-12 responsive" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            {$show_title = ($edit && $evento->id) ? $evento->nombre : 'Nuevo Evento'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                                <div class="form-body">
                                    <form action="#" class="horizontal-form" id="eventoFrm1">
                                        <div class="row hidden">
                                            <div class="row-fluid">
                                                <div class="col-md-12 text-right">
                                                    <label class="radio-inline"><input type="checkbox" name="destacado" value="1" {if $evento->destacado}checked{/if}></label> <label class="form-label-stripped">Favorito</label>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Escriba el nombre del evento</label>
                                                    <input name="nombre" type="text" autocomplete="off" class="form-control validate[required]" {if $edit && $evento->nombre}value="{$evento->nombre}"{/if}>
                                                </div>
                                            </div>
                                            
                                                <div class="delimiter"></div>
                                        </div>
                                    </div>

                                    <h3 class="form-section">Campa&ntilde;a</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Escriba el nombre o localizador de la campaña</label>
                                                    <input type="text" id="campania" autocomplete="off" class="form-control validate[required]" {if $edit && $evento->campaniaId}value="{$evento->campania->localizador} - {$evento->campania->nombre}"{/if}>
                                                    <input type="hidden" id="idCampania" name="campaniaId" {if $edit}value="{$evento->campaniaId}"{/if}>
                                                </div>
                                            </div>
                                            
                                                <div class="delimiter"></div>
                                        </div>
                                    </div>
                                    <h3 class="form-section">Contrato</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Fecha de inicio del contrato</label>
                                                    <input type="text" name="inicioContrato" autocomplete="false" disabled="" class="form-control validate[required]" {if $edit}value="{$evento->campania->inicio|date_format:"%d-%m-%Y"}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Fecha de finalización del contrato</label>
                                                    <input type="text" name="finContrato" autocomplete="false" disabled="" class="form-control validate[required]" {if $edit}value="{$evento->campania->fin|date_format:"%d-%m-%Y"}"{/if}>
                                                </div>
                                            </div>
                                                <div class="delimiter"></div>
                                        </div>
                                    </div>
                                    <h3 class="form-section">Monedas</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Moneda de reservas</label>
                                                    <select name="monedaId" class="form-control">
                                                        {foreach from=$monedas item=moneda}
                                                            <option {if $moneda->default}selected="selected"{/if} value="{$moneda->id}" {if $evento->monedaId eq $moneda->id}selected{/if}>{$moneda->nombre} ({$moneda->codigo})</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Destino Turístico</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control validate[required]" id="destino" autocomplete="off" placeholder="Filtrar por destino turístico" {if $edit && $evento->destinoTuristicoId}value="{$evento->destino->nombre}"{/if}>
                                                    <input type="hidden" name="destinoTuristicoId" {if $edit && $evento->destinoTuristicoId}value="{$evento->destinoTuristicoId}"{/if}>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <h3 class="form-section">Datos de Configuración</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <label>Duración:</label>
                                                <span class="duracion_indefinida_container"><input type="checkbox" id="duracion_indefinida" name="duracionIndefinida" value="0" {if $evento->duracion != "00:00"}checked="checked"{/if}></span>
                                                
                                                <input class="w30 validate[required]" id="duracion_horas" type="text" name="duracion" value="{$evento->duracion}" placeholder="hh:mm">
                                                
                                                <input class="w30 validate[required, custom[integer, min[1]]]" name="dias" id="duracion_dias" disabled="" style="display: none;">
                                                <select name="duracion_medida" id="duracion_medida">
                                                    <option value="horas" selected="">Horas</option>
                                                    <option value="dias">Días</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="transfer" value="1" {if $edit && $evento->transfer}checked{/if}{if !$edit}checked{/if}>
                                                        Dispone de servicio de transfer
                                                        </label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="guias[es]" value="1" {if $edit && $evento->guias["es"]}checked{/if} {if !$edit}checked{/if}>
                                                        Guía en español
                                                        </label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="guias[en]" value="1" {if $edit && $evento->guias["en"]}checked{/if} {if !$edit}checked{/if}>
                                                        Guía en ingles
                                                        </label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="guias[de]" value="1" {if $edit && $evento->guias["de"]}checked{/if} {if !$edit}checked{/if}>Guía en aleman
                                                        </label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="guias[it]" value="1" {if $edit && $evento->guias["it"]}checked{/if} {if !$edit}checked{/if}>
                                                        Guía en italiano
                                                        </label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="guias[fr]" value="1" {if $edit && $evento->guias["fr"]}checked{/if} {if !$edit}checked{/if}>
                                                        Guía en frances
                                                        </label>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="guias[ru]" value="1" {if $edit && $evento->guias["ru"]}checked{/if}>Guía en ruso</label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline"><input type="checkbox" name="guias[zh]" value="1" {if $edit && $evento->guias["zh"]}checked{/if}>
                                                        Guía en chino
                                                        </label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row-fluid">
                                                    <div class="row-fluid">
                                                        <label class="radio-inline">
                                                        <input type="checkbox" name="guias[ja]" value="1" {if $edit && $evento->guias["ja"]}checked{/if}>
                                                        Guía en japones
                                                        </label> 
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Idioma</label>
                                                    <select id="idiomaSelect" class="form-control validate[required]"> 
                                                        {foreach from=$idiomas item=idioma}
                                                            <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>   
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Descripción breve (300 caracteres)</label>
                                                    <div style="width: 100%;">
                                                        <textarea id="descripcionBreve" rows="6" class="ckeditor form-control"></textarea>
                                                        <textarea style="display:none;" name="descripcionBreve" >{if $edit}{$evento->descripcionBreve|replace:'&quot;':'\"'}{/if}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Descripción larga (3000 caracteres)</label>
                                                    <div style="width: 100%;">
                                                        <textarea id="descripcionExtendida" rows="6" class="ckeditor form-control"></textarea>
                                                        <textarea style="display:none;" name="descripcionExtendida" >{if $edit}{$evento->descripcionExtendida|replace:'&quot;':'\"'}{/if}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Sugerencias y advertencias en el TPV</label>
                                                    <div style="width: 100%;">
                                                        <textarea id="sugerenciasTpv" rows="6" class="ckeditor form-control"></textarea>
                                                        <textarea style="display:none;" name="sugerenciasTpv" >{if $edit}{$evento->sugerenciasTpv|replace:'&quot;':'\"'}{/if}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Instrucciones de consumo</label>
                                                    <div style="width: 100%;">
                                                        <textarea id="instruccionesConsumo" rows="6" class="ckeditor form-control"></textarea>
                                                        <textarea style="display:none;" name="instruccionesConsumo" >{if $edit}{$evento->instruccionesConsumo|replace:'&quot;':'\"'}{/if}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <h3 class="form-section">Contacto</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Video YouTube</label>
                                                    <input name="youtube" type="text" class="form-control" autocomplete="off" placeholder="https://www.youtube.com/watch?v=x" {if $edit && $evento->youtube}value="{$evento->youtube}"{/if}>
                                                </div>
                                            </div>

                                            <!--<div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Título SEO</label>
                                                    <input name="tituloSeo" type="text" class="form-control validate[required]" autocomplete="off" placeholder="Título seo..." {if $edit && $evento->tituloSeo}value='{$evento->tituloSeo}'{/if}>
                                                </div>
                                            </div>-->
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <h3 class="form-section">Condiciones</h3>
                                    <div class="row" id="condicionesContainer">
                                        <div class="row">
                                            {foreach from=$condiciones item=condicion}
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <div>
                                                            <label class="radio-inline">
                                                                <input type="checkbox" name="condiciones[]" value="{$condicion->id}" {if $condicion->condicionCategoriaId eq 1}disabled=""{/if} {if $condicion->selected || $condicion->condicionCategoriaId eq 1}checked{/if}> {if $condicion->nombres->$lang}{$condicion->nombres->$lang}{else}{$condicion->nombres->es}{/if}
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                        
                                    <h3 class="form-section">Ventas</h3>
                                    <div class="row">
                                                    
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                        <label>
                                                            Release
                                                        </label>
                                                        <select name="ventaAnticipada" class="form-control">
                                                            {for $i=0 to 30}
                                                                <option value="{$i}" {if $edit && $evento->ventaAnticipada eq $i}selected{/if}{if !$edit && $i eq 3}selected{/if}>{$i} día{if $i ne 1}s{/if}</option>
                                                            {/for}
                                                        </select>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Porcentaje de comisión</label>
                                                    <input name="porcentajeComision" class="form-control validate[required, custom[number]]" {if $edit}value="{$evento->porcentajeComision}"{/if} {if !$edit}value="30"{/if}>
                                                </div>
                                            </div>
                                        <div class="delimiter"></div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Cobro de reserva</label>
                                                    <select name="tipoReserva" class="form-control">
                                                        <option value="online" {if $edit && $evento->tipoReserva ne 'offline'}selected{/if}>Online</option>
                                                        <option value="offline" {if $edit && $evento->tipoReserva eq 'offline'}selected{/if}>Offline</option>
                                                        <option value="cobro anticipado de comisiones" {if $edit && $evento->tipoReserva eq 'cobro anticipado de comisiones'}selected{/if}>Cobro anticipado de comisiones</option>
                                                    </select>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-4" id="porcientoCobroAnticipado">
                                                <div class="form-group">
                                                        <label>Porcentaje de cobro anticipado</label>
                                                        <input name="porcentajeCobroAnticipado" class="form-control validate[required, custom[number]]" {if $evento->tipoReserva eq 'offline'}disabled{/if} {if $edit}value="{$evento->porcentajeCobroAnticipado}"{/if} {if !$edit}value="100"{/if}>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4 " style="padding-top: 32px;">
                                                <div class="form-group">
                                                    <label class="radio-inline"><input type="checkbox" value="1" name="bookingOnrequest" {if $evento->bookingOnrequest}checked{/if}> Booking On Request</label> 
                                                </div>
                                            </div>
                                                 <div class="delimiter"></div>
                                        </div>

                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>
                                                        Email de reservas
                                                    </label>
                                                    <input type="text" name="emailReservas" class="form-control validate[required, custom[email]]" {if $edit}value="{$evento->emailReservas}"{/if}>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>
                                                        Teléfono de reservas
                                                    </label>
                                                    <input type="text" name="telefonoReservas" class="form-control validate[required]" {if $edit}value="{$evento->telefonoReservas}"{/if}>
                                                </div>
                                            </div>
                                                <div class="delimiter"></div>
                                        </div>
                                    </div>

                                    <h3 class="form-section"><a href="#" class="btn btn-sm blue" id="agregar_ticket"><i class="fa fa-plus"></i> Agregar ticket</a> Gestión de tickets</h3>
                                    <div class="row" id="ticket_container">
                                        {foreach from=$evento->tickets item=ticket}
                                        <div class="row-fluid ticket_content">
                                            <input type="hidden" class="ticket_id" value="{$ticket->id}" />
                                            <input type="hidden" class="ticket_fechas" value='{$ticket->fechas_json}' />
                                            <div class="row-fluid">
                                                <div class="col-md-12">
                                                    <a href="#" class="btn btn-sm red pull-right borrar_ticket">Borrar</a>    
                                                </div>
                                                <div class="delimiter"></div>
                                            </div>                                    
                                            <div class="row-fluid">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Idioma</label>
                                                        <select name="tickets[{$ticket->id}][idiomaId]" class="form-control idioma_ticket validate[required]"> 
                                                            {foreach from=$idiomas item=idioma}
                                                                <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Nombre</label>
                                                        <input type="text" value='{$ticket->nombre}' name="tickets[{$ticket->id}][nombres]" class="form-control ticket_nombre">
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Precio</label>
                                                        <input type="text" value="{$ticket->precio}" name="tickets[{$ticket->id}][precio]" class="form-control validate[required]">
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label class="control-label">Stock</label>
                                                        <input type="text" value="{$ticket->stock}" name="tickets[{$ticket->id}][stock]" class="form-control validate[required]">
                                                    </div>
                                                </div>

                                                <div class="delimiter"></div>
                                            </div>  
                                            <div class="row-fluid">
                                                <div class="col-md-3">
                                                    <a href="#" class="btn btn-xs blue agregar_horario"><i class="fa fa-plus"></i> Agregar horario</a>
                                                    <div class="horario_container">
                                                        {foreach from=$ticket->horario key=h_k item=horario}
                                                        <div class="form-group horario-form-group">
                                                            <label class="control-label">Horario</label>
                                                            <input type="text" value="{$horario}" placeholder="16:16" name="tickets[{$ticket->id}][horario][{$h_k}]" class="form-control validate[required]">
                                                            <a class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
                                                        </div>
                                                        {/foreach}
                                                    </div>
                                                    <div class="form-group horario-form-group hidden">
                                                        <label class="control-label">Horario</label>
                                                        <input type="text" placeholder="16:16" name="tickets[{$ticket->id}][horario][YY]" class="form-control validate[required]">
                                                        <a class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <h4>Introducir rango de fechas</h4>
                                                    <div class="form-group">
                                                        <label class="control-label">Fecha inicial</label>
                                                        <input type="text" name="fecha_inicial" class="form-control fecha_inicial">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Fecha final</label>
                                                        <input type="text" name="fecha_final" class="form-control fecha_final">
                                                    </div>
                                                    <div class="form-group">
                                                        <a class="btn btn-success btn-xs pull-right agregar_rango_fecha_ticket" href="#">Agregar</a>
                                                        <a class="btn red btn-xs pull-right limpiar_rango_fecha_ticket" href="#">Limpiar</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="calendario"></div>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        {/foreach}
                                    </div>
                                    <div class="row-fluid hidden ticket_hidden ticket_content">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                                <a href="#" class="btn btn-sm red pull-right borrar_ticket">Borrar</a>    
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>                                    
                                        <div class="row-fluid">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Idioma</label>
                                                    <select disabled="disabled" name="tickets[XX][idiomaId]" class="form-control idioma_ticket validate[required]"> 
                                                        {foreach from=$idiomas item=idioma}
                                                            <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" disabled="disabled" name="tickets[XX][nombres]" class="form-control ticket_nombre">
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Precio</label>
                                                    <input type="text" disabled="disabled" name="tickets[XX][precio]" class="form-control validate[required]">
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Stock</label>
                                                    <input type="text" disabled="disabled" name="tickets[XX][stock]" class="form-control validate[required]">
                                                </div>
                                            </div>

                                            <div class="delimiter"></div>
                                        </div>  
                                        <div class="row-fluid">
                                            <div class="col-md-3">
                                                <a href="#" class="btn btn-xs blue agregar_horario"><i class="fa fa-plus"></i> Agregar horario</a>
                                                <div class="horario_container">
                                                    
                                                </div>
                                                <div class="form-group horario-form-group hidden">
                                                    <label class="control-label">Horario</label>
                                                    <input type="text" disabled="disabled" placeholder="16:16" name="tickets[XX][horario][YY]" class="form-control validate[required]">
                                                    <a class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                    <h4>Introducir rango de fechas</h4>
                                                    <div class="form-group">
                                                        <label class="control-label">Fecha inicial</label>
                                                        <input type="text" name="fecha_inicial" class="form-control fecha_inicial">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Fecha final</label>
                                                        <input type="text" name="fecha_final" class="form-control fecha_final">
                                                    </div>
                                                    <div class="form-group">
                                                        <a class="btn btn-success btn-xs pull-right agregar_rango_fecha_ticket" href="#">Agregar</a>
                                                        
                                                        <a class="btn red btn-xs pull-right limpiar_rango_fecha_ticket" href="#">Limpiar</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="calendario"></div>
                                                </div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>

                                    <h3 class="form-section">Dirección</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Descripción</label>
                                                <input type="text" name="descripcion" id="geocomplete" class="form-control" placeholder="Descripción"  {if $edit}value="{$evento->direccion->descripcion}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="control-label">Latitud</label>
                                                <input type="text" name="lat" id="direccion_lat" class="form-control validate[custom[number]]" placeholder="Latitud"  {if $edit}value="{$evento->direccion->lat}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label class="control-label">Longitud</label>
                                                <input type="text" name="lon" id="direccion_lon" class="form-control validate[custom[number]]" placeholder="Longitud" {if $edit}value="{$evento->direccion->lon}"{/if}>
                                            </div>
                                        </div>
                                    </div>                                           

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group" id="mapa">
                                            </div>
                                        </div> 
                                        <div style="clear: both"></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12 text-center ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit && $evento->id}
                                            <input type="hidden" name="idEvento" id="global_id_evento" value="{$evento->id}">
                                            {/if}
                                            <input id="saveBtn" type="submit" class="btn btn-success" value="Guardar">
                                            <a class="btn btn-default" href="{$base_url}/{if $edit && !$evento->id}admin-contrato-lista{else}admin-evento-lista{/if}" >Cancelar</a>
                                        </div>
                                    </div>
                                        
                                    </form>
                                    {if $edit}
                                    <h3 class="form-section">Imágenes</h3>
                                    <form action="{$base_url}/admin-ajax-evento/idEvento:{$evento->id}" class="dropzone" id="evento-dropzone">    
                                        <div class="fallback">
                                            <input name="file" type="file" multiple >
                                        </div>
                                    </form> 
                                    {/if}
                                </div>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                </div>

            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </div>
    <!-- END PAGE CONTAINER-->
</div>

{/block}