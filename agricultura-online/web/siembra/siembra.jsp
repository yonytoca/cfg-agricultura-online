<%-- 
    Document   : siembra
    Created on : 25/04/2015, 06:47:41 PM
    Author     : VíctorAndrés
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembra"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Siembra"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>


<%
    List<Siembra> siembras = ServicioSiembra.getInstancia().getListadoSiembra();

%>


<center>
    <h2 class="sub-header">Siembras</h2>
</center>


<div class="dataTable_wrapper">
    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
        <thead>
            <tr>
                <th>Codigo</th>
                <th>Producto</th>
                <th>Fecha de siembra</th>
                <th>Cantidad</th>
                <th>Socio</th>
                <th>Zona</th>
                <th>modificar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody
           <c:forEach items="<%=siembras%>" var="siembras">
        <tr>
            <td>${siembras.getId()}</td>
            <td>${siembras.getId_producto().getNombre()}</td>
            <td>${siembras.getFecha_siembra()}</td>
            <td>${siembras.getCantidad_producto()}</td>
            <td>${siembras.getId_socio().getNombre()}</td>
            <td>${siembras.getId_zona().getNombre()}</td>
            <td><a href="editarsiembra.jsp?id=${siembras.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
            <td><a href="eliminar.jsp?id=${citas.getId()}"><i class="glyphicon glyphicon-remove-circle"></i></a></td>
        </tr>
    </c:forEach>      
        </tbody> 
    </table>
</div>

<a href="crearsiembra.jsp"> registrar Siembra</a>
<jsp:include page="../teplate/footer.jsp"/>
