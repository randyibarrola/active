{extends file="admin/index.tpl"}

{block name="script" append}
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script type="text/javascript" src="{$template_url}/js/jquery.geocomplete.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/empresa-gestion.js"></script>
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/admin/empresa-gestion.css" >
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
                        <small>Gestión de Empresas</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="{$base_url}/admin-empresa-lista{$end_url}">Empresas</a>

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
                            {$show_title = ($edit) ? $empresa->nombreFiscal : 'Nueva Empresa'}
                            <div class="caption"><i class="fa fa-reorder"></i>{$show_title}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="empresaFrm">
                                <div class="form-body">
                                    <!--<h3 class="form-section">Propietario</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <input type="text" id="propietario" autocomplete="off" class="form-control validate[required]" {if $edit && $propietario->usuarioId}value="{$propietario->usuarioId}"{/if}>
                                                <input type="hidden" id="propietario" name="usuarioId" {if $edit}value="{$propietario->usuarioId}"{/if}>
                                            </div>
                                        </div>
                                    </div>
                                    -->
                                    <h3 class="form-section">Datos de la Empresa</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre Comercial</label>
                                                    <input type="text" name="nombreComercial" id="nombre" class="form-control validate[required]" placeholder="Nombre Comercial" value="{$empresa->nombreComercial}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre Fiscal</label>
                                                    <input type="text" name="nombreFiscal" id="apellido" class="form-control validate[required]" placeholder="Nombre Fiscal" value="{$empresa->nombreFiscal}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">N&uacute;mero Fiscal</label>
                                                    <input type="text" name="numeroFiscal" id="email" class="form-control" placeholder="N&uacute;mero Fiscal" value="{$empresa->numeroFiscal}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Tel&eacute;fono de reservas</label>
                                                    <input type="text" name="telefonoReservas" id="telefono" class="form-control " placeholder="Tel&eacute;fono" value="{$empresa->telefonoReservas}">
                                                </div>
                                            </div>                                        
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Email de reservas</label>
                                                    <input type="text" name="emailReservas" id="email" class="form-control validate[required]" placeholder="Email(s)" value="{$empresa->emailReservas}">
                                                </div>
                                            </div>
                                            {if ($edit && $empresa->empresaTipoId eq 1) || (!$edit && ($usuario->usuarioGrupoId eq 1 || $usuario->usuarioGrupoId eq 3))}
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Porciento de beneficio</label>
                                                        <input type="text" name="porcentajeBeneficio" class="form-control validate[required, custom[number]]" placeholder="Beneficio" value="{$empresa->porcentajeBeneficio}">
                                                    </div>
                                                </div>
                                            <!--<div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Destino Tur&iacute;stico</label>
                                                    <input type="text" name="destinoTuristico" id="telefono" class="form-control " placeholder="Destino Tur&iacute;stico" value="{$empresa->destinoTuristico}">
                                                </div>
                                            </div>-->
                                            {else}
                                            <input type="hidden" name="porcentajeBeneficio" class="form-control" placeholder="Beneficio" value="0">
                                            {/if}            
                                        </div>
                                         <input type="hidden" name="empresaTipoId" value="{if $edit}{$empresa->empresaTipoId}{else}{if $usuario->usuarioGrupoId eq 1 || $usuario->usuarioGrupoId eq 3}1{else}2{/if}{/if}" />
                                        <!--<div class="row-fluid">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Tipo de empresa</label>
                                                    <select name="empresaTipoId" class="form-control">
                                                        {foreach from=$empresa_tipos item=tipo}
                                                            <option value="{$tipo->id}" {if $edit && $empresa->empresaTipoId == $tipo->id}selected{/if}>{$tipo->tipo}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                           
                                            <div class="col-md-6 {if $empresa->empresaTipoId ne 2}hidden{/if}" id="distribuidoras-container">
                                                <div class="form-group">
                                                    <label class="control-label">Empresa distribuidora</label>
                                                    <select name="empresaDistribuidoraId" class="form-control" {if $empresa->empresaTipoId ne 2}disabled=""{/if}>
                                                        <option value="0">Ninguna</option>
                                                        {foreach from=$distribuidoras item=dis}
                                                            {if !$edit || $dis->id ne $empresa->id }
                                                            <option value="{$dis->id}" {if $edit && $empresa->empresaDistribuidoraId == $dis->id}selected{/if}>{$dis->nombreComercial}</option>
                                                            {/if}
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>                                        
                                        </div>-->

                                    </div> 
                                                
                                    <h3 class="form-section">Persona de Contacto</h3>
                                    <div class="row row-hotel-content">
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" name="contactoNombre" id="nombre" class="form-control" placeholder="Nombre" value="{$empresa->contactoNombre}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Apellidos</label>
                                                    <input type="text" name="contactoApellidos" id="apellido" class="form-control" placeholder="Apellidos" value="{$empresa->contactoApellidos}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-fluid">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">DNI</label>
                                                    <input type="text" name="contactoDni" id="dni" class="form-control" placeholder="DNI" value="{$empresa->contactoDni}">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Email</label>
                                                    <input type="text" name="contactoEmail" id="email" class="form-control" placeholder="Email" value="{$empresa->contactoEmail}">
                                                </div>
                                            </div>
                                                                                    
                                        </div>
                                        
                                    </div>
                                                
                                    <h3 class="form-section">Dirección</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label">Descripción</label>
                                                <input type="text" name="descripcion" id="geocomplete" class="form-control" placeholder="Descripción"  {if $edit}value="{$empresa->direccion->descripcion}"{/if}>
                                            </div>
                                        </div>
                                        <!--<div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Calle</label>
                                                <input type="text" name="calle" id="direccion_calle" class="form-control" placeholder="Calle"  {if $edit}value="{$empresa->direccion->calle}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Código postal</label>
                                                <input type="text" name="codigoPostal" id="direccion_cp" class="form-control  validate[custom[integer]]" placeholder="Código postal"  {if $edit}value="{$empresa->direccion->codigoPostal}"{/if}>
                                            </div>
                                        </div>-->
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Latitud</label>
                                                <input type="text" name="lat" id="direccion_lat" class="form-control validate[custom[number]]" placeholder="Latitud"  {if $edit}value="{$empresa->direccion->lat}"{/if}>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">Longitud</label>
                                                <input type="text" name="lon" id="direccion_lon" class="form-control validate[custom[number]]" placeholder="Longitud" {if $edit}value="{$empresa->direccion->lon}"{/if}>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group" id="mapa">
                                            </div>
                                        </div> 
                                        <div style="clear: both"></div>
                                    </div>
                                   
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="update">
                                            {if $edit}
                                                <input type="hidden" name="idEmpresa" value="{$empresa->id}">
                                            {/if}
                                            <input type="submit" class="btn btn-success pull-right" value="Guardar">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-empresa-lista{$end_url}" >Cancelar</a>
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