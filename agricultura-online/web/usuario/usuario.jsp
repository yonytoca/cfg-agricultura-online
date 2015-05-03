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
    <h2 class="sub-header">Lista de Usuario</h2>
</center>
   
    <div class="dataTable_wrapper">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
           <thead>
                <tr><th>Codigo</th>
                    <th>Nombre</th>
                    <th>Tipo Usuario</th>
                    <th>Editar</th>
                    
                                        
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=usuario%>" var="usuario">
                    <tr>
                        <td>${usuario.getId()}</td>
                        <td>${usuario.getUsuario()}</td>
                        <td>${usuario.getTipo_usuario_id().getNombre()}</td>
                        <td><a href="editarusuario.jsp?id=${usuario.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
                    </tr>
                </c:forEach>                         
            </tbody>
        </table>
    </div>
<jsp:include page="../teplate/footer.jsp"/>
