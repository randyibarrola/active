<style type="text/css">
	#widget_container{
		display: inline-block;
		width: {$configuracion->width}px;
	}
	#widget_header{
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		background: #{$configuracion->backgroundHeader};
		border: 1px solid #{$configuracion->borderColor};
	}
	#widget_header h3{
		margin: 0;
		color: #{$configuracion->textColorHeader};
		font-size: 17px;
		text-transform: uppercase;
		padding: 8px 3px;
		text-align: center;
	}
	#widget_body{
		margin: 0;
		padding: 10px;
		border-top: 0;
		background: #{$configuracion->backgroundBody};
		border: 1px solid #{$configuracion->borderColor};
	}
	#widget_body ul#formulario_lista{
		list-style: none;
		margin: 0px;
		padding: 0;
		overflow: auto;
	}
	#widget_body form{
		padding: 0;
		margin: 0;
	}
	#widget_body ul#formulario_lista li{
		margin-bottom: 10px;
	}
	#widget_body ul#formulario_lista li.half{
		width: 50%;
		display: inline-block;
		float: left;
	}
	#widget_body ul#formulario_lista li label{
		display: block;
		font-size: 14px;
		font-weight: 600;
		padding-bottom: 4px;
		text-align: left;
		color: #{$configuracion->textColorBody};
	}
	#widget_body ul#formulario_lista li input{
		width: 98%;
		height: 30px;
		line-height: 30px;
		background-color: #FFF;
		border: 1px solid #CCC;
		border-radius: 5px;
	}
	#widget_body ul#formulario_lista li select{
		width: 99%;
		height: 30px;
		line-height: 30px;
		background-color: #FFF;
		border: 1px solid #CCC;
	}
	#widget_body #widget_submit_button{
		cursor: pointer;
		text-transform: uppercase;
		font-size: 16px;
		font-weight: bold;
		border: 0;
		margin: 10px auto;
		border-radius: 3px;
		display: block;
		padding: 7px 11px;
		background: #{$configuracion->backgroundButton};
		color: #{$configuracion->textColorButton};
	}
</style>
<div id="widget_container">
	<div id="widget_header">
		<h3>Encuentra tu hotel</h3>
	</div>
	<div id="widget_body">
		<form action="{$enlace}" target="_blank">
			<ul id="formulario_lista">
				<li>
					<label>Zona</label>
					<select name="leavingfrom" id="leavingfrom">
						<option value="">Indiferente</option>
						{foreach from=$destinos item=destino}
						<option value="{$destino->id}">{$destino->nombre}</option>
						{/foreach}

					</select>
				</li>
				<li>
					<label>Rango de precios</label>
					<select id="going" name="going">
						<option value="">Mejor precio garantizado</option>
						<option value="1">&euro; 50 a &euro; 100</option>
						<option value="2">&euro; 100 a &euro; 150</option>
						<option value="3">M&aacute;s de &euro; 150</option>
					</select>
				</li>
			</ul>
			<input type="hidden" name="afiliado" value="1">
			<input type="submit" id="widget_submit_button" name="enter" value="Buscar ofertas">
		</form>
	</div>
</div>