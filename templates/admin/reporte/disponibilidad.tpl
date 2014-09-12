{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/disponibilidad-lista.js"></script>
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
                <h3 class="page-title">Reporte					
                    <small>Búsquedas de disponibilidad</small>
                </h3>
                <!--
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="{$base_url}/admin-empresa-lista{$end_url}">Inicio</a> 

                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">Empresas</a>

                        <i class="icon-angle-right"></i>
                    </li>
                    <li><a href="#">Listado</a></li>


                </ul>-->
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
                        <div class="caption"><i class="icon-user"></i>Listado de búsquedas de disponibilidad</div>
                        
                    </div>
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_busquedas">
                            <thead>
                                <tr>
                                    <th>Hotel</th> 
                                    <th>Fecha</th>
                                    <th>Desde</th> 
                                    <th>Hasta</th>
                                    <th class="acciones-th"></th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$empresas item=empresa}
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="{$empresa->id}" /></td>
                                    <td><input type="text" name="edit[{$empresa->id}][nombreFiscal]" value="{$empresa->nombreFiscal}"></td>
                                    <td>{$empresa->tipo->tipo}</td>
                                    <td>{$empresa->contactoNombre} {$empresa->contactoApellidos} ({$empresa->contactoEmail})</td>
                                    
                                    <td><input type="text" name="edit[{$empresa->id}][telefonoReservas]" value="{$empresa->telefonoReservas}"></td>
                                    
                                    <td class="acciones-td">
                                        <a href="{$base_url}/admin-empresa-gestion/id:{$empresa->id}{$end_url}"><span class="fa fa-pencil"></span>
                                        {if $logged_user->usuarioGrupoId ne 2}
                                        </a><a empresa-id="{$empresa->id}" class="delete" href="#"><span class="fa fa-trash-o"></span></a>
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