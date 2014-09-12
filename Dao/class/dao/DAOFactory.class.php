<?php

/**
 * DAOFactory
 * @author: http://phpdao.com
 * @date: ${date}
 */
class DAOFactory{
	
	/**
	 * @return AdwordDAO
	 */
	public static function getAdwordDAO(){
		return new AdwordMySqlExtDAO();
	}

	/**
	 * @return AdwordPaisDAO
	 */
	public static function getAdwordPaisDAO(){
		return new AdwordPaisMySqlExtDAO();
	}

	/**
	 * @return AfiliadoDAO
	 */
	public static function getAfiliadoDAO(){
		return new AfiliadoMySqlExtDAO();
	}

	/**
	 * @return AfiliadoEventoDAO
	 */
	public static function getAfiliadoEventoDAO(){
		return new AfiliadoEventoMySqlExtDAO();
	}

	/**
	 * @return AfiliadoHotelDAO
	 */
	public static function getAfiliadoHotelDAO(){
		return new AfiliadoHotelMySqlExtDAO();
	}

	/**
	 * @return AfiliadoRegistroDAO
	 */
	public static function getAfiliadoRegistroDAO(){
		return new AfiliadoRegistroMySqlExtDAO();
	}

	/**
	 * @return AfiliadoWidgetDAO
	 */
	public static function getAfiliadoWidgetDAO(){
		return new AfiliadoWidgetMySqlExtDAO();
	}

	/**
	 * @return ApartamentoDAO
	 */
	public static function getApartamentoDAO(){
		return new ApartamentoMySqlExtDAO();
	}

	/**
	 * @return ApartamentoArchivoDAO
	 */
	public static function getApartamentoArchivoDAO(){
		return new ApartamentoArchivoMySqlExtDAO();
	}

	/**
	 * @return ApartamentoCondicionDAO
	 */
	public static function getApartamentoCondicionDAO(){
		return new ApartamentoCondicionMySqlExtDAO();
	}

	/**
	 * @return ApartamentoServicioDAO
	 */
	public static function getApartamentoServicioDAO(){
		return new ApartamentoServicioMySqlExtDAO();
	}

	/**
	 * @return ArchivoDAO
	 */
	public static function getArchivoDAO(){
		return new ArchivoMySqlExtDAO();
	}

	/**
	 * @return BlacklistDAO
	 */
	public static function getBlacklistDAO(){
		return new BlacklistMySqlExtDAO();
	}

	/**
	 * @return BusquedaDisponibilidadDAO
	 */
	public static function getBusquedaDisponibilidadDAO(){
		return new BusquedaDisponibilidadMySqlExtDAO();
	}

	/**
	 * @return CampaniaDAO
	 */
	public static function getCampaniaDAO(){
		return new CampaniaMySqlExtDAO();
	}

	/**
	 * @return CampaniaPeriodoDAO
	 */
	public static function getCampaniaPeriodoDAO(){
		return new CampaniaPeriodoMySqlExtDAO();
	}

	/**
	 * @return CondicionDAO
	 */
	public static function getCondicionDAO(){
		return new CondicionMySqlExtDAO();
	}

	/**
	 * @return CondicionCategoriaDAO
	 */
	public static function getCondicionCategoriaDAO(){
		return new CondicionCategoriaMySqlExtDAO();
	}

	/**
	 * @return ConfiguracionDAO
	 */
	public static function getConfiguracionDAO(){
		return new ConfiguracionMySqlExtDAO();
	}

	/**
	 * @return ConfiguracionEventoDAO
	 */
	public static function getConfiguracionEventoDAO(){
		return new ConfiguracionEventoMySqlExtDAO();
	}

	/**
	 * @return CuponDAO
	 */
	public static function getCuponDAO(){
		return new CuponMySqlExtDAO();
	}

	/**
	 * @return DestinoArchivoDAO
	 */
	public static function getDestinoArchivoDAO(){
		return new DestinoArchivoMySqlExtDAO();
	}

	/**
	 * @return DestinoLugaresDAO
	 */
	public static function getDestinoLugaresDAO(){
		return new DestinoLugaresMySqlExtDAO();
	}

	/**
	 * @return DestinoTuristicoDAO
	 */
	public static function getDestinoTuristicoDAO(){
		return new DestinoTuristicoMySqlExtDAO();
	}

	/**
	 * @return DireccionDAO
	 */
	public static function getDireccionDAO(){
		return new DireccionMySqlExtDAO();
	}

	/**
	 * @return EmpresaDAO
	 */
	public static function getEmpresaDAO(){
		return new EmpresaMySqlExtDAO();
	}

	/**
	 * @return EmpresaTipoDAO
	 */
	public static function getEmpresaTipoDAO(){
		return new EmpresaTipoMySqlExtDAO();
	}

	/**
	 * @return EventoDAO
	 */
	public static function getEventoDAO(){
		return new EventoMySqlExtDAO();
	}

	/**
	 * @return EventoArchivoDAO
	 */
	public static function getEventoArchivoDAO(){
		return new EventoArchivoMySqlExtDAO();
	}

	/**
	 * @return EventoCondicionDAO
	 */
	public static function getEventoCondicionDAO(){
		return new EventoCondicionMySqlExtDAO();
	}

	/**
	 * @return FacturaDAO
	 */
	public static function getFacturaDAO(){
		return new FacturaMySqlExtDAO();
	}

	/**
	 * @return FacturaReservaDAO
	 */
	public static function getFacturaReservaDAO(){
		return new FacturaReservaMySqlExtDAO();
	}

	/**
	 * @return FaqDAO
	 */
	public static function getFaqDAO(){
		return new FaqMySqlExtDAO();
	}

