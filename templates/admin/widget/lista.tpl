{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/widget-lista.js"></script>
{/block}

{block name="main_content" append}
<div class="page-content">
    <div class="row">
        <div class="col-md-12">
            <h3 class="page-title">Widgets                  
                <small>Lista de widgets</small>
            </h3>
            <ul class="breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">Inicio</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="#">Widgets</a>
                    <i class="icon-angle-right"></i>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet box grey">
                <div class="portlet-title">
                    <div class="caption"><i class="icon-user"></i>Widgets</div>
                    <div class="actions">
                        <a href="{$base_url}/admin-widget-gestion/id:{$afiliado->id}" class="btn blue"><i class="fa fa-pencil"></i> Agregar</a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-striped table-bordered table-hover" id="table_widgets">
                        <thead>
                            <tr>
                                <th>Nombre</th>  
                                <th>Tipo</th> 
                                <th class="acciones-th">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$widgets item=widget}
                            <tr class="odd gradeX">
                                <td>
                                    <span>{$widget->nombre}</span>
                                </td>
                                <td>
                                    <span>{$widget->tipo}</span>
                                </td>
                                <td class="centered">
                                    <a href="{$base_url}/admin-widget-ver/id:{$widget->id}"><span class="fa fa-eye"></span></a>
                                    <a widget-id="{$widget->id}" class="delete" href="#"><span class="fa fa-trash-o"></span></a>
                                </td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
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