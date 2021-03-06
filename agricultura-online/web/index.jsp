<%-- 
    Document   : index
    Created on : 19/04/2015, 09:58:47 PM
    Author     : EDUARDO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- META SECTION -->
        <title>SIGECOPA</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- END META SECTION -->
        <link rel="icon" href="front-end/img/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="front-end/css/revolution-slider/extralayers.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="front-end/css/revolution-slider/settings.css" media="screen" />

        <link rel="stylesheet" type="text/css" href="front-end/css/styles.css" media="screen" />                  

    </head>
    <body>
        <!-- page container -->
        <div class="page-container">

            <!-- page header -->
            <div class="page-header">

                <!-- page header holder -->
                <div class="page-header-holder">

                    <!-- page logo -->
                    <div class="logo">
                        <a href="/agricultura-online/index.jsp">SIGECOPA</a>
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
                            <a href="/agricultura-online/front-end/nosotros.jsp">SIGECOPA</a>
                           
                        </li>
                        <li>
                            <a href="/agricultura-online/front-end/contacto.jsp">CONTACTOS</a>
                           
                        </li>                       

                        <form class="navbar-form navbar-right" role="form" action="../agricultura-online/UsuarioControl" method="post" >
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

            <!-- page content -->
            <div class="page-content">


                <!-- revolution slider -->
                <div class="banner-container">
                    <div class="banner">

                        <ul>

                            <li data-transition="fade" data-slotamount="1" data-masterspeed="500"  data-saveperformance="on">
                                <img src="front-end/img/backgrounds/bg-2.jpg" />

                                <div class="tp-caption lft customout rs-parallaxlevel-0"
                                     data-x="150"
                                     data-y="80" 
                                     data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                     data-speed="500"
                                     data-start="700"
                                     data-easing="Power3.easeInOut"
                                     data-elementdelay="0.1"
                                     data-endelementdelay="0.1"
                                     style="z-index: 2;">
                                    <img src="front-end/assets/slider-layers/atlant-title.png" alt="Atlant"/>
                                </div>


                                <div class="tp-caption lft customout rs-parallaxlevel-0"
                                     data-x="550"
                                     data-y="230" 
                                     data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                     data-speed="700"
                                     data-start="1200"
                                     data-easing="Power3.easeInOut"
                                     data-elementdelay="0.1"
                                     data-endelementdelay="0.1"
                                     style="z-index: 3;">
                                    <img src="front-end/assets/slider-layers/atlant_monitor.png" alt="Atlant"/>
                                </div>

                                <div class="tp-caption black_thin_34 customin tp-resizeme rs-parallaxlevel-0"
                                     data-x="0"
                                     data-y="230" 
                                     data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                     data-speed="500"
                                     data-start="1000"
                                     data-easing="Back.easeOut"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-elementdelay="0.1"
                                     data-endelementdelay="0.1"
                                     style="z-index: 4;">
                                    <img src="front-end/assets/slider-layers/atlant_responsive.png" alt="Atlant"/>
                                </div>

                                <div class="tp-caption black_thin_34 customin tp-resizeme rs-parallaxlevel-0"
                                     data-x="0"
                                     data-y="330" 
                                     data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                     data-speed="500"
                                     data-start="1100"
                                     data-easing="Back.easeOut"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-elementdelay="0.1"
                                     data-endelementdelay="0.1"
                                     style="z-index: 5;">
                                    <img src="front-end/assets/slider-layers/atlant_tempalte.png" alt="Atlant"/>
                                </div>

                            </li>                                    

                            <li data-transition="fade" data-slotamount="1" data-masterspeed="700" >
                                <img src="front-end/assets/video/video_typing_cover.png"  alt="video_typing_cover"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">                                
