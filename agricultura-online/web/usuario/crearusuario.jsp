<%-- 
    Document   : crearusuario
    Created on : 25/04/2015, 12:50:20 PM
    Author     : VíctorAndrés
--%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoUsuario"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>
<%
    List<TipoUsuario> usuario = ServicioTipoUsuario.getInstancia().getListadoTipoUsuario();

%>
<center>
    <h2 class="sub-header">Agregar Usuario</h2>
</center>
<div class="col-lg-6">
    <form action="/agricultura-online/CrearUsuarioControl"  method="post">        
        <div class="form-group">
            <label>Usuario</label>
            <input name="usuario" class="form-control">               
        </div>
        <div class="form-group">
            <label>Clave</label>
            <input name="clave" type="password" class="form-control">               
        </div> 

        <div class="form-group">
            <label>Tipo usuario </label>
            <select class="form-control" name="tusuario">
                <c:forEach items="<%=usuario%>" var="usuario">
                    <option value="${usuario.getId()}">${usuario.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>

        <div class="form-group input-group">
            <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">Crear</button>                   
            </span>
        </div>

    </form>
</div>
<jsp:include page="../teplate/footer.jsp"/>
