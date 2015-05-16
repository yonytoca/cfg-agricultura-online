<%-- 
    Document   : grafico
    Created on : 16-may-2015, 1:53:38
    Author     : victor
--%>
<%@page import="org.cfg.uapa.java.agricultura.servicios.ServicioSiembraDetalle"%>
<%@page import="org.cfg.uapa.java.agricultura.entidades.Siembra"%>
<%@page import="java.util.List"%>
<html>
  <head>
      <%

    List<Siembra> siembras = ServicioSiembraDetalle.getInstancia().getListadoSiembradetalle();
    List<Siembra> siembraz = ServicioSiembraDetalle.getInstancia().getListadoSiembradetallezona();
    Siembra constanza = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(1, 1);
    Siembra tireo = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(2, 2);
    Siembra rio = ServicioSiembraDetalle.getInstancia().getSiembraDetallePorId(3, 3);
%>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Language', 'Speakers (in porcentage)'],
          ['constanza', 50], ['tireo', 30], ['el rio', 20],
          
        ]);

        var options = {
          title: 'Produccion por zona',
          legend: 'none',
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    12: {offset: 0.3},
                    14: {offset: 0.4},
                    15: {offset: 0.5},
          },
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
      
      
    </script>
    
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>