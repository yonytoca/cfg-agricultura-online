<%-- 
    Document   : detallesiembra
    Created on : 10-may-2015, 19:35:34
    Author     : victor
--%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembraDetalle"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembra"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Siembra"%>
<%@page import="java.util.List"%>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>


<%

    List<Siembra> siembras = ServicioSiembraDetalle.getInstancia().getListadoSiembradetalle();
   
%>

<div class="panel panel-default">
    <div class="panel-heading">                                
        <h3 class="panel-title">Lista de roduccion por productos</h3>
        <ul class="panel-controls">            
            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
        </ul>                                
    </div>
    <div class="panel-body">
        <table class="table datatable">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Producto</th>               
                    <th>Cantidad</th>   
                </tr>
            </thead>
            <tbody
                <c:forEach items="<%=siembras%>" var="siembras">
                    <tr>
                        <td>${siembras.getId_producto().getId()}</td>  
                        <td>${siembras.getId_producto().getNombre()}</td>          
                        <td>${siembras.getCantidad_producto()}</td>

                    </tr>
                </c:forEach>      
            </tbody> 
        </table>
    </div>
</div>

<!-- FIN DATATABLE -->
<a href="crearsiembra.jsp"> Crear Siembra</a>
<jsp:include page="../template/footer.jsp"/>