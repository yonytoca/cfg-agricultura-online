<%-- 
    Document   : variedad
    Created on : 01-may-2015, 16:37:30
    Author     : victor
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioVariedad"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Variedad"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>

<%
    List<Variedad> variedad = ServicioVariedad.getInstancia().getListadoVariedad();
%>
<center>
    <h2 class="sub-header">variedad</h2>
</center>


<!-- INICIO DATATABLE -->
<div class="panel panel-default">
    <div class="panel-heading">                                
        <h3 class="panel-title">Lista</h3>
        <ul class="panel-controls">
            <li><a href="#" class="panel-collapse"><span class="fa fa-angle-down"></span></a></li>
            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
            <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
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
                <c:forEach items="<%=variedad%>" var="variedad">
                    <tr>
                        <td>${variedad.getId()}</td>
                        <td>${variedad.getNombre()}</td>
                        <td><a href="editarvariedad.jsp?id=${variedad.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
                    </tr>
                </c:forEach>                         
            </tbody>

        </table>
    </div>
</div>
<!-- FIN DATATABLE -->
<jsp:include page="../teplate/footer.jsp"/>            