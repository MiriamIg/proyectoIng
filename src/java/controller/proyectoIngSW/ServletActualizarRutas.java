/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.proyectoIngSW;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.proyectoIngSW.Conexion;

/**
 *
 * @author Miry
 */
public class ServletActualizarRutas extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        String idRuta       = request.getParameter("ididRuta"); 
        String matricAct    =request.getParameter("matricAct");
       
        try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
        CallableStatement actu=con.prepareCall("{call ACTUALIZAR_RUTA(?,?)}");  /// call y el nombre de tu procedimiento Y EL NUMERO DE PROCEDIMIENTOS QUE TENGAMOS
        
        actu.setString(1,idRuta);
        actu.setString(2,matricAct); 
        
        actu.execute();
       
        out.println("Se actualizo ruta");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
    }

    }

    
}
