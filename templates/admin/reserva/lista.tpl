{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/reserva-lista.js"></script>
{/block}

{block name="style" append}
    
{/block}

{block name="main_content" append}
  


<!-- BEGIN PAGE -->
<div class="page-content">
    <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <!-- BEGIN PAGE CONTAINER-->        
        <!-- BEGIN PAGE HEADER-->
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN PAGE TITLE & BREADCRUMB-->			
                <h3 class="page-title">Reserva					
                    <small>Lista de reservas</small>
                </h3>
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="{$base_url}/admin-reserva-lista{$end_url}">Reserva</a>

                        <i class="icon-angle-right"></i>
                    </li>
                    <li><a href="#">Listado</a></li>


                </ul>
                <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="row">
            <div class="row-fluid">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Busque por Localizador, Cliente u Hotel</label>
                        <input type="text" id="nombrehotel" autocomplete="off" class="form-control" {if $edit && $hotel->id}value="{$hotel->nombre}"{/if}>
                        <input type="hidden" id="hotel" name="query" {if $edit}value="hotel:{$hotel->id}"{/if}>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label><input class="" type="checkbox" name="all" value="1"> Mostrar todas las reservas</label><br>
                        <label><input class="" type="checkbox" name="showByOp" value="1"> Mostrar por OP</label>
                    </div>
                    
                </div>

                <div class="delimiter"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet box grey">
                    <div class="portlet-title">
                        <div class="caption"><i class="icon-user"></i>Reservas</div>
                        <div class="actions">
                            
                            <a href="{$base_url}/admin-reserva-export" target="_blank" class="btn btn-success"><i class="fa fa-download"></i> Exportar</a>

                            <a href="{$base_url}/admin-reserva-gestion" class="btn blue"><i class="fa fa-pencil"></i> Agregar</a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_reservas">
                            <thead>
                                <!--
                                <tr>
                                    <th style="width:8px;" rowspan="2"><input type="checkbox" class="group-checkable" data-set="#table_reservas .checkboxes" /></th>
                                    <th>
                                        <input type="text" id="localizador" class="form-control">
                                    </th>
                                    <th>
                                    <input type="text" id="nombre" class="form-control">
                                       <select id="alojamientoSelect" class="form-control">
                                            
                                        </select>
                                    </th> 
                                    <th>
                                        <select id="hotelSelect" class="form-control">
                                            
                                        </select>
                                    </th>
                                    <th>
                                        <select id="extrasSelect" class="form-control">
                                            
                                        </select>
                                    </th>
                                    <th>
                                        <input type="text" id="entrada" class="form-control">
                                    </th>
                                    <th>
                                        <input type="text" id="salida" class="form-control">
                                    </th>
                                    <th>
                                        <input type="text" id="creacion" class="form-control">
                                    </th>                                  
                                    <th class="hidden-480">
                                        <input type="text" name="importe" class="form-control">
                                    </th>
                                    <th>
                                        <select id="estadosSelect" class="form-control">
                                            <option value="">Seleccione</option>
                                            {foreach from=$estadosReserva item=estado}
                                                <option>{$estado}</option>
                                            {/foreach}
                                        </select>
                                    </th>
                                    <th class="acciones-th" rowspan="2">Acciones</th>
                                </tr>-->
                                <tr>
                                    
                                    <th>Localizador</th>
                                    <th>Cliente</th> 
                                    <th>Hotel</th>
                                    <th>Llegada</th>
                                    <th>Salida</th>
                                    <th>Creación</th>                                 
                                    <th class="hidden-480">Total</th>
                                    <th class="hidden-480">Comisión</th>
                                    <th>Estado</th>
                                    <th>OP-C</th>
                                    <th>OP-D</th>
                                    <th class="acciones-th" >Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END EXAMPLE TABLE PORTLET-->
            </div>

        </div>
                                        
        <span class="estado hidden" id="cambiarEstado">
            <select name="estado" class="form-control">
                {foreach from=$estadosReserva item=estado}
                    <option>{$estado}</option>
                {/foreach}
            </select>
        </span>

    <!-- END PAGE CONTENT-->
</div>
<!-- END PAGE CONTAINER-->

<div class="modal fade" id="eliminar_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{#eliminar#}</h4>
            </div>
            <div class="modal-body">
                {#desea_eliminar#}
                <input type="hidden" id="idEliminar">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="aceptarEliminar">{#aceptar#}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>
            
<div class="modal fade" id="motivo_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Motivo de cancelación</h4>
            </div>
            <div class="modal-body">
                <form id="motivoForm">
                <div class="form-group">
                    
                    <textarea type="text" name="motivoCancelacion" class="form-control validate[required]"></textarea>
                </div>
                
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="aceptarMotivo">{#aceptar#}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>

{/block}