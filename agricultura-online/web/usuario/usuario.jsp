<%-- 
    Document   : usuario
    Created on : 30/04/2015, 10:27:42 PM
    Author     : EDUARDO
--%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioUsuario"%>
<%@page import="java.util.List"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>
<%
    List<Usuario> usuario = ServicioUsuario.getInstancia().getListadoUsuario();    
%>
<center>
    <h2 class="sub-header">Usuario</h2>
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
                    <th>Tipo Usuario</th>
                    
                    
                                        
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=usuario%>" var="usuario">
                    <tr>
                        <td>${usuario.getId()}</td>
                        <td>${usuario.getUsuario()}</td>
                        <td>${usuario.getTipo_usuario_id().getNombre()}</td>
                       
                    </tr>
                </c:forEach>                         
            </tbody>

        </table>
    </div>
</div>
<!-- FIN DATATABLE -->      
<jsp:include page="../teplate/footer.jsp"/>
