<style type="text/css">
    body {
        width: 640px;
margin-left: auto;
margin-right: auto;
background: #FFF;
padding: 0 30px;
margin-top: 0;
margin-bottom: 0;
    }
    html{
    	
    background: #F5F5F5;
    }
    .login-form .form-group{
    	margin: 4px;
    }
    .login-form .form-group input{
    	width: 100%;
		padding: 4px;
		font-size: 13px;
	}
	.login-form .form-actions{
		text-align: center;
	}
	p{
		font-size: 13px;
	}
</style>
{if $hotel}
	<script type="text/javascript">
		window.print();
	</script>
{/if}
<p style="text-align:center;margin:0;"><img height="70" src="{$template_url}/images/logo_s.png"></p>
{if !$hotel}
<form class="login-form"  method="post">
        <div class="form-group">
                <div class="input-icon">
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Nombre" name="nombre"/>
                </div>
        </div>

        <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Apellido" name="apellido"/>
            </div>
        </div>

                <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="NIF" name="nif"/>
            </div>
        </div>

                <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Empresa" name="empresa"/>
            </div>
        </div>

                <div class="form-group">
            <div class="input-icon">
                
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="CIF" name="cif"/>
            </div>
        </div>

                <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Ciudad" name="ciudad"/>
            </div>
        </div>

        <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Dirección completa" name="direccion"/>
            </div>
        </div>

                <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Nombre del hotel" name="hotel"/>
            </div>
        </div>

        <div class="form-actions">
                <button type="submit" class="btn blue pull-right">
                Rellenar contrato <i class="m-icon-swapright m-icon-white"></i>
                </button>            
        </div>
</form>
{/if}
<h3 class="p2"><span class="s1"><b>Contrato de Arrendamiento de Servicios</b></span></h3>
<p class="p3"><span class="s1">De una parte, Don Mat&iacute;as Gabriel Barbarroja con NIF: X4790910X, mayor de edad, en nombre y representaci&oacute;n de Booking DeTeatros S.L., con domicilio social en la Avda. Fuerteventura, s/n - Urbanizaci&oacute;n Las Margaritas N&ordm; 43 - 35660 Corralejo (Fuerteventura-Espa&ntilde;a) y CIF: B76153725. En adelante, {#sistema_nombre#}.</span></p>

<p class="p3"><span class="s1">De otra parte, Don {if $nombre}{$nombre} {$apellido}{else}<b>NOMBRE DEL CLIENTE</b>{/if} con NIF: {if $nif}{$nif}{else}<b>NIF</b>{/if}, mayor de edad, en nombre y representaci&oacute;n del Hotel {if $hotel}{$hotel}{else}<b>NOMBRE DEL HOTEL</b>{/if}, propiedad de la empresa {if $empresa}{$empresa}{else}<b>NOMBRE DE LA EMPRESA</b>{/if} con CIF: {if $cif}{$cif}{else}<b>CIF</b>{/if}</span><span class="s2"> </span><span class="s1">con domicilio a los efectos del presente Contrato en {if $direccion}{$direccion}{else}<b>DIRECCIÓN COMPLETA</b>{/if}, actuando en su propio nombre y derecho. En adelante, el Hotel.</span></p>

<p class="p4"><span class="s1">Ambas partes se reconocen en el concepto en que respectivamente intervienen, la capacidad jur&iacute;dica y de obrar y la legitimidad bastante en Derecho para el otorgamiento del presente Contrato que convienen su celebraci&oacute;n, con arreglo a las siguientes</span></p>



<p class="p1"><b>PRIMERA. Objeto del Contrato</b></p>

<p class="p1">Este Contrato, incluidos sus anexos, regula los t&eacute;rminos y condiciones de la prestaci&oacute;n de los servicios de intermediaci&oacute;n para la reserva de plazas de alojamiento temporal (en adelante, los Servicios) por parte de VikaHotel, a cambio de una contraprestaci&oacute;n econ&oacute;mica.</p>

<p class="p1"><b>SEGUNDA. Contenido y alcance de los Servicios</b></p>

<p class="p1">2.1. Los servicios de VikaHotel comprenden la creaci&oacute;n y gesti&oacute;n de una p&aacute;gina web (en adelante la P&aacute;gina Promocional), conforme a su leal saber y entender, destinada a permitir a cualquier usuario de Internet la reserva telem&aacute;tica de plazas de alojamiento temporal en el establecimiento del Hotel.</p>

<p class="p1">2.2. El coste de las acciones previstas en este p&aacute;rrafo ser&aacute;, salvo acuerdo distinto entre las Partes por cuenta de VikaHotel, excepto si el presente Contrato fuera resuelto por el Hotel o por causa imputable a &eacute;ste, dentro del per&iacute;odo de desarrollo de una campa&ntilde;a promocional. En tal caso, el Hotel deber&aacute; abonar a VikaHotel el coste &iacute;ntegro de la referida campa&ntilde;a o acci&oacute;n.</p>

<p class="p1"><b>TERCERA. Condiciones econ&oacute;micas</b></p>

<p class="p1">VikaHotel percibir&aacute;, en contraprestaci&oacute;n por los servicios de intermediaci&oacute;n en la reserva de los clientes finales, un porcentaje igual al {$comision}% respecto al precio de las reservas realizadas a trav&eacute;s de la P&aacute;gina Promocional, que ser&aacute; cobrado mediante pago directo por parte del cliente final a VikaHotel en el momento de realizar la reserva. La citada cantidad deber&aacute; ser descontada de la cuant&iacute;a total que el cliente final deber&aacute; abonar en el establecimiento del Hotel, de manera presencial.</p>

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




<p class="p9">&nbsp;</p>

<p class="p7"><span class="s1">Y en prueba de conformidad suscriben las partes el presente Contrato en duplicado ejemplar y a un solo efecto en {if $ciudad}{$ciudad}{else}<b>CIUDAD</b>{/if}, {$dia} de {$mes} de 2014.</span></p>

<p class="p10">&nbsp;</p>

<p class="p11">
	<span style="display: block;float: left;width: 50%;text-align: center;" class="s1">&nbsp;&nbsp; &nbsp;Hotel {$hotel}</span>
	<span class="s1" style="display: block;
float: left;text-align: center;
width: 50%;">{#sistema_nombre#}.com <br />({#empresa_nombre#})</span></p>


<br />
<p>&nbsp;</p>
<p>&nbsp;</p>
<p style="margin-bottom:0">&nbsp;</p>