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
public class Producto {
    
    private int id_producto;
    private String nombre;
    private int cantidad_siembra;
    private String img;

    /**
     * @return the id_producto
     */
    public int getId_producto() {
        return id_producto;
    }

    /**
     * @param id_producto the id_producto to set
     */
    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
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
     * @return the cantidad_siembra
     */
    public int getCantidad_siembra() {
        return cantidad_siembra;
    }

    /**
     * @param cantidad_siembra the cantidad_siembra to set
     */
    public void setCantidad_siembra(int cantidad_siembra) {
        this.cantidad_siembra = cantidad_siembra;
    }

    /**
     * @return the img
     */
    public String getImg() {
        return img;
    }

    /**
     * @param img the img to set
     */
    public void setImg(String img) {
        this.img = img;
    }

  
}
