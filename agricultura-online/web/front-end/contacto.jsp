<%-- 
    Document   : contacto
    Created on : 14/05/2015, 10:30:43 PM
    Author     : EDUARDO
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    Date dNow = new Date();
    SimpleDateFormat ft
            = new SimpleDateFormat("yyyy/MM/dd");
    String currentDate = ft.format(dNow);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- META SECTION -->
        <title>Atlant - Front-End Template</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- END META SECTION -->

        <link rel="stylesheet" type="text/css" href="css/styles.css" media="screen" />

    </head>
    <body>
    <body>
        <!-- page container -->
        <div class="page-container">

            <!-- page header -->
            <div class="page-header">

                <!-- page header holder -->
                <div class="page-header-holder">

                    <!-- page logo -->
                    <div class="logo">
                        <a href="index.html">SIGECOPA</a>
                    </div>
                    <!-- ./page logo -->




                    <!-- nav mobile bars -->
                    <div class="navigation-toggle">
                        <div class="navigation-toggle-button"><span class="fa fa-bars"></span></div>
                    </div>
                    <!-- ./nav mobile bars -->

                    <!-- navigation -->
                    <ul class="navigation">
                        <li>
                            <a href="#">SIGECOPA</a>
                            <ul>
                                <li><a href="index.jsp">Pantalla Principal</a></li>
                                <li><a href="index-default.html">Default</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">CONTACTOS</a>
                            <ul>
                                <li><a href="about-us.html">Nosotros</a></li>
                                <li><a href="contacts.html">Contacts</a></li>
                                <li><a href="pricing.html">Pricing</a></li>
                            </ul>
                        </li>


                        <li>
                            <a href="#">Portfolio</a>
                            <ul>
                                <li><a href="portfolio-with-title.html">Portfolio With Title</a></li>
                                <li><a href="portfolio-2column.html">Portfolio 2 Column</a></li>
                                <li><a href="portfolio-3column.html">Portfolio 3 Column</a></li>
                                <li><a href="portfolio-4column.html">Portfolio 4 Column</a></li>
                            </ul>
                        </li>


                        <form class="navbar-form navbar-right" role="form" action="/agricultura-online/UsuarioControl" method="post" >
                            <div class="form-group">
                                <input type="text" class="form-control" name="usuario" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <input type="Password" class="form-control" name="clave" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-default">Entrar</button>
                        </form>
                    </ul>
                    <!-- ./navigation -->                        


                </div>
                <!-- ./page header holder -->

            </div>
            <!-- ./page header -->
            <form class="navbar-form navbar-right" role="form" action="/agricultura-online/ContactoControl" method="post" >
            <!-- page content -->
            <div class="page-content">

                <!-- page content wrapper -->
                <div class="page-content-wrap bg-light">
                    <!-- page content holder -->
                    <div class="page-content-holder no-padding">
                        <!-- page title -->
                        <div class="page-title">                            
                            <h1>Contacts Us</h1>
                            <!-- breadcrumbs -->

                            <!-- ./breadcrumbs -->
                        </div>
                        <!-- ./page title -->
                    </div>
                    <!-- ./page content holder -->
                </div>
                <!-- ./page content wrapper -->



                <!-- page content wrapper -->
                <div class="page-content-wrap">                    

                    <div class="divider"><div class="box"><span class="fa fa-angle-down"></span></div></div>                    
                    
                    <!-- page content holder -->
                    <div class="page-content-holder">

                        <div class="row">
                            <div class="col-md-7 this-animate" data-animate="fadeInLeft">
                                
                                    <div class="text-column">
                                        <h4>Contact Us</h4>
                                        <div class="text-column-info">
                                            Proin luctus nulla fringilla massa euismod commodo. Donec sit amet elementum libero. Curabitur ut lorem id tellus malesuada tincidunt et eget purus. 
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label> Nombre <span class="text-hightlight">*</span></label>
                                                <input name="nombre" type="text" class="form-control"/>
                                                <input type="hidden" id="dp-3" name="fecha" value="<%=currentDate%>"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label> Dirección <span class="text-hightlight">*</span></label>
                                                <input name="correo" type="text" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label> Asunto <span class="text-hightlight">*</span></label>
                                                <input name="asunto" type="text" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label> Mensage <span class="text-hightlight">*</span></label>
                                                <textarea name="mensaje" class="form-control" rows="8"></textarea>
                                            </div>
                                            <button class="btn btn-primary btn-lg pull-right">Send Message</button>
                                        </div>
                                    </div>
                                
                            </div>
                            <div class="col-md-5 this-animate" data-animate="fadeInRight">

                                <div class="text-column text-column-centralized">
                                    <div class="text-column-icon">
                                        <span class="fa fa-home"></span>
                                    </div>                                    
                                    <h4>Our Office</h4>
                                    <div class="text-column-info">
                                        <p><strong><span class="fa fa-map-marker"></span> Address: </strong> 000 StreetName, Suite 111, City Name, ST 01234</p>
                                        <p><strong><span class="fa fa-phone"></span> Phone: </strong> (012) 345-67-89</p>
                                        <p><strong><span class="fa fa-envelope"></span> E-mail: </strong> <a href="#">johndoe@domain.com</a></p>
                                    </div>
                                </div>




                            </div>
                        </div>

                    </div>
                    <!-- ./page content holder -->
                </div>
                
                <!-- ./page content wrapper -->

            </div>
            <!-- ./page content -->
