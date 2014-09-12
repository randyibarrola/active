{extends file="admin/index.tpl"}

{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/admin/faq.js"></script>
{/block}

{block name="style" append}
    <!--<link rel="stylesheet" href="{$template_url}/css/admin/uniform.css">-->
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
                    <h3 class="page-title">FAQ					
                        <small>Preguntas frecuentes</small>
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="{$base_url}/admin-home{$end_url}">Inicio</a> 

                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="#">FAQ</a>

                            <i class="icon-angle-right"></i>
                        </li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption"><i class="fa fa-reorder"></i>Preguntas frecuentes</div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <div class="form-body">
                                <form action="#" class="horizontal-form" id="hotelFrm1">
                                <div class="row row-hotel-content">
                                    <div class="row-fluid">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Idioma</label>
                                                <select id="idiomaSelect" class="form-control validate[required]"> 
                                                    {foreach from=$idiomas item=idioma}
                                                        <option value="{$idioma->codigo}">{$idioma->nombre}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>                                        
                                </div>
                                </form>
                            </div>
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