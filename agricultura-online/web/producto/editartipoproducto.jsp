<%-- 
    Document   : editartipoproducto
    Created on : 01-may-2015, 17:16:46
    Author     : victor
--%>

<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioTipoProducto"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.TipoProducto"%>
<jsp:include page="../teplate/header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));

  TipoProducto  tproducto = ServicioTipoProducto.getInstancia().getTipoProductoPorId(id);


%>


<form class="form-horizontal" action="/agricultura-online/TipoProductoControl" method="post">
    <input type="hidden" name="idTipoProducto" value="<%=tproducto.getId()%>"/>

    <div class="form-group">
        <label>Nombre</label>
        <input type="text" name="nombre" style="width:50%;" id="inputNombre" class="form-control" placeholder="Nombre" value="<%=tproducto.getNombre()%>">
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-default" tabindex="3">Confirmar</button>
    </div>

</form>
<jsp:include page="../teplate/footer.jsp"/>