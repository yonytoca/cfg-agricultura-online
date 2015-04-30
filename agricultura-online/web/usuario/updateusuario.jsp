<%-- 
    Document   : updateusuario
    Created on : 30/04/2015, 10:46:29 PM
    Author     : EDUARDO
--%>

<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int id = Integer.parseInt(request.getParameter("id"));    
    Usuario usuarios = ServicioUsuario.getInstancia().getUsuarioPorId(id);
    List<TipoUsuario> usuario = ServicioTipoUsuario.getInstancia().getListadoTipoUsuario();
    List<Usuario> usuariolis = ServicioUsuario.getInstancia().getListadoUsuario();
%>

<div class="col-lg-6">
    <form action="/agricultura-online/UsuarioControl"  method="post">        
        <div class="form-group">
            <label>Usuario</label>
            <input name="id" type="text" value="<%=usuarios.getId()%>" class="form-control">               
            <input name="nombre" value="<%=usuarios.getUsuario()%>" class="form-control">               
        </div>
        <div class="form-group">
            <label>Clave</label>
            <input name="clave" type="password" value="<%=usuarios.getClave()%>" class="form-control">               
        </div> 
        <div class="form-group">
            <label>Tipo Usuario </label>
            <select class="form-control" name="usuario">                
                <option value="<%=usuarios.getTipo_usuario_id().getId()%>"><%=usuarios.getTipo_usuario_id().getNombre()%></option>                
                <c:forEach items="<%=usuario%>" var="usuario">                    
                    <option value="${usuario.getId()}">${usuario.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>        
        <button type="submit" class="btn btn-default">Crear</button>     
</form>
</div>