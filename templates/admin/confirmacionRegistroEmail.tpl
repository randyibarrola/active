<h2>Gracias por registrarse en {#sistema_nombre#}</h2><br>
    <h3>Sus datos de usuario</h3><br>
<strong>Email:</strong>    {$usuario->email}<br>
<strong>Contraseña:</strong> {$usuario->password}<br>
<strong>Nombre completo:</strong> {$usuario->nombre} {$usuario->apellido}<br><br>
<h3>Datos de su empresa</h3><br>
<strong>Nombre:</strong>   {$empresa['nombre']}<br>
<h3>Productos</h3><br>
    {foreach from=$hoteles item=h}
        <strong>Nombre:</strong>   {$h}<br>
    {/foreach}

Para entrar al panel haga click <a href="{$base_url}/admin-login/">aqui</a> e inicie sesión con su email y contraseña.