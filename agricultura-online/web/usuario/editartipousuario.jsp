<%-- 
    Document   : editartipousuario
    Created on : 03/05/2015, 07:18:00 PM
    Author     : EDUARDO
--%>

<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    TipoUsuario tusuarios = ServicioTipoUsuario.getInstancia().getTipoUsuarioPorId(id);

%>



    <h2 class="sub-header">Actualizar Tipo de Usuario</h2>


<div class="col-lg-6">
    <form action="/agricultura-online/TipoUsuarioControl"  method="post">        
        <div class="form-group">
            <label>Nombre</label>
            <input name="id" type="hidden" class="form-control" value="<%=tusuarios.getId()%>">
            <input name="nombre" class="form-control" value="<%=tusuarios.getNombre()%>">               
        </div>
        <div class="form-group input-group">
            <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">Actualizar</button>                   
            </span>
        </div>
</div>


</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>
