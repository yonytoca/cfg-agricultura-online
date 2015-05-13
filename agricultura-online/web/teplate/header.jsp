<%-- 
    Document   : header
    Created on : 20/04/2015, 03:50:46 PM
    Author     : VíctorAndrés
--%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
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
        <% Usuario currentUser = (Usuario) session.getAttribute("currentSessionUser");%>        



        <% if (session.getAttribute("currentSessionUser").equals(null)) {%>
        <a href="login.jsp"> </a>
        <%} else {%>
        <a href="logaut.jsp"> </a>
        <%}
        %>        

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

                   
                    <li>
                    <li class="xn-openable">

                        <a href="#"><span class="fa fa-bars"></span> <span class="xn-text">Usuario</span></a>

                        <ul>
                            <li><a href="/agricultura-online/usuario/crearusuario.jsp"><span class="fa fa-cog"></span>Usuario</a></li>
                            <li><a href="/agricultura-online/socio/crearSocio.jsp"><span class="fa fa-cog"></span>Socio </a></li>
                            <!-- Sub-menu lista -->
                            <li class="xn-openable">

                                <a href="#"><span class="fa fa-eye"></span> <span class="xn-text">Listado Usuario</span></a>

                                <ul>
                                    <li><a href="/agricultura-online/usuario/usuario.jsp"><span class="fa fa-list"></span> Lista Usuario</a></li>
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
                    <!-- SIGN OUT -->
                    <li class="xn-icon-button pull-right">
                        <a href="logaut.jsp" class="mb-control" data-box="#mb-signout"><span class="fa fa-power-off"></span></a>                        
                    </li> 
                    <!-- END SIGN OUT -->
                    <!-- MESSAGES -->
                    <li class="xn-icon-button pull-right">
                        <a href="#"><span class=""></span></a>
                                               
                    </li>
                    <!-- END MESSAGES -->
                    <!-- Mostrar Usuario -->
                     <li class="xn-icon-button pull-right">
                        <a href="#"><span class="fa fa-user-md " ><%= currentUser.getUsuario()%></span></a>
                         <ul>
                            <li><a href="/agricultura-online/zona/crearzona.jsp"><span class="fa fa-users"></span>Mi cuenta</a></li>
                            <li><a href="/agricultura-online/zona/zona.jsp"><span class="fa fa-cog"></span>Configuración</a></li>
                        </ul>
                    </li> 
                    <!-- Mostrar Usuariofin -->
                    <!-- END TOGGLE NAVIGATION -->                    
                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                     

                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#"></a></li>                    
                    <li class="active"></li>
                </ul>
                <!-- END BREADCRUMB -->                

                <div class="page-title">                    
                    <h2><span class="fa fa-arrow-circle-o-left"></span>SISTEMA DE GESTION Y CONTROL DE LOS PRODUCTOS AGRICOLAS</h2>
                </div>                   

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">

                            <div class="panel panel-default">
                                <div class="panel-heading">

                                </div>
                                <div class="panel-body">