<!DOCTYPE html>
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>{#sistema_nombre#}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->   
	{block "style"}       
	<link href="{$template_url}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="https://fonts.googleapis.com/css?family=Ubuntu+Condensed|Open+Sans:400,700" rel="stylesheet" type="text/css">
	<link href="{$template_url}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="{$template_url}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/toastr.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/animate.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="{$template_url}/css/validationEngine.jquery.css" />
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES --> 
	<link rel="stylesheet" type="text/css" href="{$template_url}/admin/assets/plugins/select2/select2_metro.css" />
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME STYLES --> 
	<link href="{$template_url}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="{$template_url}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="{$template_url}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="{$template_url}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="{$template_url}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="{$template_url}/admin/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
	<link href="{$template_url}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	{/block}
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
  <div id="blocker">
            <div class="bubblingG">
            <span id="bubblingG_1">
            </span>
            <span id="bubblingG_2">
            </span>
            <span id="bubblingG_3">
            </span>
            </div>
        </div>
	<div class="wrapper">
        <header class="hidden-print">
		<div class="pull-left">
			<div class="logo">
		<a href="{$base_url}"><img src="{$template_url}/images/logo.png" alt="" />
		<span>{#sistema_nombre#}</span></a>
	</div>
		</div>
		<div class="pull-right">
			<a class="pull-right contacto_modal" href="javascript:void(0)">Contactar</a>
			<a class="pull-right recuperar_reserva_modal" href="javascript:void(0)">Recuperar reserva</a>
                        <a class="pull-right inicio" href="{$base_url}/admin-login">Ingresar</a>
		</div>
	</header>
      
	<!-- BEGIN LOGO -->
	
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->

	<div class="content_wrapper">
	{block "main_content"}    
        {/block}
	</div>
</div>
        <footer class="hidden-print">
		<!--<p><strong>¿Aun te queda cupo?, a que esperas?</strong><br />
Registrate y arma <strong>tu promoción en solo 2 minutos</strong>, danos tu mejor oferta y atrevete a probar la forma mas rápida y discreta de vender el cupo que te sobra!</p>-->
<p class="copy">{#sistema_nombre#} system: {#empresa_nombre#} con CIF {#empresa_cif#} y con domicilio social en {#empresa_direccion#}. Contacto: {#empresa_contacto#}</p>

	<ul class="enlaces">
            <a class="privacidad_link" href="javascript:void(0)"><li>POLÍTICA DE PRIVACIDAD</li></a>
            <a class="cookies_link" href="javascript:void(0)"><li>POLÍTICA DE COOKIES</li></a>
	</ul>
	</footer>
	<!-- BEGIN CORE PLUGINS -->   
	<!--[if lt IE 9]>
	<script src="assets/plugins/respond.min.js"></script>
	<script src="assets/plugins/excanvas.min.js"></script> 
	<![endif]-->
        {block "script"}
	<script type="text/javascript">
      var BASE_URL = "{$base_url}";
      var END_URL = "{$end_url}";
      var TEMPLATE_URL = "{$template_url}";
    </script>
	<script src="{$template_url}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="{$template_url}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="{$template_url}/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="{$template_url}/admin/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<script src="{$template_url}/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="{$template_url}/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="{$template_url}/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="{$template_url}/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
        <script src="{$template_url}/js/toastr.js" type="text/javascript" ></script>
        <script src="{$template_url}/js/jquery.validationEngine-es.js"></script>
        <script src="{$template_url}/js/jquery.validationEngine.js"></script>
        
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="{$template_url}/admin/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
	{if !$print}
        <script src="{$template_url}/admin/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        {/if}
	<script type="text/javascript" src="{$template_url}/admin/assets/plugins/select2/select2.min.js"></script>
        <script type="text/javascript" src="{$template_url}/admin/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="{$template_url}/admin/assets/scripts/app.js" type="text/javascript"></script>
	<script src="{$template_url}/admin/assets/scripts/login-soft.js" type="text/javascript"></script>      
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script>
		jQuery(document).ready(function() {     
		  App.init();
		  Login.init();
		});
                
                {if $msg}var msg = '{$msg}';{else}var msg = false;{/if}
                
	</script>
        {/block}
	<!-- END JAVASCRIPTS -->
        <div class="modal fade" id="ley_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#ley_proteccion_datos#}</h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:ley/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>
                        
        <div class="modal fade" id="terminos_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#terminos_y_condiciones#}</h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:terminos/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>
                        
        <div class="modal fade" id="privacidad_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#politica_privacidad#}</h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:privacidad/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>
                    
        <div class="modal fade" id="cookies_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">{#politica_de_cookies#}</h4>
                    </div>
                    <div class="modal-body">

                    </div>
                    <div class="modal-footer">
                        <a href="{$base_url}/ajax-popup/id:cookies/print:1" class="btn btn-success" target="_blank">{#imprimir#}</a>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="contacto_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Contáctanos</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                          <address>
                              <strong>Email:</strong>
                              <a href="mailto:{#empresa_contacto#}">{#empresa_contacto#}</a><br />
                              <strong>Teléfono:</strong>
                              <span>{#empresa_telefono_1#}</span><br />
                              <strong style="width: 65px;
height: 20px;
display: block;
float: left;clear:both;">&nbsp;</strong>
                              <span>{#empresa_telefono_2#}</span><br />
                              <strong  style="width: 65px;
height: 20px;
display: block;
float: left;clear:both;">&nbsp;</strong>
                              <span>{#empresa_telefono_3#}</span>
                            </address>
                          <form id="contact-form">
                              <div class="row-fluid">
                                  <div class="row">
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <input class="form-control validate[required]" type="text" name="nombre" placeholder="Nombre completo">
                                    </div>
                                  </div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <input class="form-control validate[required, custom[email]]" type="text" name="email" placeholder="Correo electrónico">
                                    </div>
                                  </div>
                                  </div>
                                  <div class="row">
                                  <div class="col-md-12">
                                    <div class="form-group">
                                      <textarea rows="5" class="form-control validate[required]" name="mensaje" placeholder="Mensaje"></textarea>
                                    </div>
                                    <input type="submit" class="btn btn-success pull-right" value="Enviar">
                                  </div>
                                  </div>
                              </div>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="recuperar_reserva_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Recupera tu reserva</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                      <form id="recover-form">
                          <div class="row-fluid">
                              <div class="row">
                                  <div class="col-md-12">
                                    <div class="form-group">
                                      <input class="form-control validate[required, custom[email]]" type="text" name="email" placeholder="Correo electrónico">
                                    </div>
                                      <input type="hidden" name="action" value="recuperar">
                                    <input type="submit" class="btn btn-success pull-right" value="Enviar">
                                  </div>
                              </div>
                          </div>
                      </form>
                  </div>
                    </div>
                </div>
            </div>
        </div>
</body>
<!-- END BODY -->
</html>