<%-- 
    Document   : crearsiembra
    Created on : 25/04/2015, 04:30:29 PM
    Author     : VíctorAndrés
--%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Zona"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioZona"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSocio"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Socio"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>


<%
    List<Producto> producto = ServicioProducto.getInstancia().getListadoProducto();
    List<Socio> socio = ServicioSocio.getInstancia().getListadoSocio();
    List<Zona> zona = ServicioZona.getInstancia().getListadoZona();
    Date dNow = new Date();
    SimpleDateFormat ft
            = new SimpleDateFormat("yyyy/dd/MM");
    String currentDate = ft.format(dNow);
%>
<script>
    function validar(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if ((tecla < 48 || tecla > 57) && (tecla > 31) && (tecla != 127))
            return false;
    }

    function validateForm() {
        var x = document.forms["my"]["cproducto"].value;
        if (x == null || x == "") {
            alert("Aun tiene campos en blanco");            
            return false;
        }
        var x1 = document.forms["my"]["tsembrada"].value; 
        if (x1 == null || x1 == "") {
            alert("Aun tiene campos en blanco1");
            return false;
        }
    }



</script>



<div class="col-lg-6">
    
    <form name="my" action="/agricultura-online/SiembraControl"  method="post" onsubmit="return validateForm()"> 

        <div class="form-group">
            <label>Producto</label>
            <select class="form-control" name="producto">
                <c:forEach items="<%=producto%>" var="producto">
                    <option value="${producto.getId()}">${producto.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>
        <label>
             <% Usuario currentUser =  (Usuario) session.getAttribute("currentSessionUser");%>        
            
                   
            <%= currentUser.getUsuario() %>
            <input name="seccion" type="text" value="<%= currentUser.getId() %>" class="form-control" placeholder="Nombre">
        </label>
        <label>Fecha Siembra</label>
        <div class="form-group">           
            <div class="col-md-5">
                <div class="input-group">
                    <input type="text" id="dp-3" name="fsiembra" value="<%=currentDate%>"/>

                </div>
            </div>            
        </div><br><br>



        <div class="form-group">
            <label>Cantida Producto</label>
            <input name="cproducto" onkeypress="return validar(event)" class="form-control">               
        </div> 

        <div class="form-group">
            <label>Socio</label>
            <select class="form-control" name="socio">
                <c:forEach items="<%=socio%>" var="socio">
                    <option value="${socio.getId()}">${socio.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>


        <div class="form-group">
            <label>Zona</label>
            <select class="form-control" name="zona">
                <c:forEach items="<%=zona%>" var="zona">
                    <option value="${zona.getId()}">${zona.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>

        <div class="form-group">
            <label>Tarea Sembrada</label>
            <input name="tsembrada" onkeypress="return validar(event)" class="form-control">               
        </div> 
        
        <div class="form-group input-group">
            <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">Crear</button>                   
            </span>
        </div>
    </form>
</div>
<jsp:include page="../teplate/footer.jsp"/>