	/**
	 * @return HotelDAO
	 */
	public static function getHotelDAO(){
		return new HotelMySqlExtDAO();
	}

	/**
	 * @return HotelArchivoDAO
	 */
	public static function getHotelArchivoDAO(){
		return new HotelArchivoMySqlExtDAO();
	}

	/**
	 * @return HotelCondicionDAO
	 */
	public static function getHotelCondicionDAO(){
		return new HotelCondicionMySqlExtDAO();
	}

	/**
	 * @return HotelDestinoLugarDAO
	 */
	public static function getHotelDestinoLugarDAO(){
		return new HotelDestinoLugarMySqlExtDAO();
	}

	/**
	 * @return HotelDireccionDAO
	 */
	public static function getHotelDireccionDAO(){
		return new HotelDireccionMySqlExtDAO();
	}

	/**
	 * @return HotelDominiosDAO
	 */
	public static function getHotelDominiosDAO(){
		return new HotelDominiosMySqlExtDAO();
	}

	/**
	 * @return HotelFechasDAO
	 */
	public static function getHotelFechasDAO(){
		return new HotelFechasMySqlExtDAO();
	}

	/**
	 * @return HotelIdiomaDAO
	 */
	public static function getHotelIdiomaDAO(){
		return new HotelIdiomaMySqlExtDAO();
	}

	/**
	 * @return HotelMonedaDAO
	 */
	public static function getHotelMonedaDAO(){
		return new HotelMonedaMySqlExtDAO();
	}

	/**
	 * @return HotelPrecioDAO
	 */
	public static function getHotelPrecioDAO(){
		return new HotelPrecioMySqlExtDAO();
	}

	/**
	 * @return HotelServicioDAO
	 */
	public static function getHotelServicioDAO(){
		return new HotelServicioMySqlExtDAO();
	}

	/**
	 * @return IdiomaDAO
	 */
	public static function getIdiomaDAO(){
		return new IdiomaMySqlExtDAO();
	}

	/**
	 * @return MailDAO
	 */
	public static function getMailDAO(){
		return new MailMySqlExtDAO();
	}

	/**
	 * @return MailTipoDAO
	 */
	public static function getMailTipoDAO(){
		return new MailTipoMySqlExtDAO();
	}

	/**
	 * @return MonedaDAO
	 */
	public static function getMonedaDAO(){
		return new MonedaMySqlExtDAO();
	}

	/**
	 * @return PaisDAO
	 */
	public static function getPaisDAO(){
		return new PaisMySqlExtDAO();
	}

	/**
	 * @return PermisoDAO
	 */
	public static function getPermisoDAO(){
		return new PermisoMySqlExtDAO();
	}

	/**
	 * @return PromocionDAO
	 */
	public static function getPromocionDAO(){
		return new PromocionMySqlExtDAO();
	}

	/**
	 * @return ReglasCuponesDAO
	 */
	public static function getReglasCuponesDAO(){
		return new ReglasCuponesMySqlExtDAO();
	}

	/**
	 * @return ReservaDAO
	 */
	public static function getReservaDAO(){
		return new ReservaMySqlExtDAO();
	}

	/**
	 * @return ReservaAfiliadoDAO
	 */
	public static function getReservaAfiliadoDAO(){
		return new ReservaAfiliadoMySqlExtDAO();
	}

	/**
	 * @return ReservaPagoDAO
	 */
	public static function getReservaPagoDAO(){
		return new ReservaPagoMySqlExtDAO();
	}

	/**
	 * @return ReservaProductoDAO
	 */
	public static function getReservaProductoDAO(){
		return new ReservaProductoMySqlExtDAO();
	}

	/**
	 * @return ServicioDAO
	 */
	public static function getServicioDAO(){
		return new ServicioMySqlExtDAO();
	}

	/**
	 * @return ServicioCategoriaDAO
	 */
	public static function getServicioCategoriaDAO(){
		return new ServicioCategoriaMySqlExtDAO();
	}

	/**
	 * @return ShoppingCartDAO
	 */
	public static function getShoppingCartDAO(){
		return new ShoppingCartMySqlExtDAO();
	}

	/**
	 * @return TelefonoDAO
	 */
	public static function getTelefonoDAO(){
		return new TelefonoMySqlExtDAO();
	}

	/**
	 * @return TelefonoTipoDAO
	 */
	public static function getTelefonoTipoDAO(){
		return new TelefonoTipoMySqlExtDAO();
	}

	/**
	 * @return TicketDAO
	 */
	public static function getTicketDAO(){
		return new TicketMySqlExtDAO();
	}

	/**
	 * @return TicketFechaDAO
	 */
	public static function getTicketFechaDAO(){
		return new TicketFechaMySqlExtDAO();
	}

	/**
	 * @return UsuarioDAO
	 */
	public static function getUsuarioDAO(){
		return new UsuarioMySqlExtDAO();
	}

	/**
	 * @return UsuarioCuentaDAO
	 */
	public static function getUsuarioCuentaDAO(){
		return new UsuarioCuentaMySqlExtDAO();
	}

	/**
	 * @return UsuarioEmpresaDAO
	 */
	public static function getUsuarioEmpresaDAO(){
		return new UsuarioEmpresaMySqlExtDAO();
	}

	/**
	 * @return UsuarioGrupoDAO
	 */
	public static function getUsuarioGrupoDAO(){
		return new UsuarioGrupoMySqlExtDAO();
	}

	/**
	 * @return UsuarioPermisoDAO
	 */
	public static function getUsuarioPermisoDAO(){
		return new UsuarioPermisoMySqlExtDAO();
	}


}
?>