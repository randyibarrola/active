{extends file="admin/index.tpl"}

{block name="script" append}
{/block}

{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/admin/form_wizard.css" >
    <link href="{$template_url}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
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
                        <small>Ver contrato</small>
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
                            
                            <div class="caption">
                                <i class="fa fa-reorder"></i>
                                <span class="step-title">
                                        Contrato
                                </span>
                            </div>
                            
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            
                                <div class="form-body ver-campania">
                                    <h4 class="form-section">Campaña</h3>
                                    <div class="row-fluid">
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Nombre:</label>
                                            <label class="col-md-6" id="labelNombre">{$campania->nombre}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Nº referencia:</label>
                                            <label class="col-md-6">{$campania->localizador}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Hotel:</label>
                                            <label class="col-md-6">{$campania->nombreHotel}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Comisón:</label>
                                            <label class="col-md-6">{$campania->porcentajeBeneficio}%</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <!--
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-3">Dominio oficial:</label>
                                            <label class="col-md-4" id="labelSubdominio">{$campania->subdominio}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        -->
                                            <div class="delimiter"></div>
                                    </div>
                                    <h4 class="form-section">Datos del distribuidor</h3>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Nombre comercial:</label>
                                            <label class="col-md-6" id="labelNombre">{$campania->empresaDistribuidora->nombreComercial}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Nombre fiscal:</label>
                                            <label class="col-md-6" id="labelNombre">{$campania->empresaDistribuidora->nombreFiscal}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">CIF:</label>
                                            <label class="col-md-6">{$campania->empresaDistribuidora->numeroFiscal}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Teléfono:</label>
                                            <label class="col-md-6" id="labelNombre">{$campania->empresaDistribuidora->telefonoReservas}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Email:</label>
                                            <label class="col-md-6">{$campania->empresaDistribuidora->emailReservas}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Contacto:</label>
                                            <label class="col-md-6">{$campania->empresaDistribuidora->contactoNombre} {$campania->empresa->contactoApellidos}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                            <div class="delimiter"></div>
                                    </div>
                                    <h4 class="form-section">Datos de la empresa cliente</h3>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Nombre comercial:</label>
                                            <label class="col-md-6" id="labelNombre">{$campania->empresa->nombreComercial}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Nombre fiscal:</label>
                                            <label class="col-md-6" id="labelNombre">{$campania->empresa->nombreFiscal}</label>
                                            <div class="delimiter"></div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">CIF:</label>
                                            <label class="col-md-6">{$campania->empresa->numeroFiscal}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Teléfono:</label>
                                            <label class="col-md-6" id="labelNombre">{$campania->empresa->telefonoReservas}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="delimiter"></div>
                                    </div>
                                    <div class="row-fluid container-fluid">
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Email:</label>
                                            <label class="col-md-6">{$campania->empresa->emailReservas}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Contacto:</label>
                                            <label class="col-md-6">{$campania->empresa->contactoNombre} {$campania->empresa->contactoApellidos}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                            <div class="delimiter"></div>
                                    </div>
                                     
                                        <h4 class="form-section">Contrato</h3>
                                        <div class="row-fluid">
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Inicio:</label>
                                            <label class="col-md-6" id="labelInicio">{$campania->inicio|date_format:"%d-%m-%Y"}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Fin:</label>
                                            <label class="col-md-6" id="labelFin">{$campania->fin|date_format:"%d-%m-%Y"}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Estancia mínima:</label>
                                            <label class="col-md-6 estancia-minima">{$campania->estanciaMinima} día{if $campania->estanciaMinima > 1}s{/if}</label>
                                            <div class="delimiter"></div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="control-label col-md-6">Release:</label>
                                            <label class="col-md-6 venta-anticipada">{$campania->ventaAnticipada} día{if $campania->estanciaMinima > 1}s{/if}</label>
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
                                                    <div class="row-fluid">
                                                        <div class="form-group col-md-3">
                                                            <label class="control-label col-md-6">de {$periodo->inicio|date_format:"%d-%m-%Y"}</label>
                                                            <label class="col-md-6 inicio">a {$periodo->fin|date_format:"%d-%m-%Y"}</label>
                                                            <div class="delimiter"></div>
                                                        </div>
                                                        
                                                        <div class="form-group col-md-3">
                                                            <label class="control-label col-md-6">Descuento:</label>
                                                            <label class="col-md-6 descuento">{$periodo->descuentoBooking} {$periodo->tipoDescuento}</label>
                                                            <div class="delimiter"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                         <div class="delimiter"></div>
                                        <h3 class="form-section">T&eacute;rminos del contrato</h3>
                                        <div class="row-fluid">
                                            <p class="p1"><b>PRIMERA. Objeto del Contrato</b></p>

<p class="p1">Este Contrato, incluidos sus anexos, regula los t&eacute;rminos y condiciones de la prestaci&oacute;n de los servicios de intermediaci&oacute;n para la reserva de plazas de alojamiento temporal (en adelante, los Servicios) por parte de VikaHotel, a cambio de una contraprestaci&oacute;n econ&oacute;mica.</p>

<p class="p1"><b>SEGUNDA. Contenido y alcance de los Servicios</b></p>

<p class="p1">2.1. Los servicios de VikaHotel comprenden la creaci&oacute;n y gesti&oacute;n de una p&aacute;gina web (en adelante la P&aacute;gina Promocional), conforme a su leal saber y entender, destinada a permitir a cualquier usuario de Internet la reserva telem&aacute;tica de plazas de alojamiento temporal en el establecimiento del Hotel.</p>

<p class="p1">2.2. El coste de las acciones previstas en este p&aacute;rrafo ser&aacute;, salvo acuerdo distinto entre las Partes por cuenta de VikaHotel, excepto si el presente Contrato fuera resuelto por el Hotel o por causa imputable a &eacute;ste, dentro del per&iacute;odo de desarrollo de una campa&ntilde;a promocional. En tal caso, el Hotel deber&aacute; abonar a VikaHotel el coste &iacute;ntegro de la referida campa&ntilde;a o acci&oacute;n.</p>

<p class="p1"><b>TERCERA. Condiciones econ&oacute;micas</b></p>

<p class="p1">VikaHotel percibir&aacute;, en contraprestaci&oacute;n por los servicios de intermediaci&oacute;n en la reserva de los clientes finales, un porcentaje igual al {$campania->porcentajeBeneficio}% respecto al precio de las reservas realizadas a trav&eacute;s de la P&aacute;gina Promocional, que ser&aacute; cobrado mediante pago directo por parte del cliente final a VikaHotel en el momento de realizar la reserva. La citada cantidad deber&aacute; ser descontada de la cuant&iacute;a total que el cliente final deber&aacute; abonar en el establecimiento del Hotel, de manera presencial.</p>

<p class="p1"><b>CUARTA. Obligaciones de las Partes</b></p>

<p class="p1">4.1. VikaHotel realizar&aacute; los Servicios contratados en las condiciones pactadas en el presente contrato o sus anexos.</p>

<p class="p1">4.2. El Hotel se obliga a prestar los servicios que sean objeto de reserva a trav&eacute;s de las P&aacute;gina Promocional conforme a la informaci&oacute;n que haya facilitado a VikaHotel.</p>

<p class="p1">A todos los efectos, la recepci&oacute;n de la reserva por el Hotel vincular&aacute; a &eacute;stos, tanto en lo relativo a precios y condiciones, como en el resto de condiciones legales o contractuales con el cliente final, no teniendo VikaHotel ninguna responsabilidad sobre ello o sobre posibles cambios o cancelaciones que deber&aacute;n ser comunicadas a los clientes directamente por el Hotel.</p>

<p class="p1">4.3. El Hotel deber&aacute; permitir a VikaHotel realizar las campa&ntilde;as publicitarias u otras acciones promocionales conforme a lo establecido en la Estipulaci&oacute;n 2.2. del presente Contrato as&iacute; como a incluir en la P&aacute;gina Promocional correspondiente, la posibilidad de que el cliente final reserve y/o contrate otros servicios complementarios. En ning&uacute;n caso estos servicios supondr&aacute;n competencia directa o indirecta respecto de los ofrecidos por el Hotel.</p>

<p class="p1">4.4.&nbsp;&nbsp; &nbsp;El Hotel deber&aacute; validar los contenidos de la p&aacute;gina promocional de manera previa a su publicaci&oacute;n.</p>

<p class="p1">4.5. El Hotel dejar&aacute; indemne a VikaHotel de cualquier da&ntilde;o, perjuicio, p&eacute;rdida y/o coste derivado de los incumplimientos de cualesquier obligaciones contenidas en el presente Contrato o en cualquier de sus anexos.</p>

<p class="p1"><b>QUINTA. Exclusi&oacute;n de responsabilidad</b></p>

<p class="p1">5.1. VikaHotel es un mero intermediador entre el Hotel que vende y reserva servicios hoteleros, y el usuario de Internet como cliente final o adquirente de los mismos y no tiene m&aacute;s obligaci&oacute;n que lo contenido en el presente Contrato o sus anexos, no siendo en ning&uacute;n caso responsable de c&oacute;mo el Hotel se relacione con los clientes finales, ni de cualquier eventualidad que acontezca durante su estancia ante la que el Hotel deber&aacute; dejar indemne a VikaHotel.</p>

<p class="p1">5.2. VikaHotel no ser&aacute; responsable de los actos u omisiones de los clientes finales que reserven los servicios de Hotel a trav&eacute;s de la P&aacute;gina Promocional incluyendo expresamente el denominado &ldquo;no-show&rdquo; y las cantidades debidas formal y definitivamente no pagadas por aqu&eacute;llos.</p>

<p class="p1">5.3. Las partes acuerdan que la responsabilidad que asume VikaHotel frente al Hotel, derivada del presente contrato, en ning&uacute;n caso incluye el lucro cesante y se limitar&aacute;, en cualquier caso, como m&aacute;ximo y por cualquier concepto, al importe total percibido por VikaHotel del Hotel en concepto de honorarios por la prestaci&oacute;n de los servicios objeto del presente contrato.</p>

<p class="p1"><b>S&Eacute;XTA. Varios</b></p>

<p class="p1">6.1. El presente Contrato tiene car&aacute;cter mercantil, y est&aacute; formado por las presentes estipulaciones, acordadas y negociadas entre las partes que son en todo caso, partes contractuales independientes.</p>

<p class="p1">6.2.  La duración del presente Contrato es de 1 año a partir del día de su subscripción.<br />Si ninguna de las partes notifica su deseo de dejar resuelto el mismo, se entenderá prorrogado por un año y así sucesivamente se irán efectuando dichas prorrogas por iguales plazos.</p>

<p class="p1">6.3. Las Partes podr&aacute;n resolver el Contrato en cualquier momento, y acuerdan comunicar tal voluntad con a antelaci&oacute;n de UN (1) mes, en consonancia con la buena fe contractual.</p>

<p class="p1">6.4. Los conocimientos y dem&aacute;s informaciones trasmitidas entre las partes constituyen informaci&oacute;n propia y confidencial de VikaHotel y del Hotel, que no podr&aacute; ser revelada a terceros ni durante la vigencia del presente contrato, ni tras la finalizaci&oacute;n del mismo.</p>

<p class="p1">6.5. VikaHotel ser&aacute; responsable del fichero, conforme a la LOPD, respecto de aquella informaci&oacute;n personal que puedan recibir en virtud del presente contrato y proporcionar&aacute; los datos de cada reserva al Hotel para la &uacute;nica la finalidad de la gesti&oacute;n y prestaci&oacute;n de los servicios reserva realizados, siendo el Hotel responsable de los ficheros de datos personales de los compradores.</p>

<p class="p1">6.6. El presente Contrato se regir&aacute; por las leyes espa&ntilde;olas. Las partes se someten a la jurisdicci&oacute;n de los Juzgados y Tribunales de Puerto del Rosario &ndash; Las Palmas.</p>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 centered ">
                                                <a class="btn btn-default" href="{$base_url}/admin-contrato-lista" >Atr&aacute;s</a>
                                                <a class="btn btn-success" target="_blank" href="{$base_url}/admin-campania-imprimir/id:{$campania->id}" >Imprimir</a>
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
</div>
<!-- END PAGE -->

<div class="modal fade" id="tc_modal">
    <div class="modal-dialog">
        <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Términos del contrato</h4>
            </div>
            <div class="modal-body">
                Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{#cerrar#}</button>
            </div>
        </div>
    </div>
</div>

{/block}