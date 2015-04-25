<%-- 
    Document   : crearzona
    Created on : 25/04/2015, 03:09:19 PM
    Author     : VíctorAndrés
--%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Variedad"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSubZona"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.SubZona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>
<%
     
    List<SubZona> subzona = ServicioSubZona.getInstancia().getListadoSubZona();

%>
<div class="col-lg-6">
    <form action="/agricultura-online/ZonaControl"  method="post">        
        <div class="form-group">
            <label>Nombre</label>
            <input name="nombre" class="form-control">               
        </div>
        
          <div class="form-group">
            <label>Sub Zona</label>
            <select class="form-control" name="subzona">
                <c:forEach items="<%=subzona%>" var="subzona">
                    <option value="${subzona.getId()}">${subzona.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
		
        <button type="submit" class="btn btn-default">Crear</button>
     
</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>