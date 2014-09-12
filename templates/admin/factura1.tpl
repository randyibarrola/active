<html>
    <head>
        <title>Factura</title>
        <link rel="stylesheet" href="{$template_url}/css/admin/facturas.css">
        <link rel="stylesheet" href="{$template_url}/css/admin/facturas-print.css">
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F9F9F9" id="main_content" >
            <!-- COTENIDO -->
            <tr>
                <td valign="top" style="  padding: 10px;" id="main_content_td">﻿﻿
                    <!-- AVISO DATOS DE VALIDACIÓN NO ACTUALIZADOS -->
                    <table cellpadding="2" cellspacing="1" align="center" id="aviso"  style="display:none;"  >
                        <tr>
                            <td>
                                <div style="margin:4px; width:100%; border: 1px dotted #996600; background-color:#ffff99; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#996600; padding:4px; ">
                                    <img src="images/ico_information.gif" width="16" height="16" align="absmiddle" /> 
                                </div>
                            </td>
                        </tr>
                    </table>
                    
                    <table border="0" align="center" cellpadding="10" cellspacing="0">
                        <!-- FACTURA -->
                        <tr id="factura"><td>
                                <table width="620" border="0" align="center" cellpadding="2" cellspacing="0" bgcolor="#999999">
                                    <tr>
                                        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                <tr>
                                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                                                            <tr>
                                                                <td><img src="{$template_url}/images/logo_s.png" height="65" /></td>
                                                                <td rowspan="2" valign="top"><table border="0" align="right" cellpadding="3" cellspacing="1" class="texto_negro">
                                                                        <tr>
                                                                            <td bgcolor="#F5F5F5"><span style="font-size:12px;"><strong>N° de factura:</strong></span></td>
                                                                            <td align="right" nowrap="nowrap" bgcolor="#F9F9F9"><span style="font-size:12px;">{$factura->numero}</span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#F5F5F5"><span style="font-size:12px;"><strong>Fecha emisión:</strong></span></td>
                                                                            <td align="right" bgcolor="#F9F9F9"><span style="font-size:12px;">{$factura->tiempoCreacion|date_format:"%d/%m/%Y"}</span></td>
                                                                        </tr>
                                                                    </table></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2"><span class="texto_negro" style="font-size:14px; font-weight:bold;">Servicio de sistema de reservas online</span></td>
                                                            </tr>
                                                        </table></td>
                                                </tr>
                                                <tr bgcolor="#F5F5F5">
                                                    <td style="border-top:#999999 1px solid; border-bottom:#999999 1px solid;"><!-- Datos del titular -->
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                                            <tr>
                                                                <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                                                                        <tr>
                                                                            <td><span class="texto_negro">
                                                                            {#empresa_nombre#}</span></td>
                                                                            <td colspan="2"><span class="texto_negro">{#empresa_direccion#}</span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><span class="texto_negro">C.I.F.: {#empresa_cif#}</span></td>
                                                                            <td><span class="texto_negro">{#empresa_email#}</span></td>
                                                                        </tr>
                                                                    </table></td>
                                                            </tr>
                                                        </table>
                                                        <!-- /Datos del titular --></td>
                                                </tr>
                                                <tr>
                                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                                                            <tr>
                                                                <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                                                                        <tr>
                                                                            <td><span class="texto_negro"><strong>Producto:</strong></span></td>
                                                                            <td><span class="texto_negro">{$hotel->nombre} ({$hotel->empresa->nombreFiscal})</span></td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td><span class="texto_negro"><strong>Empresa:</strong></span></td>
                                                                            <td><span class="texto_negro">{$hotel->empresa->nombreFiscal}</span></td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td><span class="texto_negro"><strong>NIF/CIF:</strong></span></td>
                                                                            <td><span class="texto_negro">{$hotel->empresa->numeroFiscal}</span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><span class="texto_negro"><strong>Dirección fiscal:</strong></span></td>
                                                                            <td><span class="texto_negro">{$hotel->direccion->descripcion}</span></td>
                                                                        </tr>
                                                                        <!--<tr>
                                                                            <td><span class="texto_negro"><strong>Forma de pago:</strong></span></td>
                                                                            <td><span class="texto_negro">Transferencia bancaria</span></td>
                                                                        </tr>-->
                                                                    </table></td>
                                                            </tr>
                                                        </table></td>
                                                </tr>
                                                <tr>
                                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
                                                            <tr>
                                                                <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F5F5F5">
                                                                        <tr>
                                                                            <td bgcolor="#999999"><table width="100%" border="0" cellspacing="1" cellpadding="2" class="texto_negro">
                                                                                    <tr>
                                                                                        <td colspan="2" align="center" bgcolor="#E5E5E5"><strong>Descripción</strong></td>
                                                                                        <td align="center" bgcolor="#E5E5E5"><strong>Importe</strong></td>
                                                                                    </tr>

                                                                                    <!-- Row detalle -->
                                                                                    <tr>
                                                                                        <td colspan="2" bgcolor="#FFFFFF">Total bruto de reservas validadas</td>
                                                                                        <td align="center" bgcolor="#FFFFFF">{$totalFacturado} €</td>
                                                                                    </tr>
                                                                                    <!-- /Row detalle -->


                                                                                    <!-- Subtotal -->
                                                                                    <tr>
                                                                                        <td colspan="2" align="right" bgcolor="#E5E5E5"><span style="font-size:12px; font-weight:bold;">Total comisiones</span></td>
                                                                                        <td align="center" bgcolor="#E5E5E5"><span style="font-size:12px; font-weight:bold;">{$totalComisiones} €</span></td>
                                                                                    </tr>
                                                                                    <!-- /Subtotal -->

                                                                                    <tr>
                                                                                        <td colspan="2" align="left" bgcolor="#FFF"><span style="font-size:12px;">Impuestos y tasas</span></td>
                                                                                        <td align="center" bgcolor="#FFF"><span style="font-size:12px;">INCLUIDOS</span></td>
                                                                                    </tr>

                                                                                    <!-- Impuestos -->
                                                                                    <!--<tr>
                                                                                      <td colspan="2" bgcolor="#FFFFFF">IGIC&nbsp;(7 %)</td>
                                                                                      <td align="center" bgcolor="#FFFFFF">31,95 €</td>
                                                                                    </tr>-->
                                                                                    <!-- /Impuestos -->

                                                                                    <!-- Total -->
                                                                                    <!--<tr>
                                                                                          <td colspan="2" align="right" bgcolor="#E5E5E5"><span style="font-size:14px; font-weight:bold;">Total</span></td>
                                                                                          <td align="center" bgcolor="#E5E5E5"><span style="font-size:14px; font-weight:bold;">488,43 €</span></td>
                                                                                    </tr>-->
                                                                                    <!-- /Total -->
                                                                                </table></td>
                                                                        </tr>
                                                                    </table></td>
                                                            </tr>
                                                        </table></td>
                                                </tr>
                                                <tr>
                                                    <td><table width="100%" border="0" cellspacing="0" cellpadding="5" class="texto_negro">
                                                            <tr>
                                                                <td valign="top">
                                                                    <strong>Empresa: Booking DeTeatros S.L.</strong><br />
                                                                    <strong>Banco: Banco La Caixa</strong><br />
                                                                    <strong>Número de cuenta: ES47 2100 4505 4222 0004 4084</strong>
                                                                </td>
                                                                <td valign="top">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table></td>
                                                </tr>
                                            </table></td>
                                    </tr>
                                </table>
                            </td></tr>
                        <!-- /FACTURA -->

                        <!-- PRINT -->
                        <!-- /PRINT -->



                        <!-- DETALLE FACTURA -->
                        <tr id="detalle_factura" ><td>

                                <table width="620" border="0" align="center" cellpadding="2" cellspacing="0" bgcolor="#999999"><tr><td>

                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                <tr><td bgcolor="#E5E5E5" class="texto_negro_grande" style="font-size:14px; font-weight:bold;">Detalle de cargos facturados</td>
                                                </tr>
                                                <tr><td bgcolor="#999999" style="padding:0px;">  
                                                        <!-- Listado de cargos -->
                                                        <table width="100%" border="0" cellspacing="1" cellpadding="4" class="texto_negro"><!-- Title --><tr style="font-size:12px;"><td align="center" bgcolor="#F8F8F8"><strong>Concepto</strong></td><td width="90" align="center" bgcolor="#F8F8F8"><strong>Importe</strong></td></tr><!-- /Title --><!-- Cargos --><!-- Cargo -->
                                                            {foreach from=$reservas item=reserva}
                                                            <tr><td bgcolor="#FFFFFF">
                                                                    <table border="0" cellpadding="2" cellspacing="0" >
                                                                        <tr><td colspan="2"><span class="texto_gris_oscuro" style="padding:2px;">Reserva validada</span></td></tr>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td class="texto_gris_oscuro"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                                                    <tr>
                                                                                        <td><table cellpadding="2" cellspacing="1" width="100%" align="center" bgcolor="#CCCCCC" class="texto_gris">
                                                                                                <tr class="texto_blanco">
                                                                                                    <td height="20" colspan="2" align="center" bgcolor="#F4F4F4"><span class="texto_azul">Código</span></td>
                                                                                                    <td align="center" bgcolor="#F4F4F4"><span class="texto_azul">Nombre</span></td>
                                                                                                    <td align="center" bgcolor="#F4F4F4"><span class="texto_azul">Check-in</span></td>
                                                                                                    <td align="center" bgcolor="#F4F4F4"><span class="texto_azul">Check-out </span></td>
                                                                                                    <td align="center" bgcolor="#F4F4F4"><span class="texto_azul">Noches</span></td>
                                                                                                    <td align="center" bgcolor="#F4F4F4"><span class="texto_azul">Total</span></td>
                                                                                                    <td align="center" bgcolor="#F4F4F4"><span class="texto_azul">Comisión</span></td>
                                                                                                </tr>
                                                                                                <tr class="texto_gris" bgcolor="#FFFFFF">
                                                                                                    <td colspan="2" align="center"><a class="link_azul" style="cursor:pointer">{$reserva->localizador}</a></td>
                                                                                                    <td align="center">{$reserva->usuario->nombre} {$reserva->usuario->apellido}</td>
                                                                                                    <td align="center">{$reserva->alojamiento[0]->inicio|date_format:"%d/%m/%Y"}</td>
                                                                                                    <td align="center">{$reserva->alojamiento[0]->final|date_format:"%d/%m/%Y"}</td>
                                                                                                    <td align="center">{intval((strtotime($reserva->alojamiento[0]->final) - strtotime($reserva->alojamiento[0]->inicio))/(60*60*24))}</td>
                                                                                                    <td align="center">{$reserva->moneda->simbolo} {$reserva->alojamiento[0]->precioUnitario|number_format:2:',':' '}</td>
                                                                                                    <td align="center">{$reserva->moneda->simbolo} {$reserva->alojamiento[0]->comision|number_format:2:',':' '}</td>
                                                                                                </tr>

                                                                                            </table></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td><td align="right" bgcolor="#FFFFFF"><span class="texto_verde">{$reserva->moneda->simbolo} {$reserva->alojamiento[0]->comision|number_format:2:',':' '}</span></td>
                                                            </tr>
                                                            {/foreach}
                                                            <!-- /Cargo --><!-- /Cargos --></table>                              <!-- /Listado de cargos -->
                                                    </td>
                                                </tr>
                                                <tr><td bgcolor="#E5E5E5" style="font-size:14px; font-weight:bold;">
                                                        <!-- Total de cargos facturados -->
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="4" class="texto_gris_oscuro">
                                                            <tr>
                                                                <td align="right" style="font-size:16px; font-weight:bold; color:#666666;">Total bruto reservado</td>
                                                                <td width="90" align="right" style="font-size:16px; font-weight:bold; color:#666666;">{$hotel->moneda->simbolo}{$totalFacturado|number_format:2:',':''}</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" style="font-size:16px; font-weight:bold; color:#666666;">Total comisiones</td>
                                                                <td width="90" align="right" style="font-size:16px; font-weight:bold; color:#666666;">{$hotel->moneda->simbolo}{$totalComisiones|number_format:2:',':''}</td>
                                                            </tr>
                                                        </table>
                                                        <!-- /Total de cargos facturados -->

                                                    </td>
                                                </tr>
                                            </table>

                                        </td></tr></table>


                            </td></tr>
                        <!-- /DETALLE FACTURA -->


                        <!-- PRINT -->
                        <tr id="acciones" ><td>

                                <!-- Acciones -->
                                <table id="acciones_btns" border="0" align="center" cellpadding="0" cellspacing="0" >

                                    <tr>
                                        <!--<td><table border="0" align="center" cellpadding="5" cellspacing="0" id="btnVolver">
                                                <tr>
                                                    <td><div class="btnAtras"><a href="{$backUrl}" ><span>Volver al inicio</span></a></div></td>
                                                </tr>
                                            </table></td>
                                        <td>&nbsp;</td>-->
                                        <td>
                                            <table border="0" align="center" cellpadding="2" cellspacing="0" id="print_button_1">
                                                <tr>
                                                    <td><div class="btn_imprimir" ><a href="javascript:window.print();"><span>Imprimir</span></a></div></td>
                                                    <!--<td><table border="0" cellspacing="0" cellpadding="1">
                                                            <tr>
                                                                <td align="center"><input name="checkbchk_imprimir_factura" type="checkbox" id="checkbchk_imprimir_factura" value="1" checked="checked" /></td>
                                                                <td><label for="checkbchk_imprimir_factura" class="texto_negro_chico" style="cursor:pointer;">Factura</label></td>
                                                            </tr>
                                                        </table>
                                                        <table border="0" cellspacing="0" cellpadding="1">
                                                            <tr>
                                                                <td align="center"><input name="checkbchk_imprimir_detalle" type="checkbox" id="checkbchk_imprimir_detalle" value="1" checked="checked" /></td>
                                                                <td><label for="checkbchk_imprimir_detalle"  class="texto_negro_chico" style="cursor:pointer;">Detalle factura</label></td>
                                                            </tr>
                                                        </table>
                                                        </td>-->
                                                </tr>
                                            </table>
                                        </td>
                                        <!-- /Imprimir -->

                                    </tr>
                                </table>
                                <!-- /Acciones -->


                            </td></tr>
                        <!-- /PRINT -->
                    </table>



                </td></tr>
            <!--/COTENIDO -->

        </table>
        <!-- FOOTER POR MODULO -->
        <!-- /FOOTER POR MODULO -->
    </body>
</html>
