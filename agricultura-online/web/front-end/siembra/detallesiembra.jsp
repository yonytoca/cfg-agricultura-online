<%-- 
    Document   : detallesiembra
    Created on : 10-may-2015, 19:35:34
    Author     : victor
--%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembraDetalle"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembra"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Siembra"%>
<%@page import="java.util.List"%>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>


<%

    List<Siembra> siembras = ServicioSiembraDetalle.getInstancia().getListadoprueba(1);
    List<Siembra> siembraz = ServicioSiembraDetalle.getInstancia().getListadoSiembradetallezona();
    Siembra constanza = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(1, 1);
    Siembra tireo = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(2, 2);
    Siembra rio = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(3, 3);
%>


<script type="text/javascript">
    "use strict";

    $(document).ready(function () {
        var tipos = [];
        tipos[0] = "constanza";
        tipos[1] = "tireo";
        tipos[2] = "rio";
        var total = [];
        total[0] =${constanza.getCantidad()};
        total[1] =${tireo.getCantidad()};
        total[2] =${rio.getCantidad()};

        var d_pie = [];
        var series = 3;
        for (var i = 0; i < series; i++) {
            d_pie[i] = {label: tipos[i], data: Math.floor(total[i] * 100) + 1};

        }

        $.plot("#morris-line-example", d_pie, $.extend(true, {}, Plugins.getFlotDefaults(), {
            series: {
                pie: {
                    show: true,
                    radius: 1,
                    label: {
                        show: true
                    }
                }
            },
            grid: {
                hoverable: true
            },
            tooltip: true,
            tooltipOpts: {
                content: '%p.0%, %s', // show percentages, rounding to 2 decimal places
                shifts: {
                    x: 20,
                    y: 0
                }
            }
        }));

    });
</script>






<center>
    <h2 class="sub-header">Siembras</h2>
</center>

<div class="panel panel-default">
    <div class="panel-heading">                                
        <h3 class="panel-title">Lista de roduccion por productos</h3>
        <ul class="panel-controls">            
            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
        </ul>                                
    </div>
    <div class="panel-body">
        <table class="table datatable">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Producto</th>               
                    <th>Cantidad</th>   
                </tr>
            </thead>
            <tbody
                <c:forEach items="<%=siembras%>" var="siembras">
                    <tr>
                        <td>${siembras.getId_producto().getId()}</td>  
                        <td>${siembras.getId_producto().getNombre()}</td>          
                        <td>${siembras.getCantidad_producto()}</td>

                    </tr>
                </c:forEach>      
            </tbody> 
        </table>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">                                
        <h3 class="panel-title">Lista de produccion por zona</h3>
        <ul class="panel-controls">            
            <li><a href="#" class="panel-refresh"><span class="fa fa-refresh"></span></a></li>
        </ul>                                
    </div>
    <div class="panel-body">
        <table class="table datatable">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Producto</th> 
                    <th>zona</th> 
                    <th>Cantidad</th>   
                </tr>
            </thead>
            <tbody
                <c:forEach items="<%=siembraz%>" var="siembraz">
                    <tr>
                        <td>${siembraz.getId_producto().getId()}</td>  
                        <td>${siembraz.getId_producto().getNombre()}</td>  
                        <td>${siembraz.getCantidad_producto()}</td>

                    </tr>
                </c:forEach>      
            </tbody> 
        </table>
    </div>
</div>

<!-- FIN DATATABLE -->
<a href="crearsiembra.jsp"> Crear Siembra</a>
<jsp:include page="../template/footer.jsp"/>