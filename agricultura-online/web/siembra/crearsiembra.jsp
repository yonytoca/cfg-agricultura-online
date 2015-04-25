<%-- 
    Document   : crearsiembra
    Created on : 25/04/2015, 04:30:29 PM
    Author     : VíctorAndrés
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Zona"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioZona"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSocio"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Socio"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="../teplate/header.jsp"/>
<%
     List<Producto> producto = ServicioProducto.getInstancia().getListadoProducto();
    List<Socio> socio = ServicioSocio.getInstancia().getListadoSocio();
    List<Zona> zona = ServicioZona.getInstancia().getListadoZona();

%>
<div class="col-lg-6">
    <form action="/agricultura-online/SiembraControl"  method="post">        
         <div class="form-group">
            <label>Producto</label>
            <select class="form-control" name="producto">
                <c:forEach items="<%=producto%>" var="producto">
                    <option value="${producto.getId()}">${producto.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
        
       <div class="fecha">
                    <label>Fecha Siembra</label>
                    <div id="datetimepicker2" class="input-append">
                        <input data-format="yyyy/MM/dd" type="text" name="fsiembra"style="width:30%;"></input>
                        <span class="add-on">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                            </i>
                        </span>
                    </div>
            </div>
        <div class="form-group">
            <label>Cantida Producto</label>
            <input name="cproducto" class="form-control">               
        </div> 
        
          <div class="form-group">
            <label>Socio</label>
            <select class="form-control" name="socio">
                <c:forEach items="<%=socio%>" var="socio">
                    <option value="${socio.getId()}">${socio.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
		
        
        <div class="form-group">
            <label>Variedad</label>
            <select class="form-control" name="zona">
                <c:forEach items="<%=zona%>" var="zona">
                    <option value="${zona.getId()}">${zona.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
        <button type="submit" class="btn btn-default">Crear</button>
     
</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>