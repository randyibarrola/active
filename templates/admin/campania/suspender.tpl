{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/campania-suspender.js"></script>
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
                    <h3 class="page-title">Campa&ntilde;a					
                        <small>Suspender campa&ntilde;a</small>
                    </h3>
                    
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
                            
                            <div class="caption"><i class="fa fa-reorder"></i>{$campania->nombre}</div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="horizontal-form" id="suspenderCampaniaFrm">
                                <div class="form-body">
                                    <h3 class="form-section">Datos de la Campa&ntilde;a</h3>
                                    
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Nombre:</label>
                                            <label class="col-md-4" id="labelNombre">{$campania->nombre}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Localizador:</label>
                                            <label class="col-md-4">{$campania->localizador}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                    
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Empresa Distribuidor:</label>
                                            <label class="col-md-4" id="labelDistribuidora">{$campania->empresaDistribuidora->nombreComercial}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Empresa Cliente:</label>
                                            <label class="col-md-4" id="labelCliente">{$campania->empresa->nombreComercial}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                    
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Hotel:</label>
                                            <label class="col-md-4" id="labelNombreHotel">{$campania->nombreHotel}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Desde:</label>
                                            <label class="col-md-4" id="labelInicio">{$campania->inicio|date_format:"%d-%m-%Y"}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">Hasta:</label>
                                            <label class="col-md-4" id="labelFin">{$campania->fin|date_format:"%d-%m-%Y"}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group alert alert-danger">
                                            <div class="form-group terms info">
                                                <p><label>Al suspender su campa&ntilde;a se le aplicar&aacute; una penalizaci&oacute;n de 120,00 &euro;.<label></p>
                                                
                                            </div>
                                            <div class="form-group">
                                                <input type="checkbox" id="ap" class="validate[required]"><label>Acepto penalizaci&oacute;n</label>
                                            </div>
                                        </div>       
                                    
                                   
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <input type="hidden" name="action" value="suspender">
                                            
                                            <input type="hidden" name="idCampania" value="{$campania->id}">
                                            
                                            <input type="submit" class="btn btn-success pull-right" value="Suspender">
                                        </div>
                                        <div class="col-md-6 ">
                                            <a class="btn btn-default" href="{$base_url}/admin-campania-lista{$end_url}" >Cancelar</a>
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