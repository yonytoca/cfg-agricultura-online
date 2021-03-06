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

    public List<Socio> getListadoSocio() {

        List<Socio> listasocio = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from socio")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Socio socios = new Socio();
                    socios.setId(rs.getInt("id"));
                    socios.setNombre(rs.getString("nombre"));
                    socios.setApellido(rs.getString("apellido"));
                    socios.setTelefono(rs.getString("telefono"));
                    socios.setDireccion(rs.getString("direccion"));
                    socios.setUsuario(rs.getString("usuario"));
                    socios.setTipousuario(ServicioTipoUsuario.getInstancia().getTipoUsuarioPorId(rs.getInt("tipo_usuario_id")));
                    //   socios.setImg(rs.getString("img"));
                    listasocio.add(socios);

                }
            }

        } catch (SQLException e) {
            Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
        }
        return listasocio;
    }

    public Socio getSocioPorId(int id) {

        String sql = "select * from socio where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Socio socios = null;

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            rs.next();
            socios = new Socio();
            socios.setId(rs.getInt("id"));
            socios.setNombre(rs.getString("nombre"));
            socios.setApellido(rs.getString("apellido"));
            socios.setTelefono(rs.getString("telefono"));
            socios.setDireccion(rs.getString("direccion"));
            socios.setUsuario(rs.getString("usuario"));
            socios.setTipousuario(ServicioTipoUsuario.getInstancia().getTipoUsuarioPorId(rs.getInt("tipo_usuario_id")));
            socios.setClave(rs.getString("clave"));
           //socios.setImg(rs.getString("img"));         

        } catch (SQLException e) {
            Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
        }

        return socios;
    }

    public boolean crearSocio(Socio socio) {

        boolean estado = false;
        PreparedStatement stmt = null;
        String sql = "insert into socio(nombre,apellido,telefono,direccion,usuario,clave,tipo_usuario_id) values(?,?,?,?,?, MD5(?),?)";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, socio.getNombre());
            stmt.setString(2, socio.getApellido());
            stmt.setString(3, socio.getTelefono());
            stmt.setString(4, socio.getDireccion());
            stmt.setString(5, socio.getUsuario());
            stmt.setString(6, socio.getClave());
            stmt.setInt(7, socio.getTipousuario().getId());
            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    // actulizar socio
    public boolean UpdateSocio(Socio socio) {

        boolean estado;
        //PreparedStatement stmt = null ;
        String sql = "update socio set nombre = ?,apellido = ?,telefono = ?,direccion=?, usuario=?, tipo_usuario_id=? where id = ?";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            //stmt = con.prepareStatement(sql);
            stmt.setString(1, socio.getNombre());
            stmt.setString(2, socio.getApellido());
            stmt.setString(3, socio.getTelefono());
            stmt.setString(4, socio.getDireccion());
            stmt.setString(5, socio.getUsuario()); 
            stmt.setInt(6, socio.getTipousuario().getId());
            stmt.setInt(7, socio.getId());

            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
        }
        return estado;
    }
    
     
    public boolean EditarClaveSocio(Socio socio) {

        boolean estado;
        //PreparedStatement stmt = null ;
        String sql = "update socio set clave=MD5(?), usuario=? where id = ?";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            //stmt = con.prepareStatement(sql);
            stmt.setString(1, socio.getClave());
            stmt.setString(2, socio.getUsuario());
            stmt.setInt(3, socio.getId());

            stmt.executeUpdate();
            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioSocio.class.getName()).log(Level.SEVERE, null, e);
        }
        return estado;
    }
}
