<%-- 
    Document   : index
    Created on : 19/04/2015, 09:58:47 PM
    Author     : EDUARDO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioContacto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Contacto"%>
<%@page import="java.util.List"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="teplate/header.jsp"/>
     <%
    List<Contacto> contacto = ServicioContacto.getInstancia().getListadoContacto();    
%>

<center>
    <h2 class="sub-header">Mensajes Recibidos </h2>
</center>

<!-- INICIO DATATABLE -->
<div class="panel panel-default">
    <div class="panel-heading">                                
        <h3 class="panel-title">Lista</h3>
        <ul class="panel-controls">
            
            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
            
        </ul>                                
    </div>
    <div class="panel-body">
        <table class="table datatable">
           <thead>
                <tr><th>Codigo</th>
                    <th>Fecha</th>
                    <th>Nombre</th>
                    <th>Asunto</th>
                    <th>Correo</th>
                    <th>Mensaje</th>
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=contacto%>" var="contacto">
                    <tr>
                        <td>${contacto.getId()}</td>
                        <td>${contacto.getFecha()}</td>
                        <td>${contacto.getNombre()}</td>
                        <td>${contacto.getAsunto()}</td>
                        <td>${contacto.getCorreo()}</td>
                        <td>${contacto.getMensaje()}</td>
                        

                    </tr>
                </c:forEach>                         
            </tbody>

        </table>
    </div>
</div>
                            
                                 
<jsp:include page="teplate/footer.jsp"/>
