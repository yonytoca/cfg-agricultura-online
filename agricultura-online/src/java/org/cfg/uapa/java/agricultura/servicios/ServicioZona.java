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
import org.cfg.uapa.java.agricultura.entidades.Zona;

/**
 *
 * @author VíctorAndrés
 */
public class ServicioZona {
    
    private static final ServicioZona INSTANCIA = new ServicioZona();
    
    private ServicioZona() {
    }
    public static ServicioZona getInstancia() {
        return INSTANCIA;
    }    
    
    // lista de los socios 
    public List<Zona> getListadoZona() {

        List<Zona> listazonas = new ArrayList<>();       

         try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from zona")) {
            try (ResultSet rs = stmt.executeQuery()) {      

            while (rs.next()) {               
                Zona zona = new Zona();
                zona.setId(rs.getInt("id"));
                zona.setNombre(rs.getString("nombre"));
                zona.setSubzona_id(ServicioSubZona.getInstancia().getSubZonaPorId(rs.getInt("subzona_id")));
                listazonas.add(zona);
            }
         }       
            } catch (SQLException e) {
                Logger.getLogger(ServicioZona.class.getName()).log(Level.SEVERE, null, e);
            }
        return listazonas;
    }
    

//   traer socio por id
         public Zona getZonaPorId(int id){

         
        String sql = "select * from zona where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Zona zonas = null;

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            
           rs = stmt.executeQuery();
           
           rs.next();          
           zonas = new Zona();  
           zonas.setId(rs.getInt("id"));
           zonas.setNombre(rs.getString("nombre"));         
           zonas.setSubzona_id(ServicioSubZona.getInstancia().getSubZonaPorId(rs.getInt("subzona_id")));
            
        } catch (SQLException e) {
            Logger.getLogger(ServicioZona.class.getName()).log(Level.SEVERE, null, e);
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
                Logger.getLogger(ServicioZona.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return zonas;
    }
         
         public boolean crearZona(Zona zona) {

        boolean estado = false;
        PreparedStatement stmt = null ;
        String sql = "insert into zona(nombre,subzona_id) values(?,?)";
        
         Connection con = Coneccion.getInstancia().getConeccion();

        try {

             stmt = con.prepareStatement(sql);
             stmt.setString(1,zona.getNombre()); 
             stmt.setInt(2, zona.getSubzona_id().getId());
            stmt.executeUpdate();
            
            estado = true;

        } catch (SQLException e) {
            estado = false;
             Logger.getLogger(ServicioZona.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioZona.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                }
               }
        
        return estado;

    }   
}
