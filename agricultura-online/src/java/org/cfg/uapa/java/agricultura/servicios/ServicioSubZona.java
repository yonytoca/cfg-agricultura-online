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
import org.cfg.uapa.java.agricultura.entidades.SubZona;

/**
 *
 * @author VíctorAndrés
 */
public class ServicioSubZona {
     private static final ServicioSubZona INSTANCIA = new ServicioSubZona();
    
    private ServicioSubZona() {
    }
    public static ServicioSubZona getInstancia() {
        return INSTANCIA;
    }    
    
    // lista de los socios 
    public List<SubZona> getListadoSubZona() {

        List<SubZona> listasubzona = new ArrayList<>();       

         try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from sub_zona")) {
            try (ResultSet rs = stmt.executeQuery()) {      

            while (rs.next()) {               
                SubZona varied = new SubZona();
                varied.setId(rs.getInt("id"));
                varied.setNombre(rs.getString("nombre"));
                listasubzona.add(varied);
            }
         }       
            } catch (SQLException e) {
                Logger.getLogger(ServicioSubZona.class.getName()).log(Level.SEVERE, null, e);
            }
        return listasubzona;
    }
    

//   traer socio por id
         public SubZona getSubZonaPorId(int id){

         
        String sql = "select * from sub_zona where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        SubZona subzona = null;

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            
           rs = stmt.executeQuery();
           
           rs.next();          
           subzona = new SubZona();  
           subzona.setId(rs.getInt("id"));
           subzona.setNombre(rs.getString("nombre"));         
           
            
        } catch (SQLException e) {
            Logger.getLogger(ServicioSubZona.class.getName()).log(Level.SEVERE, null, e);
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
                Logger.getLogger(ServicioSubZona.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return subzona;
    }
         
         public boolean crearSubZona(SubZona  subzona) {

        boolean estado = false;
        PreparedStatement stmt = null ;
        String sql = "insert into sub_zona(nombre) values(?)";
        
         Connection con = Coneccion.getInstancia().getConeccion();

        try {

             stmt = con.prepareStatement(sql);
             stmt.setString(1,subzona.getNombre());       
            stmt.executeUpdate();
            
            estado = true;

        } catch (SQLException e) {
            estado = false;
             Logger.getLogger(ServicioSubZona.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioSubZona.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                }
               }
        
        return estado;

    }   
    
}
