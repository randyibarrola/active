<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="shortcut icon" href="ico/favicon.png">-->

    <title>{$campania->nombre}</title>
    
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
        <link href="{$template_url}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	    <link href="{$template_url}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
        <link href="{$template_url}/admin/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
	    <link href="{$template_url}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
            
        <link href="{$template_url}/css/toastr.css" rel="stylesheet" type="text/css"/>
        <link href="{$template_url}/css/validationEngine.jquery.css" rel="stylesheet" type="text/css"/>
        
        <link href="{$template_url}/css/print.css" rel="stylesheet" type="text/css"/>
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->

        <!-- END PAGE LEVEL STYLES -->
        <link rel="shortcut icon" href="favicon.ico" />
    

    
        <script type="text/javascript">
            window.print();
        </script>
        
  </head>
  <body class="page-header-fixed page-sidebar-closed" style="background-color: #fff !important; padding: 10px 20px !important;">
      

        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
        <!-- BEGIN PAGE CONTAINER-->        
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">
                <div class="col-xs-12 responsive" data-tablet="span12 fix-offset">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box">
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body ver-campania">
                                    <h4 class="form-section">Contrato con {$campania->empresaDistribuidora->nombreComercial}</h3>
                                    <h4 class="form-section">Campaña</h3>
                                    <div class="row-fluid">
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Nombre:</label>
                                            <label class="col-xs-6" id="labelNombre">{$campania->nombre}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Localizador:</label>
                                            <label class="col-xs-6">{$campania->localizador}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Hotel:</label>
                                            <label class="col-xs-6">{$campania->nombreHotel}</label>
                                            <div class="delimiter"></div>
                                            <!--
                                            <label class="control-label col-xs-6">Dominio oficial:</label>
                                            <label class="col-xs-4" id="labelSubdominio">{$campania->subdominio}</label>
                                            <div class="delimiter"></div>
                                            -->
                                        </div>
                                            <div class="delimiter"></div>
                                    </div>
                                    <h4 class="form-section">Datos del distribuidor</h3>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Nombre comercial:</label>
                                            <label class="col-xs-6" id="labelNombre">{$campania->empresaDistribuidora->nombreComercial}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Nombre fiscal:</label>
                                            <label class="col-xs-6" id="labelNombre">{$campania->empresaDistribuidora->nombreFiscal}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">CIF:</label>
                                            <label class="col-xs-6">{$campania->empresaDistribuidora->numeroFiscal}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Teléfono:</label>
                                            <label class="col-xs-6" id="labelNombre">{$campania->empresaDistribuidora->telefonoReservas}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Email:</label>
                                            <label class="col-xs-6">{$campania->empresaDistribuidora->emailReservas}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Contacto:</label>
                                            <label class="col-xs-6">{$campania->empresaDistribuidora->contactoNombre} {$campania->empresa->contactoApellidos}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                            <div class="delimiter"></div>
                                    </div>
                                    <h4 class="form-section">Datos de la empresa cliente</h3>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Nombre comercial:</label>
                                            <label class="col-xs-6" id="labelNombre">{$campania->empresa->nombreComercial}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Nombre fiscal:</label>
                                            <label class="col-xs-6" id="labelNombre">{$campania->empresa->nombreFiscal}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">CIF:</label>
                                            <label class="col-xs-6">{$campania->empresa->numeroFiscal}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Teléfono:</label>
                                            <label class="col-xs-6" id="labelNombre">{$campania->empresa->telefonoReservas}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Email:</label>
                                            <label class="col-xs-6">{$campania->empresa->emailReservas}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Contacto:</label>
                                            <label class="col-xs-6">{$campania->empresa->contactoNombre} {$campania->empresa->contactoApellidos}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                            <div class="delimiter"></div>
                                    </div>
                                     
                                        <h4 class="form-section">Contrato</h3>
                                        <div class="row-fluid">
                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Inicio:</label>
                                            <label class="col-xs-6" id="labelInicio">{$campania->inicio|date_format:"%d-%m-%Y"}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Fin:</label>
                                            <label class="col-xs-6" id="labelFin">{$campania->fin|date_format:"%d-%m-%Y"}</label>
                                            <div class="delimiter"></div>
                                        </div>

                                        <div class="form-group col-xs-6">
                                            <label class="control-label col-xs-6">Estancia mínima:</label>
                                            <label class="col-xs-6 estancia-minima">{$campania->estanciaMinima} día{if $campania->estanciaMinima > 1}s{/if}</label>
                                            <div class="delimiter"></div>
                                            <label class="control-label col-xs-6">Release:</label>
                                            <label class="col-xs-6 venta-anticipada">{$campania->ventaAnticipada} día{if $campania->estanciaMinima > 1}s{/if}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                            <div class="delimiter"></div>
                                        </div>
                                        <h4 class="form-section">Promociones</h4>
                                        <div id="periodos-resume-container">
                                            {foreach from=$campania->periodos item=periodo name=p}
                                                <div class="periodo-resume">
                                                    <div class="row-fluid">
                                                    <label class="promo">Promoción {$smarty.foreach.p.iteration}</label>
                                                    </div>
                                                    <div class="row-fluid periodo-resume">
                                                        <div class="form-group col-xs-6">
                                                            <label class="control-label col-xs-6">de {$periodo->inicio|date_format:"%d-%m-%Y"}</label>
                                                            <label class="col-xs-6 inicio">a {$periodo->fin|date_format:"%d-%m-%Y"}</label>
                                                            <div class="delimiter"></div>
                                                        </div>
                                                        
                                                        <div class="form-group col-xs-6">
                                                            <label class="control-label col-xs-6">Descuento:</label>
                                                            <label class="col-xs-6 descuento">{$periodo->descuentoBooking} {$periodo->tipoDescuento}</label>
                                                            <div class="delimiter"></div>
                                                        </div>
                                                            <div class="delimiter"></div>
                                                    </div>
                                                </div>
                                                <hr>
                                            {/foreach}
                                        </div>
                                         <div class="delimiter"></div>
                                        <h3 class="form-section">T&eacute;rminos del contrato</h3>
                                        <div class="row-fluid">
                                            <div class="form-group terms">
                                                <div dir="ltr"><p><b>Condiciones de Contratación de Campañas</b></p><p><b>1. Identificación de las Partes. Objeto y Duración&nbsp;</b></p><p>Las presentes Condiciones de Contratación, son suscritas:</p><p>De una parte por Booking DeTeatros S.L., (en adelante <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>), con domicilio social en Urbanización las Margaritas 43, 35660 Corralejo, (Fuerteventura-España) y CIF B76153725, registrado en el Registro Mercantil de Las Palmas, Tomo 159, Folio 84, Sección 8, H IFolio 7103, I/A 1ª, titular de la Página Web <a href="http://www.google.com/url?q=http%3A%2F%2Fwww.vikahotel.com%2F&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHkGNfgPKd_K3ww4FVYgK8ND2jx6w" target="_blank">http://www.Vikahotel.com</a>, (en adelante, la Página).</p><p>De otra parte, por el Hotel, conforme a los datos introducidos en el formulario de contratación de campaña de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> con el usuario previamente registrado para ello, con el fin de establecer una relación con <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> para la intermediación y promoción por parte de éste de reservas de servicios hoteleros del Hotel a través de Internet, así como la puesta a disposición de los clientes finales del Hotel de la reserva de otros servicios complementarios o paquetizados</p><p>El Hotel, al cumplimentar sus datos en el formulario de contratación de campaña y aceptar la casilla de verificación del consentimiento correspondiente a estas Condiciones de Contratación declara conocer y aceptar las características esenciales de la Página y las presentes Condiciones y someterse a las mismas, sin perjuicio de la aplicación de otras condiciones particulares vigentes entre las partes.&nbsp;</p><p><a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> pone a disposición del Hotel un servicio de atención de consultas a través del correo electrónico [<span>CORREO</span>] por el que el usuario podrá solicitar información.&nbsp;</p><p>El Hotel contrata los servicios de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> con la duración definida por el mismo en el formulario de Contratación de Campaña. Las Partes podrán resolver el Contrato en cualquier momento, y acuerdan comunicar tal voluntad con la antelación de un (1) mes, en consonancia con la buena fe contractual.</p><p><b>2. Qué es <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a></b></p><p>El principal servicio de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> es la intermediación del Hotel con los Usuarios de Internet, ofreciendo a éstos un sistema de reserva de servicios hoteleros por Internet fácil y sencillo, así como la promoción específica de campañas según las condiciones establecidas por el Hotel en el formulario de Contratación de Campañas (en adelante el Formulario).</p><p>Mediante el Formulario, el Hotel establece las condiciones básicas de las campañas, su duración y&nbsp; descuentos, siendo el mismo parte inseparable y esencial de las presentes condiciones de contratación, conocido y aceptado en su totalidad por el Hotel.</p><p>Además, <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> promocionará y gestionará la campaña mediante el uso de una página web exclusiva para tal fin (en adelante la Página Promocional), direccionada mediante el subdominio creado a partir del nombre del establecimiento aportado por el Hotel en el Formulario.</p><p><b>3. Obligaciones del Hotel</b></p><p>3.1. Para contratarse con <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, el Hotel debe haberse registrado previamente en la Página a través de un formulario de registro.</p><p>3.2. Una vez registrado, el Hotel podrá cumplimentar el Formulario, en el que deberá rellenar todos los datos oblgatorios exigidos en el momento de cumplimentación, y las condiciones básicas de las campañas a realizar.</p><p>3.2. Es requisito para poder cumplimentar el Formulario en <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>:</p>
