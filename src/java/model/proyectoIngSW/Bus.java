/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.proyectoIngSW;

/**
 *
 * @author Miriam
 */
public class Bus {
   private String matriculaBus;
   private Integer idConductor;
   private String modelo;
   private Integer capacidad;

    public Bus(String matriculaBus, Integer idConductor, String modelo, Integer capacidad) {
        this.matriculaBus = matriculaBus;
        this.idConductor = idConductor;
        this.modelo = modelo;
        this.capacidad = capacidad;
    }

    
    

    public String getMatriculaBus() {
        return matriculaBus;
    }

    public void setMatriculaBus(String matriculaBus) {
        this.matriculaBus = matriculaBus;
    }

    public Integer getIdConductor() {
        return idConductor;
    }

    public void setIdConductor(Integer idConductor) {
        this.idConductor = idConductor;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Integer getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(Integer capacidad) {
        this.capacidad = capacidad;
    }
    
}
