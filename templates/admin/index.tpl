<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="shortcut icon" href="ico/favicon.png">-->

    <title>Admin</title>
    {block "style"}
      <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="{$template_url}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/select2/select2_metro.css" />
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
        <link rel="stylesheet" href="{$template_url}/admin/assets/plugins/data-tables/DT_bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
        <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-datepicker/css/datepicker.css" />
	    <link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/bootstrap-timepicker/compiled/timepicker.css" />
        <link href="{$template_url}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
        />
        <link href="{$template_url}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	    <link href="{$template_url}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
        <link href="{$template_url}/admin/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
	    <link href="{$template_url}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/toastr.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/print.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->

        <!-- END PAGE LEVEL STYLES -->
        <link rel="shortcut icon" href="favicon.ico" />
    {/block}

    {block "script"}
        <script type="text/javascript">
          var BASE_URL = "{$base_url}";
          var END_URL = "{$end_url}";
          var SISTEMA_NOMBRE_WEB = "{#sistema_nombre_web#}";
        </script>
        
        <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-47599454-40']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
        </script>

        <script src="{$template_url}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>     
    <script src="{$template_url}/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap/js/bootstrap2-typeahead.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
    <script src="{$template_url}/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="{$template_url}/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
        
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/fuelux/js/spinner.min.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/ckeditor/ckeditor.js"></script> 
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> 
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/data-tables/DT_bootstrap.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
        
    <script src="{$template_url}/admin/assets/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-markdown/lib/markdown.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript" ></script>
    <script src="{$template_url}/admin/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript" ></script>
        <script src="{$template_url}/admin/assets/plugins/dropzone/dropzone.js"></script>
        
    <script src="{$template_url}/admin/assets/scripts/app.js"></script>
    <script src="{$template_url}/admin/assets/scripts/form-components.js"></script>  
    <script src="{$template_url}/admin/assets/scripts/table-managed.js"></script>
    <script src="{$template_url}/admin/assets/scripts/form-dropzone.js"></script>
    
    <script src="{$template_url}/js/admin/main.js"></script> 
    <script src="{$template_url}/js/toastr.js"></script>  
    <script src="{$template_url}/js/jquery.validationEngine.js"></script>
    <script src="{$template_url}/js/jquery.validationEngine-es.js"></script>
        <script>
            jQuery(document).ready(function() {
                App.init();
                //FormComponents.init();
                TableManaged.init();
                FormDropzone.init();
            });
        </script>
        
    {/block}
  </head>
  <body class="page-header-fixed page-sidebar-closed">
      <div id="blocker">
           <div>Cargando...</div>
       </div>
    {include file="admin/header.tpl"}
    <div class="clearfix"></div>
    
    <div class="page-container">
      
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar navbar-collapse collapse">
                <!-- BEGIN SIDEBAR MENU -->        	
                <ul class="page-sidebar-menu">
                <li class="sidebar-toggler-wrapper">
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                    <div class="sidebar-toggler hidden-phone">
                    </div>
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                </li>
                    
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-reserva-lista{$end_url}">
                            <i class="fa fa-copy"></i>
                            <span class="title">Reservas</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-hotel-lista{$end_url}">
                            <i class="fa fa-home"></i>
                            <span class="title">Hoteles</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 2}
                    <li class="start ">
                        <a href="{$base_url}/admin-campania-lista{$end_url}">
                            <i class="fa fa-file-text"></i>
                            <span class="title">Campa&ntilde;as</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-contrato-lista{$end_url}">
                            <i class="fa fa-file-text"></i>
                            <span class="title">Contratos</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-empresa-lista{$end_url}">
                            <i class="fa fa-building-o"></i>
                            <span class="title">Empresas</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-evento-lista{$end_url}">
                            <i class="fa fa-calendar"></i>
                            <span class="title">Eventos</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-factura-lista{$end_url}">
                            <i class="fa fa-check-circle"></i>
                            <span class="title">Facturas</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-adword-lista{$end_url}">
                            <i class="fa fa-info-circle"></i>
                            <span class="title">Adwords</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-configuracion-lista{$end_url}">
                            <i class="fa fa-adjust"></i>
                            <span class="title">Configuraci&oacute;n</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-idioma-gestion{$end_url}">
                            <i class="fa fa-flag"></i>
                            <span class="title">Traducciones</span>
                        </a>
                    </li>
                    {/if}                    
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-seo-lista{$end_url}">
                            <i class="fa fa-laptop"></i>
                            <span class="title">SEO</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-destino-lista{$end_url}">
                            <i class="fa fa-globe"></i>
                            <span class="title">Destinos Turísticos</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-usuario-lista{$end_url}">
                            <i class="fa fa-user"></i>
                            <span class="title">Usuarios</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-afiliado-lista{$end_url}">
                            <i class="fa fa-child"></i>
                            <span class="title">Afiliados</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-condicion-lista{$end_url}">
                            <i class="fa fa-archive"></i>
                            <span class="title">Condiciones</span>
                        </a>
                    </li>
                    {/if}
                    
                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-blacklist-lista{$end_url}">
                            <i class="fa fa-warning"></i>
                            <span class="title">Lista negra</span>
                        </a>
                    </li>
                    {/if}

                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-reporte-disponibilidad{$end_url}">
                            <i class="fa fa-bar-chart-o"></i>
                            <span class="title">Reportes</span>
                        </a>
                    </li>
                    {/if}

                    {if $logged_user->usuarioGrupoId eq 1 || $logged_user->usuarioGrupoId eq 3}
                    <li class="start ">
                        <a href="{$base_url}/admin-faq-gestion{$end_url}">
                            <i class="fa fa-question"></i>
                            <span class="title">FAQ's</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 5}
                    <li class="start ">
                        <a href="{$base_url}/admin-widget-lista{$end_url}">
                            <i class="fa fa-link"></i>
                            <span class="title">Widgets</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 5}
                    <li class="start ">
                        <a href="{$base_url}/admin-widget-enlaces{$end_url}">
                            <i class="fa fa-list-ol"></i>
                            <span class="title">Enlaces</span>
                        </a>
                    </li>
                    {/if}
                    {if $logged_user->usuarioGrupoId eq 5}
                    <li class="start ">
                        <a href="{$base_url}/admin-ganancia-lista{$end_url}">
                            <i class="fa fa-money"></i>
                            <span class="title">Ganancias</span>
                        </a>
                    </li>
                    {/if}
                    
                </ul>
                <!-- END SIDEBAR MENU -->
            </div>
            <!-- END SIDEBAR -->
          
            {block "main_content"}{/block}
    </div> 
    {include file="admin/footer.tpl"}
  </body>
</html>