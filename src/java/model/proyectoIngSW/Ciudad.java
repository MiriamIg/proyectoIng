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
public class Ciudad {
    private String idCiudad;
    private String idRutaAsig;
    private String ciudad;
    private String dir;
    private String tel;

    public Ciudad(String idCiudad, String idRutaAsig, String ciudad, String dir, String tel) {
        this.idCiudad = idCiudad;
        this.idRutaAsig = idRutaAsig;
        this.ciudad = ciudad;
        this.dir = dir;
        this.tel = tel;
    }

    public String getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(String idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getIdRutaAsig() {
        return idRutaAsig;
    }

    public void setIdRutaAsig(String idRutaAsig) {
        this.idRutaAsig = idRutaAsig;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
   
}
