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
import org.cfg.uapa.java.agricultura.entidades.Socio;

/**
 *
 * @author EDUARDO
 */
public class ServicioSocio {
        private static final ServicioSocio INSTANCIA = new ServicioSocio();
    
    private ServicioSocio() {
    }
    public static ServicioSocio getInstancia() {
        return INSTANCIA;
    }    
    
    // lista de los socios 
    public List<Socio> getListadoSocio() {

        List<Socio> listasocio = new ArrayList<>();       

         try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from socio")) {
            try (ResultSet rs = stmt.executeQuery()) {      

            while (rs.next()) {               
                Socio socio = new Socio();
                socio.setId_socio(rs.getShort("id_socio"));                
                socio.setNombre(rs.getString("nombre"));
                socio.setApellido(rs.getString("apellido"));
                socio.setTelefono(rs.getString("telefono"));
                socio.setDireccion(rs.getString("direccion"));
                socio.setId_usuario(ServicioUsuario.getInstancia().getUsuarioPorId(rs.getInt("id_usuario")));               
                socio.setClave(rs.getString("clave"));
                socio.setImg(rs.getString("img"));
                socio.setId_producto(ServicioProducto.getInstancia().getProductoPorId(rs.getInt("id_producto")));                
            }
         }       
            } catch (SQLException e) {
                Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
            }
        return listasocio;
    }
    

//   traer socio por id
         public Socio getSocioPorId(int id) throws SQLException {

         
        String sql = "select * from socio where id_socio=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Socio socios = null;

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
           rs.next();
          
           socios = new Socio();          
           socios.setId_socio(rs.getInt("id_socio"));
           socios.setNombre(rs.getString("nombre"));
           socios.setApellido(rs.getString("apellido"));
           socios.setTelefono(rs.getString("telefono"));
           socios.setDireccion(rs.getString("direccion"));                      
           socios.setClave(rs.getString("clave"));
           socios.setImg(rs.getString("img"));
          
           
            
        } catch (SQLException e) {
            Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
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
                Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return socios;
    }
         
         public boolean crearSocio(Socio  socio) {

        boolean estado = false;
        PreparedStatement stmt = null ;
        String sql = "insert into socio(nombre,apellido,telefono,direccion,id_usuario,clave,img,id_producto) values(?,?,?,?,?,?,?,?)";
        
         Connection con = Coneccion.getInstancia().getConeccion();

        try {

             stmt = con.prepareStatement(sql);
             stmt.setString(1, socio.getNombre());
             stmt.setString(2,socio.getApellido());
             stmt.setString(3,socio.getTelefono());
             stmt.setString(4, socio.getDireccion());   
             stmt.setInt(5,socio.getId_usuario().getId_usuario());                        
             stmt.setString(6, socio.getClave());
             stmt.setString(7,socio.getImg());
            stmt.setInt(8, socio.getId_producto().getId_producto());
        

            stmt.executeUpdate();
            
            estado = true;

        } catch (SQLException e) {
            estado = false;
             Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                }
               }
        
        return estado;

    }   
               
             
             
         
}
