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
public class Siembra {
  private int  id; 
private Producto id_producto;
private String fecha_siembra;
private int cantidad_producto;
private Socio id_socio;
private Zona id_zona;

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
     * @return the id_producto
     */
    public Producto getId_producto() {
        return id_producto;
    }

    /**
     * @param id_producto the id_producto to set
     */
    public void setId_producto(Producto id_producto) {
        this.id_producto = id_producto;
    }

    /**
     * @return the fecha_siembra
     */
    public String getFecha_siembra() {
        return fecha_siembra;
    }

    /**
     * @param fecha_siembra the fecha_siembra to set
     */
    public void setFecha_siembra(String fecha_siembra) {
        this.fecha_siembra = fecha_siembra;
    }

    /**
     * @return the cantidad_producto
     */
    public int getCantidad_producto() {
        return cantidad_producto;
    }

    /**
     * @param cantidad_producto the cantidad_producto to set
     */
    public void setCantidad_producto(int cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    /**
     * @return the id_socio
     */
    public Socio getId_socio() {
        return id_socio;
    }

    /**
     * @param id_socio the id_socio to set
     */
    public void setId_socio(Socio id_socio) {
        this.id_socio = id_socio;
    }

    /**
     * @return the id_zona
     */
    public Zona getId_zona() {
        return id_zona;
    }

    /**
     * @param id_zona the id_zona to set
     */
    public void setId_zona(Zona id_zona) {
        this.id_zona = id_zona;
    }

    public void setId_socio(int soci) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
