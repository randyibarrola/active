{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/idioma-gestion.js"></script>
    <script>
        var CONFIG = {json_encode($config)};
        var USUARIO_TIPO = '{$usuario->usuarioGrupoId}';
    </script>
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
                <h3 class="page-title">Idiomas					
                    <small>Traducciones</small>
                </h3>
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">Inicio</a> 

                        <i class="icon-angle-right"></i>
                    </li>
                    <!--<li>
                        <a href="#">Campa&ntilde;as</a>

                        <i class="icon-angle-right"></i>
                    </li>-->
                    <li><a href="#">Idiomas</a></li>
                    

                </ul>
                <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <form class="form" id="frmTraducciones">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Seleccione el Idioma</label>
                    <div class="row-fluid">
                        <div class="col-xs-9 no-padding">
                        <select id="idioma" class="form-control" name="idioma">
                            {foreach from=$idiomas item=i}

                                <option value="{$i->codigo}">{$i->nombre}</option>

                            {/foreach}
                        </select>
                        </div>
                        <div class="col-xs-3">
                            <a href="" class="btn btn-success hidden" id="addIdiomaBtn">Agregar traducción</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            
            <div class="clearfix"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet box grey">
                    <div class="portlet-title">
                        <div class="caption"><i class="icon-user"></i>Traducciones</div>
                        <div class="actions">
                           <!-- <a href="javascript:void(0)" class="btn blue"><i class="fa fa-pencil"></i> Agregar palabra</a>-->
                        </div>
                    </div>
                    
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover" id="table_traducciones">
                            <thead>
                                <tr>
                                    <!--<th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#table_campanias .checkboxes" /></th>-->
                                    <th style="width: 20%;">Key</th>
                                    <th style="width: 25%;">Palabra</th>
                                    <th>Traducci&oacute;n</th>               
                                    
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$config.es item=p key=k}
                                    <tr>
                                        <td>{$k}</td>
                                        <td>{$p}</td>
                                        <td><textarea class="form-control" name="traducciones[{$k}]">{$config[$idiomas[0]->codigo][$k]}</textarea></td>
                                        {if $usuario->usuarioGrupoId eq 1}
                                        <td><a class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a></td>
                                        {/if}
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END EXAMPLE TABLE PORTLET-->
            </div>

        </div>
        <div class="row">
                <div class="col-md-12 centered">
                    <input type="hidden" name="action" value="update">
                    
                    <input type="submit" class="btn btn-success" value="Guardar">
                
                </div>
            </div>
        </form>

    <!-- END PAGE CONTENT-->
</div>
<!-- END PAGE CONTAINER-->

<div class="modal fade" id="addIdioma_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Agregar idioma</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Seleccione el idioma que desea agregar</label>
                    <select name="idioma" class="form-control">
                        {foreach from=$languages item=l}
                            <option value="{$l->codigo}">{$l->nombre}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"  id="aceptarEliminar">{#aceptar#}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>

{/block}