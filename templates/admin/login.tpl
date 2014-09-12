{extends file="admin/login_template.tpl"}

{block name="main_content" append}
<!-- BEGIN LOGIN FORM -->
<div class="content">
<form class="login-form" action="{$base_url}/admin-login" method="post">
        <h3 class="form-title">Inicia sesión con tu cuenta</h3>
        {if $errmsg}
        <div class="alert alert-danger">
                <span>{$errmsg}</span>
        </div>
        {/if}
        {if $regmsg}
        <div class="alert alert-success">
                <span>{$regmsg}</span>
        </div>
        {/if}
        <div class="form-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">Correo electrónico</label>
                <div class="input-icon">
                        <i class="fa fa-user"></i>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Correo electrónico" name="username" {if $usuario}value="{$usuario}"{/if}/>
                </div>
        </div>
        <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">Contraseña</label>
                <div class="input-icon">
                        <i class="fa fa-lock"></i>
                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Contraseña" name="password"/>
                </div>
        </div>
        <div class="form-actions">
                <label class="checkbox pull-left">
                <input type="checkbox" name="remember" value="1"/> Recuerdame
                </label>
                <button type="submit" class="btn blue pull-right">
                Login <i class="m-icon-swapright m-icon-white"></i>
                </button>            
        </div>
        <div class="create-account">
        <p>
                 No tienes una cuenta ?&nbsp; <a href="{$base_url}/admin-register" >Crear una cuenta</a>
        </p>
</div>
</form>
</div>
<!-- END LOGIN FORM -->
{/block}