<ul>
<li>a) Estar autorizado para representar y comprometerse tanto sí mismo como a la sociedad a la que represente.</li>
<li>b) La exactitud y veracidad de todos los datos aportados.</li>
<li>c) Tener cocimiento de la finalidad y uso de la Página.</li>
<li>d) Tener capacidad legal y de obrar para obligarse según estas Condiciones.&nbsp;</li>
</ul><p>3.3. Aceptando estas Condiciones Generales de Contratación, reconoces que cumples las anteriores condiciones y que eres el único responsable de las consecuencias derivadas de no cumplirlas.</p><p>3.4. El Hotel se obliga a pagar a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> el precio fijo correspondiente por las labores de promoción e intermediación de la venta o reserva de servicios hoteleros, así como un porcentaje a calcular según la cuantía establecida en la cláusula quinta de las presentes condiciones.</p><p>3.5. El Hotel se compromete a ofrecer a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, a efecto de su uso en la Página Promocional, un descuento en sus tarifas respecto a las que ofrezca en la plataforma online Booking. Este descuento se corresponderá con el estipulado por el Hotel en el Formuclario, ya sea mediante un porcentaje o cuantía fija en euros.</p><p>3.6. Asimismo, el Hotel se obliga a prestar los servicios que le sean reservados por los Usuarios de Internet a través de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> en las fechas y por las condiciones estipuladas por el Hotel en el Formulario. En caso de que, por cualquier causa, no pueda cumplir con estas obligaciones, lo pondrá de inmediato en conocimiento de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, y realizará los esfuerzos que resulten razonables para procurar a los usuarios servicios alternativos, de calidad igual o superior a los reservados.</p><p>A todos los efectos, la recepción de la reserva por el Hotel vinculará a éste tanto en lo relativo a precios y condiciones como en el resto de condiciones legales o contractuales con el Comprador, no teniendo <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> ninguna responsabilidad.</p><p>3.7. En caso de cambios o cancelaciones en los servicios ofertados, el Hotel se obliga a comunicar a los Compradores estos cambios o cancelaciones. También podrá comunicarlos a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> para que, como intermediario, realice la comunicación a los Compradores. No obstante, <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, no será responsable de estos cambios o cancelaciones ni de los daños y perjuicios que se deriven de los mismos para el Hotel.&nbsp;</p><p>3.8. El Hotel a los efectos de este Contrato, se compromete, además a:</p><p>a) No utilizar o intentar utilizar la cuenta de otro Hotel sin autorización.</p><p>b) Ser el único responsable de todas las actividades que se realicen desde su cuenta de Usuario.</p><p>c) Aportar a Vikahote.coml, a su requerimiento, contenidos o información extra para la promoción y gestión de las campañas, tales como: Fotografías, vídeos, etc... Estos contenidos deberán ser exclusivos para su uso por <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, no pudiendo haber sido cedidos (ni cederse en el futuro) a terceros para su uso.</p><p>d) En particular, respecto a la información suministrada en el Formulario, el Hotel se compromete a:</p>
<ul>
<li>Facilitar la información necesaria de manera exacta, completa y actualizada y, en especial, la relativa a disponibilidad, tarifas, ofertas y condiciones de reserva de la campaña.</li>
<li>No aportar contenido ilegal, inapropiado, inexacto, injurioso, discriminatorio u ofensivo. El Hotel será en todo caso responsable de estos contenidos así como de las consecuencias que de ello se deriven. En especial, será responsable de las violaciones de derechos de propiedad intelectual o industrial que infrinja con ocasión de los mismos y su publicación por <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>.&nbsp;</li>
</ul><p>e) Toda vez que detectemos o seamos informados de cualquier hecho que pueda ser contrario a lo establecido en este apartado, nos facultará para bloquear el acceso a las promociones o páginas creadas por <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> para la&nbsp; Página o Plataforma y retirar contenidos de la cuenta de Hotel sin derecho a indemnización alguna.</p><p>f) El Establecimiento se abstendrá de remitir comunicaciones comerciales, por cualquier medio, a los clientes que reciba a través de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>.</p><p>g) Permitir a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> realizar campañas publicitarias u otras acciones promocionales en&nbsp; páginas de su titularidad para ofrecer mayor visibilidad a las ofertas y servicios de la Página Promocional, lo que incluye expresamente el uso de otros dominios diferentes al subdominio creado en el proceso de cumplimentación del Formulario.&nbsp;</p><p>El coste de las acciones previstas en este párrafo será, salvo acuerdo entre las Partes, por cuenta de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, excepto que el presente contrato sea resuelto por el Hotel o finalice por cualquier causa imputable a éste, dentro del período de desarrollo de una campaña publicitaria o acción promocional. En tal caso, el Hotel deberá abonar a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> el coste íntegro de la referida campaña o acción.</p><p>h)&nbsp; Permitir a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> la inclusión de otros productos o servicios de terceros en la Página Promocional para dar al cliente final la posibilidad de obtener servicios complementarios a los servicios hoteleros. En ningún caso estos servicios supondrán competencia directa o indirecta a los ofrecidos por el Hotel.</p><p><b>4. Obligaciones de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a></b></p><p><a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> se obliga a:</p>
<ul>
<li>a) <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> gestionará la información y promoverá, conforme a su leal saber y entender, los servicios del Hotel mediante la creación de una Página Promocional dedicada a la campaña y, de esta forma, los Usuarios de la misma puedan contratar y reservar los servicios del Hotel.</li>
<li>b) Velar porque el sistema de contratación por el que los Usuarios de Internet pueden reservar los servicios del Hotel se ajuste a la legalidad vigente.</li>
<li>c) Asimismo, se obliga a ofrecer al Usuario de Internet y Comprador, la información adecuada para la reserva, entre ella, los precios y condiciones generales aplicables.</li>
</ul><p><b>5. Condiciones económicas</b></p><p><a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, por su labor de intermediación y promoción de las reservas, percibirá como contraprestación, un porcentaje igual al DIEZ POR CIENTO (10%) respecto a las reservas realizadas, en contraprestación por los servicios de intermediación en la reservar de los clientes finales.</p><p>Los anteriores porcentajes se liquidarán mensualmente, para la determinación de los mismos, <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> utilizará los datos de reservas y compras efectuados a través de la Página Promocional creada a tal efecto</p><p><b>6. Exclusión de responsabilidad</b></p><p>6.1. <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> no tiene más obligación que lo contenido en estas Condiciones Generales de Contratación. No obstante, pueden existir otras condiciones legales especiales, en cuyo caso, también sean de aplicación.</p><p>6.2. <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> no será en ningún caso responsable de cómo el Hotel se relacione con los Compradores, ni de cualquier eventualidad que acontezca durante su estancia.</p><p>6.3. <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, en lo referente a los servicios ofrecidos en la Campaña, se configura como un mero intermediador entre el Hotel que vende y reserva servicios hoteleros, y el usuario de Internet como Comprador o adquirente de los mismas. En tal sentido, no será responsable por la información facilitada por el Hotel, ni por las reclamaciones de ningún tipo efectuadas por los Compradores respecto a los o servicios del Hotel adquiridos o reservados a través de la Página creada a tal efecto por <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>.</p><p>En tal sentido, la información que aparece en la Página Promocional es suministrada para su publicación por&nbsp; los Hoteles, por lo que, conforme al artículo 16 de la Ley 34/2004, de 11 de julio, de servicios de la sociedad de la información y del comercio electrónico, <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> se configura a los efectos de prestar este servicio como un prestador de servicios de alojamiento o almacenamiento de datos. En consecuencia, no se hace responsable de la ilegalidad, falsedad o inexactitud de los contenidos publicadosen la Página Promocional dado que el servicio de publicación de estos contenidos opera de forma automática. En particular, no se hace responsable por infracciones de derechos de propiedad intelectual, industrial o de imagen. Si crees que algún contenido no es conforme con la Ley o que existen errores, por favor comunícanoslo a <a href="?&amp;v=b&amp;cs=wh&amp;to=info@vikahotel.com" target="_blank">info@vikahotel.com</a>.</p><p>6.4. El Hotel asumirá cualquier reclamación que reciba <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, manteniéndole indemne de toda responsabilidad o gasto que se pudiere generar, por cualesquiera de las siguientes causas:</p><p>a. Las derivadas de cualquier inexactitud, error u omisión en relación con la información facilitada por el Hotel;</p><p>b. Las relacionadas con la propiedad intelectual o industrial de la información, documentación o contenidos literarios, gráficos, audiovisuales o de cualquier tipo facilitados por el Hotel para su incorporación a la Página Promocional;</p><p>c. Las ocasionadas con motivo de la carencia, por parte del Hotel, de los permisos, autorizaciones o licencias oficiales necesarios para el desarrollo de la actividad de alojamiento turístico.</p><p>d. Las relacionadas con la prestación de los servicios reservados por los usuarios o el incumplimiento de las condiciones contratadas con los mismos; o</p><p>e. Las ocasionadas por la cancelación unilateral de reservas por el Hotel.</p><p>6.5. <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> no será responsable de los actos u omisiones de los Usuarios que reserven los servicios de Hotel a través de la Página, Promocional incluyendo expresamente el denominado “no-show” y las cantidades debidas formal y definitivamente no pagadas por aquéllos.</p><p>6.6. El Hotel garantiza que desarrollará las obligaciones asumidas en las presentes Condiciones conforme a la buena fe y con lealtad para con <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>.</p><p>6.7. Las partes acuerdan que la responsabilidad que asume <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> frente al Hotel, derivada del presente contrato, en ningún caso incluye el lucro cesante y se limitará, en cualquier caso, como máximo y por cualquier concepto, al importe total percibido por <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> del Hotel en concepto de honorarios por la prestación de los servicios objeto del presente contrato.</p><p>6.8. <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> no garantiza la absoluta continuidad del servicio o la ausencia de virus informáticos en los servicios prestados a través de su red, que puedan producir alteraciones en los programas o documentos almacenados en sus sistemas de información, si bien llevará a cabo los mejores esfuerzos para evitar que se produzcan estas circunstancias.</p><p><b>7. Propiedad intelectual e industrial</b></p><p>Los derechos de propiedad intelectual del contenido de las páginas web, su diseño gráfico y códigos son de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> en exclusiva o cuenta con los oportunos derechos y/o autorizaciones para su publicación en la Página y, por tanto, queda prohibida su reproducción, distribución, comunicación pública, transformación o cualquier otra actividad que se pueda realizar con los contenidos de sus páginas web ni aún citando las fuentes, salvo consentimiento por escrito de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> o del titular en exclusiva del derecho.</p><p>El Hotel, como titular de los derechos de propiedad intelectual o de una autorización bastante sobre la información, documentación o contenidos literarios, gráficos, audiovisuales o de cualquier tipo que proporcione a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> para su publicación en la Página Promocional, concede a éste una licencia sobre los contenidos (i) de forma no exclusiva, pero con el carácter de transferible a terceros, (ii) por el tiempo de vigencia del presente contrato y (iii) sin límite territorial, y por tanto para todos los territorios del mundo. La licencia incluye la reproducción, distribución, comunicación pública y transformación de dichos contenidos, siempre que su uso esté relacionado con la actividad de intermediación y promoción de la venta de entradas y reservas para los espectáculos del Hotel, o con la promoción de la misma.</p><p>Todos los nombres comerciales, marcas o signos distintivos de cualquier clase contenidos en la Página y todas sus secciones son propiedad de sus dueños o titulares legítimos y están protegidos por ley.</p><p>El Hotel autoriza expresamente a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> para que éste utilice las marcas y logos de aquél en la Página, si bien únicamente en relación con el objeto de las presentes Condiciones.</p><p>El Hotel autoriza expresamente a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> a recabar, de su propio sitio web o de sitios web de terceros, aquellos datos que sean precisos para completar la información del Hotel en la Página Promocional, licenciándole en los términos previstos en el párrafo anterior.</p><p>El Hotel es responsable de la obtención de cualesquiera derechos o autorizaciones que fuesen necesarios, así como el cumplimiento de cualquier obligación, sobre los derechos de propiedad intelectual o industrial de terceros que pudieran afectar a la información que facilite a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> para su incorporación a la Página, y sobre la que <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> no realizará ningún tipo de control previo. . Si crees que tu derecho de propiedad intelectual o industrial ha sido infringido o que un contenido no es conforme con la Ley, por favor comunícanoslo a: [<span>CORREO</span>].</p><p><b>8. Protección de datos</b></p><p><a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> será responsable del fichero, conforme a la Ley Orgánica de Protección de Datos (LOPD), respecto de aquella información personal que puedan recibir en virtud de las presentes Condiciones.&nbsp;</p><p><a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> cederá los datos de cada reserva al Hotel para la única la finalidad de la gestión y prestación de los servicios reservados. En tal caso, el Hotel será a los efectos de la legislación de protección de datos, responsable de los ficheros de datos personales de los compradores.</p><p>En este sentido, cuando un usuario realice una reserva a través de la Página se le informará de que está facilitando sus datos a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, y que ésta se los comunicará al Hotel para la prestación del servicio o efectuar la compra.</p><p><b>9. Miscelánea</b></p><p>9.1. Modificaciones</p><p><a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> se reserva el derecho de modificar, eliminar o alterar en cualquier momento los servicios ofrecidos a través de la Página, sean propios o de terceros.</p><p>9.2. Cualquier incumplimiento de estas Condiciones por parte del Hotel, podría suponer para nosotros daños y perjuicios. De tal forma, si por incumplimientos del Hotel sufriéramos daños, perjuicios, cualquier tipo de pérdidas y costes (como pueden ser los honorarios de abogados y procuradores), aquél estará obligado a resarcirnos.&nbsp;</p><p>Asimismo, si por los incumplimientos del Hotel se generaran cualquier tipo de reclamaciones o procedimientos contra nosotros, el Hotel dejará indemne a <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>, pudiendo reclamarle cualquier gasto, coste, daño o perjuicio derivado de sus acciones.</p><p>9.3. Las comunicaciones entre las Partes relativas al Contrato se realizarán por escrito, mediante cualquier medio que permita acreditar su recepción y contenido a las direcciones de correo electrónico comunicadas por cada una de las partes</p><p>9.4. Salvaguarda e interpretación de las Condiciones Generales</p><p><a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> y el Hotel son, en todo caso, partes contractuales independientes. En ningún caso el presente Contrato supone la creación de vínculo alguno entre las partes más que el derivado del estricto contenido del mismo, sin que en virtud de sus cláusulas se cree o se establezca relación alguna de agencia, laboral, de franquicia, Joint venture, sociedad o se confiera representación legal a una parte para actuar en nombre de la otra.</p><p>Las totalidad de las presentes Condiciones Generales de Contratación constituyen un acuerdo único entre el Hotel de <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a>. Cualquier contrato posterior entre las Partes para idéntico objeto complementará las presentes Condiciones y, en caso de contradicción, se dará preferencia a aquél.&nbsp;</p><p>Si cualquier disposición de las Condiciones fuera considerada ilegal, inválida o no ejecutable según la disposición de la Autoridad competente, la misma podrá ser modificada o interpretada de otra manera del modo en que pueda ser ejecutable y, al mismo tiempo, efectiva del modo más próximo posible a la intención original de la disposición.</p><p>Cualquier referencia realizada en las presentes Condiciones a un artículo o cuerpo normativo que resulte derogado se entenderá realizada a la disposición equivalente que lo sustituya.</p><p>La no exigencia del cumplimiento estricto de alguno de los términos de estas Condiciones, no supone ni puede interpretarse como una renuncia por nuestra parte a exigir su cumplimiento en sus estrictos términos en el futuro.</p><p>La declaración de nulidad de alguna o algunas de las cláusulas establecidas en las presentes Condiciones por la Autoridad competente no perjudicará la validez de las restantes. En este caso, las partes contratantes se comprometen a negociar una nueva cláusula en sustitución de la anulada con la mayor identidad posible con la misma. Si la sustitución deviniese imposible y la cláusula fuese esencial para las Condiciones, a juicio de la parte perjudicada por su eliminación, ésta podrá optar por la resolución del contrato.</p><p>9.5. Legislación y fuero</p><p>Las relaciones entre <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> con los usuarios Registrados de sus servicios telemáticos, presentes en la web, se encuentran sometidas a la legislación y jurisdicción españolas.</p><p>Como regla general, para la resolución de conflictos relativos a las Condiciones, <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> y el usuario registrado, con renuncia expresa a cualquier otro fuero, se someten a la jurisdicción de los Juzgados y Tribunales de la residencia habitual del usuario. No obstante, en el caso de que éste tenga su domicilio fuera de España, <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> y el usuario registrado se someten, con renuncia expresa a cualquier otro fuero, a los juzgados y tribunales de Madrid.</p><p>En caso de que el contrato se haya celebrado entre <a href="http://www.google.com/url?q=http%3A%2F%2FVikahotel.com&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNE_SqHQahXxOwu2iqoO37b6cRdI0Q" target="_blank">Vikahotel.com</a> y una empresa o profesional, se someterán, con renuncia expresa a cualquier otro fuero, a la jurisdicción que corresponda conforme a la Ley 34/2002, de 11 de julio, de Servicios de la Sociedad de la Información y de Comercio Electrónico.&nbsp;</p>
</div>
                                            </div>
                                        </div>
                                        
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
          
            


    
  </body>
</html>