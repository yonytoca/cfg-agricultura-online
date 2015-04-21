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
import org.cfg.uapa.java.agricultura.entidades.Socio;
import org.cfg.uapa.java.agricultura.entidades.Usuario;
import org.cfg.uapa.java.agricultura.servicios.ServicioProducto;
import org.cfg.uapa.java.agricultura.servicios.ServicioSocio;
import org.cfg.uapa.java.agricultura.servicios.ServicioUsuario;

/**
 *
 * @author EDUARDO
 */
@WebServlet(name = "SocioControl", urlPatterns = {"/SocioControl"})
public class SocioControl extends HttpServlet {

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
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String usuarios = request.getParameter("usuario");
        String clave = request.getParameter("clave");       
        String imagen = request.getParameter("imagen");       
        String productos = request.getParameter("producto");   
    
        Usuario usuario = ServicioUsuario.getInstancia().getUsuarioPorId(Integer.valueOf(usuarios));        
        Producto producto = ServicioProducto.getInstancia().getProductoPorId(Integer.valueOf(productos));
        
        Socio socio = new Socio();
        socio.setNombre(nombre);
        socio.setApellido(apellido);
        socio.setTelefono(telefono);
        socio.setDireccion(direccion);
        socio.setId_usuario(usuario);                
        socio.setClave(clave);
        socio.setImg(imagen);
        socio.setId_producto(producto);
        
        boolean isCreado = ServicioSocio.getInstancia().crearSocio(socio);

        if (isCreado) {

            response.sendRedirect("index.jsp");

        } else {

            response.sendRedirect("crearSocio.jsp");

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
