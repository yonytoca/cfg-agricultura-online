<%-- 
    Document   : controllogin
    Created on : 04/05/2015, 05:24:44 PM
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
    function validar(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if ((tecla < 48 || tecla > 57) && (tecla > 31) && (tecla != 127))
            return false;
    }
</script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onLoad="javascript:enviarForm();"> 

        <script language="javascript">
            function enviarForm()
            {
                document.b.submit();
            }
        </script>   

        <form name="b" action="/agricultura-online/TipoUsuarioControl"  method="post">        
            <div class="form-group">
                <label>Nombre</label>
                <input name="nombre" class="form-control ">               
            </div>
            <div class="form-group input-group">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-primary">Crear</button>                   
                </span>
            </div>
        </div>


    </form>


    <h1>Hello World!</h1>
    <input name="nombre" type="text" class="form-control" onkeypress="return validar(event)" placeholder="Nombre" >


    <table>
        <caption>2009 Individual Sales by Category</caption>
        <thead>
            <tr>
                <td></td>
                <th>food</th>
                <th>auto</th>
                <th>household</th>
                <th>furniture</th>
                <th>kitchen</th>
                <th>bath</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Mary</th>
                <td>150</td>
                <td>160</td>
                <td>40</td>
                <td>120</td>
                <td>30</td>
                <td>70</td>
            </tr>
            <tr>
                <th>Tom</th>
                <td>3</td>
                <td>40</td>
                <td>30</td>
                <td>45</td>
                <td>35</td>
                <td>49</td>
            </tr>
            ...Las columnas repetidas las saco por brevedad
        </tbody>
    </table>

    $('table').visualize({options});

</body>
</html>
