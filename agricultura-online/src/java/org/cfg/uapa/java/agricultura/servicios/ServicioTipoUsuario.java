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
import org.cfg.uapa.java.agricultura.entidades.TipoUsuario;


/**
 *
 * @author VíctorAndrés
 */
public class ServicioTipoUsuario {
     private static ServicioTipoUsuario INSTANCIA = null;

    public static ServicioTipoUsuario getInstancia() {
        if (INSTANCIA == null) {
            INSTANCIA = new ServicioTipoUsuario();
        }
        return INSTANCIA;
    }

    public List<TipoUsuario> getListadoTipoUsuario() throws SQLException {

       List<TipoUsuario> Listatipousuario = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from tipo_usuario")) 
        {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    TipoUsuario tuser = new TipoUsuario();
                    tuser.setId(rs.getInt("id"));
                    tuser.setNombre(rs.getString("nombre"));                   
                    Listatipousuario.add(tuser);
                    
                 }
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);          
        }

        return Listatipousuario;
    }
    
    
   
      public TipoUsuario getTipoUsuarioPorId(int id) {

        String sql = "select * from tipo_usuario where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        TipoUsuario tusuario = null;

        try {

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();
      
            rs.next();
            tusuario = new TipoUsuario();
            tusuario.setId(rs.getInt("id"));
            tusuario.setNombre(rs.getString("nombre"));
            
        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);          
        }

        return tusuario;
    }
     
     public boolean crearTipoUsuario(TipoUsuario  tipousuario) {

        boolean estado = false;
        PreparedStatement stmt = null ;
        String sql = "insert into tipo_usuario(nombre) values(?)";
        
         Connection con = Coneccion.getInstancia().getConeccion();

        try {

             stmt = con.prepareStatement(sql);
             stmt.setString(1,tipousuario.getNombre());
              

            stmt.executeUpdate();
            
            estado = true;

        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);          
        }
      
        return estado;

    }   
        
         public boolean EditarUsuario(TipoUsuario tipousuario) {
        
     boolean estado = false;
        //PreparedStatement stmt = null ;
        String sql = "update tipo_usuario set nombre = ? where id = ?"; 
                

        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            //stmt = con.prepareStatement(sql);
            stmt.setString(1, tipousuario.getNombre());
            stmt.setInt(2, tipousuario.getId());

            stmt.executeUpdate();

            estado = true;
            
      } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);          
        }
        return estado;    
    }     
}
