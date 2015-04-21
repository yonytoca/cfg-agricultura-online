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
import org.cfg.uapa.java.agricultura.entidades.Producto;

/**
 *
 * @author Yanelkys
 */
public class ServicioProducto {

    private static ServicioProducto INSTANCIA = null;

    public static ServicioProducto getInstancia() {
        if (INSTANCIA == null) {
            INSTANCIA = new ServicioProducto();
        }
        return INSTANCIA;
    }

    public List<Producto> getListadoProducto() throws SQLException {

        List<Producto> Listaproducto = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from producto")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Producto producto = new Producto();
                    producto.setId_producto(rs.getInt("id_producto"));
                    producto.setNombre(rs.getString("nombre"));
                    producto.setImg(rs.getString("img"));
                    producto.setCantidad_siembra(rs.getInt("cantidad_siembra"));
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Listaproducto;
    }

    public Producto getProductoPorId(int id) {

        String sql = "select * from producto where id_producto=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Producto producto = null;

        try {

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            rs.next();
            producto = new Producto();
            producto.setId_producto(rs.getInt("id_producto"));
            producto.setNombre(rs.getString("nombre"));
            producto.setImg(rs.getString("img"));
            producto.setCantidad_siembra(rs.getInt("cantidad_siembra"));

        } catch (SQLException e) {
            Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, e);
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
                Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return producto;
    }

    public boolean crearProducto(Producto producto) {

        boolean estado = false;
        PreparedStatement stmt = null;
        String sql = "insert into producto(nombre,img,cantidad_siembra) values(?,?,?)";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, producto.getNombre());
            stmt.setString(2, producto.getImg());
            stmt.setInt(3, producto.getCantidad_siembra());

            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }

        return estado;

    }

    public boolean editarProducto(Producto producto) {

        boolean estado = false;
        PreparedStatement stmt = null;
        String sql = "update producto set nombre = ?, img=?, cantidad_siembra=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, producto.getNombre());
            stmt.setString(2, producto.getImg());
            stmt.setInt(3, producto.getCantidad_siembra());

            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }

        return estado;

    }

}
