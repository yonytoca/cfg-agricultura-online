<%-- 
    Document   : editarproducto
    Created on : 03-may-2015, 23:28:22
    Author     : victor
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Producto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioVariedad"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Variedad"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoProducto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>

<%
     int id = Integer.parseInt(request.getParameter("id"));
    Producto  producto = ServicioProducto.getInstancia().getProductoPorId(id);
  
    List<TipoProducto> tproducto = ServicioTipoProducto.getInstancia().getListadoTipoProducto();
    List<Variedad> variedad = ServicioVariedad.getInstancia().getListadoVariedad();
%>
<div class="col-lg-6">
    <form action="/agricultura-online/ProductoControl"  method="post">        
        <div class="form-group">
            <label>Nombre</label>
            <input name="idproducto" type="hidden" class="form-control" value="<%=producto.getId()%>">   
            <input name="nombre" class="form-control" value="<%=producto.getNombre()%>">               
        </div>
        <div class="form-group">
            <label>Imagen</label>
            <input name="img" class="form-control" value="<%=producto.getImg()%>">               
        </div> 
       
        
          <div class="form-group">
            <label>Tipo Producto</label>
            <select class="form-control" name="tproducto">
                <option value="<%=producto.getTipo_producto_id().getId()%>"><%=producto.getTipo_producto_id().getNombre()%></option>
                <c:forEach items="<%=tproducto%>" var="tproducto">
                    <option value="${tproducto.getId()}">${tproducto.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
                        
        <div class="form-group">
            <label>Variedad</label>
            <select class="form-control" name="variedad">
                <option value="<%=producto.getId_variedad().getId()%>"><%=producto.getId_variedad().getNombre()%></option>
                <c:forEach items="<%=variedad%>" var="variedad">                    
                    <option value="${variedad.getId()}">${variedad.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
                
        
        
        <div class="form-group">
            <label>tiempo prodccion</label>
            <input name="periodo" class="form-control" value="<%=producto.getTiempoProduccion()%>">               
        </div> 
        
        <div class="form-group">
            <label>prodccion por tarea</label>
            <input name="producciontarea" class="form-control" value="<%=producto.getProducciontarea()%>">               
        </div>
       <div class="form-group input-group">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">Actualizar</button>                   
        </span>
    </div>
    


</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>