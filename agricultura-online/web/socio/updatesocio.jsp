<%-- 
    Document   : updatesocio.jsp
    Created on : 25/04/2015, 08:27:21 PM
    Author     : EDUARDO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioUsuario"%>
<%@page import="java.util.List"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Socio"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));    
    Socio socio = ServicioSocio.getInstancia().getSocioPorId(id);
    List<Usuario> usuario = ServicioUsuario.getInstancia().getListadoUsuario();    
%>

<form role="form" action="/agricultura-online/SocioUpdateControl">
    <div class="form-group input-group">
        <label>Nombre </label>
        <input type="hidden" name="id" value="<%=socio.getId()%>" required="" />
        <input name="nombre" type="text" class="form-control" value="<%=socio.getNombre()%>" required="" >
    </div>
    <div class="form-group input-group">
        <label>Apellido</label>
        <input name="apellido" type="text" class="form-control" value="<%=socio.getApellido()%>" required="" >                                            
    </div>
    <div class="form-group input-group">
        <label>Teléfono</label>
        <input name="telefono" type="text" class="form-control" value="<%=socio.getTelefono()%>" required="">
    </div>
    <div class="form-group input-group">
        <label> Dirección</label>
        <input name="direccion" type="text" class="form-control" value="<%=socio.getDireccion()%>" required="">                                            
    </div>    
    <div class="form-group input-group">
        <label> Imagen</label>
        <input name="imagen" type="text" class="form-control" value="<%=socio.getImg()%>" required="">
    </div>
    <div class="form-group input-group">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">Actualizar</button>                   
        </span>
    </div>
</form>
<jsp:include page="../teplate/footer.jsp"/>