</form>
            <!-- page footer -->
            <div class="page-footer">

                <!-- page footer wrap -->
                <div class="page-footer-wrap bg-dark-gray">
                    <!-- page footer holder -->
                    <div class="page-footer-holder page-footer-holder-main">

                        <div class="row">

                            <!-- about -->
                            <div class="col-md-3">
                                <h3>Creado por</h3>
                                <h3>Víctor Marine</h3>
                                <h3>Yanelkys Reyes</h3>
                                <h3>Eduardo Viva</h3>
                            </div>
                            <!-- ./about -->



                            <!-- recent tweets -->
                            <div class="col-md-3">
                                <h3>VISITANOS</h3>

                                <div class="list-with-icon small">
                                    <div class="item">
                                        <div class="icon">
                                            <span class="fa fa-twitter"></span>
                                        </div>
                                        <div class="text">
                                            <a href="#">@SIGECOPA</a>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="icon">
                                            <span class="fa fa-facebook"></span>
                                        </div>
                                        <div class="text">
                                            <a href="#">@SIGECOPA</a> 
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="icon">
                                            <span class="fa fa-instagram"></span>
                                        </div>
                                        <div class="text">
                                            <a href="#">@sigecopa</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- ./recent tweets -->

                            <!-- contacts -->
                            <div class="col-md-3">
                                <h3>CONTACTO</h3>

                                <div class="footer-contacts">
                                    <div class="fc-row">
                                        <span class="fa fa-home"></span>
                                        Constanza, Rep. Dom.,<br/> 

                                    </div>
                                    <div class="fc-row">
                                        <span class="fa fa-phone"></span>
                                        (809) 000-0000
                                    </div>
                                    <div class="fc-row">
                                        <span class="fa fa-envelope"></span>
                                        <strong>SIGECOPA</strong><br>
                                        <a href="mailto:#">sigecopa@gmail.com</a>
                                    </div>                                    
                                </div>

                                <h3>Subscribe</h3>
                                <div class="input-group">
                                    <input type="text" name="b" class="form-control" placeholder="Your email"/>
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary"><span class="fa fa-paper-plane"></span></button>
                                    </div>
                                </div>

                            </div>
                            <!-- ./contacts -->

                        </div>

                    </div>
                    <!-- ./page footer holder -->
                </div>
                <!-- ./page footer wrap -->

                <!-- page footer wrap -->
                <div class="page-footer-wrap bg-darken-gray">
                    <!-- page footer holder -->
                    <div class="page-footer-holder">

                        <!-- copyright -->
                        <div class="copyright">
                            &copy; 2015 Los Constanceros <a href="#"></a> - Derecho reservado                            
                        </div>
                        <!-- ./copyright -->

                        <!-- social links -->
                        <div class="social-links">
                            <a href="#"><span class="fa fa-facebook"></span></a>
                            <a href="#"><span class="fa fa-twitter"></span></a>
                            <a href="#"><span class="fa fa-google-plus"></span></a>
                            <a href="#"><span class="fa fa-linkedin"></span></a>
                            <a href="#"><span class="fa fa-vimeo-square"></span></a>
                            <a href="#"><span class="fa fa-dribbble"></span></a>
                        </div>                        
                        <!-- ./social links -->

                    </div>
                    <!-- ./page footer holder -->

                    <!-- ./page footer wrap -->

                </div>
                <!-- ./page footer -->

            </div> 

        </div>        
        <!-- ./page container -->

        <!-- page scripts -->
        <script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="js/plugins/bootstrap/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/plugins/mixitup/jquery.mixitup.js"></script>
        <script type="text/javascript" src="js/plugins/appear/jquery.appear.js"></script>

        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

        <script type="text/javascript">

            var mapCords = new google.maps.LatLng(37.751117, -122.423095);
            var mapOptions = {zoom: 14, center: mapCords, mapTypeId: google.maps.MapTypeId.ROADMAP}
            var map = new google.maps.Map(document.getElementById("google-map"), mapOptions);

            var cords = new google.maps.LatLng(37.751117, -122.423095);
            var marker = new google.maps.Marker({position: cords,
                map: map,
                title: "Marker 1",
                icon: 'http://aqvatarius.com/development/atlant-frontend/img/map-marker.png'}
            );

        </script>

        <script type="text/javascript" src="js/actions.js"></script>                
        <!-- ./page scripts -->
    </body>
</html>