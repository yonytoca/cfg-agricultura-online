/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.agricultura.controles;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.cfg.uapa.java.agricultura.entidades.Producto;
import org.cfg.uapa.java.agricultura.entidades.Siembra;
import org.cfg.uapa.java.agricultura.entidades.Socio;
import org.cfg.uapa.java.agricultura.entidades.Zona;
import org.cfg.uapa.java.agricultura.servicios.ServicioProducto;
import org.cfg.uapa.java.agricultura.servicios.ServicioSiembra;
import org.cfg.uapa.java.agricultura.servicios.ServicioSocio;
import org.cfg.uapa.java.agricultura.servicios.ServicioZona;

/**
 *
 * @author VíctorAndrés
 */
@WebServlet(name = "SiembraControl", urlPatterns = {"/SiembraControl"})
public class SiembraControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idsiembra = request.getParameter("idsiembra");
        String produc = request.getParameter("producto");
        String fecha_siembra = request.getParameter("fsiembra");
        int cantproducto = Integer.parseInt(request.getParameter("cproducto"));
        String soci = request.getParameter("socio");
        String zon = request.getParameter("zona");
        int tsembrada = Integer.parseInt(request.getParameter("tsembrada"));
        int produccion = Integer.parseInt(request.getParameter("cproduccion"));
        
        Producto producto = ServicioProducto.getInstancia().getProductoPorId(Integer.valueOf(produc));
        Socio socio = ServicioSocio.getInstancia().getSocioPorId(Integer.valueOf(soci));
        Zona zona = ServicioZona.getInstancia().getZonaPorId(Integer.valueOf(zon));

        if (null != idsiembra) {
            Siembra siembra = new Siembra();
            siembra.setId(Integer.parseInt(idsiembra));
            siembra.setId_producto(producto);
            siembra.setFecha_siembra(fecha_siembra);
            siembra.setCantidad_producto(cantproducto);
            siembra.setId_socio(socio);
            siembra.setId_zona(zona);
            siembra.setTareasembrada(tsembrada);
            siembra.setProduccion(produccion);
            
            boolean isActualizado = ServicioSiembra.getInstancia().editarsiembra(siembra);
            
            if (isActualizado) {
                response.sendRedirect("siembra/siembra.jsp");
            } else {
                response.sendRedirect("siembra/editarsiembra.jsp");
            }
            }else{
            
        Siembra siembra = new Siembra();
        siembra.setId_producto(producto);
        siembra.setFecha_siembra(fecha_siembra);
        siembra.setCantidad_producto(cantproducto);
        siembra.setId_socio(socio);
        siembra.setId_zona(zona);  
        siembra.setTareasembrada(tsembrada);
        siembra.setProduccion(produccion);

            boolean isCreado = ServicioSiembra.getInstancia().crearSiembra(siembra);

            if (isCreado) {
                response.sendRedirect("siembra/siembra.jsp");
            } else {
                response.sendRedirect("siembra/crearsiembra.jsp");
            }
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
