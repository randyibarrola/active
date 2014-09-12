{extends file="admin/index.tpl"}
{block name="script" append}
    <script type="text/javascript" src="{$template_url}/js/colorpicker.js"></script>
    <script type="text/javascript" src="{$template_url}/js/admin/widget-gestion.js"></script>
{/block}
{block name="style" append}
    <link rel="stylesheet" href="{$template_url}/css/colorpicker.css" >
{/block}
{block name="main_content" append}
<div class="page-container row-fluid">
    <div class="page-content">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <h3 class="page-title">Widgets
                        <small>Asistente para las creación de widgets.</small>
                    </h3>
                </div>
            </div>
            <div class="row-fluid">
                <div class="col-md-12 responsive" data-tablet="span12 fix-offset">
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-reorder"></i>
                                <span class="step-title">
                                        Paso 1 de 2
                                </span>
                            </div>
                        </div>
                        <div class="portlet-body form">
                                <div class="form-body form-wizard">
                                    <ul class="nav nav-pills nav-justified steps">
                                        <li class="active">
                                            <a href="#tipoDiv" data-toggle="tab" class="step">
                                                <span class="number">1</span>
                                                <span class="desc"><i class="fa fa-check"></i> Tipo de widget</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#configuracionDiv" data-toggle="tab" class="step">
                                                <span class="number">2</span>
                                                <span class="desc"><i class="fa fa-check"></i> Configuración</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#finalizarDiv" data-toggle="tab" class="step">
                                                <span class="number">3</span>
                                                <span class="desc"><i class="fa fa-check"></i> Finalizar</span>
                                            </a>
                                        </li>
                                    </ul>
                                <div id="bar" class="progress progress-striped" role="progressbar">
                                    <div class="progress-bar progress-bar-success"></div>
                                </div>
                                <div id="tipoDiv">
                                    <form id="formulario_inicial">
                                        <h3 class="form-section">Tipo de widget</h3>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label class="control-label">Nombre</label>
                                                    <input type="text" id="widget_nombre" name="nombre" class="form-control validate[required]" placeholder="Nombre de la widget" >
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Tipo de widget</label>
                                                    <select id="tipo_widget_select" name="tipo" class="form-control">
                                                        <option value="banner">Banner (1 Hotel)</option>
                                                        <option value="completo">Completo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 centered">
                                                <a href="#configuracionDiv" id="tipo_widget" class="btn btn-success">Siguiente</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div id="configuracionDiv">
                                    <form id="formWizardWidget">
                                        <h3 class="form-section">Configura tu widget</h3>
                                        <div class="row widget_row">
                                            <div class="col-md-3 banner_row">
                                                <div class="form-group">
                                                    <label class="control-label">Hotel</label>
                                                    <select name="hotel" class="form-control">
                                                        {foreach from=$hoteles item=hotel}
                                                        <option value="{$hotel->id}">{$hotel->nombre}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        
                                            <div class="col-md-3 banner_row completo_row">
                                                <div class="form-group">
                                                    <label class="control-label">Ancho (en pixeles)</label>
                                                    <input type="text" name="configuracion[width]" class="form-control validate[required]" value="300">
                                                </div>
                                            </div>

                                            <div class="col-md-3 completo_row">
                                                <div class="form-group">
                                                    <label class="control-label">Color del borde</label>
                                                    <input type="text" name="configuracion[borderColor]" class="form-control validate[required] colores" placeholder="Color del borde" value="D8D8D8">
                                                </div>
                                            </div>
                                            <div class="col-md-3 completo_row">
                                                <div class="form-group">
                                                    <label class="control-label">Color de fondo de la cabecera</label>
                                                    <input type="text" name="configuracion[backgroundHeader]" class="form-control validate[required] colores" placeholder="Color de background" value="F1F1F1" >
                                                </div>
                                            </div>

                                            <div class="col-md-3 completo_row">
                                                <div class="form-group">
                                                    <label class="control-label">Color del texto de la cabecera</label>
                                                    <input type="text" name="configuracion[textColorHeader]" class="form-control validate[required] colores" placeholder="Color del texto del header" value="1575BC">
                                                </div>
                                            </div>
                                            <div class="col-md-3 completo_row banner_row">
                                                <div class="form-group">
                                                    <label class="control-label">Color de fondo del cuerpo</label>
                                                    <input id="backgroundBody" type="text" name="configuracion[backgroundBody]" class="form-control validate[required] colores" placeholder="Color de background" value="F9F9F9">
                                                </div>
                                            </div>
                                            <div class="col-md-3 completo_row banner_row">
                                                <div class="form-group">
                                                    <label class="control-label">Color del texto del cuerpo</label>
                                                    <input id="textColorBody" type="text" name="configuracion[textColorBody]" class="form-control validate[required] colores" placeholder="Color del texto del body" value="626262">
                                                </div>
                                            </div>
                                            <div class="col-md-3 completo_row banner_row">
                                                <div class="form-group">
                                                    <label id="backgroundButton" class="control-label">Color de fondo del botón</label>
                                                    <input type="text" name="configuracion[backgroundButton]" class="form-control validate[required] colores" placeholder="Background del botón" value="C92183">
                                                </div>
                                            </div>
                                            <div class="col-md-3 completo_row banner_row">
                                                <div class="form-group">
                                                    <label class="control-label">Color del texto del botón</label>
                                                    <input id="textColorButton" type="text" name="configuracion[textColorButton]" class="form-control validate[required] colores" placeholder="Color del texto del botón" value="FFFFFF">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 centered">
                                                <input type="hidden" id="tipo_formulario" name="tipo">
                                                <input type="hidden" id="action_formulario" value="get" name="action" />
                                                <input type="hidden" name="afiliado_id" value="{$afiliado->id}">
                                                <a class="btn btn-default" href="#tipoDiv" >Atras</a>
                                                <a href="#finalizarDiv" id="generar_widget" class="btn btn-success">Siguiente</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div id="finalizarDiv">
                                    <form id="formFinalizar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h3 class="form-section">Códigos de enlace</h3>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label">Tu enlace directo</label>
                                                        <input id="enlace_directo" type="text" name="enlace" class="form-control" value="">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label">Código del banner</label>
                                                        <textarea id="widget_codigo" class="form-control" rows="15"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h3 class="form-section">Previsualiza tu widget</h3>
                                                <div class="col-md-12">
                                                    <div class="centered" id="widget_html"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <br class="clear" />
                                        <div class="row">
                                            <div class="col-md-12 centered">
                                                <a class="btn btn-default" href="#configuracionDiv" >Atras</a>
                                                <input type="hidden" name="action" value="insert" >
                                                <input type="submit" class="btn btn-success" value="Finalizar">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/block}