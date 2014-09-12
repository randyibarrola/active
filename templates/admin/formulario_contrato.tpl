{extends file="admin/login_template.tpl"}

{block name="main_content" append}
<!-- BEGIN LOGIN FORM -->
<div class="content" style="margin-top:60px;">
<form class="login-form"  method="post">
        <h3 class="form-title">Datos del contrato</h3>
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
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Nombre del hotel" name="hotel"/>
            </div>
        </div>

        <div class="form-group">
            <div class="input-icon">
                
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="CIF" name="cif"/>
            </div>
        </div>

        <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="NIF" name="nif"/>
            </div>
        </div>

        <div class="form-group">
            <div class="input-icon">
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Ciudad" name="ciudad"/>
            </div>
        </div>

        <div class="form-actions">
                <button type="submit" class="btn blue pull-right">
                Crear contrato <i class="m-icon-swapright m-icon-white"></i>
                </button>            
        </div>
</form>
</div>
<!-- END LOGIN FORM -->
{/block}