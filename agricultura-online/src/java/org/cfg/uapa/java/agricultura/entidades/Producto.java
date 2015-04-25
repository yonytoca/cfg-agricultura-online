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
    
    private int id;
    private String nombre;
    private String img;
    private String periodo;
    private TipoProducto tipo_producto_id;
    private Variedad id_variedad;

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

    /**
     * @return the periodo
     */
    public String getPeriodo() {
        return periodo;
    }

    /**
     * @param periodo the periodo to set
     */
    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    /**
     * @return the tipo_producto_id
     */
    public TipoProducto getTipo_producto_id() {
        return tipo_producto_id;
    }

    /**
     * @param tipo_producto_id the tipo_producto_id to set
     */
    public void setTipo_producto_id(TipoProducto tipo_producto_id) {
        this.tipo_producto_id = tipo_producto_id;
    }

    /**
     * @return the id_variedad
     */
    public Variedad getId_variedad() {
        return id_variedad;
    }

    /**
     * @param id_variedad the id_variedad to set
     */
    public void setId_variedad(Variedad id_variedad) {
        this.id_variedad = id_variedad;
    }

   
  
}
