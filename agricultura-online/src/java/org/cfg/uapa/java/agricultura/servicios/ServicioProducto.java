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

    private static final ServicioProducto INSTANCIA = new ServicioProducto();

    private ServicioProducto() {
    }

    public static ServicioProducto getInstancia() {
        return INSTANCIA;
    }

    // lista de los socios 
    public List<Producto> getListadoProducto()throws SQLException {

        List<Producto> listaproducto = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from producto")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Producto producto = new Producto();
                    producto.setId(rs.getInt("id"));
                    producto.setNombre(rs.getString("nombre"));                    
                    producto.setTipo_producto_id(ServicioTipoProducto.getInstancia().getTipoProductoPorId(rs.getInt("tipo_producto_id")));
                    producto.setId_variedad(ServicioVariedad.getInstancia().getVariedadPorId(rs.getInt("id_variedad")));
                    producto.setTiempoProduccion(rs.getInt("tiempo_produccion"));
                    producto.setProducciontarea(rs.getInt("produccion_tarea"));
                    listaproducto.add(producto);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ServicioProducto.class.getName()).log(Level.SEVERE, null, e);
        }
        return listaproducto;
    }

    public Producto getProductoPorId(int id) {

        String sql = "select * from producto where id=?";

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
            producto.setId(rs.getInt("id"));
            producto.setNombre(rs.getString("nombre"));            
            producto.setTipo_producto_id(ServicioTipoProducto.getInstancia().getTipoProductoPorId(rs.getInt("tipo_producto_id")));
            producto.setId_variedad(ServicioVariedad.getInstancia().getVariedadPorId(rs.getInt("id_variedad")));
            producto.setTiempoProduccion(rs.getInt("tiempo_produccion"));
            producto.setProducciontarea(rs.getInt("produccion_tarea"));

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
        String sql = "insert into producto(nombre,tipo_producto_id,id_variedad,tiempo_produccion,produccion_tarea) values(?,?,?,?,?)";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, producto.getNombre());            
            stmt.setInt(2, producto.getTipo_producto_id().getId());
            stmt.setInt(3, producto.getId_variedad().getId());
            stmt.setInt(4,producto.getTiempoProduccion());
            stmt.setInt(5,producto.getProducciontarea());
            

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
        String sql = "update producto set nombre = ?, tipo_producto_id=?, id_variedad=?,tiempo_produccion=?,produccion_tarea=? where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, producto.getNombre());            
            stmt.setInt(2, producto.getTipo_producto_id().getId());
            stmt.setInt(3, producto.getId_variedad().getId());
            stmt.setInt(4,producto.getTiempoProduccion());
            stmt.setInt(5,producto.getProducciontarea());
            stmt.setInt(6,producto.getId());

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
