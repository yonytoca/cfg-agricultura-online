<%-- 
    Document   : socio
    Created on : 22/04/2015, 12:19:55 AM
    Author     : EDUARDO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSocio"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Socio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>
<%
    List<Socio> socio = ServicioSocio.getInstancia().getListadoSocio();    
%>

<center>
    <h2 class="sub-header">Socios</h2>
</center>

<!-- INICIO DATATABLE -->
<div class="panel panel-default">
    <div class="panel-heading">                                
        <h3 class="panel-title">Lista</h3>
        <ul class="panel-controls">
            
            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
            
        </ul>                                
    </div>
    <div class="panel-body">
        <table class="table datatable">
           <thead>
                <tr><th>Codigo</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Teléfono</th>
                    <th>Dirección</th>
                    <th>Usuario</th>
                    <th>Tipo Usuario</th>
                    <th>Editar</th>
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=socio%>" var="socio">
                    <tr>
                        <td>${socio.getId()}</td>
                        <td>${socio.getNombre()}</td>
                        <td>${socio.getApellido()}</td>
                        <td>${socio.getTelefono()}</td>
                        <td>${socio.getDireccion()}</td>
                        <td>${socio.getUsuario()}</td>
                        <td>${socio.getTipousuario().getNombre()}</td>
                        <td><a href="updatesocio.jsp?id=${socio.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
                    </tr>
                </c:forEach>                         
            </tbody>

        </table>
    </div>
</div>
<!-- FIN DATATABLE -->   
<jsp:include page="../teplate/footer.jsp"/>
