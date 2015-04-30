<%-- 
    Document   : socio
    Created on : 22/04/2015, 12:19:55 AM
    Author     : EDUARDO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSocio"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Socio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    List<Socio> socio = ServicioSocio.getInstancia().getListadoSocio();    
%>
<center>
    <h2 class="sub-header">Socios</h2>
</center>
   
    <div class="dataTable_wrapper">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
           <thead>
                <tr><th>Codigo</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Telefono</th>
                    <th>Dirección</th>
                    <th>Usuario</th>
                    <th>Imagen</th>
                    
                </tr>    
            </thead>
            <tbody>
                <c:forEach items="<%=socio%>" var="socio">
                    <tr>
                        <td>${socio.getId()}</td>
                        <td>${socio.getNombre()}</td>
                        <td>${socio.getApellido()}</td>
                        <td>${socio.getTelefono()}</td>
                        <td>${socio.getDireccion()}</td>
                        <td>${socio.getId_usuario().getUsuario()}</td>
                        <td>${socio.getImg()}</td>
                        <td><a href="updatesocio.jsp?id=${socio.getId()}"><i class="glyphicon glyphicon-edit"></i>editar</a></td>
                    </tr>
                </c:forEach>                         
            </tbody>
        </table>
    </div>

