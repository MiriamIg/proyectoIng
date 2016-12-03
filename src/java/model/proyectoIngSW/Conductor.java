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
public class Conductor {
    private Integer id_Conduct;
    private String nombreConduct;
    private String dir;
    private String telConduct;
    private Integer experiencia;
    private String salud;

    public Conductor(Integer id_Conduct, String nombreConduct, String dir, String telConduct, Integer experiencia, String salud) {
        this.id_Conduct = id_Conduct;
        this.nombreConduct = nombreConduct;
        this.dir = dir;
        this.telConduct = telConduct;
        this.experiencia = experiencia;
        this.salud = salud;
    }

    public Integer getId_Conduct() {
        return id_Conduct;
    }

    public void setId_Conduct(Integer id_Conduct) {
        this.id_Conduct = id_Conduct;
    }

    public String getNombreConduct() {
        return nombreConduct;
    }

    public void setNombreConduct(String nombreConduct) {
        this.nombreConduct = nombreConduct;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getTelConduct() {
        return telConduct;
    }

    public void setTelConduct(String telConduct) {
        this.telConduct = telConduct;
    }

    public Integer getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(Integer experiencia) {
        this.experiencia = experiencia;
    }

    public String getSalud() {
        return salud;
    }

    public void setSalud(String salud) {
        this.salud = salud;
    }

   
    
}
