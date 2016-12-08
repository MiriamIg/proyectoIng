/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.proyectoIngSW;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.proyectoIngSW.permisosModulosER;

/**
 *
 * @author Miry
 */
public class ServletLogin extends HttpServlet {

     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            permisosModulosER permiso= new permisosModulosER();	
		String usuario		=request.getParameter("usuario");
        	String password		=request.getParameter("password");
                boolean exito;
       if(usuario=="software"){
            if(password=="123"){
                exito=true;
            }else{exito=false;}
                
       // out.print(permiso.Acceso(usuario, password));
         //       if(usuario=="software" && password="123"){
       //         out.print(false);
     //}
     }else{exito=false;}
       out.print(exito);
}
}
