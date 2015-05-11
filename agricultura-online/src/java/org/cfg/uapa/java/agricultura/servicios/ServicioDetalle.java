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
import org.cfg.uapa.java.agricultura.entidades.Detalle;
import org.cfg.uapa.java.agricultura.entidades.Siembra;

/**
 *
 * @author victor
 */
public class ServicioDetalle {

    private static final ServicioDetalle INSTANCIA = new ServicioDetalle();

    private ServicioDetalle() {
    }

    public static ServicioDetalle getInstancia() {
        return INSTANCIA;
    }

    public List<Detalle> getListadoDetalle() {

        List<Detalle> listadetalle = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from detalle")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Detalle deta = new Detalle();
                    deta.setNombreProducto(rs.getString("nombre_producto"));
                    deta.setProducto(ServicioProducto.getInstancia().getProductoPorId(rs.getInt("id_producto")));
                    deta.setZonas(ServicioZona.getInstancia().getZonaPorId(rs.getInt("id_zona")));
                    deta.setTotal(rs.getInt("total"));
                    listadetalle.add(deta);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }
        return listadetalle;
    }

    public Detalle getDetallePorid(int id) {

        String sql = "select * from detalle where id=?";
        Detalle detall = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, id);

                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    detall = new Detalle();
                    detall.setCodigo(rs.getInt("id"));
                    detall.setNombreProducto(rs.getString("nombre_producto"));
                    detall.setProducto(ServicioProducto.getInstancia().getProductoPorId(rs.getInt("id_producto")));
                    detall.setZonas(ServicioZona.getInstancia().getZonaPorId(rs.getInt("id_zona")));

                    rs.close();
                    stmt.close();
                    con.close();
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioSiembra.class.getName()).log(Level.SEVERE, null, e);
        }

        return detall;
    }

}
