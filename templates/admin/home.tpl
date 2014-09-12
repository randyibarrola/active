{extends file="admin/index.tpl"}

{block name="script" append}

{/block}

{block name="style" append}
    
{/block}

{block name="main_content" append}
  
<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar nav-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->        	
        <ul>
            <li class="start ">
                <a href="index.html">
                    <i class="icon-home"></i> 
                    <span class="title">Hoteles</span>
                </a>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <!-- BEGIN PAGE CONTAINER-->        
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <div class="row-fluid">
                <div class="span12">
                    
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="span6 responsive" data-tablet="span12 fix-offset" data-desktop="span6">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box grey">
                        <div class="portlet-title">
                            <div class="caption"><i class="icon-user"></i>Hoteles</div>
                            <div class="actions">
                                <a href="{$base_url}/admin-hotel-gestion{$end_url}" class="btn blue"><i class="fa fa-pencil"></i> Agregar</a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover" id="sample_2">
                                <thead>
                                    <tr>
                                        <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_2 .checkboxes" /></th>
                                        <th>Nombre</th>
                                        <th class="hidden-480">Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$hoteles item=hotel}
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="{$hotel->id}" /></td>
                                        <td>{$hotel->nombre}</td>
                                        <td><span class="label label-success">{$hotel->estado}</span></td>
                                    </tr>
                                    {/foreach}
                                </tbody>
                            </table>
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