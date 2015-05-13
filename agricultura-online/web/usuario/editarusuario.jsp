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
        if (formulario.usuario.value.length == 0) { //comprueba que no esté vacío
            formulario.usuario.focus();
            alert('No has escrito tu nombre');
            return false; //devolvemos el foco
        }
        if (formulario.email1.value.length == 0) { //comprueba que no esté vacío
            formulario.email1.focus();
            alert('No has escrito tu e-Mail');
            return false;
        }
        if (formulario.email1.value != formulario.email2.value) {
            formulario.email1.focus();            //comprueba que sean iguales
            alert('Los e-Mails no coinciden');
            return false;
        }
        if (formulario.consulta.value.length == 0) {  //comprueba que no esté vacío
            formulario.consulta.focus();
            alert('No has escrito ninguna consulta');
            return false;
        }
        return true;
    }
</script>


<form action="../" onsubmit="return checkEmail(this);">
<p> Enter Your Email Address:<br>
<input type="TEXT" name="EMAIL_1" size="20" maxlength="20"> 
<br>
Please Confirm Your Email Address:
<br>
<input type="TEXT" name="EMAIL_2" size="20" maxlength="20"> 
<br>
<input type="SUBMIT" value="Send Address!"></p> 
</form>





<%
    int id = Integer.parseInt(request.getParameter("id"));
    Usuario usuarios = ServicioUsuario.getInstancia().getUsuarioPorId(id);

    List<TipoUsuario> tusuario = ServicioTipoUsuario.getInstancia().getListadoTipoUsuario();
//    List<Usuario> usuariolis = ServicioUsuario.getInstancia().getListadoUsuario();
%>



<div class="col-lg-6">       
    <form action="/agricultura-online/CrearUsuarioControl"   method="post"  onsubmit="return checkEmail(this);">        
        <div class="form-group">
            <label>Usuario</label>
            <input name="id" type="hidden" value="<%=usuarios.getId()%>" class="form-control">               
            <input name="usuario" value="<%=usuarios.getUsuario()%>" class="form-control">               
        </div>
        <div class="form-group">
            <label>Clave anterior</label>
            <input name="clave1" type="password" value="<%=usuarios.getClave()%>" class="form-control">               
        </div> 
        <div class="form-group">
            <label>Clave Anterio </label>
            <input name="clave2" type="password" value="" class="form-control">               
        </div> 
        <div class="form-group">
            <label>Clave nueva</label>
            <input name="clave" type="password" value="" class="form-control">               
        </div> 
        <div class="form-group">
            <label>Tipo usuario </label>
            <select class="form-control" name="tusuario">                

                <option value="<%=usuarios.getTipo_usuario_id().getId()%>"><%=usuarios.getTipo_usuario_id().getNombre()%></option>                                
                <c:forEach items="<%=tusuario%>" var="tusuario">                    
                    <option value="${tusuario.getId()}">${tusuario.getNombre()}</option>
                </c:forEach>                
            </select>
        </div>        
        
        <div class="form-group input-group">
            <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">Actualizar</button>                   
            </span>
        </div>

    </form>
    <script type="text/javascript" language="JavaScript">
<!--
//--------------------------------
// This code compares two fields in a form and submit it
// if they're the same, or not if they're different.
//--------------------------------
function checkEmail(theForm) {
	if (theForm.clave1.value != theForm.clave2.value)
	{
		alert('Those emails don\'t match!');
		return false;
	} else {
		return true;
	}
}
//-->
</script>
</div>
<jsp:include page="../teplate/footer.jsp"/>        