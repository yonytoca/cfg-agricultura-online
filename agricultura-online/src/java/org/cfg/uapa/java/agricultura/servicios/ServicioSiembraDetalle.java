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
import org.cfg.uapa.java.agricultura.entidades.Siembra;

/**
 *
 * @author victor
 */
public class ServicioSiembraDetalle {
     private static final ServicioSiembraDetalle INSTANCIA = new ServicioSiembraDetalle();

    private ServicioSiembraDetalle() {
    }

    public static ServicioSiembraDetalle getInstancia() {
        return INSTANCIA;
    }

    // lista de los siembra
    public List<Siembra> getListadoSiembradetalle() {

        List<Siembra> listasiembra = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("SELECT id, id_producto,  SUM(cantidad_producto) as total from siembra group by id_producto")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Siembra siembra = new Siembra();
                    siembra.setId(rs.getInt("id"));
                    siembra.setId_producto(ServicioProducto.getInstancia().getProductoPorId(rs.getInt("id_producto")));
                    siembra.setCantidad_producto(rs.getInt("total"));
                    listasiembra.add(siembra);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }
        return listasiembra;
    }
    
     public List<Siembra> getListadoSiembradetallezona() {

        List<Siembra> listasiembra = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("SELECT id, id_producto,  SUM(cantidad_producto) as total from siembra where id_zona=1 group by id_producto")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Siembra siembra = new Siembra();
                    siembra.setId(rs.getInt("id"));
                    siembra.setId_producto(ServicioProducto.getInstancia().getProductoPorId(rs.getInt("id_producto")));
                    siembra.setCantidad_producto(rs.getInt("total"));
                    listasiembra.add(siembra);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }
        return listasiembra;
    }
      public Siembra getSiembraDetallePorId(int id , int id1) {

        String sql = "SELECT id, id_producto,  SUM(cantidad_producto) as total from siembra where id_zona=? and id_producto =1 ";
        Siembra siembr = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, id);
                stmt.setInt(1, id1);
                

                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    siembr = new Siembra();
                    siembr.setCantidad_producto(rs.getInt("total"));
   
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }

        return siembr;
    }
     
      
}
