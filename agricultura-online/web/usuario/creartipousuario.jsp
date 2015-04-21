<%-- 
    Document   : creartipousuario
    Created on : 20/04/2015, 12:26:22 PM
    Author     : VíctorAndrés
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../teplate/header.jsp"/>

        <div class="col-lg-6">
            <form action="/agricultura-online/TipoUsuarioControl"  method="post">        
            <div class="form-group">
                <label>Nmobre</label>
                <input name="nombre" class="form-control">               
            </div>
            <button type="submit" class="btn btn-default">Crear</button>
            </div>
            
         
        </form>
    </div>
<jsp:include page="../teplate/footer.jsp"/>