<%-- 
    Document   : crearproducto
    Created on : 20/04/2015, 08:24:10 PM
    Author     : Yanelkys
--%>
<div class="col-lg-6">
    <form action="/agricultura-online/ProductoControl" method="post">    
        <div class="form-group">
            <label>Nombre</label><br>
            <input name="nombre" class="form-control">          
        </div>
        <div class="form-group">
            <label>Imagen</label><br>
            <input name="img" class="form-control">   
            <div class="form-group">
                <label>Cantidad Siembra</label><br>
                <input name="csiembra" class="form-control">          
            </div>
        </div>

        <button type="submit" class="btn btn-default">crear</button>
</div>


</form>
</div>