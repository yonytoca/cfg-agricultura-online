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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.cfg.uapa.java.agricultura.entidades.Variedad;

/**
 *
 * @author VíctorAndrés
 */
public class ServicioVariedad {
     private static final ServicioVariedad INSTANCIA = new ServicioVariedad();
    
    private ServicioVariedad() {
    }
    public static ServicioVariedad getInstancia() {
        return INSTANCIA;
    }    
    
    // lista de los socios 
    public List<Variedad> getListadoVariedad() {

        List<Variedad> listavariedad = new ArrayList<>();       

         try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from variedad")) {
            try (ResultSet rs = stmt.executeQuery()) {      

            while (rs.next()) {               
                Variedad varied = new Variedad();
                varied.setId(rs.getInt("id"));
                varied.setNombre(rs.getString("nombre"));
                listavariedad.add(varied);
            }
         }       
            } catch (SQLException e) {
                Logger.getLogger(ServicioVariedad.class.getName()).log(Level.SEVERE, null, e);
            }
        return listavariedad;
    }
    

//   traer socio por id
         public Variedad getVariedadPorId(int id){

         
        String sql = "select * from variedad where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Variedad variedad = null;

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            
           rs = stmt.executeQuery();
           
           rs.next();          
           variedad = new Variedad();  
           variedad.setId(rs.getInt("id"));
           variedad.setNombre(rs.getString("nombre"));         
           
            
        } catch (SQLException e) {
            Logger.getLogger(ServicioVariedad.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioVariedad.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return variedad;
    }
         
         public boolean crearVariedad(Variedad  variedad) {

        boolean estado = false;
        PreparedStatement stmt = null ;
        String sql = "insert into variedad(nombre) values(?)";
        
         Connection con = Coneccion.getInstancia().getConeccion();

        try {

             stmt = con.prepareStatement(sql);
             stmt.setString(1,variedad.getNombre());       
            stmt.executeUpdate();
            
            estado = true;

        } catch (SQLException e) {
            estado = false;
             Logger.getLogger(ServicioVariedad.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioVariedad.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                }
               }
        
        return estado;

    }   
          public boolean editarVriedad(Variedad variedad) {
            
         boolean estado;
        //PreparedStatement stmt = null ;
        String sql = "update variedad set nombre =? where id=?"; 
                
        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            //stmt = con.prepareStatement(sql);
            stmt.setString(1, variedad.getNombre());
            stmt.setInt(2,variedad.getId());
            
            stmt.executeUpdate();
            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioVariedad.class.getName()).log(Level.SEVERE, null, e);
        }
        return estado;    
    }
               
}
