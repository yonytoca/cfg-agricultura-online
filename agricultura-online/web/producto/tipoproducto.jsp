<%-- 
    Document   : tipoproducto
    Created on : 01-may-2015, 17:17:04
    Author     : victor
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoProducto"%>
<%@page import="java.util.List"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>

<%
    List<TipoProducto> tiproducto = ServicioTipoProducto.getInstancia().getListadoTipoProducto();
%>
<center>
    <h2 class="sub-header">Agregar Tipo Producto</h2>
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
                    <th>Editar</th>
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=tiproducto%>" var="tiproducto">
                   
                    <tr>
                        <td>${tiproducto.getId()}</td>
                        <td>${tiproducto.getNombre()}</td>
                        <td><a href="editartipoproducto.jsp?id=${tiproducto.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
                    </tr>
                </c:forEach>                         
            </tbody>         
        </table>
    </div>
</div>
<!-- FIN DATATABLE -->
<jsp:include page="../teplate/footer.jsp"/>