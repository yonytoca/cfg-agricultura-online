<%-- 
    Document   : EditarZona
    Created on : 03/05/2015, 05:11:33 PM
    Author     : Yanelkys
--%>

<%@page import="org.cfg.uapa.java.agricultura.entidades.Zona"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioZona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>
<% int id=Integer.parseInt(request.getParameter("id"));
Zona zona=ServicioZona.getInstancia().getZonaPorId(id);
%>

    <h2 class="sub-header">Actualizar Zona</h2>

<div class="col-lg-6">
    <form action="/agricultura-online/ZonaControl"  method="post">        
        <div class="form-group">
            <label>Nombre</label>
            <input type="hidden" name="idzona" class="form-control" value="<%=zona.getId()%>" required="">
            <input name="nombre" class="form-control" value="<%=zona.getNombre()%>" required=""> 
        </div>
                
        
        <button type="submit" class="btn btn-default">Crear</button>
     
</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>