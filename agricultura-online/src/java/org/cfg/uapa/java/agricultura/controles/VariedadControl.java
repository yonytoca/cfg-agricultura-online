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
import org.cfg.uapa.java.agricultura.entidades.Variedad;
import org.cfg.uapa.java.agricultura.servicios.ServicioVariedad;

/**
 *
 * @author VíctorAndrés
 */
@WebServlet(name = "VariedadControl", urlPatterns = {"/VariedadControl"})
public class VariedadControl extends HttpServlet {

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
        String idvariedad = request.getParameter("idvariedad");

        if (null != idvariedad) {

            Variedad varied = new Variedad();
            varied.setId(Integer.parseInt(idvariedad));
            varied.setNombre(nombre);
            boolean isActualizado = ServicioVariedad.getInstancia().editarVriedad(varied);

            if (isActualizado) {

                response.sendRedirect("variedad/variedad.jsp");

            } else {
                response.sendRedirect("variedad/editarvariedad.jsp");
            }
        } else {
            Variedad varied = new Variedad();
            varied.setNombre(nombre);
            boolean isCreado = ServicioVariedad.getInstancia().crearVariedad(varied);
            if (isCreado) {
                response.sendRedirect("variedad/variedad.jsp");
            } else {
                response.sendRedirect("variedad/crearvariedad.jsp");
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
