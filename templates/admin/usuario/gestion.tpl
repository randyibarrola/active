{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/usuario-gestion.js"></script>
{/block}

{block name="style" append}
    
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
                    <h3 class="page-title">Hoteles					
                        <small>Gestión de Usuarios</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-usuario-lista{$end_url}">Usuarios</a>

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
                            {$show_title = ($edit) ? $usuario->nombre : 'Nuevo Usuario'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="usuarioFrm">
                                <div class="form-body">
                                    <h3 class="form-section">Datos del Usuario</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" name="nombre" id="nombre" class="form-control validate[required]" placeholder="Nombre" value="{$usuario->nombre}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Apellido</label>
                                                    <input type="text" name="apellido" id="apellido" class="form-control validate[required]" placeholder="Apellido" value="{$usuario->apellido}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Correo Electr&oacute;nico</label>
                                                    <input autocomplete="off" type="text" name="email" id="email" class="form-control validate[required, custom[email]]" placeholder="Correo Electr&oacute;nico" value="{$usuario->email}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Contraseña</label>
                                                    <input autocomplete="off" type="password" name="password" id="password" class="form-control" value="{$usuario->password}" placeholder="Contraseña">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Tel&eacute;fono</label>
                                                    <input type="text" name="telefono" id="telefono" class="form-control " placeholder="Tel&eacute;fono" value="{$usuario->telefono}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Estado</label>
                                                    <div>
                                                        <label class="radio-inline">
                                                          <input type="radio" id="estado_activo" name="status" value="activo"  {if $usuario->estado ne 'inactivo'}checked{/if}> Activo
                                                        </label>
                                                        <label class="radio-inline">
                                                          <input type="radio" id="estado_inactivo" name="status" value="inactivo" {if $usuario->estado eq 'inactivo'}checked{/if}> Inactivo
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                                        <div class="delimiter"></div>
                                        </div>
                                                                            
                                    </div> 
                                    <h3 class="form-section">Dirección</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Descripción</label>
                                                <input type="text" name="descripcion" id="geocomplete" class="form-control" placeholder="Descripción"  {if $edit}value="{$usuario->direccion->descripcion}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Calle</label>
                                                <input type="text" name="calle" id="direccion_calle" class="form-control" placeholder="Calle"  {if $edit}value="{$usuario->direccion->calle}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Código postal</label>
                                                <input type="text" name="codigoPostal" id="direccion_cp" class="form-control" placeholder="Código postal"  {if $edit}value="{$usuario->direccion->codigoPostal}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Pa&iacute;s</label>
                                                <select name="paisId" id="direccion_pais" class="form-control" placeholder="Pais">
                                                    {foreach from=$paises item=pais}
                                                        <option value="{$pais->id}" {if ($edit && $pais->id eq $usuario->paisId) || (!$usuario->paisId && $pais->id eq 724)}selected{/if}>{$pais->nombre}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                    {if ($logged_user->usuarioGrupoId eq 3 || $logged_user->usuarioGrupoId eq 1) && count($empresas) > 0}
                                    <h3 class="form-section">Asignar empresas</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                            <table class="table table-striped table-bordered table-hover" id="table_empresas">
                                                <thead>
                                                    <tr>
                                                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#table_empresas .checkboxes" /></th>
                                                        <th>Nombre Comercial</th>  
                                                        <th>Correo Electr&oacute;nico</th> 
                                                        <th>Teléfono</th> 
                                                        <th>Tipo</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {foreach from=$empresas item=e}
                                                    <tr class="odd gradeX">
                                                        <td><input type="checkbox" name="empresas[]" class="checkboxes" value="{$e->id}" {if $e->selected}checked{/if} /></td>
                                                        <td>{$e->nombreComercial}</td>
                                                        <td>{$e->emailReservas}</td>
                                                        <td>{$e->telefonoReservas}</td>
                                                        <td>{if $e->empresaTipoId eq 1}Distribuidor{else}Cliente{/if}</td>
                                                        
                                                    </tr>
                                                    {/foreach}
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                    </div>
                                    {/if}
                                   
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit}
                                                <input type="hidden" name="idUsuario" value="{$usuario->id}">
                                                <input type="hidden" name="usuarioGrupoId" value="{$usuario->usuarioGrupoId}">
                                            {else}
                                                <input type="hidden" name="usuarioGrupoId" value="3">
                                            {/if}
                                            <input type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-usuario-lista{$end_url}" >Cancelar</a>
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

{/block}