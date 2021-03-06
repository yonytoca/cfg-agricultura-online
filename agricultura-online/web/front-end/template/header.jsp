<%-- 
    Document   : header
    Created on : 20/04/2015, 03:50:46 PM
    Author     : VíctorAndrés
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioProducto"%>
<%@page import="java.util.List"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Producto"%>
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
        <%List<Producto> siembra = ServicioProducto.getInstancia().getListadoProducto();%>
    </head>
    <body>

        <% Usuario currentUser = (Usuario) session.getAttribute("currentSessionUser");%>        



        <% if (session.getAttribute("currentSessionUser").equals(null)) {%>                            
        <% response.sendRedirect("login.jsp"); %>
        <a href="login.jsp"> </a>
        <%} else {%>
        <% response.sendRedirect("login.jsp"); %>    
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

                    </li> 
                    <li>
                    <li class="xn-openable">

                        <a href="#"><span class="fa fa-bars"></span> <span class="xn-text">Siembra</span></a>

                        <ul>

                            <li><a href="/agricultura-online/front-end/siembra/crearsiembra.jsp"><span class="fa fa-cog"></span>Registrar Siembra</a></li>
                            <li><a href="/agricultura-online/front-end/siembra/detallesiembra.jsp"><span class="fa fa-list"></span>Lista Siembra</a></li>
                            <!-- Sub-menu lista -->
                        </ul>    
                        <div>
                            <font size="+2" color="white">
                            <table   width="50">
                                <thead>
                                    <tr>
                                        <th >Producto</th>              
                                        <th>Tope</th>   
                                    </tr>
                                </thead>
                                <tbody
                            <c:forEach items="<%=siembra%>" var="siembra">
                                <tr>
                                    <td>${siembra.getNombre()}</td> 
                                    <td>${siembra.getTope()}</td>
                                </tr>
                            </c:forEach>      
                            </tbody> 
                        </table>
                            </font>
                    </div>
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
                    <a href="#"><span class="fa fa-user-md " ><%= currentUser.getNombre() + " " + currentUser.getApellido()%></span></a>
                    <ul>
                        <li><a href="/agricultura-online/front-end/editarusuario.jsp?id=<%=currentUser.getId()%>"><span class="fa fa-user"></span>Cambiar contraseña</a></li>

                    </ul>
                </li> 
                <li class="xn-icon-button pull-right">
                    <a href="/agricultura-online/front-end/index1.jsp" class="mb-control" data-box="/agricultura-online/front-end/index1.jsp"><span class="fa fa-home"></span></a>                        
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
                <h2><span class="fa fa-arrow-circle-o-left"></span> SISTEMA DE GESTION Y CONTROL DE LOS PRODUCTOS AGRICOLAS</h2>
            </div>                   

            <!-- PAGE CONTENT WRAPPER -->
            <div class="page-content-wrap">

                <div class="row">
                    <div class="col-md-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"></h3>
                            </div>
                            <div class="panel-body">