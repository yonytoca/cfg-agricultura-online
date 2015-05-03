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
    <h2 class="sub-header">Lista de Usuario</h2>
</center>
   
    <div class="dataTable_wrapper">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
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
<jsp:include page="../teplate/footer.jsp"/>
