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
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>


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
         <label>Fecha Siembra</label>
        <div class="form-group">
           
            <div class="col-md-5">
                <div class="input-group">
                    <input type="text" id="dp-3" name="fsiembra" class="form-control datepicker"  value="06-06-2014" data-date="06-06-2014" data-date-format="dd-mm-yyyy" data-date-viewmode="years"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>            
        </div><br>
        
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