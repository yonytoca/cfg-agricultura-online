<%-- 
    Document   : creartipousuario
    Created on : 20/04/2015, 12:26:22 PM
    Author     : VíctorAndrés
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>

    <h2 class="sub-header">Agregar Tipo Usuario</h2>

<div class="col-lg-6">
    <form action="/agricultura-online/TipoUsuarioControl"  method="post">        
        <div class="form-group">
            <label>Nombre</label>
            <input name="nombre" class="form-control">               
        </div>
        <div class="form-group input-group">
            <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">Crear</button>                   
            </span>
        </div>
</div>


</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>