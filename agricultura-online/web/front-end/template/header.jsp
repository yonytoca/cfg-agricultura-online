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
         <% Usuario currentUser =  (Usuario) session.getAttribute("currentSessionUser");%>        
                               
                         
                        
                            <% if (session.getAttribute("currentSessionUser").equals(null)){%>
                            <a href="login.jsp"> </a>
                            <%}
                                else{%>
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
                    <li class="xn-title"></span><%= currentUser.getUsuario() + " " + currentUser.getTipo_usuario_id().getId() %><li><a href="logaut.jsp"><i class="glyphicon glyphicon-lock"></i> Salir</a></li></li>
                    <li>
                    
                    </li> 
                    <li>
                    <li class="xn-openable">

                        <a href="#"><span class="fa fa-bars"></span> <span class="xn-text">Siembra</span></a>

                        <ul>
                            
                            <li><a href="/agricultura-online/front-end/siembra/crearsiembra.jsp"><span class="fa fa-cog"></span>Registrar Siembra</a></li>
                            <li><a href="/agricultura-online/front-end/siembra/detallesiembra.jsp"><span class="fa fa-list"></span>Lista Siembra</a></li>
                            <!-- Sub-menu lista -->
                           
                        </ul>                        
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