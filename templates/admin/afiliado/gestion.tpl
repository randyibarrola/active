{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/afiliado-gestion.js"></script>
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
                    <h3 class="page-title">Afiliados					
                        <small>Gestión de Afiliados</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-afiliado-lista{$end_url}">Afiliados</a>

                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="javascript:void(0)">Gestión</a></li>


                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12 responsive" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            {$show_title = ($edit) ? $afiliado->usuario->nombre : 'Nuevo Afiliado'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="afiliadoForm">
                                <div class="form-body">
                                    <h3 class="form-section">Datos del Afiliado</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" name="nombre" id="nombre" class="form-control validate[required]" placeholder="Nombre" value="{$afiliado->usuario->nombre}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Apellido</label>
                                                    <input type="text" name="apellido" id="apellido" class="form-control validate[required]" placeholder="Apellido" value="{$afiliado->usuario->apellido}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Correo Electr&oacute;nico</label>
                                                    <input autocomplete="off" type="text" name="email" id="email" class="form-control validate[required, custom[email]]" placeholder="email@midominio.com" value="{$afiliado->usuario->email}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Contraseña</label>
                                                    <input autocomplete="off" type="password" name="password" id="password" class="form-control" value="{$afiliado->usuario->password}" placeholder="Contraseña">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Tel&eacute;fono</label>
                                                    <input type="text" name="telefono" id="telefono" class="form-control " placeholder="(99) 999 999 999" value="{$afiliado->usuario->telefono}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre comercial</label>
                                                    <input type="text" name="nombreComercial" class="form-control" placeholder="Blog turístico" value="{$afiliado->nombreComercial}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Web</label>
                                                    <input type="text" name="web" class="form-control" placeholder="www.midominio.com" value="{$afiliado->web}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Porcentaje de comisión para hoteles</label>
                                                    <input type="text" name="comisionHotel" class="form-control" placeholder="XX" value="{$afiliado->comisionHotel}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Porcentaje de comisión para productos</label>
                                                    <input type="text" name="comisionEvento" class="form-control" placeholder="XX" value="{$afiliado->comisionEvento}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Idioma</label>
                                                    <select name="idiomaId" class="form-control">
                                                        {foreach from=$idiomas item=idioma}
                                                            <option {if $idioma->default}selected="selected"{/if} value="{$idioma->id}" {if $afiliado->idiomaId eq $idioma->id}selected{/if}>{$idioma->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Moneda</label>
                                                    <select name="monedaId" class="form-control">
                                                        {foreach from=$monedas item=moneda}
                                                            <option {if $moneda->default}selected="selected"{/if} value="{$moneda->id}" {if $afiliado->cuenta->monedaId eq $moneda->id}selected{/if}>{$moneda->nombre} ({$moneda->codigo})</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="control-label">Estado</label>
                                                    <div>
                                                        <label class="radio-inline">
                                                          <input type="radio" id="estado_activo" name="status" value="activo"  {if $afiliado->usuario->estado ne 'inactivo'}checked{/if}> Activo
                                                        </label>
                                                        <label class="radio-inline">
                                                          <input type="radio" id="estado_inactivo" name="status" value="inactivo" {if $afiliado->usuario->estado eq 'inactivo'}checked{/if}> Inactivo
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="delimiter"></div>
                                        </div>
                                                                            
                                    </div> 
                                    <h3 class="form-section">Detalles de cuenta</h3>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Nombre del banco</label>
                                                <input type="text" name="cuenta[bancoNombre]" class="form-control" placeholder="Nombre del banco"  {if $edit}value="{$afiliado->cuenta->bancoNombre}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Sucursal</label>
                                                <input type="text" name="cuenta[bancoSucursal]" class="form-control" placeholder="Sucursal"  {if $edit}value="{$afiliado->cuenta->bancoSucursal}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Dirección de la sucursal</label>
                                                <input type="text" name="cuenta[direccion][descripcion]" class="form-control" placeholder="Dirección de la sucursal"  {if $edit}value="{$afiliado->cuenta->direccion->descripcion}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Pa&iacute;s</label>
                                                <select name="cuenta[paisId]" id="direccion_pais" class="form-control" placeholder="Pais">
                                                    {foreach from=$paises item=pais}
                                                        <option value="{$pais->id}" {if ($edit && $pais->id eq $afiliado->paisId) || (!$afiliado->cuenta->paisId && $pais->id eq 724)}selected{/if}>{$pais->nombre}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Ciudad</label>
                                                <input type="text" name="cuenta[direccion][ciudad]" class="form-control" placeholder="Ciudad"  {if $edit}value="{$afiliado->cuenta->direccion->ciudad}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Estado</label>
                                                <input type="text" name="cuenta[direccion][estado]" class="form-control" placeholder="Estado"  {if $edit}value="{$afiliado->cuenta->direccion->estado}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Código postal</label>
                                                <input type="text" name="cuenta[direccion][codigoPostal]" id="direccion_cp" class="form-control" placeholder="Código postal"  {if $edit}value="{$afiliado->cuenta->direccion->codigoPostal}"{/if}>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Titular de la cuenta</label>
                                                <input type="text" name="cuenta[nombre]" class="form-control" placeholder="Titular de la cuenta"  {if $edit}value="{$afiliado->cuenta->nombre}"{/if}>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Swift</label>
                                                <input type="text" name="cuenta[swift]" class="form-control" placeholder="Titular de la cuenta"  {if $edit}value="{$afiliado->cuenta->swift}"{/if}>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Número de cuenta</label>
                                                <input type="text" name="cuenta[numero]" class="form-control" placeholder="Número de cuenta"  {if $edit}value="{$afiliado->cuenta->numero}"{/if}>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">IBAN</label>
                                                <input type="text" name="cuenta[iban]" class="form-control" placeholder="Número IBAN"  {if $edit}value="{$afiliado->cuenta->iban}"{/if}>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Comentarios</label>
                                                <input type="text" name="cuenta[comentarios]" class="form-control" placeholder="Comentarios"  {if $edit}value="{$afiliado->cuenta->comentarios}"{/if}>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    {if ($logged_user->usuarioGrupoId eq 3 || $logged_user->usuarioGrupoId eq 1) && count($hoteles) > 0}
                                    <h3 class="form-section">Asignar hoteles</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                            <table class="table table-striped table-bordered table-hover" id="table_hoteles">
                                                <thead>
                                                    <tr>
                                                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#table_hoteles .checkboxes" /></th>
                                                        <th>Nombre</th>
                                                        <th>Vigencia de contrato</th>
                                                        <th>Email de reservas</th>
                                                        <th>Teléfono de reservas</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {foreach from=$hoteles item=e}
                                                    <tr class="odd gradeX">
                                                        <td><input type="checkbox" name="hoteles[]" class="checkboxes" value="{$e->id}" {if $e->selected}checked{/if} /></td>
                                                        <td>{$e->nombre}</td>
                                                        <td>
                                                            <span class="label label-info">{$e->campania->inicio|date_format:"%e/%m/%Y"} - {$e->campania->fin|date_format:"%e/%m/%Y"}</span>
                                                        </td>
                                                        <td><span>{$e->emailReservas}</span></td>
                                                        <td><span>{$e->telefonoReservas}</span></td>
                                                        
                                                    </tr>
                                                    {/foreach}
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                    </div>
                                    {/if}

                                    {if count($productos) > 0}
                                    <h3 class="form-section">Asignar productos</h3>
                                    <div class="row">
                                        <div class="row-fluid">
                                            <div class="col-md-12">
                                            <table class="table table-striped table-bordered table-hover" id="table_productos">
                                                <thead>
                                                    <tr>
                                                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#table_productos .checkboxes" /></th>
                                                        <th>Nombre</th> 
                                                        <th>Localizador del contrato</th>
                                                        <th>Vigencia del contrato</th>
                                                        <th>Email de reservas</th>
                                                        <th>Teléfono de reservas</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {foreach from=$productos item=e}
                                                    <tr class="odd gradeX">
                                                        <td><input type="checkbox" name="productos[]" class="checkboxes" value="{$e->id}" {if $e->selected}checked{/if} /></td>
                                                        <td><span>{$e->nombre}</span></td>
                                                        <td><span class="label label-info">{$e->campania->localizador}</span></td>
                                                        <td><span class="label label-info">{$e->campania->inicio|date_format:"%e/%m/%Y"} - {$e->campania->fin|date_format:"%e/%m/%Y"}</span></td>
                                                        <td><span>{$e->emailReservas}</span></td>
                                                        <td><span>{$e->telefonoReservas}</span></td>
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
                                            <input type="hidden" name="tipo" value="afiliado">
                                            {if $edit}
                                                <input type="hidden" name="idUsuario" value="{$afiliado->usuario->id}">
                                                <input type="hidden" name="idAfiliado" value="{$afiliado->id}">
                                                <input type="hidden" name="cuenta[direccionId]" value="{$afiliado->cuenta->direccionId}">
                                                <input type="hidden" name="cuenta[id]" value="{$afiliado->cuenta->id}">
                                                <input type="hidden" name="cuenta[usuarioId]" value="{$afiliado->cuenta->usuarioId}">
                                                <input type="hidden" name="usuarioGrupoId" value="5">
                                            {else}
                                                <input type="hidden" name="usuarioGrupoId" value="5">
                                            {/if}
                                            <input type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6">
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