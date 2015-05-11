<%-- 
    Document   : hola
    Created on : 11-may-2015, 22:20:50
    Author     : victor
--%>

<%@page import="org.cfg.uapa.java.agricultura.entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body onLoad="javascript:enviarForm();">
        
           <% Usuario currentUser =  (Usuario) session.getAttribute("currentSessionUser");%>        
                               
                         
                        
                            <% if (session.getAttribute("currentSessionUser").equals(null)){%>
                            <a href="login.jsp"> </a>
                            <%}
                                else{%>
                            <a href="logaut.jsp"> </a>
                            <%}
                            %>  
      
        
        <script language="javascript">
function enviarForm()
{
document.b.submit();
}
</script>
<form name="b" role="form" action="/agricultura-online/controlsession">
    <div class="form-group input-group">
        
        <input name="seccion" type="hidden" value="<%= currentUser.getTipo_usuario_id().getId() %>" class="form-control" placeholder="Nombre">
    </div   

</form>
    </body>
</html>
