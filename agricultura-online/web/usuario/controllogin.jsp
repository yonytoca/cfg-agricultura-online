<%-- 
    Document   : controllogin
    Created on : 04/05/2015, 05:24:44 PM
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

< %@ page session="true" %>

< %

String nombre = "";

HttpSession sesionOk = request.getSession();

if (sesionOk.getAttribute("nombre") == null) {

%>

<jsp:forward page="miInicio.jsp">

<jsp:param name="error" value="Coloca tus datos"/>

</jsp:forward>

< %

} else {

nombre = (String)sesionOk.getAttribute("nombre");

}
%>
        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
