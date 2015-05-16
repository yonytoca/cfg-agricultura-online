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
import org.cfg.uapa.java.agricultura.entidades.Sembrar;
import org.cfg.uapa.java.agricultura.entidades.Siembra;

/**
 *
 * @author EDUARDO
 */
public class ServicioSembrar {

    private static final ServicioSembrar INSTANCIA = new ServicioSembrar();

    private ServicioSembrar() {
    }

    public static ServicioSembrar getInstancia() {
        return INSTANCIA;
    }
    
 public List<Sembrar> getListadoSembrar() {

        List<Sembrar> listasembrar = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("SELECT id, id_producto,id_zona,  SUM(cantidad_producto) as total from siembra where id_socio=? ")) {
            try (ResultSet rs = stmt.executeQuery()) {
               
             //   stmt.setInt(1, id);

                while (rs.next()) {
                    Sembrar sembrar = new Sembrar();
                    sembrar.setId(rs.getInt("id"));
                    sembrar.setFecha(rs.getString("fecha"));
                    sembrar.setId_socio(ServicioSocio.getInstancia().getSocioPorId(rs.getInt("id_socio")));
                    sembrar.setId_zona(ServicioZona.getInstancia().getZonaPorId(rs.getInt("id_zona")));
                    sembrar.setCantidad_sembrada(rs.getInt("cantidad_sembrada"));
                    listasembrar.add(sembrar);                    
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSembrar.class.getName()).log(Level.SEVERE, null, e);
        }
        return listasembrar;
    }
 
     public Siembra getSiembradetallePorId(int id ) {

        String sql = "SELECT id, id_producto,id_zona,  SUM(cantidad_producto) as total from siembra where id_socio=? group by id_producto";
        Siembra siembr = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setInt(1, id);
                
                try (ResultSet rs = pstmt.executeQuery()) {

                    rs.next();
                    siembr = new Siembra();
                    siembr.setId(rs.getInt("id"));
                    siembr.setId_producto(ServicioProducto.getInstancia().getProductoPorId(rs.getInt("id_producto")));
                    siembr.setFecha_siembra(rs.getString("fecha_siembra"));
                    siembr.setCantidad_producto(rs.getInt("cantidad_producto"));
                    siembr.setId_socio(ServicioSocio.getInstancia().getSocioPorId(rs.getInt("id_socio")));
                    siembr.setId_zona(ServicioZona.getInstancia().getZonaPorId(rs.getInt("id_zona")));
                    siembr.setTareasembrada(rs.getInt("tarea_sembrada"));
   
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }

        return siembr;
    }
}
