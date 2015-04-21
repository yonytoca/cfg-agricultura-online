<%-- 
    Document   : crearusuario
    Created on : 20/04/2015, 01:01:17 PM
    Author     : VíctorAndrés
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>

<%
    List<TipoUsuario> usuario = ServicioTipoUsuario.getInstancia().getListadoTipoUsuario();

%>

<div class="col-lg-6">
    <form action="/agricultura-online/CrearUsuarioControl1"  method="post">        
        <div class="form-group">
            <label>Usuario</label>
            <input name="usuario" class="form-control">               
        </div>
        <div class="form-group">
            <label>Clave</label>
            <input name="clave" type="password" class="form-control">               
        </div>
         
        <div class="form-group">
            <label>Tipo Usuario</label>
            <select class="form-control" name="tusuario">
                <c:forEach items="<%=usuario%>" var="usuario">
                    <option value="${usuario.getId_tipo_usuario()}">${usuario.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
        <button type="submit" class="btn btn-default">Crear</button>  
</div>


</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>