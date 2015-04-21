/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.agricultura.entidades;

/**
 *
 * @author Yanelkys
 */
public class TipoProducto {
     private int id_tipo_producto;
    private String nombre;

    /**
     * @return the id_tipo_producto
     */
    public int getId_tipo_producto() {
        return id_tipo_producto;
    }

    /**
     * @param id_tipo_producto the id_tipo_producto to set
     */
    public void setId_tipo_producto(int id_tipo_producto) {
        this.id_tipo_producto = id_tipo_producto;
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
