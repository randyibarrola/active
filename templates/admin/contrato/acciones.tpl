<a target="_blank" href="{if strpos($campania.subdominio, 'http://') eq FALSE}http://{/if}{$campania.subdominio}" title="Web oficial"><span class="fa fa-home"></span></a>
{if $campania.estado ne 'Pendiente'}<a href="{$base_url}/admin-contrato-ver/id:{$campania.id}{$end_url}" title="Ver contrato"><i class="fa fa-file"></i></a>
{/if}
<a campania-id="{$campania.id}" class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>
{if $campania.estado eq 'Aprobada'}
   
    {if $campania.tipo eq 'hotel'}
		<a href="{$base_url}/admin-hotel-gestion/{if $campania.hotel_id}id:{$campania.hotel_id}{else}c:{$campania.id}{/if}" title="{if $campania.hotel_id}Editar{else}Crear{/if} hotel"><span class="fa fa-building-o"></span></a>
    {/if}

    {if $campania.tipo eq 'evento'}
    	<a href="{$base_url}/admin-evento-gestion/c:{$campania.id}" title="Crear evento"><span class="fa fa-calendar"></span></a>
    {/if}
   
    <a href="{$base_url}/admin-reserva-lista/id:{$campania.hotel_id}{$end_url}" title="Reservas"><span class="fa fa-file-text"></span></a>
{/if}