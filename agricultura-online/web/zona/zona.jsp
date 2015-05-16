<%-- 
    Document   : zona
    Created on : 03/05/2015, 04:58:03 PM
    Author     : Yanelkys
--%>
<%@page import="java.util.List"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Zona"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioZona"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>
<%
    List<Zona> zona = ServicioZona.getInstancia().getListadoZona();    
%>

<center>
    <h2 class="sub-header">Listado Zona</h2>
</center>
   
    <div class="dataTable_wrapper">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
           <thead>
                <tr><th>Código</th>
                    <th>Nombre</th>
                     <th>Editar</th>
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=zona%>" var="zona">
                    <tr>
                        <td>${zona.getId()}</td>
                        <td>${zona.getNombre()}</td>
                         <td><a href="EditarZona.jsp?id=${zona.getId()}"><i class="glyphicon glyphicon-edit"></i></a></td>
                    </tr>
                </c:forEach>                         
            </tbody>
        </table>
    </div>
<jsp:include page="../teplate/footer.jsp"/>