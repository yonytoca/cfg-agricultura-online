<%-- 
    Document   : controllogin
    Created on : 04/05/2015, 05:24:44 PM
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<table id="dataTable" summary="Member Data from 2000 to 2006">
    <caption>Member Data from 2000 to 2006</caption>
    <thead>
        <tr>
            <td></td>
            <th id="2000">2000</th>
            <th id="2001">2001</th>
            <th id="2002">2002</th>
            <th id="2003">2003</th>
            <th id="2004">2004</th>        
        </tr>
    </thead>
    <tfoot>
       
    </tfoot>
    <tbody>
        <tr>
            <th headers="members">Mary</th>
            <td headers="2000">150</td>
            <td headers="2001">160</td>
            <td headers="2002">40</td>
            <td headers="2003">120</td>
            <td headers="2004">30</td>
        </tr>
        <tr>
            <th headers="members">Tom</th>
            <td headers="2000">3</td>
            <td headers="2001">40</td>
            <td headers="2002">30</td>
            <td headers="2003">45</td>
            <td headers="2004">35</td>
        </tr>
        <tr>
            <th headers="members">Brad</th>
            <td headers="2000">10</td>
            <td headers="2001">00</td>
            <td headers="2002">10</td>
            <td headers="2003">85</td>
            <td headers="2004">25</td>
        </tr>
        <tr>
            <th headers="members">Kate</th>
            <td headers="2000">40</td>
            <td headers="2001">80</td>
            <td headers="2002">90</td>
            <td headers="2003">25</td>
            <td headers="2004">15</td>
        </tr>      
    </tbody>
</table>


<canvas id="chart1" class="fgCharting_src-dataTable_type-pie" width="400" height="400"></canvas>


	
$.fgCharting();

<?xml version="1.0" standalone="no" ?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="800" height="800" version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 400">
<script type="text/ecmascript"> <![CDATA[




SVGDocument = null;
parent.setPoint = setPoint;
parent.setTitle= setTitle;
////////////////////////////////////////////////////////////////////
//
// SET TITLE
//
////////////////////////////////////////////////////////////////////
function setTitle(text)
{
// creating the title
var title= document.createElement('text');
// style a properties
title.setAttribute('x', 40);
title.setAttribute('y',20);
title.setAttribute('fill', 'black');
title.setAttribute('font-family','arial');
title.setAttribute('font-size',40);
var child =document.createTextNode(text);
titulo.appendChild(hijo);
// adding the new child
var contend= document.getElementById('contend');
title = contend.appendChild(title);
}
////////////////////////////////////////////////////////////////////
//
// SET POINT
//
////////////////////////////////////////////////////////////////////
function setPoint(x, y, color)
{
// creating a new point
var point= document.createElement('rect');
// setting style and properties
var width= 2;
var height= 2;
point.setAttribute('x', x+30);
point.setAttribute('y', y+30);
point.setAttribute('width', width);
point.setAttribute('height',height);
point.setAttribute('stroke', color);
// adding the new child
var contend= document.getElementById('contend');
point = contend.appendChild(point);
}
]]>
</script>
<g id="contend" >
<rect fill="none" stroke="black" stroke-width="1" width="740" height="740" x="30" y="30" />
</g>
</svg>










<script>
    function validar(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if ((tecla < 48 || tecla > 57) && (tecla > 31) && (tecla != 127))
            return false;
    }
</script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onLoad="javascript:enviarForm();"> 

        <script language="javascript">
            function enviarForm()
            {
                document.b.submit();
            }
        </script>   

        <form name="" action="/agricultura-online/TipoUsuarioControl"  method="post">        
            <div class="form-group">
                <label>Nombre</label>
                <input name="nombre" class="form-control ">               
            </div>
            <div class="form-group input-group">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-primary">Crear</button>                   
                </span>
            </div>
        </div>


    </form>


    <h1>Hello World!</h1>
    <input name="nombre" type="text" class="form-control" onkeypress="return validar(event)" placeholder="Nombre" >


    <table>
        <caption>2009 Individual Sales by Category</caption>
        <thead>
            <tr>
                <td></td>
                <th>food</th>
                <th>auto</th>
                <th>household</th>
                <th>furniture</th>
                <th>kitchen</th>
                <th>bath</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Mary</th>
                <td>150</td>
                <td>160</td>
                <td>40</td>
                <td>120</td>
                <td>30</td>
                <td>70</td>
            </tr>
            <tr>
                <th>Tom</th>
                <td>3</td>
                <td>40</td>
                <td>30</td>
                <td>45</td>
                <td>35</td>
                <td>49</td>
            </tr>
            ...Las columnas repetidas las saco por brevedad
        </tbody>
    </table>

    $('table').visualize({options});

</body>
</html>
