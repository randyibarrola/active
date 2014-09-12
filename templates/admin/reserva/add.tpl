{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/reserva-add.js"></script>
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/admin/reserva-gestion.css" />
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
                <div class="span12 hidden-print">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->			
                    <h3 class="page-title">Hoteles					
                        <small>Gestión de Reserva</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-reserva-lista{$end_url}">Reservas</a>

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
                <div class="col-xs-12 responsive" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title hidden-print">
                            {$show_title = ($edit) ? 'Editar Reserva' : 'Nueva Reserva'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            <!--<div class="actions">
                                <a href="{$base_url}/admin-campania-ver/id:{$reserva->hotel->campaniaId}" class="btn btn-warning"><i class="fa fa-file"></i> Ver contrato</a>
                            </div>-->
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="reservaFrm">
                                <div class="form-body">
                                    <h3 class="form-section">Datos del hotel</h3>
                                    <div class="row row-hotel-content">
                                        {if $edit}
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Localizador</label>
                                                    <input type="text" id="usuario" disabled="" class="form-control" value="{$reserva->localizador}">
                                                </div>
                                            </div>
                                             <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Referencia de contrato</label>
                                                    <input type="text" id="usuario" disabled="" class="form-control" value="{$campania->localizador}">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Fecha de creaci&oacute;n</label>
                                                    <input type="text" id="fecha" class="form-control"  placeholder="Fecha" value="{$reserva->tiempoCreacion|date_format:"%e/%m/%Y"}">
                                                </div>
                                            </div>
                                            {if $logged_user->usuarioGrupoId ne 2}
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Estado</label>
                                                    <select class="form-control" name="estado">
                                                        {foreach from=$estadosReserva item=estado}
                                                            <option value="{$estado}" {if $reserva->estado eq $estado}selected{/if}>{$estado}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            {/if}
                                            <div class="delimiter"></div>
                                        </div>
                                        {/if}
                                        <div class="row-fluid">
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <label class="">Hotel</label>
                                                    <input type="text" class="form-control validate[required]" placeholder="Hotel" id="nombrehotel" autocomplete="off">
                                                    <input type="hidden" name="hotelId" id="hotel">
                                                </div>
                                            </div>
                                            
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Estado</label>
                                                    <select class="form-control" name="estado">
                                                        {foreach from=$estadosReserva item=estado}
                                                            <option value="{$estado}" {if $reserva->estado eq $estado}selected{/if}>{$estado}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                                    <div class="clearfix"></div>
                                        </div>
                                        <div class="row-fluid">
                                            
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Adultos</label>
                                                    <select class="form-control" name="adultos" >
                                                        {for $i=1 to 10}
                                                            <option>{$i}</option>
                                                        {/for}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Niños</label>
                                                    <select class="form-control" name="ninios" >
                                                        {for $i=0 to 10}
                                                            <option>{$i}</option>
                                                        {/for}
                                                    </select>
                                                </div>
                                            </div>
                                                <div class="clearfix"></div>
                                        </div>
                                        
                                        
                                    </div>
                                    <h3 class="form-section">Datos del cliente</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-xs-4">
                                                <div class="form-group">
                                                    <label class="">Nombre</label>
                                                    <input type="text"  class="form-control validate[required]" placeholder="Usuario" name="nombre">
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="form-group">
                                                    <label class="">Apellidos</label>
                                                    <input type="text"  class="form-control validate[required]" placeholder="Apellidos" name="apellido">
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="form-group">
                                                    <label class="">Email del cliente</label>
                                                    <input type="text"  class="form-control validate[required, custom[email]]" placeholder="Email" name="email">
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="form-group">
                                                    <label class="">Teléfono del cliente</label>
                                                    <input type="text"  class="form-control" placeholder="Telefono" name="telefono">
                                                </div>
                                            </div>
                                            <div class="col-xs-4">
                                                <div class="form-group">
                                                    <label class="">Nacionalidad</label>
                                                    <select name="paisId"  class="form-control" >
                                                        {foreach from=$paises item=pais}
                                                        <option value="{$pais->id}">{$pais->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="delimiter"></div>
                                        </div>
                                        {if $reserva->peticionesEspeciales}
                                        <div class="row-fluid">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="">Peticiones especiales</label>
                                                    <div class="form-control delimiter"  style="height: auto;">{if $edit}{$reserva->peticionesEspeciales}{/if}</div>
                                                </div>
                                            </div>
                                        <div class="delimiter"></div>
                                        </div>
                                        {/if}
                                    </div>

                                    <h3 class="form-section">Apartamento</h3>
                                    <div class="row">
                                    
                                    <div class="row-fluid">
                                        <div class="col-xs-10">
                                            <div class="form-group">
                                                <label class="">Título</label>
                                                
                                                <input type="text" class="form-control validate[required]"  placeholder="Titulo" name="titulo">
                                            </div>
                                        </div>
                                            
                                        <div class="col-xs-2">
                                            <div class="form-group">
                                                <label class="">Precio</label>
                                                <input type="text" id="fecha" class="form-control  validate[required, custom[number]]"  placeholder="Precio" name="precioUnitario">
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="col-xs-5">
                                            <div class="form-group">
                                                <label class="">Pensión</label>
                                                <input type="text"  class="form-control validate[required]"  placeholder="Pensión" name="pension">
                                            </div>
                                        </div>
                                        
                                        <div class="col-xs-5">
                                            <div class="form-group">
                                                <label class="">Condición</label>
                                                <input type="text"  class="form-control validate[required]"  placeholder="Condición" name="condicion">
                                            </div>
                                        </div>
                                        
                                        
                                    
                                        
                                            <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid">
                                    
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label class="">Fecha de Entrada</label>
                                                <input type="text" id="inicio" class="form-control validate[required]" readonly=""  placeholder="Fecha" name="inicio">
                                            </div>
                                        </div>
                                        
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label class="">Fecha de Salida</label>
                                                <input type="text" id="final" class="form-control  validate[required]" readonly=""  placeholder="Fecha" name="final">
                                            </div>
                                        </div>
                                        <!--<div class="col-xs-2">
                                            <div class="form-group">
                                                <label class="">Noches</label>
                                                <input type="text" id="noches" class="form-control"  placeholder="Noches" readonly="">
                                            </div>
                                        </div>-->
                                        
                                        <div class="col-xs-2">
                                            <div class="form-group">
                                                <label class="">Hora</label>
                                                <input type="text" id="sesion" class="form-control"  placeholder="Hora" name="sesion">
                                            </div>
                                        </div>    
                                        
                                        <div class="delimiter"></div>
                                    </div>
                                    </div>
                                    <!--
                                    <div class="row-fluid">                                        
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Forma de pago</label>
                                                <input class="form-control" disabled="" value="{if !$producto->pagoOffline}Online{else}Offline{/if}">
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Porciento de adelanto</label>
                                                <input type="text" class="form-control"  value="{$producto->porcientoInicial}%">
                                            </div>
                                        </div>
                                                
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Importe de adelanto</label>
                                                <input type="text" class="form-control"  value="{$reserva->moneda->simbolo}{$producto->importeInicial|number_format:2:',':' '}">
                                            </div>
                                        </div>
                                        
                                                <div class="delimiter"></div>
                                    </div>
                                    
                                    
                                    </div>

                                    <!--<h3 class="form-section">Pagos de Reserva</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Agregar pago</label>
                                                    <select class="form-control" id="tipoPago" >
                                                        <option value="tarjeta">Tarjeta de Cr&eacute;dito</option>
                                                        <option value="efectivo">Efectivo</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                
                                                    <input type="submit" id="add_pago" class="btn btn-success pull-left" value="Agregar">
                                                
                                            </div>
                                        </div>
                                    </div>-->
                                    <h3 class="form-section">Pago de la reserva</h3>
                                    <div class="row pagos-update" id="pagosCont">
                                        
                                        
                                        <input type="hidden" name="formaPago" value="tarjeta">
                                      
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Tipo de tarjeta</label>
                                                    
                                                    <select class="form-control" name="tarjetaTipo">
                                                        <option value="Visa">Visa</option>
                                                        <option value="Master Card">Master Card</option>
                                                    </select>
                                                </div>
                                            </div>
                                                   
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Importe</label>
                                                    <input name="importe" class="form-control validate[required, custom[number]]" placeholder="Importe" value="">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Estado</label>
                                                    <select id="fecha" class="form-control" name="estado">
                                                        {foreach from=$estadosPago item=estado}
                                                            <option value="{$estado}" {if $pago->estado eq $estado}selected{/if}>{$estado}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">OP</label>
                                                    <input name="op" class="form-control validate[required, custom[number]]" placeholder="OP" value="">
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                                        
                                            
                                        </div>
                                        
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Numero de tarjeta</label>
                                                    <input type="text" name="tarjetaNumero" class="form-control validate[required]" placeholder="Numero" value="{$pago->tarjetaNumero}" >
                                                </div>
                                            </div>
                                                
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Titular</label>
                                                    <input type="text" name="titular" class="form-control validate[required]" placeholder="Titular" value="{$pago->titular}" >
                                                </div>
                                            </div>
                                                
                                            <div class="col-xs-1">
                                                <div class="form-group">
                                                    <label class="">CVV</label>
                                                    <input type="text" name="cvv" class="form-control validate[required]" placeholder="CVV" value="{$pago->cvv}" >
                                                </div>
                                            </div>
                                                
                                            <div class="col-xs-2">
                                                <div class="form-group">
                                                    <label class="">Mes de caducidad</label>
                                                    
                                                    <select name="caducidadMes" class="form-control" placeholder="Fecha">
                                                        {for $i=1 to 12}
                                                            <option value="{$i}" {if $pago->caducidadMes eq $i}selected{/if}>{$i} - {$meses[$i - 1]}</option>
                                                        {/for}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-2">
                                                <div class="form-group">
                                                    <label class="">A&ntilde;o de caducidad</label>
                                                    
                                                    <select  name="caducidadAnio" class="form-control" placeholder="Fecha">
                                                        {for $i=2014 to 2040}
                                                            <option value="{$i}" {if $pago->caducidadAnio eq $i}selected{/if}>{$i}</option>
                                                        {/for}
                                                    </select>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                    
                                    </div>
                                    
                                    
                                    
                                    <div id="pago_efectivo">
                                        <div class="delete-pago-container"><a href="javascript:void(0)"><span class="fa fa-trash-o"></span></a></div>
                                        <div class="row-fluid">
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Importe</label>
                                                    <input type="hidden" name="pagoUpdate[XX][formaPago]" value="efectivo" disabled="">
                                                    <input type="text" name="pagoUpdate[XX][importe]" class="form-control validate[required, custom[number]]" placeholder="Importe" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-xs-3">
                                                <div class="form-group">
                                                    <label class="">Estado</label>
                                                    <select id="fecha" class="form-control" name="pagoUpdate[XX][estado]" disabled="">
                                                        {foreach from=$estadosPago item=estado}
                                                            <option value="{$estado}">{$estado}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                                    <div class="delimiter"></div>
                                    </div>
                                    <div class="row hidden-print">
                                        <div class="col-xs-12 centered">
                                            <input type="hidden" name="action" value="insert">
                                            
                                            <input type="submit" class="btn btn-success" value="Guardar">
                                            <a target="_blank" href="{$base_url}/admin-reserva-gestion/id:{$reserva->id}/print:1"  class="btn btn-warning">Imprimir</a>
                                            <a href="{$base_url}/admin-reserva-lista{$end_url}" class="btn btn-default">Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
<!-- END PAGE -->

<div class="modal fade" id="cardData_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Mostrar Datos de las tarjetas</h4>
            </div>
            <div class="modal-body">
                <form id="cardDataForm">
                <div class="form-group">
                    <label>Introduzca la clave de encriptación</label>
                    <input type="text" name="clave" class="form-control validate[required]">
                </div>
                <input type="hidden" name="id" value="{$reserva->id}">
                <input type="hidden" name="action" value="cardData">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="aceptar">{#aceptar#}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>

{/block}