<img src="front-end/assets/video/video_typing_cover.png"  alt="video_typing_cover"  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
                                <div class="tp-caption tp-fade fadeout fullscreenvideo"
                                     data-x="0"
                                     data-y="0"
                                     data-speed="1000"
                                     data-start="1100"
                                     data-easing="Power4.easeOut"
                                     data-elementdelay="0.01"
                                     data-endelementdelay="0.1"
                                     data-endspeed="1500"
                                     data-endeasing="Power4.easeIn"
                                     data-autoplay="true"
                                     data-autoplayonlyfirsttime="false"
                                     data-nextslideatend="true"
                                     data-volume="mute" data-forceCover="1" data-aspectratio="16:9" data-forcerewind="on" style="z-index: 2;">

                                    <video class="" preload="none" width="100%" height="100%" poster="front-end/assets/video/video_typing_cover.jpg"> 
                                        <source src='front-end/assets/video/computer_typing.mp4' type='video/mp4'/>
                                        <source src='front-end/assets/video/computer_typing.webm' type='video/webm'/>
                                    </video>
                                </div>

                                <div class="tp-caption customin ltl"
                                     data-x="600"
                                     data-y="280" 
                                     data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                     data-speed="500"
                                     data-start="1500"
                                     data-easing="Power4.easeInOut"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-elementdelay="0.01"
                                     data-endelementdelay="0.1"
                                     data-endspeed="1000"
                                     data-endeasing="Power4.easeIn"
                                     style="z-index: 3;">

                                </div>                                

                                <div class="tp-caption customin ltl"
                                     data-x="600"
                                     data-y="320" 
                                     data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                     data-speed="500"
                                     data-start="1700"
                                     data-easing="Power4.easeInOut"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-elementdelay="0.01"
                                     data-endelementdelay="0.1"
                                     data-endspeed="1000"
                                     data-endeasing="Power4.easeIn"
                                     style="z-index: 3;">

                                </div>

                                <div class="tp-caption customin ltl"
                                     data-x="600"
                                     data-y="362" 
                                     data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                     data-speed="500"
                                     data-start="1900"
                                     data-easing="Power4.easeInOut"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-elementdelay="0.01"
                                     data-endelementdelay="0.1"
                                     data-endspeed="1000"
                                     data-endeasing="Power4.easeIn"
                                     style="z-index: 3;">

                                </div>

                                <div class="tp-caption customin ltl"
                                     data-x="600"
                                     data-y="404" 
                                     data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                     data-speed="500"
                                     data-start="2100"
                                     data-easing="Power4.easeInOut"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-elementdelay="0.01"
                                     data-endelementdelay="0.1"
                                     data-endspeed="1000"
                                     data-endeasing="Power4.easeIn"
                                     style="z-index: 3;">

                                </div>

                                <div class="tp-caption customin ltl"
                                     data-x="600"
                                     data-y="446" 
                                     data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                     data-speed="500"
                                     data-start="2200"
                                     data-easing="Power4.easeInOut"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-elementdelay="0.01"
                                     data-endelementdelay="0.1"
                                     data-endspeed="1000"
                                     data-endeasing="Power4.easeIn"

                            </div>

                            <div class="tp-caption customin ltl"
                                 data-x="600"
                                 data-y="488" 
                                 data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                 data-speed="500"
                                 data-start="2400"
                                 data-easing="Power4.easeInOut"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-elementdelay="0.01"
                                 data-endelementdelay="0.1"
                                 data-endspeed="1000"
                                 data-endeasing="Power4.easeIn"
                                 style="z-index: 3;">

                            </div>

                        </li>
                    </ul>

                </div>
            </div>                        
            <!-- ./revolution slider -->                        

            <!-- page content wrapper -->
            <div class="page-content-wrap bg-light">
                <!-- page content holder -->
                <div class="page-content-holder padding-v-20">

                   
                </div>
                <!-- ./page content holder -->
            </div>
            <!-- ./page content wrapper -->                        

            <!-- page content wrapper -->
            <div class="page-content-wrap bg-img-1">

                <div class="divider"><div class="box"><span class="fa fa-angle-down"></span></div></div>                    

                <!-- page content holder -->
                <div class="page-content-holder">

                    <div class="row">
                        <div class="col-md-8 this-animate" data-animate="fadeInLeft">

                            <div class="block-heading block-heading-centralized">

                                <h2 class="heading-underline">Sistema de Gestión y Control de los Productos Agrícolas </h2>
                                <h2 class="heading-underline">(SIGECOPA)</h2>
                                <div class="block-heading-text">
                                    Este sistema facilitará además de la organización, llevar el control de las producciones existente, sirviendo como apoyo para que los productos tengan mejores venta y no este saturando el mercado con los mismos productos, es decir evitar pérdidas cuantiosas para los agricultores.
                                </div>
                            </div>
                            <div class="block this-animate" data-animate="fadeInLeft">
                                <img src="front-end/assets/atlant_technologies.png" class="img-responsive"/>
                            </div>
                        </div>
                        <div class="col-md-4 this-animate text-center" data-animate="fadeInRight">
                            <img src="front-end/assets/atlant_responsive.png" class="img-responsive-mobile"/>
                        </div>
                    </div>



                </div>
                <!-- ./page content holder -->
            </div>
            <!-- ./page content wrapper -->                

            <!-- page content wrapper -->
            <div class="page-content-wrap bg-texture-1 bg-dark light-elements">

                <div class="divider"><div class="box"><span class="fa fa-angle-down"></span></div></div>

                <!-- page content holder -->
                <div class="page-content-holder">

                    <div class="row">

                        <div class="col-md-4">                                
                            <div class="text-column text-column-centralized tex-column-icon-lg this-animate" data-animate="fadeInLeft">
                                <div class="text-column-icon">
                                    <span class="fa fa-arrow-circle-down"></span>
                                </div>
                                <h4>Fresa</h4>
                                <div class="text-column-info">

                                    Es una fuente de vitamina C, vitamina P, hidratos de carbono, potasio, magnesio, calcio y agua. Se estima que 100 gramos de fresa incluyen 34,5 calorías.

                                </div>
                            </div>                                
                        </div>

                        <div class="col-md-4">                                
                            <div class="text-column text-column-centralized tex-column-icon-lg this-animate" data-animate="fadeInUp">
                                <div class="text-column-icon">
                                    <span class="fa fa-arrow-circle-down"></span>
                                </div>
                                <h4>Ajo</h4>
                                <div class="text-column-info">
                                    Es una planta perenne con hojas planas y delgadas, de hasta 30 cm de longitud. Las raíces alcanzan fácilmente profundidades de 50 cm o más. El bulbo, de piel blanca, forma una cabeza dividida en gajos que comúnmente son llamados dientes.
                                </div>
                            </div>                                
                        </div>

                        <div class="col-md-4">                                
                            <div class="text-column text-column-centralized tex-column-icon-lg this-animate" data-animate="fadeInRight">
                                <div class="text-column-icon">
                                    <span class="fa fa-arrow-circle-down"></span>
                                </div>
                                <h4>Zanahoria</h4>
                                <div class="text-column-info">
                                    Planta bienal que forma una roseta de hojas en primavera y verano, mientras desarrolla la gruesa raíz napiforme, la cual almacenará grandes cantidades de azúcar para la floración del año siguiente. El tallo floral crece alrededor de 10 cm con unaumbela de flores blancas en el ápice.


                                </div>
                            </div>                                
                        </div>

                    </div>

                </div>
                <!-- ./page content holder -->
            </div>
            <!-- ./page content wrapper -->

            <!-- page content wrapper -->                
            <div class="page-content-wrap bg-light bg-texture-1">

                <div class="divider"><div class="box"><span class="fa fa-angle-down"></span></div></div>                    

                <!-- page content holder -->
                <div class="page-content-holder">                        

                    <div class="quote this-animate" data-animate="fadeInDown">
                        <div class="row">
                            <div class="col-md-9">
                                <h3><strong>SIGECOPA</strong> &mdash; Sistema de Gestión y Control de los Productos Agrícolas </h3>
                            </div>
                            
                        </div>
                    </div>                        

                </div>
                <!-- ./page content holder -->
            </div>
            <!-- ./page content wrapper -->                    

            <!-- page content wrapper -->
            <div class="page-content-wrap bg-light">
                <!-- page content holder -->
                <div class="page-content-holder padding-v-20">

                    

                </div>
                <!-- ./page content holder -->
            </div>
            <!-- ./page content wrapper -->
        </div>
        <!-- ./page content -->

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
                                <input type="text" class="form-control" placeholder="Your email"/>
                               
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
            </div>
            <!-- ./page footer wrap -->

        </div>
        <!-- ./page footer -->

    </div>        
    <!-- ./page container -->

    <!-- page scripts -->
    <script type="text/javascript" src="front-end/js/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="front-end/js/plugins/bootstrap/bootstrap.min.js"></script>

    <script type="text/javascript" src="front-end/js/plugins/mixitup/jquery.mixitup.js"></script>
    <script type="text/javascript" src="front-end/js/plugins/appear/jquery.appear.js"></script>

    <script type="text/javascript" src="front-end/js/plugins/revolution-slider/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="front-end/js/plugins/revolution-slider/jquery.themepunch.revolution.min.js"></script>

    <script type="text/javascript" src="front-end/js/actions.js"></script>
    <script type="text/javascript" src="front-end/js/slider.js"></script>
    <!-- ./page scripts -->
</body>
</html>

