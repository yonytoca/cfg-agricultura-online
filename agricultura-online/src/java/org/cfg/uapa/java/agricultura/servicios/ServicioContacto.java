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
import org.cfg.uapa.java.agricultura.entidades.Contacto;

/**
 *
 * @author EDUARDO
 */
public class ServicioContacto {
  private static final ServicioContacto INSTANCIA = new ServicioContacto();

    private ServicioContacto() {
    }

    public static ServicioContacto getInstancia() {
        return INSTANCIA;
    }

    public List<Contacto> getListadoContacto() {

        List<Contacto> listacontacto = new ArrayList<>();

        try (PreparedStatement stmt = Coneccion.getInstancia().getConeccion().prepareStatement("select * from contacto order by id asc")) {
            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Contacto contacto = new Contacto();
                    contacto.setId(rs.getInt("id"));
                    contacto.setNombre(rs.getString("nombre"));
                    contacto.setCorreo(rs.getString("correo"));
                    contacto.setAsunto(rs.getString("asunto"));
                    contacto.setMensaje(rs.getString("mensaje"));
                    contacto.setFecha(rs.getString("fecha"));
                    listacontacto.add(contacto);
                }
            }

        } catch (SQLException e) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, e);
        }
        return listacontacto;
    }

//crear mensaje 
    public boolean CrearMensaje(Contacto contacto) {

        boolean estado = false;
        PreparedStatement stmt = null;
        String sql = "insert into contacto(nombre,correo,asunto,mensaje,fecha) values(?,?,?,?,?)";

        Connection con = Coneccion.getInstancia().getConeccion();

        try {

            stmt = con.prepareStatement(sql);
            stmt.setString(1, contacto.getNombre());
            stmt.setString(2, contacto.getCorreo());
            stmt.setString(3, contacto.getAsunto());
            stmt.setString(4, contacto.getMensaje());            
            stmt.setString(5, contacto.getFecha());
            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }
}
