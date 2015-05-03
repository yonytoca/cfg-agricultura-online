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
import org.cfg.uapa.java.agricultura.entidades.TipoProducto;
import org.cfg.uapa.java.agricultura.entidades.Variedad;
import org.cfg.uapa.java.agricultura.servicios.ServicioProducto;
import org.cfg.uapa.java.agricultura.servicios.ServicioTipoProducto;
import org.cfg.uapa.java.agricultura.servicios.ServicioVariedad;

/**
 *
 * @author Yanelkys
 */
@WebServlet(name = "ProductoControl", urlPatterns = {"/ProductoControl"})
public class ProductoControl extends HttpServlet {

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
  
        String nombre = request.getParameter("nombre");
        String img = request.getParameter("img");
        String periodo = request.getParameter("periodo");
        String tproducto = request.getParameter("tproducto");
        String variedad = request.getParameter("variedad");
        String tproduccion = request.getParameter("tproduccion");

         TipoProducto tipoproduc = ServicioTipoProducto.getInstancia().getTipoProductoPorId(Integer.valueOf(tproducto));
         Variedad varied = ServicioVariedad.getInstancia().getVariedadPorId(Integer.valueOf(variedad));
         
        Producto producto = new Producto();
        producto.setNombre(nombre); 
        producto.setImg(img);
        producto.setPeriodo(periodo);
        producto.setTipo_producto_id(tipoproduc);
        producto.setId_variedad(varied);
       
       
       
        boolean isCreado = ServicioProducto.getInstancia().crearProducto(producto);

        if (isCreado) {

            response.sendRedirect("index.jsp");

        } else {

            response.sendRedirect("producto/crearproducto.jsp");

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
