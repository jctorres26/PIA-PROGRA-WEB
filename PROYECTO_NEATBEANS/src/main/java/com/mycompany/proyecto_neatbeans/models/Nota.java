/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto_neatbeans.models;

import java.sql.Date;

/**
 *
 * @author jctor
 */
public class Nota {
    private int idNota;
    private String userNota;
    private String descripcion;
    private Date fechaCreacion;
    private int eliminada;

    public Nota() {
    }

    public Nota(String userNota, String descripcion) {
        this.userNota = userNota;
        this.descripcion = descripcion;
    }

    public Nota(int idNota, String userNota, String descripcion) {
        this.idNota = idNota;
        this.userNota = userNota;
        this.descripcion = descripcion;
    }

    public Nota(int idNota, String descripcion) {
        this.idNota = idNota;
        this.descripcion = descripcion;
    }

    public Nota(int idNota) {
        this.idNota = idNota;
    }

   

    public int getIdNota() {
        return idNota;
    }

    public void setIdNota(int idNota) {
        this.idNota = idNota;
    }

    public String getUserNota() {
        return userNota;
    }

    public void setUserNota(String userNota) {
        this.userNota = userNota;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public int getEliminada() {
        return eliminada;
    }

    public void setEliminada(int eliminada) {
        this.eliminada = eliminada;
    }
    
    
    
}
