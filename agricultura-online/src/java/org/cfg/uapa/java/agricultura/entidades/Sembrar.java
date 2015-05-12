/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.agricultura.entidades;

/**
 *
 * @author EDUARDO
 */
public class Sembrar {
    
    private int id;
    private String fecha;
    private Socio id_socio;
    private Zona id_zona;
    private int cantidad_sembrada;

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
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
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

    /**
     * @return the cantidad_sembrada
     */
    public int getCantidad_sembrada() {
        return cantidad_sembrada;
    }

    /**
     * @param cantidad_sembrada the cantidad_sembrada to set
     */
    public void setCantidad_sembrada(int cantidad_sembrada) {
        this.cantidad_sembrada = cantidad_sembrada;
    }

   
}
