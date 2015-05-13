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
 * @author VíctorAndrés
 */
public class ServicioSiembra {

    private static final ServicioSiembra INSTANCIA = new ServicioSiembra();

    private ServicioSiembra() {
    }

    public static ServicioSiembra getInstancia() {
        return INSTANCIA;
    }

    // lista de los siembra
    public List<Siembra> getListadoSiembra() {

        List<Siembra> listasiembra = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from siembra")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Siembra siembra = new Siembra();
                    siembra.setId(rs.getInt("id"));
                    siembra.setId_producto(ServicioProducto.getInstancia().getProductoPorId(rs.getInt("id_producto")));
                    siembra.setFecha_siembra(rs.getString("fecha_siembra"));
                    siembra.setCantidad_producto(rs.getInt("cantidad_producto"));
                    siembra.setId_socio(ServicioSocio.getInstancia().getSocioPorId(rs.getInt("id_socio")));
                    siembra.setId_zona(ServicioZona.getInstancia().getZonaPorId(rs.getInt("id_zona")));
                    siembra.setTareasembrada(rs.getInt("tarea_sembrada"));
                    listasiembra.add(siembra);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }
        return listasiembra;
    }
   
    
    
    
    public Siembra getSiembraPorId(int id) {

        String sql = "select * from siembra where id=?";
        Siembra siembr = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setInt(6, id);

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
 public Siembra getSiembradetallePorId(int id) {

        String sql = "SELECT id, id_producto,id_zona,  SUM(cantidad_producto) as total from siembra where id_zona=? group by id_producto";
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

    public boolean crearSiembra(Siembra siembra) {

        boolean estado = false;
        PreparedStatement stmt = null;
        String sql = "insert into siembra(id_producto,fecha_siembra,cantidad_producto,id_socio, id_zona,tarea_sembrada) values(?,?,?,?,?,?)";
      
        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, siembra.getId_producto().getId());
            stmt.setString(2, siembra.getFecha_siembra());
            stmt.setInt(3, siembra.getCantidad_producto());
            stmt.setInt(4, siembra.getId_socio().getId());
            stmt.setInt(5, siembra.getId_zona().getId());
            stmt.setInt(6, siembra.getTareasembrada());
            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }

        return estado;
    }

    public boolean editarsiembra(Siembra siembra) {

        boolean estado;
        //PreparedStatement stmt = null ;
        String sql = "update siembra set id_producto=?,fecha_siembra=?,cantidad_producto=?,id_socio=?,id_zona=?, tarea_sembrada=? where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, siembra.getId_producto().getId());
            stmt.setString(2, siembra.getFecha_siembra());
            stmt.setInt(3, siembra.getCantidad_producto());
            stmt.setInt(4, siembra.getId_socio().getId());
            stmt.setInt(5, siembra.getId_zona().getId());
            stmt.setInt(6, siembra.getTareasembrada());
            stmt.setInt(8, siembra.getId());

            stmt.executeUpdate();
            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }
        return estado;
    }

}
