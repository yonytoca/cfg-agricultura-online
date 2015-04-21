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
import org.cfg.uapa.java.agricultura.entidades.TipoUsuario;
import org.cfg.uapa.java.agricultura.entidades.Usuario;
import org.cfg.uapa.java.agricultura.servicios.ServicioTipoUsuario;
import org.cfg.uapa.java.agricultura.servicios.ServicioUsuario;

/**
 *
 * @author VíctorAndrés
 */
@WebServlet(name = "CrearUsuarioControl", urlPatterns = {"/CrearUsuarioControl"})
public class CrearUsuarioControl extends HttpServlet {

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
        String user = request.getParameter("usuario");
        String clave = request.getParameter("clave");       
        String tuser = request.getParameter("tusuario");
        

        TipoUsuario tipou = ServicioTipoUsuario.getInstancia().getTipoUsuarioPorId(Integer.valueOf(tuser));
        
        Usuario usuario = new Usuario();
        usuario.setUsuario(user);
        usuario.setClave(clave);
        usuario.setTipo_usuario_id(tipou);
        
        
          boolean isCreado = ServicioUsuario.getInstancia().crearUsuario(usuario);

        if (isCreado) {

            response.sendRedirect("cita.jsp");

        } else {

            response.sendRedirect("crearcita.jsp");

        
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
