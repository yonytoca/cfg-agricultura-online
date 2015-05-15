<%-- 
    Document   : indexsocios
    Created on : 11-may-2015, 22:46:26
    Author     : victor
--%>

<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembraDetalle"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembra"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Siembra"%>
<%@page import="java.util.List"%>
<jsp:include page="template/header.jsp"/>
<!DOCTYPE html>


<%

    List<Siembra> siembras = ServicioSiembraDetalle.getInstancia().getListadoSiembradetalle();
    List<Siembra> siembraz = ServicioSiembraDetalle.getInstancia().getListadoSiembradetallezona();
    Siembra constanza = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(1, 1);
    Siembra tireo = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(2, 2);
    Siembra rio = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(3, 3);
%>

<input type="text" name="idsiembra" value="<%=constanza.getCantidad_producto()%>" required="" />
<input type="text" name="idsiembra" value="<%=tireo.getCantidad_producto()%>" required="" />
<input type="text" name="idsiembra" value="<%=rio.getCantidad_producto()%>" required="" />
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




<!-- START LINE CHART -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Line Chart</h3>                                
    </div>
    <div class="panel-body">
        <div id="morris-line-example" style="height: 300px;"></div>
    </div>
</div>
<!-- END LINE CHART -->
<div class="page-header">
    <div class="page-title">
        <h3>Estadisticas</h3>

    </div>
</div>



<!-- START LINE CHART -->
<div class="row">
    <div class="col-md-6">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reportes por tipo de violencia</h4>
                <div class="toolbar no-padding">
                    <div class="btn-group">
                        <span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="widget-content">
                <div id="chart_pie" class="chart"></div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reportes por cantidad de ingresos</h4>
                <div class="toolbar no-padding">
                    <div class="btn-group">
                        <span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="widget-content">
                <div id="chart_pie" class="chart"></div>
            </div>
        </div>
    </div>
</div>
<!-- END LINE CHART -->

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
<jsp:include page="template/footer.jsp"/>