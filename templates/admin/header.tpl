<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
    <div>
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="header-inner">
            <!-- BEGIN LOGO -->
            <a class="navbar-brand logo-brand" href="index.html">
                <img src="{$template_url}/images/logo.png" alt="logo" width="26" />
                {#sistema_nombre#}
            </a>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                <img src="{$template_url}/admin/assets/img/menu-toggler.png" alt="" />
            </a>          
            <!-- END RESPONSIVE MENU TOGGLER -->            
            <!-- BEGIN TOP NAVIGATION MENU -->              
            <ul class="nav navbar-nav pull-right">
                <!-- BEGIN NOTIFICATION DROPDOWN -->   
                <!--<li class="dropdown" id="header_notification_bar">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <i class="fa fa-warning"></i>
                        <span class="badge">2</span>
                    </a>
                    <ul class="dropdown-menu extended notification">
                        <li>
                            <p>Usted tiene 2 notificaciones</p>
                        </li>
                        <li>
                            <a href="#">
                                <span class="label label-success"><i class="icon-plus"></i></span>
                                10 nuevos usuarios
                                <span class="time">Justo ahora</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="label label-important"><i class="icon-bell"></i></span>
                                25 Reservaciones nuevas
                                <span class="time">15 min</span>
                            </a>
                        </li>
                        <li class="external">
                            <a href="#">Ver todas las notificaciones <i class="m-icon-swapright"></i></a>
                        </li>
                    </ul>
                </li>-->
                <!-- END NOTIFICATION DROPDOWN -->

                <!-- END TODO DROPDOWN -->
                <!-- BEGIN USER LOGIN DROPDOWN -->
                <li class="dropdown user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <!--<img alt="" src="{$template_url}/admin/assets/img/avatar1_small.jpg" />-->
                        <span class="username"> {$logged_user->nombre} {$logged_user->apellido}</span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <!--<li><a href="perfil.html"><i class="fa fa-user"></i></i> Perfil</a></li>
                        <li class="divider"></li>-->
                        <li><a href="{$base_url}/admin-logout"><i class="fa fa-key"></i> Cerrar sesión</a></li>
                    </ul>
                </li>
                <!-- END USER LOGIN DROPDOWN -->
            </ul>
            <!-- END TOP NAVIGATION MENU --> 
            <div class="clearfix"></div>
    </div>
    <!-- END TOP NAVIGATION BAR -->
    </div>
</div>
<!-- END HEADER -->