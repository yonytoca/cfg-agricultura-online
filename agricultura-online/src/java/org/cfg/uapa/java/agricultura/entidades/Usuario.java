/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.agricultura.entidades;

/**
 *
 * @author VíctorAndrés
 */
public class Usuario {
private int id;
private String usuario;
private String clave;
private TipoUsuario tipo_usuario_id;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the clave
     */
    public String getClave() {
        return clave;
    }

    /**
     * @param clave the clave to set
     */
    public void setClave(String clave) {
        this.clave = clave;
    }

    /**
     * @return the tipo_usuario_id
     */
    public TipoUsuario getTipo_usuario_id() {
        return tipo_usuario_id;
    }

    /**
     * @param tipo_usuario_id the tipo_usuario_id to set
     */
    public void setTipo_usuario_id(TipoUsuario tipo_usuario_id) {
        this.tipo_usuario_id = tipo_usuario_id;
    }

    /**
     * @return the id_usuario
     */
   

}
