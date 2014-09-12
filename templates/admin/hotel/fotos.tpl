{foreach from=$adjuntos item=adjunto}
    <div class="dz-preview dz-processing dz-image-preview dz-success">
        <div class="dz-details">
            <div class="dz-filename"><span data-dz-name>{$adjunto->nombre}</span></div>
            <div class="dz-size" data-dz-size></div>
            <img data-dz-thumbnail alt="{$adjunto->nombre}" src="{$adjunto->ruta}"/>
        </div>
        <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress style="width: 100%;"></span></div>
        <div class="dz-success-mark"><span></span></div>
        <div class="dz-error-mark"><span></span></div>
        <div class="dz-error-message"><span data-dz-errormessage></span></div>
        <a href="#" class="dz-remove delete_foto" data-deptoadj="{$adjunto->id}" data-ruta="{$adjunto->ruta}">Borrar foto</a>
    </div>
{/foreach}