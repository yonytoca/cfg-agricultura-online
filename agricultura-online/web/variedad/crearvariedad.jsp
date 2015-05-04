<%-- 
    Document   : crearvariedad
    Created on : 25/04/2015, 10:59:24 AM
    Author     : VíctorAndrés
--%>

<jsp:include page="../teplate/header.jsp"/>

<div class="col-lg-6">
    <form action="/agricultura-online/VariedadControl" method="post">           
        <div class="form-group">
            <label>Nmobre</label>
            <input name="nombre" class="form-control">               
        </div>
        <div class="form-group input-group">
            <span class="input-group-btn">
                <button type="submit" class="btn btn-primary">Crear</button>                   
            </span>
        </div>
</div>         
</form>
</div>
<jsp:include page="../teplate/footer.jsp"/>