<%-- 
    Document   : producto
    Created on : 03-may-2015, 23:28:51
    Author     : victor
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>

<%
    List<Producto> producto = ServicioProducto.getInstancia().getListadoProducto();
%>
<center>
    <h2 class="sub-header">Producto</h2>
</center>


<!-- INICIO DATATABLE -->
<div class="panel panel-default">
    <div class="panel-heading">                                
        <h3 class="panel-title">Lista</h3>
        <ul class="panel-controls">
            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
        </ul>                                
    </div>
    <div class="panel-body">
        <table class="table datatable">
            <thead>
                <tr><th>Codigo</th>
                    <th>Nombre</th>  
                    <th>Imagen</th>
                    <th>Periodo</th>
                    <th>Tipo Producto</th>
                    <th>Variedad</th>
                    <th>Tiempo producion</th>
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=producto%>" var="producto">
                    <tr>
                        <td>${producto.getId()}</td>
                        <td>${producto.getNombre()}</td>
                        <td>${producto.getImg()}</td>
                        <td>${producto.getPeriodo()}</td>
                        <td>${producto.getTipo_producto_id().getNombre()}</td>
                        <td>${producto.getId_variedad().getNombre()}</td>
                        <td>${producto.getTiempoProduccion()}</td>
                        <td><a href="editarproducto.jsp?id=${producto.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
                    </tr>
                </c:forEach>                         
            </tbody>         
        </table>
    </div>
</div>
<!-- FIN DATATABLE -->
<jsp:include page="../teplate/footer.jsp"/>