{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/campania-lista.js"></script>
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
                <h3 class="page-title">Campa&ntilde;as					
                    <small>Lista de campa&ntilde;as</small>
                </h3>
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">Inicio</a> 

                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">Campa&ntilde;as</a>

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
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet box grey">
                    <div class="portlet-title">
                        <div class="caption"><i class="icon-user"></i>Campa&ntilde;as</div>
                        <div class="actions">
                            <a href="{$base_url}/admin-campania-contrato{$end_url}" class="btn blue"><i class="fa fa-pencil"></i> Crear campa&ntilde;a</a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_campanias">
                            <thead>
                                <tr>
                                    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#table_campanias .checkboxes" /></th>
                                    <th>Nombre</th>
                                    <th>Referencia</th>                                  
                                    <th class="hidden-480">Estado</th>
                                    <th class="acciones-th">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$campanias item=campania}
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="{$campania->id}" /></td>
                                    <td>{$campania->nombreHotel}</td>   
                                    <td>{$campania->localizador}</td>                                    
                                    <td><span class="label label-success">{$campania->estado}</span></td>
                                    <td class="acciones-td">
                                        <a target="_blank" href="{if strpos($campania->subdominio, 'http://') eq FALSE}http://{/if}{$campania->subdominio}" title="Web oficial"><span class="fa fa-home"></span></a>
                                        
                                    {if $campania->estado eq 'Pendiente'}<a href="{$base_url}/admin-campania-contrato/id:{$campania->id}{$end_url}" title="Crear contrato"><span class="fa fa-plus-square"></span></a>
                                    {else}<a href="{$base_url}/admin-campania-ver/id:{$campania->id}{$end_url}" title="Ver contrato"><span class="fa fa-file"></span></a>
                                    {/if}
                                    {if $logged_user->usuarioGrupoId ne 2}
                                        {if $campania->estado ne 'Aprobada'}
                                            <a campania-id="{$campania->id}" class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
                                        {else}
                                            <a href="{$base_url}/admin-campania-suspender/id:{$campania->id}" title="Suspender"><span class="fa fa-eraser"></span></a>
                                            
                                        {/if}
                                    {/if}
                                    {if $campania->estado eq 'Aprobada'}
                                        <a href="{$base_url}/admin-reserva-lista/id:{$campania->hotel->id}{$end_url}" title="Reservas"><span class="fa fa-file-text"></span></a>
                                    {/if}
                                    </td>
                                </tr>
                                {/foreach}
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