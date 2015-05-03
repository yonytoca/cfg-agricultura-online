/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.agricultura.servicios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.cfg.uapa.java.agricultura.entidades.Usuario;

/**
 *
 * @author VíctorAndrés
 */
public class ServicioUsuario {
     private static ServicioUsuario INSTANCIA = null;

    public static ServicioUsuario getInstancia() {
        if (INSTANCIA == null) {
            INSTANCIA = new ServicioUsuario();
        }
        return INSTANCIA;
    }

    public List<Usuario> getListadoUsuario() throws SQLException {

       List<Usuario> Listausuario = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from usuario")) 
        {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Usuario user = new Usuario();
                    user.setId(rs.getInt("id"));
                    user.setUsuario(rs.getString("usuario"));
                    user.setTipo_usuario_id(ServicioTipoUsuario.getInstancia().getTipoUsuarioPorId(rs.getInt("tipo_usuario_id")));
                                       
                    Listausuario.add(user);
                 }
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);          
        }

        return Listausuario;
    }
    
    
    public Usuario checkUsuario(String usuario, String clave) throws SQLException {

        Connection con = Coneccion.getInstancia().getConeccion();
        Usuario usuario1 = null;

        try (PreparedStatement pstmt = con.prepareStatement("select * from usuario where usuario = ? and clave= ?")) {

            pstmt.setString(1, usuario);
            pstmt.setString(2, clave);

            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println("usuario: " + usuario + " clave : " + clave);

                if (rs.next()) {

                    usuario1 = new Usuario();                                   
                    usuario1.setUsuario(rs.getString("usuario"));
                    usuario1.setClave(rs.getString("clave"));
            }

        } catch (SQLException e) {
            Logger.getLogger(getClass().getName()).info(MessageFormat.format("Error en el SQl{0}", e.getMessage()));
            return null;
        }

        return usuario1;
    }
    }
      
      public Usuario getUsuarioPorId(int id) {

        
              String sql = "select * from usuario where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Usuario usuario = null;

        try {

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();
        
        
            rs.next();
            usuario = new Usuario();
            usuario.setId(rs.getInt("id"));
            usuario.setUsuario(rs.getString("usuario"));
            usuario.setClave(rs.getString("clave"));            
           
        }  catch (SQLException e) {
                Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, e);
            }
        

        return usuario;
    }
      
     public boolean crearUsuario(Usuario usuario) {

        boolean estado = false;
        PreparedStatement stmt = null ;
        String sql = "insert into usuario(usuario,clave,tipo_usuario_id) values(?,?,?)";
        
         Connection con = Coneccion.getInstancia().getConeccion();

        try {

             stmt = con.prepareStatement(sql);
             stmt.setString(1,usuario.getUsuario());
             stmt.setString(2, usuario.getClave());
             stmt.setInt(3,usuario.getTipo_usuario_id().getId());
      
             

            stmt.executeUpdate();
            
            estado = true;

        } catch (SQLException e) {
            estado = false;
             Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                }
               }
        
        return estado;

    }
     
    public boolean EditarUsuario(Usuario usuario) {
        
     boolean estado;
        //PreparedStatement stmt = null ;
        String sql = "update usuario set usuario = ?,clave = ?,tipo_usuario_id=? where id = ?";                 

        Connection con = Coneccion.getInstancia().getConeccion();
        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            //stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario.getUsuario());
            stmt.setString(2, usuario.getClave());
            stmt.setInt(3, usuario.getTipo_usuario_id().getId());
            stmt.setInt(4, usuario.getId());
            
            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, e);
        }
        return estado;    
    } 
          
     
}
