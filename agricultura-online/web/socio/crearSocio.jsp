<%-- 
    Document   : crearSocio
    Created on : 19/04/2015, 11:44:40 PM
    Author     : EDUARDO
--%>



<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoUsuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>
<%
    List<TipoUsuario> tusuario = ServicioTipoUsuario.getInstancia().getListadoTipoUsuario();    
%>
<div>
    <a href="../usuario/crearusuario.jsp">Crear Usuario</a>
</div>

<form role="form" action="/agricultura-online/SocioControl">
    <div class="form-group input-group">
        <label>Nombre </label>
        <input name="nombre" type="text" class="form-control" placeholder="Nombre">
    </div>
    <div class="form-group input-group">
        <label>Apellido</label>
        <input name="apellido" type="text" class="form-control" placeholder="Apellido">                                            
    </div>
    <div class="form-group input-group">
        <label>Teléfono</label>
        <input name="telefono" type="text" class="form-control" placeholder="Teléfono">
    </div>
    <div class="form-group input-group">
        <label> Dirección</label>
        <input name="direccion" type="text" class="form-control" placeholder="Dirección">                                            
    </div>
    <div class="form-group">
        <label>Tipo Usuario</label>
        <select class="form-control" name="usuario">
            <c:forEach items="<%=tusuario%>" var="tusuario">
                <option value="${tusuario.getId()}">${tusuario.getNombre()}</option>
            </c:forEach>                
        </select>
    </div>
    <div class="form-group input-group">
        <label> Imagen</label>
        <input name="imagen" type="text" class="form-control" placeholder="Imagen">

    </div>
    <div class="form-group input-group">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">Crear</button>                   
        </span>
    </div>
</form>
<jsp:include page="../teplate/footer.jsp"/>