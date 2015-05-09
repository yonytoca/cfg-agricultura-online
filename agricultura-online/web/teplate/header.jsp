<%-- 
    Document   : header
    Created on : 20/04/2015, 03:50:46 PM
    Author     : VíctorAndrés
--%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>SIGECOPA</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="/agricultura-online/img/favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="/agricultura-online/css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">

            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">
                    <li class="xn-logo">
                        <a href="index.jsp">SIGECOPA</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>                               
                    <!-- inicio del menu -->
                    <li class="xn-title">Navigation</li>
                    <li>
                    <li class="xn-openable">

                        <a href="#"><span class="fa fa-bars"></span> <span class="xn-text">Usuario</span></a>

                        <ul>
                            <li><a href="/agricultura-online/usuario/crearusuario.jsp"><span class="fa fa-cog"></span>Usuario</a></li>
                            <li><a href="/agricultura-online/usuario/creartipousuario.jsp"><span class="fa fa-cog"></span>Tipo Usuario </a></li>
                            <li><a href="/agricultura-online/socio/crearSocio.jsp"><span class="fa fa-cog"></span>Socio </a></li>
                            <!-- Sub-menu lista -->
                            <li class="xn-openable">

                                <a href="#"><span class="fa fa-eye"></span> <span class="xn-text">Listado Usuario</span></a>

                                <ul>
                                    <li><a href="/agricultura-online/usuario/usuario.jsp"><span class="fa fa-list"></span> Lista Usuario</a></li>
                                    <li><a href="/agricultura-online/usuario/tipousuario.jsp"><span class="fa fa-list"></span> Lista Tipo Usuario</a></li>
                                    <li><a href="/agricultura-online/socio/socio.jsp"><span class="fa fa-list"></span> Lista Socio</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    </li> 
                    <li>
                    <li class="xn-openable">

                        <a href="#"><span class="fa fa-bars"></span> <span class="xn-text">Cultivos</span></a>

                        <ul>
                            <li><a href="/agricultura-online/producto/crearproducto.jsp"><span class="fa fa-cog"></span>Productos</a></li>
                            <li><a href="/agricultura-online/producto/creartipoproducto.jsp"><span class="fa fa-cog"></span>Tipo Producto</a></li>
                            <li><a href="/agricultura-online/siembra/crearsiembra.jsp"><span class="fa fa-cog"></span>Siembra</a></li>
                            <li><a href="/agricultura-online/variedad/crearvariedad.jsp"><span class="fa fa-cog"></span>Variedad</a></li>
                            <!-- Sub-menu lista -->
                            <li class="xn-openable">

                                <a href="#"><span class="fa fa-eye"></span> <span class="xn-text">Listado Cultivos</span></a>

                                <ul>
                                    <li><a href="/agricultura-online/producto/tipoproducto.jsp"><span class="fa fa-list"></span>Lista tipo Producto</a></li>
                                    <li><a href="/agricultura-online/producto/producto.jsp"><span class="fa fa-list"></span>Lista productos</a></li>
                                    <li><a href="/agricultura-online/siembra/siembra.jsp"><span class="fa fa-list"></span>Lista Siembra</a></li>
                                    <li><a href="/agricultura-online/variedad/variedad.jsp"><span class="fa fa-list"></span>Lista Variedad</a></li>

                                </ul>
                            </li>
                        </ul>                        
                    </li>
                    </li>
                    <li>
                    <li class="xn-openable">

                        <a href="#"><span class="fa fa-bars"></span> <span class="xn-text">Zonas</span></a>

                        <ul>
                            <li><a href="/agricultura-online/zona/crearzona.jsp"><span class="fa fa-cog"></span>Zona</a></li>
                            <li><a href="/agricultura-online/zona/zona.jsp"><span class="fa fa-list"></span>Lista Zona</a></li>
                        </ul>
                    </li>
                    </li>
                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->

            <!-- PAGE CONTENT -->
            <div class="page-content">

                <!-- START X-NAVIGATION VERTICAL -->
                <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                    <!-- TOGGLE NAVIGATION -->
                    <li class="xn-icon-button">
                        <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->                    
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Link</a></li>                    
                    <li class="active">Active</li>
                </ul>
                <!-- END BREADCRUMB -->                

                <div class="page-title">                    
                    <h2><span class="fa fa-arrow-circle-o-left"></span>Sistema de Gestion y Control de los Productos Agrícolas</h2>
                </div>                   

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Sistema de Gestion y Control de los Productos Agrícolas</h3>
                                </div>
                                <div class="panel-body">