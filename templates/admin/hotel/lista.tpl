{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/hotel-lista.js"></script>
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
                <h3 class="page-title">Hoteles					
                    <small>Lista de hoteles registrados</small>
                </h3>
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="index.html">Inicio</a> 

                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">Hoteles</a>
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
                        <label>Destinos turísticos</label>
                        <input type="text" class="form-control" id="destino" autocomplete="off" placeholder="Filtrar por destino turístico">
                        <input type="hidden" name="destinoId">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group" style="padding-top: 30px;">
                        <label><input type="checkbox" name="destacados" value="1"> Filtrar favoritos</label>
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
                        <div class="caption"><i class="icon-user"></i>Hoteles</div>
                        <div class="actions">
                            <a href="{$base_url}/admin-hotel-export" target="_blank" class="btn btn-success"><i class="fa fa-download"></i> Exportar</a>
                            <a href="{$base_url}/admin-hotel-gestion{$end_url}" class="btn blue"><i class="fa fa-pencil"></i> Agregar</a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_hoteles">
                            <thead>
                                <tr>
                                    
                                    <th>Nombre</th>
                                    <th>Dominios</th>
                                    <th>Vigencia de contrato</th>
                                    
                                    <th>Email de reservas</th>
                                    <th>Teléfono de reservas</th>
                                    <th class="acciones-th">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--
                                {foreach from=$hoteles item=hotel}
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="{$hotel->id}" /></td>
                                    <td><input type="text" name="edit[{$hotel->id}][nombre]" value="{$hotel->nombre}"></td>
                                    <td>
                                        {$hotel->campania->subdominio}<br/>
                                        {$hotel->dominioOficial}<br/>
                                        {if $hotel->dominios}
                                            {foreach from=$hotel->dominios item=d name=d}
                                                {$d->dominio}{if !$smarty.foreach.d.last}<br/>{/if}
                                            {/foreach}
                                        {/if}
                                    </td>
                                    <td>
                                        <span class="label label-info">{$hotel->campania->inicio|date_format:"%e/%m/%Y"} - {$hotel->campania->fin|date_format:"%e/%m/%Y"}</span>
                                    </td>
                                    <td><input type="text" name="edit[{$hotel->id}][emailReservas]" value="{$hotel->emailReservas}"></td>
                                    <td><input type="text" name="edit[{$hotel->id}][telefonoReservas]" value="{$hotel->telefonoReservas}"></td>
                                    <td class="acciones-td">
                                        <a target="_blank" href="{if strpos($hotel->campania->subdominio, 'http://') eq FALSE}http://{/if}{$hotel->campania->subdominio}" title="Web oficial"><span class="fa fa-home"></span></a>
                                        <a href="{$base_url}/admin-reserva-lista/id:{$hotel->id}{$end_url}" title="Reservas"><span class="fa fa-file-text"></span></a>
                                        <a href="{$base_url}/admin-hotel-gestion/id:{$hotel->id}{$end_url}" title="Editar"><span class="fa fa-pencil"></span></a>
                                        <a hotel-id="{$hotel->id}" class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
                                    </td>
                                </tr>
                                {/foreach}
                                -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END EXAMPLE TABLE PORTLET-->
            </div>

        </div>

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

{/block}