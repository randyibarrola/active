<a class="favorito" href="#" title="{if $hotel.destacado}Desmarcar{else}Marcar{/if} como favorito" hotel-id="{$hotel.id}"><img src="{$template_url}/images/icons/star-o{if $hotel.destacado}n{else}ff{/if}.png" width="14px" style="margin-top: -4px;"></a>
<a target="_blank" href="{if strpos($hotel.subdominio, 'http://') eq FALSE}http://{/if}{$hotel.subdominio}" title="Web oficial"><span class="fa fa-home"></span></a>
<a href="{$base_url}/admin-reserva-lista/id:{$hotel.id}{$end_url}" title="Reservas"><span class="fa fa-file-text"></span></a>
<a href="{$base_url}/admin-hotel-gestion/id:{$hotel.id}{$end_url}" title="Editar"><span class="fa fa-pencil"></span></a>
<a hotel-id="{$hotel.id}" class="delete" href="#" title="Eliminar"><span class="fa fa-trash-o"></span></a>