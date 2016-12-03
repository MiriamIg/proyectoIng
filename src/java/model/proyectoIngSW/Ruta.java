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
public class Ruta {
    private String id_ruta;
    private String matricula;
    private Float  km;
    private String origen;
    private String destino;
    private Integer numCiudades;

    public Ruta(String id_ruta, String matricula, Float km, String origen, String destino, Integer numCiudades) {
        this.id_ruta = id_ruta;
        this.matricula = matricula;
        this.km = km;
        this.origen = origen;
        this.destino = destino;
        this.numCiudades = numCiudades;
    }

    public String getId_ruta() {
        return id_ruta;
    }

    public void setId_ruta(String id_ruta) {
        this.id_ruta = id_ruta;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public Float getKm() {
        return km;
    }

    public void setKm(Float km) {
        this.km = km;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public Integer getNumCiudades() {
        return numCiudades;
    }

    public void setNumCiudades(Integer numCiudades) {
        this.numCiudades = numCiudades;
    }
            
    
    
    
    
}
