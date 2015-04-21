<%-- 
    Document   : index
    Created on : 19/04/2015, 09:58:47 PM
    Author     : EDUARDO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%try{
Class.forName("com.mysql.jdbc.Driver");
Connection conexion=DriverManager.getConnection
("jdbc:mysql://127.0.0.1/Agricultura","root","root");
out.println("Conexión realizada con éxito a: "+conexion.getCatalog());
conexion.close();
} catch(SQLException ex)
{ %>
<%="Se produjo una excepción durante la conexión:"+ex%>
<%} catch(Exception ex){ %>
<%="Se produjo una excepción:"+ex%>
<%}%>
            
            Hello World!</h1>
    </body>
</html>
