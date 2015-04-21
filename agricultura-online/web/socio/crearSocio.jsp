<%-- 
    Document   : crearSocio
    Created on : 19/04/2015, 11:44:40 PM
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <form role="form" action="/agricultura-online/SocioControl">
            <div class="form-group input-group">
                <label>Nombre </label>
                <input name="nombre" type="text" class="form-control" placeholder="Nombre">
            </div>
            <div class="form-group input-group">
                <label>Apellido</label>
                <input name="apellido" type="text" class="form-control" placeholder="Apellido">                                            
            </div>
            <div class="form-group input-group">
                <label>Teléfono</label>
                <input type="text" class="form-control" placeholder="Teléfono">
            </div>
            <div class="form-group input-group">
                <label> Dirección</label>
                <input name="direccion" type="text" class="form-control" placeholder="Dirección">                                            
            </div>
            <div class="form-group input-group">
                <label> Usuario</label>
                <input name="usuario" type="text" class="form-control" placeholder="Usuario">

            <div class="form-group input-group">
                <label> Clave</label>
                <input name="cleve" type="text" class="form-control" placeholder="Clave">

            </div>
            </div>
            <div class="form-group input-group">
                <label> Producto</label>
                <input name="producto" type="text" class="form-control" placeholder="Producto">

            </div>
            <div class="form-group input-group">
                <label> Imagen</label>
                <input name="imagen" type="text" class="form-control" placeholder="Imagen">

            </div>
            <div class="form-group input-group">
                
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-primary">Guardar</button>
                   
                </span>
            </div>
        </form>


    </body>
</html>
