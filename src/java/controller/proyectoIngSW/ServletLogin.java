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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        permisosModulosER permiso= new permisosModulosER();	
		String usuario		=request.getParameter("user");
        	String password		=request.getParameter("passw");
        
        	out.print(permiso.Acceso(usuario, password));     

    }

}
