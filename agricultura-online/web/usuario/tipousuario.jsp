<%-- 
    Document   : tipousuario
    Created on : 03/05/2015, 06:36:34 PM
    Author     : EDUARDO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoUsuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>
<%
    List<TipoUsuario> tusuario = ServicioTipoUsuario.getInstancia().getListadoTipoUsuario();    
%>

<center>
    <h2 class="sub-header">Tipo de Usuario</h2>
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
                    <th>Editar</th>
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=tusuario%>" var="tusuario">
                    <tr>
                        <td>${tusuario.getId()}</td>
                        <td>${tusuario.getNombre()}</td>                        
                        <td><a href="editartipousuario.jsp?id=${tusuario.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
                    </tr>
                </c:forEach>                         
            </tbody>

        </table>
    </div>
</div>
<!-- FIN DATATABLE -->   
<jsp:include page="../teplate/footer.jsp"/>
