<%-- 
    Document   : sembrar
    Created on : 10/05/2015, 10:47:50 AM
    Author     : EDUARDO
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembra"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Siembra"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSembrar"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Sembrar"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Zona"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioZona"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Socio"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSocio"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Producto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>

<%
    List<Producto> producto = ServicioProducto.getInstancia().getListadoProducto();
    List<Socio> socio = ServicioSocio.getInstancia().getListadoSocio();
    List<Zona> zona = ServicioZona.getInstancia().getListadoZona();
    List<Siembra> sembrar = ServicioSiembra.getInstancia().getListadoSiembra();
    List<Sembrar> sembrare = ServicioSembrar.getInstancia().getListadoSembrar();   
    

   // int id = Integer.parseInt(request.getParameter("id"));
    // Producto  producto1 = ServicioProducto.getInstancia().getProductoPorId(id);
    //  int id = Integer.parseInt(request.getParameter("id"));
    // Sembrar sembra = ServicioSembrar.getInstancia().getSembrarPorId(id);
    Date dNow = new Date();
    SimpleDateFormat ft
            = new SimpleDateFormat("dd/MM/yyyy");
    String currentDate = ft.format(dNow);
%>
<div class="col-lg-6">
    <form class="navbar-form navbar-right" role="form" action="/agricultura-online/SiembraControl"  method="post">        

        <div class="form-group">       

            <label><%=currentDate%></label            

            <label>Fecha</label>

            <input name="fecha" class="form-control" type="text" value="<%=currentDate%>">              
            <label>socio</label>
            <input name="id_socio" class="form-control" type="text" value="1">
            <label>Factura</label>
            <input name="id_detalle" class="form-control" type="text" value="">              
            <input name="idproducto" type="hidden" class="form-control" value="">   
        </div>      

        <div class="form-group navbar-right">
            <label>Producto</label>
            <select class="form-control" name="producto">
                <c:forEach items="<%=producto%>" var="producto">
                    <option value="${producto.getId()}">${producto.getNombre()}</option>
                </c:forEach>                
            </select>
            <label>zona</label>
            <select class="form-control" name="id_zona">
                <c:forEach items="<%=zona%>" var="zona">
                    <option value="${zona.getId()}">${zona.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
        <div class="form-group">
            <label>Cantida Producto</label>
            <input name="cproducto" class="form-control">               

            <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">Agregar Siembra</button>                   
            </span>
        </div>

    </form>
</div>

<div class="panel-body">
    <table class="table datatable">
        <thead>
            <tr>
                <th>Codigo</th>                
                <th>Producto</th>                
                <th>Cantidad Producto</th>
                <th>Socio</th>
                <th>Zona</th>
                <th>Eliminar</th>                    
            </tr>
        </thead>
        <tbody

            <c:forEach items="<%=sembrar%>" var="sembrar">
                <tr>
                    <td>${sembrar.getId()}</td>
                    <td>${sembrar.getId_producto().getNombre()}</td>
                    <td>${sembrar.getCantidad_producto()}</td>
                    <td>${sembrar.getId_socio().getNombre()}</td>
                    <td>${sembrar.getId_zona().getNombre()}</td>                       
                    <td><a href="eliminar.jsp?id=${siembra.getId()}"><i class="glyphicon glyphicon-remove-circle"></i></a></td>
                </tr>
            </c:forEach>
        </tbody> 
    </table>
</div>
<jsp:include page="../teplate/footer.jsp"/>