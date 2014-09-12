{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/contrato-lista.js"></script>
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
                <h3 class="page-title">Contratos					
                    <small>Lista de contratos</small>
                </h3>
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">Inicio</a> 

                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">Contratos</a>

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

                    <div class="delimiter"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet box grey">
                    <div class="portlet-title">
                        <div class="caption"><i class="icon-user"></i>Contratos</div>
                        <div class="actions">
                            {if $logged_user->usuarioGrupoId eq 3}
                            <a href="{$base_url}/admin-campania-contrato{$end_url}" class="btn blue"><i class="fa fa-pencil"></i> Crear contrato</a>
                            {/if}
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_campanias">
                            <thead>
                                <tr>
                                    
                                    <th>No</th>
                                    <th>Nombre</th> 
                                    <th>Cobro</th>
                                    <th>Vigencia</th>
                                    <th>Distribuidor</th>
                                    <th class="hidden-480">Estado</th>
                                    <th class="acciones-th">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--
                                {foreach from=$campanias item=campania}
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="{$campania->id}" /></td>
                                    <td>{$campania->localizador}</td>
                                    <td>{$campania->nombreHotel}</td>
                                    <td>{if $campania->hotel}{if $campania->hotel->tipoReserva eq 'offline'}Offline{else}Online {$campania->hotel->porcentageCobroAnticipado}%{/if}{else}Online 0%{/if}</td>
                                    <td>
                                        <span class="label label-info">{$campania->inicio|date_format:"%e/%m/%Y"} - {$campania->fin|date_format:"%e/%m/%Y"}</span>
                                    </td>

                                    <td>{$campania->empresaDistribuidora->nombreComercial}</td>

                                    <td><span class="label label-success {if $campania->estado ne 'Pendiente'}estado-campania{/if}" campania-id="{$campania->id}"><span class="estado-label">{$campania->estado}</span> {if $campania->estado ne 'Pendiente'}<i class="fa fa-pencil"></i>{/if}</span></td>
                                    <td class="acciones-td">
                                        <a target="_blank" href="{if strpos($campania->subdominio, 'http://') eq FALSE}http://{/if}{$campania->subdominio}" title="Web oficial"><span class="fa fa-home"></span></a>
                                        {if $campania->estado ne 'Pendiente'}<a href="{$base_url}/admin-contrato-ver/id:{$campania->id}{$end_url}" title="Ver contrato"><i class="fa fa-file"></i></a>
                                        {/if}
                                        <a campania-id="{$campania->id}" class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
                                        {if $campania->estado eq 'Aprobada'}
                                            <a href="{$base_url}/admin-hotel-gestion/{if $campania->hotel->id}id:{$campania->hotel->id}{else}c:{$campania->id}{/if}" title="{if $campania->hotel->id}Editar{else}Crear{/if} hotel"><span class="fa fa-building-o"></span></a>
                                            <a href="{$base_url}/admin-reserva-lista/id:{$campania->hotel->id}{$end_url}" title="Reservas"><span class="fa fa-file-text"></span></a>
                                        {/if}
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

<span class="estado hidden" id="cambiarEstado">
    <select name="estado" class="form-control">
        {foreach from=$estadosCampania item=estado}
            {if $estado ne 'Pendiente'}
                <option>{$estado}</option>
            {/if}
        {/foreach}
    </select>
</span>
    
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