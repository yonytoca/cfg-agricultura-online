<%-- 
    Document   : tipo_producto
    Created on : 20/04/2015, 09:44:19 PM
    Author     : Yanelkys
--%>
<jsp:include page="../teplate/header.jsp"/>

        <div class="col-lg-6">
            <form action="/agricultura-online/TipoProductoControl" method="post">           
            <div class="form-group">
                <label>Nmobre</label>
                <input name="nombre" class="form-control">               
            </div>
           <div class="form-group input-group">
        <span class="input-group-btn">
            <button type="submit" class="btn btn-primary">Crear</button>                   
        </span>
    </div>           
         
        </form>
    </div>
<jsp:include page="../teplate/footer.jsp"/>