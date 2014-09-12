{extends file="admin/index.tpl"}
{block name="style" append}
{/block}
{block name="main_content" append}
<div class="page-container row-fluid">
    <div class="page-content">
        <div class="container-fluid">
			<div>
		        <div class="row">
                    <div class="col-md-6">
                        <h3 class="form-section">Códigos de enlace</h3>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label">Tu enlace directo</label>
                                <input id="enlace_directo" type="text" name="enlace" class="form-control" value="{$enlace}">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label">Código del banner</label>
                                <textarea id="widget_codigo" class="form-control" rows="15">{$widget}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3 class="form-section">Previsualiza tu widget</h3>
                        <div class="col-md-12">
                            <div class="centered" id="widget_html">{$widget}</div>
                        </div>
                    </div>
                </div>
		        <br class="clear" />
		        <div class="row">
		            <div class="col-md-12 centered">
		                <a class="btn btn-success" href="{$base_url}/admin-widget-lista">Finalizar</a>
		            </div>
		        </div>
			</div>
		</div>
	</div>
</div>
{/block}