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

    List<Siembra> siembras = ServicioSiembraDetalle.getInstancia().getListadoSiembradetalle();
    List<Siembra> siembraz = ServicioSiembraDetalle.getInstancia().getListadoSiembradetallezona();
%>


<script type="text/javascript">
    "use strict";

    $(document).ready(function () {
        var tipos = [];
        tipos[0] = "producto";
        tipos[1] = "cantidad";
        tipos[2] = "De 7,000 a 15,000";       
        var total = [];
        total[0] =${siembras.getId_producto().getId()};
        total[1] =${siembras.getId_producto().getNombre()};
        total[2] =${siembraz.getCantidad_producto()};
        
        var d_pie = [];
        var series = 5;
        for (var i = 0; i < series; i++) {
            d_pie[i] = {label: tipos[i], data: Math.floor(total[i] * 100) + 1};

        }

        $.plot("#siembras", d_pie, $.extend(true, {}, Plugins.getFlotDefaults(), {
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
<div class="page-header">
    <div class="page-title">
        <h3>Estadisticas</h3>

    </div>
</div>
<h2>Total de reportes por mes</h2>
<!--=== Widget Chart ===-->
<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-chart"> <!-- Possible colors: widget-chart-blue, widget-chart-blueLight (standard), widget-chart-green, widget-chart-red, widget-chart-yellow, widget-chart-orange, widget-chart-purple, widget-chart-gray -->
                <div id="pormes" class="chart chart-medium"></div>
            </div>
            <div class="widget-content">
                <ul class="stats"> <!-- .no-dividers -->
                    <li>
                        <strong><%=.getTotal()%></strong>
                        <small>Total de reportes activos</small>
                    </li>
                    <li class="light">
                        <strong><%=inactivo.getTotal()%></strong>
                        <small>Total de reportes inactivos</small>
                    </li>
                    <li>
                        <strong><%=eninvestigacion.getTotal()%></strong>
                        <small>Total de reportes en investigacion</small>
                    </li>
                    <li class="light">
                        <strong><%=descartado.getTotal()%></strong>
                        <small>Total de reportes descartados</small>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

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