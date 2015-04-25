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
import org.cfg.uapa.java.agricultura.entidades.SubZona;
import org.cfg.uapa.java.agricultura.entidades.Zona;
import org.cfg.uapa.java.agricultura.servicios.ServicioSubZona;
import org.cfg.uapa.java.agricultura.servicios.ServicioZona;

/**
 *
 * @author VíctorAndrés
 */
@WebServlet(name = "ZonaControl", urlPatterns = {"/ZonaControl"})
public class ZonaControl extends HttpServlet {

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
        String subzona = request.getParameter("subzona");
        
              
        
        SubZona szona = ServicioSubZona.getInstancia().getSubZonaPorId(Integer.valueOf(subzona));
               
        
        
        Zona zona = new Zona();
        zona.setNombre(nombre);
        zona.setSubzona_id(szona);
       
    
        
        boolean isCreado = ServicioZona.getInstancia().crearZona(zona);

        if (isCreado) {

            response.sendRedirect("index.jsp");

        } else {

            response.sendRedirect("zona/crearzona.jsp");

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
