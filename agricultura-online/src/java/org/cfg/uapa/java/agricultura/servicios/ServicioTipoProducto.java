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
import org.cfg.uapa.java.agricultura.entidades.TipoProducto;

/**
 *
 * @author Yanelkys
 */
public class ServicioTipoProducto {
     private static ServicioTipoProducto INSTANCIA = new ServicioTipoProducto();

    
     private ServicioTipoProducto(){
     }
     public static ServicioTipoProducto getInstancia(){
        return INSTANCIA;
        
    }

    public List<TipoProducto> getListadoTipoProducto() throws SQLException {

        List<TipoProducto> ListaTipoProducto = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from tipo_producto")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                   TipoProducto tproducto = new TipoProducto();
                   tproducto.setId(rs.getInt("id"));
                   tproducto.setNombre(rs.getString("nombre"));
                    ListaTipoProducto.add(tproducto);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicioTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ListaTipoProducto;
    }

    public TipoProducto getTipoProductoPorId(int id) {

        String sql = "select * from tipo_producto where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        TipoProducto tipoproducto = null;

        try {

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            rs.next();
            tipoproducto = new TipoProducto();   
            tipoproducto.setId(rs.getInt("id"));
            tipoproducto.setNombre(rs.getString("nombre"));
       

        } catch (SQLException e) {
            Logger.getLogger(ServicioTipoProducto.class.getName()).log(Level.SEVERE, null, e);
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
                Logger.getLogger(ServicioTipoProducto.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return tipoproducto;
    }

    public boolean CrearTipoProducto(TipoProducto tproducto) {

        boolean estado = false;
        PreparedStatement stmt = null;
        String sql = "insert into tipo_producto(nombre) values(?)";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, tproducto.getNombre());
            
           

            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioTipoProducto.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }

        return estado;

    }

    public boolean editarTipoProducto(TipoProducto tipoproducto) {

        boolean estado = false;
        PreparedStatement stmt = null;
        String sql = "update tipo_producto set nombre =? where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, tipoproducto.getNombre());
            stmt.setInt(2,tipoproducto.getId());
            
            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioTipoProducto.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ServicioTipoProducto.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }

        return estado;

    }

}
    
