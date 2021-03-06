/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.agricultura.controles;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.cfg.uapa.java.agricultura.entidades.TipoProducto;
import org.cfg.uapa.java.agricultura.servicios.ServicioTipoProducto;

/**
 *
 * @author Yanelkys
 */
@WebServlet(name = "TipoProductoControl", urlPatterns = {"/TipoProductoControl"})
public class TipoProductoControl extends HttpServlet {

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
        String idTipoProducto = request.getParameter("idTipoProducto");
        

        if (null != idTipoProducto) {

            TipoProducto tproducto = new TipoProducto();
            tproducto.setId(Integer.parseInt(idTipoProducto));
            tproducto.setNombre(nombre);
            boolean isActualizado = ServicioTipoProducto.getInstancia().editarTipoProducto(tproducto);

            if (isActualizado) {

                response.sendRedirect("producto/tipoproducto.jsp");

            } else {

                response.sendRedirect("producto/editartipoproducto.jsp");

            }
        }else {
             TipoProducto tproducto = new TipoProducto();
            tproducto.setNombre(nombre);
            boolean isCreado = ServicioTipoProducto.getInstancia().CrearTipoProducto(tproducto);
            if(isCreado){
                response.sendRedirect("producto/tipoproducto.jsp");
            }else {
                response.sendRedirect("producto/creartipoproducto.jsp");
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
