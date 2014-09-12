{extends file="admin/login_template.tpl"}
{block name="style" append}
    <link href="{$template_url}/admin/assets/css/pages/register.css" rel="stylesheet" type="text/css"/>
{/block}

{block name="main_content" append}   
<div class="content">
		<form class="register-form" method="post" novalidate="novalidate">
		<h3>Reg&iacute;strate</h3>
		<!--<p>
			 Datos básicos:
		</p>-->
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Nombre</label>
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control placeholder-no-fix" type="text" placeholder="Nombre" name="nombre">
			</div>
		</div>
                <div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Apellidos</label>
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control placeholder-no-fix" type="text" placeholder="Apellidos" name="apellido">
			</div>
		</div>
                <div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">DNI</label>
			<div class="input-icon">
				<i class="fa fa-credit-card"></i>
				<input class="form-control placeholder-no-fix" type="text" placeholder="DNI" name="dni">
			</div>
		</div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Empresa</label>
			<div class="input-icon">
				<i class="fa fa-building-o"></i>
                                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Empresa" name="empresa">
			</div>
		</div>
                
                <div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Puesto de trabajo</label>
			<div class="input-icon">
				<i class="fa fa-archive"></i>
				<input class="form-control placeholder-no-fix" type="text" placeholder="Puesto de trabajo" name="puestoTrabajo">
			</div>
		</div>
                <div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Correo electr&oacute;nico</label>
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Correo electr&oacute;nico" name="email">
			</div>
		</div>
                <div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Tel&eacute;fono de oficina</label>
			<div class="input-icon">
				<i class="fa fa-phone"></i>
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Tel&eacute;fono de oficina" name="telefono">
			</div>
		</div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Tel&eacute;fono m&oacute;vil</label>
			<div class="input-icon">
				<i class="fa fa-phone"></i>
                                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Tel&eacute;fono m&oacute;vil" name="movil">
			</div>
		</div>
                <!--
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Comisión</label>
			<div class="input-icon">
				<i class="fa fa-money"></i>
                                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Comisión" name="porcentajeBeneficio">
			</div>
		</div>
                -->
                <p class="form-section">Productos: <a id="addProductBtn" href="javascript:void(0)" title="Agregar producto" style="float: right;"><i class="fa fa-plus"></i></a></p>
                <div class="row-fluid" id="hoteles">
                    <div class="form-group">
                        <label class="control-label visible-ie8 visible-ie9">Nombre</label>
                        <div class="input-icon">
                                <i class="fa fa-building-o"></i>
                                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Hotel California" name="hotel[]">
                        </div>
                    </div>
                </div>
                <div class="form-group hidden hotel-clone">
                    <label class="control-label visible-ie8 visible-ie9">Nombre</label>
                    <div class="input-icon">
                            <i class="fa fa-building-o"></i>
                            <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Hotel California" name="hotel[]" disabled="">
                    </div>
                </div>
		<div class="form-group">
                        <label>Click para ver la <a id="ley_link" href="">Ley de protección de datos</a></label>
                        <label class="checkbox">
                            <input type="checkbox" name="tnc"> I agree to the <a href="#" id="terminos_link">Terms of Service</a> and <a href="#" id="privacidad_link">Privacy Policy</a>
			</label>
			<div id="register_tnc_error">
			</div>
		</div>
		<div class="form-actions">
			<a id="register-back-btn" href="{$base_url}/admin-login" class="btn">
			<i class="m-icon-swapleft"></i> Atras </a>
			<button type="submit" id="register-submit-btn" class="btn green pull-right">
			Registrar <i class="m-icon-swapright m-icon-white"></i>
			</button>
		</div>
	</form>
  </div>                      
        
{/block}