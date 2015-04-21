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
public class TipoUsuario {
private int id_tipo_usuario;
private String nombre;

    /**
     * @return the id_tipo_usuario
     */
    public int getId_tipo_usuario() {
        return id_tipo_usuario;
    }

    /**
     * @param id_tipo_usuario the id_tipo_usuario to set
     */
    public void setId_tipo_usuario(int id_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
