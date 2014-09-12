<style type="text/css">
	#banner_container{
		display: inline-block;
		position: relative;
		width: {$configuracion->width}px;
	}
	#banner_container h5{
		padding: 3px 3px;
		margin: 0;
		font-size: 14px;
		text-align: left;
		color: #{$configuracion->textColorBody};
	}
	#banner_container img{
		width: 100%;
	}
	#banner_container #banner_content{
		position: absolute;
		bottom: 0px;
		background: rgba({$rgb}, 0.5);
		width: 100%;
	}
	#banner_container #banner_content p{
		margin: 3px 4px 7px;
		font-size: 11px;
		text-align: left;
		color: #{$configuracion->textColorBody};
	}
	#banner_container #banner_content p a#banner_anchor{
		text-decoration: none;
		float: right;
		padding: 3px;
		position: absolute;
		bottom: 4px;
		right: 4px;
		border-radius: 2px!important;
		font-size: 12px;
		text-align: center;
		background: #{$configuracion->backgroundButton};
		color: #{$configuracion->textColorBody};
	}
</style>
<div id="banner_container">
	<img src="{$image->ruta}">
	<div id="banner_content">
		<h5>{$hotel_h->nombre}</h5>
		<p>
			{$destino->nombre}
			<a id="banner_anchor" target="_blank" href="{$enlace}">Reserva desde &euro; {$hotel_h->precioMinimo->precioMinimo|number_format:2:',':' '}</a>
		</p>
	</div>
</div>