<%-- 
    Document   : editarvariedad
    Created on : 01-may-2015, 16:33:37
    Author     : victor
--%>

<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioVariedad"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Variedad"%>
<jsp:include page="../teplate/header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
  Variedad  variedad = ServicioVariedad.getInstancia().getVariedadPorId(id);


%>

<form class="form-horizontal" action="/agricultura-online/VariedadControl" method="post">
    <input type="hidden" name="idvariedad" value="<%=variedad.getId()%>"/>

    <div class="form-group">
        <label>Nombre</label>
        <input type="text" name="nombre" style="width:50%;" id="inputNombre" class="form-control" placeholder="Nombre" value="<%=variedad.getNombre()%>">
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-default" tabindex="3">Confirmar</button>
    </div>

</form>
<jsp:include page="../teplate/footer.jsp"/>