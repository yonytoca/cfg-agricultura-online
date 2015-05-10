<%-- 
    Document   : crearproducto
    Created on : 25/04/2015, 12:58:41 PM
    Author     : VíctorAndrés
--%>

<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioVariedad"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Variedad"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoProducto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>
<%
     List<TipoProducto> tproducto = ServicioTipoProducto.getInstancia().getListadoTipoProducto();
    List<Variedad> variedad = ServicioVariedad.getInstancia().getListadoVariedad();

%>
<div class="col-lg-6">
    <form action="/agricultura-online/ProductoControl"  method="post">        
        <div class="form-group">
            <label>Nombre</label>
            <input name="nombre" class="form-control">               
        </div>
        <div class="form-group">
            <label>Imagen</label>
            <input name="img" class="form-control">               
        </div>         
        
          <div class="form-group">
            <label>Tipo Producto</label>
            <select class="form-control" name="tproducto">
                <c:forEach items="<%=tproducto%>" var="tproducto">
                    <option value="${tproducto.getId()}">${tproducto.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
		
        
        <div class="form-group">
            <label>Variedad</label>
            <select class="form-control" name="variedad">
                <c:forEach items="<%=variedad%>" var="variedad">
                    <option value="${variedad.getId()}">${variedad.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
       <div class="form-group">
            <label>tiempo produccion/Dias</label>
            <input name="periodo" class="form-control">               
        </div>
        <div class="form-group">
            <label>produccion por Tarea</label>
            <input name="producciontarea" class="form-control">               
        </div> 
        
       <div class="form-group input-group">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">Crear</button>                   
        </span>
    </div>
     
</form>
    
</div>
<jsp:include page="../teplate/footer.jsp"/>