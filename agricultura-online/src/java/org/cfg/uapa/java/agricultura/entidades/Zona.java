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
public class Zona {
    private int id;
    private String nombre;
    private SubZona subzona_id;

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

    /**
     * @return the subzona_id
     */
    public SubZona getSubzona_id() {
        return subzona_id;
    }

    /**
     * @param subzona_id the subzona_id to set
     */
    public void setSubzona_id(SubZona subzona_id) {
        this.subzona_id = subzona_id;
    }
}
