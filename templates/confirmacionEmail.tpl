<div
	style="font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; margin: 1.2em; font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px">
	<table align="center" width="720" cellspacing="0" cellpadding="0"
		border="0"
		style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
		<tbody>
			<tr>
				<td
					style="text-align: center; color: rgb(0, 53, 128); font-weight: bold; font-size: 14px; padding: 10px 10px 18px"
					colspan="3">¡{#Gracias#}, {$usuario['nombre']}! {#tu_reserva_esta_confirmada#}</td>
			</tr>
			<tr>
				<td valign="top" colspan="3">
					<table cellspacing="0" cellpadding="0" border="0"
						style="width: 730px">
						<tbody>
							<tr>
								<td colspan="1">{$apartamento['titulo']}</td>
								<td align="right"
									style="font-family: Helvetica, Arial, sans-serif; font-weight: bold; font-size: 11px; color: rgb(69, 69, 69); vertical-align: middle">
									<a target="_blank"
									href="#">
										<img style="vertical-align: middle"
										src="{$template_url}/images/icon-check.png">
										<span>&nbsp;</span> {#precio_minimo_garantizado#}
								</a> 
								<!--
								<a target="_blank"
									style="white-space: nowrap; margin-left: 20px"
									href="https://www.google.com/url?q=https%3A%2F%2Fsecure.booking.com%2Fmyreservations.es.html%3Fbn%3D601465223%3Bpincode%3D9453%3Bsource%3Dconf_email%3Bpbsource%3Dconf_email_modify&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFqzSZxwI-dXkme2JpT7qzuNAuFvw">
										<span>&nbsp;</span>Gestiona tu reserva
								</a>-->
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td width="356"></td>
				<td width="10">&nbsp;</td>
				<td width="356"></td>
			</tr>
			<tr>
				<td valign="top" style="padding-bottom: 20px; width: 360px">
					<table width="100%" cellspacing="0" cellpadding="0" border="0"
						style="color: rgb(0, 53, 128)">
						<tbody>
							<tr>
								<td>
									<table cellspacing="0" cellpadding="4" border="0"
										style="color: rgb(0, 53, 128); width: 347px">
										<tbody>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(0, 53, 128); padding-top: 10px">
													<b>{#numero_de_reserva#}</b>
												</td>
												<td align="right" valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(0, 53, 128); padding-top: 10px">
													{$reserva->id}</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px">
												</td>
												<td align="right" valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px">
												</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px">
													<b>{#email#}</b>
												</td>
												<td align="right" valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px">
													<span> <a target="_blank"
														href="https://mail.google.com/mail/h/1oyhvllvsxcc7/?&amp;v=b&amp;cs=wh&amp;to=listico__@hotmail.com">
															{$usuario['email']}</a>
												</span>
												</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px; padding-bottom: 10px">
													<b>{#reserva_realizada_por#}:</b>
												</td>
												<td align="right" valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px; padding-bottom: 10px">
													<span>{$usuario['nombre']} {$usuario['apellido']}</span>
												</td>
											</tr>
										</tbody>
									</table>
									<table cellspacing="0" cellpadding="4" border="0"
										style="color: rgb(0, 53, 128); width: 347px">
										<tbody>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(0, 53, 128); padding-top: 10px"
													colspan="2">
													<table width="100%" cellspacing="0" cellpadding="0"
														border="0" style="color: rgb(0, 53, 128)">
														<tbody>
															<tr>
																<td
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
																	<b>{#tu_reserva#}:</b>
																</td>
																<td align="right"
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
																	{$noches} noche{if $noches > 1}s{/if}, {$cantidad} apartamento{if $cantidad > 1}s{/if}</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 14px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px"
													colspan="2">
													<table width="100%" cellspacing="0" cellpadding="0"
														border="0" style="color: rgb(0, 53, 128)">
														<tbody>
															<tr valign="top">
																<td width=" 75"
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
																	<b>{#entrada#}:</b>
																</td>
																<td align="right"
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
																	<u> </u> {$entrada|date_format} <u> </u> <br>
																	<i style="color: rgb(85, 85, 85); white-space: nowrap"></i>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 14px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px; padding-bottom: 10px"
													colspan="2">
													<table width="100%" cellspacing="0" cellpadding="0"
														border="0" style="color: rgb(0, 53, 128)">
														<tbody>
															<tr valign="top">
																<td width="75"
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
																	<b>{#salida#}:</b>
																</td>
																<td align="right" width="237"
																	style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
																	<u> </u> {$salida|date_format} <span>&nbsp;</span>
																	<br> <i
																	style="color: rgb(85, 85, 85); white-space: nowrap"></i> <u></u>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 14px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding: 0px 12px 10px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); text-align: right"
													colspan="2"><br></td>
											</tr>
										</tbody>
									</table>
									<table cellspacing="0" cellpadding="4" border="0"
										style="color: rgb(0, 53, 128); width: 347px">
										<tbody>
											<tr>
												<td valign="top"
													style="font-weight: normal; font-size: 11px; line-height: 15px; margin: 8px 0px 4px; font-family: Helvetica, Arial, sans-serif; background-color: rgb(230, 237, 246); border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(0, 53, 128); padding-top: 10px">
													<b>{$apartamento['titulo']}</b>
												</td>
												<td align="right" valign="top"
													style="font-weight: normal; font-size: 11px; line-height: 15px; margin: 8px 0px 4px; font-family: Helvetica, Arial, sans-serif; background-color: rgb(230, 237, 246); border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(0, 53, 128); padding-top: 10px">
													&nbsp; {$apartamento['precioTotal_format']}</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-weight: bold; font-size: 11px; line-height: 14px; margin: 8px 0px 4px; font-family: Helvetica, Arial, sans-serif; background-color: rgb(230, 237, 246); border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px">
													<!--Impuesto (7%) incluido--></td>
												<td align="right" valign="top"
													style="font-weight: normal; font-size: 11px; line-height: 14px; margin: 8px 0px 4px; font-family: Helvetica, Arial, sans-serif; background-color: rgb(230, 237, 246); border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px">
													<!--&nbsp; € 3,70--></td>
											</tr>
											<tr>
												<td valign="top"
													style="color: rgb(0, 53, 128); font-weight: bold; font-size: 16px; font-family: Helvetica, Arial, sans-serif; line-height: 25px; background-color: rgb(230, 237, 246); border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px">
													Precio total</td>
												<td align="right" valign="top"
													style="color: rgb(0, 53, 128); font-weight: normal; font-size: 16px; font-family: Helvetica, Arial, sans-serif; line-height: 25px; background-color: rgb(230, 237, 246); border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px; white-space: nowrap">
													{$precioTotal}</td>
											</tr>
											<tr>
												<td valign="top"
													style="font-weight: normal; font-size: 11px; font-family: Helvetica, Arial, sans-serif; line-height: 14px; background-color: rgb(230, 237, 246); border-left-width: 1px; border-left-style: solid; border-left-color: rgb(0, 53, 128); padding-left: 12px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(0, 53, 128); padding-right: 12px"
													colspan="2"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td></td>
				<td valign="top">
					<table width="100%" cellspacing="0" cellpadding="0" border="0"
						style="padding: 10px; color: rgb(0, 53, 128)" valign="top">
						<tbody>
							<tr>
								<td
									style="color: rgb(0, 53, 128); font-weight: bold; font-size: 16px; padding-bottom: 10px"
									colspan="2"><a target="_blank"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 16px; line-height: 15px; font-weight: bold; color: rgb(0, 0, 238); text-decoration: underline"
									title="Información del hotel"
									href="http://or.vikatickets.com">
										<span>{$hotel->nombres->es}</span>
								</a> <span style="white-space: nowrap"> </span> <span
									style="white-space: nowrap"> </span></td>
							</tr>
							<tr>
								<td valign="top"
									style="font-weight: normal; font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px">
									<b>{#direccion#}:</b>
								</td>
								<td valign="top"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
									<span>{$hotel->direccion->descripcion}</span> <br> 
									<br>
								</td>
							</tr>
							<tr>
								<td valign="top"
									style="font-weight: normal; font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px">
									<b>{#telefono#}:</b>
								</td>
								<td valign="top"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
									<span>{$hotel->empresa->telefonoReservas}</span>
								</td>
							</tr>
							<tr>
								<td valign="top"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: bold">
									{#email#}:</td>
								<td valign="top"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
									<a target="_blank"
									href="mailto:{$hotel->empresa->emailReservas}">
										<span>{$hotel->empresa->emailReservas}</span>
								</a>
								</td>
							</tr>
							<tr>
								<td valign="top"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: bold; padding-bottom: 10px">
									{#como_llegar#}:</td>
								<td valign="top"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; padding-bottom: 10px">
									<a target="_blank"
									href="http://or.vikatickets.com/">
										{#mostrar_itinerario#} </a> &nbsp;({#aqui_lo_llevas_a_su_confirmacion#})
								</td>
							</tr>
							<tr>
								<td align="center" style="height: 255px" colspan="2"><img
									width="354" height="255" border="0" style="display: block"
									src="http://maps.googleapis.com/maps/api/staticmap?center={$hotel->direccion->lat},{$hotel->direccion->lon}&zoom=15&size=608x194&sensor=true&markers=color:red|label:{$hotel->nombres->es}|{$hotel->direccion->lat},{$hotel->direccion->lon}">
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td style="height: 20px; font-size: 11px; line-height: 20px">&nbsp;</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td valign="top">
					<table width="100%" cellspacing="0" cellpadding="0" border="0"
						valign="top">
						<tbody>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-top-width: 1px; border-top-style: solid; border-color: rgb(205, 205, 205); padding: 10px 12px 0px; border-left-width: 1px; border-left-style: solid; border-right-width: 1px; border-right-style: solid; margin-bottom: 0px"
									colspan="2">
									<h2
										style="color: rgb(0, 53, 128); font-weight: bold; font-size: 14px">
										{#datos_del_establecimiento#}</h2>
								</td>
							</tr>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px; border-right-width: 1px; border-right-style: solid; padding-right: 12px"
									colspan="2"></td>
							</tr>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px; border-right-width: 1px; border-right-style: solid; padding-right: 12px"
									colspan="2">
									<p>Este apartamento dispone de {foreach from=$apartamento['servicios'] item=servicio name=servicios}{if !$smarty.foreach.servicios.first && !$smarty.foreach.servicios.last}, {/if}{if !$smarty.foreach.servicios.first && $smarty.foreach.servicios.last} y {/if}{$servicio}{/foreach}</p>
								</td>
							</tr>
							<tr>
								<td width="80"
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px">
									Nombre del cliente:</td>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-right-width: 1px; border-right-style: solid; border-color: rgb(205, 205, 205); padding-right: 12px">
									{$usuario['nombre']} {$usuario['apellido']}</td>
							</tr>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px; border-right-width: 1px; border-right-style: solid; padding-right: 12px"
									colspan="2">para 2 adultos, 2 niños (hasta 2 años)</td>
							</tr>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px; border-right-width: 1px; border-right-style: solid; padding-right: 12px; padding-top: 10px"
									colspan="2"></td>
							</tr>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px; border-right-width: 1px; border-right-style: solid; padding-right: 12px; border-bottom-width: 1px; border-bottom-style: solid; padding-bottom: 10px"
									colspan="2">
									<div
										style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
										<h4
											style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: bold; margin: 5px 0px">
											<br>
										</h4>
										<div
											style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal">
											<div>
												<h4
													style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: bold; margin: 5px 0px">
													Pago por adelantado:</h4>
												<ul
													style="margin-top: 0px; margin-bottom: 0px; padding-left: 21px">
													<li>No se cargará ningún depósito.</li>
												</ul>
											</div>
											<h4
												style="font-weight: bold; font-size: 11px; line-height: 15px; margin: 8px 0px 4px">
												Cargos de cancelación hora local del hotel:</h4>
											<ul
												style="margin-top: 0px; margin-bottom: 0px; padding-left: 21px">
												<li>Hasta 9 de noviembre de 2013 23:59 [Corralejo] :
													EUR 0</li>
												<li>Desde 10 de noviembre de 2013 00:00 [Corralejo] :
													EUR 56.50</li>
											</ul>
											<div
												style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; margin-top: 10px">
												<a target="_blank"
													href="https://www.secure.booking.com/myreservations.es.html">
													Cancelar tu reserva </a>
											</div>
											<div
												style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; margin-top: 10px; font-style: normal">
												El alojamiento es el encargado de determinar los cargos de
												cancelación o de modificación. Cualquier tipo de gasto
												adicional lo pagarás al alojamiento.</div>
											< /div>
										</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td></td>
				<td valign="top">
					<table width="100%" cellspacing="0" cellpadding="0" border="0"
						style="padding: 0px 10px" valign="top">
						<tbody>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px; border-right-width: 1px; border-right-style: solid; padding-right: 12px; border-top-width: 1px; border-top-style: solid; padding-top: 10px"
									colspan="2">
									<h3
										style="color: rgb(0, 53, 128); font-weight: bold; font-size: 14px">
										Condiciones del hotel</h3>
								</td>
							</tr>
							<tr>
								<td
									style="font-family: Helvetica, Arial, sans-serif; font-size: 11px; line-height: 15px; font-weight: normal; border-left-width: 1px; border-left-style: solid; border-color: rgb(205, 205, 205); padding-left: 12px; border-right-width: 1px; border-right-style: solid; padding-right: 12px; border-bottom-width: 1px; border-bottom-style: solid; padding-bottom: 10px"
									colspan="2">
									<h4
										style="font-weight: bold; font-size: 11px; line-height: 15px; margin: 8px 0px 4px">{$apartamento['condicion']}.
									</h4>
									
									<h4
										style="color: rgb(0, 53, 128); font-weight: bold; font-size: 12px; margin-bottom: 0px">¿Necesitas
										ayuda?</h4>
									<p style="margin: 5px 0px; text-indent: 0px">
										Si tienes preguntas sobre el establecimiento, puedes ponerte
										en contacto con el Oasis Duna en el # o a
										través de <a target="_blank"
											href="mailto:direccion@email.com">
											direccion@unhotel.es </a>
									</p>
									<p style="margin: 5px 0px">
										Si quieres hacer algún cambio en tu reserva, entra en<span>&nbsp;</span>
										<a target="_blank"
											href="http://or.vikatickets.com/">
											Mi outlet-rooms.com </a>.
									</p>
									<p style="margin: 5px 0px; text-indent: 0px">
										También puedes ponerte en contacto con nuestro servicio de
										Atención al cliente.<span>&nbsp;</span> <a target="_blank"
											title="Tu número de referencia es “--”" rel="nofollow"
											href="http://or.vikatickets.com/">
											Envíanos un mensaje </a> <span>&nbsp;</span> o llámanos al:
									</p>
									<div
										style="margin: 5px 0px; font-weight: normal; text-indent: 0px">
										<br>
									</div>
									<div>
										<b>Número local:</b> <span>&nbsp;</span> <span
											style="direction: ltr">+123123123</span> <br>
										<b> Otros países : <span>&nbsp;</span></b> <span
											style="direction: ltr">+123123123<br>
										</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td style="height: 10px"></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td
					style="padding-top: 10px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(205, 205, 205)"
					colspan="3">
					<h2
						style="color: rgb(0, 53, 128); font-weight: bold; font-size: 12px">
						Pago</h2>
					<p>Se ha realizado el pago correctamente.</p>
					<p
						style="font-family: Georgia, serif; color: rgb(0, 53, 128); font-size: 16px; text-align: right">
						<i style="line-height: 22px">¡Buen viaje!</i> <br>-<span>&nbsp;</span>
						<span style="font-size: 14px">El equipo de <a
							target="_blank"
							href="{$base_url}">OasisDuna.com</a>
						</span>
					</p>
				</td>
			</tr>
			
		</tbody>
	</table>
</div>