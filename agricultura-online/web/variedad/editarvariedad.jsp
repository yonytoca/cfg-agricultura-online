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

    <h2 class="sub-header">Actualizar Valiedad</h2>


<form class="form-horizontal" action="/agricultura-online/VariedadControl" method="post">
    <input type="hidden" name="idvariedad" value="<%=variedad.getId()%>"/>

    <div class="form-group">
        <label>Nombre</label>
        <input type="text" name="nombre" style="width:50%;" id="inputNombre" class="form-control" placeholder="Nombre" value="<%=variedad.getNombre()%>">
    </div>

    <div class="form-group input-group">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">Actualizar</button>                   
        </span>
    </div>

</form>
<jsp:include page="../teplate/footer.jsp"/>