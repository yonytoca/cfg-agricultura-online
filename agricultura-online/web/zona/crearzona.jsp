<%-- 
    Document   : crearzona
    Created on : 25/04/2015, 03:09:19 PM
    Author     : VíctorAndrés
--%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Variedad"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSubZona"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.SubZona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>
<%
     
    List<SubZona> subzona = ServicioSubZona.getInstancia().getListadoSubZona();

%>

<script type="text/javascript">
function validarForm(zona) {
  if(zona.nombre.value.length==0) { //comprueba que no esté vacío
    zona.nombre.focus();   
    alert('No has escrito tu nombre'); 
    return false; //devolvemos el foco
  }
  return true;
}
</script>

<div class="col-lg-6">
    <form name="zona" action="/agricultura-online/ZonaControl"  method="post" onsubmit="return validarForm(this);">        
        <div class="form-group">
            <label>Nombre de la zona</label>
            <input name="nombre" class="form-control">               
        </div>
     
       
        <button type="submit" class="btn btn-default">Crear</button>
     
</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>