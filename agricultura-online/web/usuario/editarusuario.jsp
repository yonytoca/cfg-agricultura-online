<%-- 
    Document   : updateusuario
    Created on : 30/04/2015, 10:46:29 PM
    Author     : EDUARDO
--%>

<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioUsuario"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../teplate/header.jsp"/>
<!DOCTYPE html>
<script type="text/javascript">
function validarForm(formulario) {
  if(formulario.usuario.value.length==0) { //comprueba que no esté vacío
    formulario.usuario.focus();   
    alert('No has escrito tu nombre'); 
    return false; //devolvemos el foco
  }
  if(formulario.email1.value.length==0) { //comprueba que no esté vacío
    formulario.email1.focus();
    alert('No has escrito tu e-Mail');
    return false;
  }
  if(formulario.email1.value!=formulario.email2.value) {
    formulario.email1.focus();            //comprueba que sean iguales
	alert('Los e-Mails no coinciden');
    return false;
  }
  if(formulario.consulta.value.length==0) {  //comprueba que no esté vacío
    formulario.consulta.focus();
    alert('No has escrito ninguna consulta');
    return false;
  }
  return true;
}
</script>
<%
    int id = Integer.parseInt(request.getParameter("id"));    
    Usuario usuarios = ServicioUsuario.getInstancia().getUsuarioPorId(id);    
    List<TipoUsuario> tusuario = ServicioTipoUsuario.getInstancia().getListadoTipoUsuario();
//    List<Usuario> usuariolis = ServicioUsuario.getInstancia().getListadoUsuario();
%>

<div class="col-lg-6">
    <form action="/agricultura-online/CrearUsuarioControl"  method="post"  onsubmit="return validarForm(this);">        
        <div class="form-group">
            <label>Usuario</label>
            <input name="id" type="hidden" value="<%=usuarios.getId()%>" class="form-control">               
            <input name="usuario" value="<%=usuarios.getUsuario()%>" class="form-control">               
        </div>
        <div class="form-group">
            <label>Clave</label>
            <input name="clave" type="password" value="<%=usuarios.getClave()%>" class="form-control">               
        </div> 
        <div class="form-group">
            <label>Tipo Usuario </label>
            <select class="form-control" name="tusuario">                
                                
                <c:forEach items="<%=tusuario%>" var="usuario">                    
                    <option value="${tusuario.getId()}">${tusuario.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>        
        <button type="submit" class="btn btn-default">Crear</button>     
</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>        